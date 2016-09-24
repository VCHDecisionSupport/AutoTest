-- GO not allowed in pymssql python module
-- USE CommunityMart
-- GO

-- get all id columns
;WITH id AS (
	SELECT 
		sch.name AS SchemaName
		,tab.name AS TableName
		,col.name AS ColumnName
		,CASE 
		    WHEN typ.name LIKE '%char%' THEN FORMATMESSAGE('%s(%i)',typ.name,col.max_length)
		    ELSE typ.name
		END AS DataType
	FROM sys.tables AS tab
	JOIN sys.schemas AS sch
	ON tab.schema_id = sch.schema_id
	JOIN sys.columns AS col
	ON col.object_id = tab.object_id
	JOIN sys.types AS typ
	ON col.system_type_id = typ.system_type_id
	WHERE 1=1
	AND typ.name LIKE '%int%'
	AND col.name != 'ETLAuditID'
	AND tab.name != 'DischargeFact'
), 
-- get all candidate key columns 
ck AS (
	SELECT 
		DISTINCT
		--TOP 10
		tlog.TestConfigID
		,obj.ObjectPhysicalName AS TableName
		,obj.ObjectSchemaName AS SchemaName
		,cpro.ColumnName
		,attr.Datatype
		,attr.FKTableObjectID
		,obj.ObjectPKField
		,tpro.RecordCount
	FROM AutoTest.dbo.TestConfig AS tlog
	JOIN AutoTest.dbo.TestType AS tt
	ON tlog.TestTypeID = tt.TestTypeID
		LEFT JOIN AutoTest.dbo.TableProfile AS tpro
		ON tlog.TestConfigID = tpro.TestConfigID
		LEFT JOIN AutoTest.dbo.TableProfileType AS tprot
		ON tprot.TableProfileTypeID = tpro.TableProfileTypeID
		LEFT JOIN AutoTest.dbo.ColumnProfile AS cpro
		ON tpro.TableProfileID = cpro.TableProfileID
		LEFT JOIN AutoTest.dbo.ColumnProfileType AS cprot
		ON cprot.ColumnProfileTypeID = cpro.ColumnProfileTypeID
	LEFT JOIN DQMF.dbo.MD_Database db
	ON PARSENAME(tlog.PostEtlSourceObjectFullName,3) = db.DatabaseName
		LEFT JOIN DQMF.dbo.MD_Object AS obj
		ON obj.ObjectID = tlog.ObjectID
		LEFT JOIN DQMF.dbo.MD_ObjectAttribute AS attr
		ON obj.ObjectID = attr.ObjectID
		AND cpro.ColumnName = attr.AttributePhysicalName
	WHERE 1=1
	AND obj.IsActive=1
	AND attr.IsActive=1
	AND cpro.ColumnCount = tpro.RecordCount
	AND cpro.ColumnCount > 1
), 
-- get all ck columns that are also id columns (ETLAuditID already filtered out)
biz_key AS (
SELECT DISTINCT
	ck.SchemaName
	,ck.TableName
	,ck.ColumnName
	,ck.ObjectPKField
	,ck.FKTableObjectID
	,ck.RecordCount
	,id.Datatype
FROM ck
JOIN id
ON ck.SchemaName=id.SchemaName
AND ck.TableName=id.TableName
AND ck.ColumnName=id.ColumnName
), 
-- create parent-child join records
fk_ref AS (
	SELECT 
		DISTINCT
		biz_key.SchemaName AS Child_SchemaName
		,biz_key.TableName AS Child_TableName
		,biz_key.Datatype
		,cpro.ColumnName AS FK_ColumnName
		,obj.ObjectPhysicalName AS Parent_TableName
		,obj.ObjectSchemaName AS Parent_SchemaName
		,attr.FKTableObjectID
		,obj.ObjectPKField

	FROM AutoTest.dbo.TestConfig AS tlog
	JOIN AutoTest.dbo.TestType AS tt
	ON tlog.TestTypeID = tt.TestTypeID
		LEFT JOIN AutoTest.dbo.TableProfile AS tpro
		ON tlog.TestConfigID = tpro.TestConfigID
		LEFT JOIN AutoTest.dbo.TableProfileType AS tprot
		ON tprot.TableProfileTypeID = tpro.TableProfileTypeID
		LEFT JOIN AutoTest.dbo.ColumnProfile AS cpro
		ON tpro.TableProfileID = cpro.TableProfileID
		LEFT JOIN AutoTest.dbo.ColumnProfileType AS cprot
		ON cprot.ColumnProfileTypeID = cpro.ColumnProfileTypeID
	LEFT JOIN DQMF.dbo.MD_Database db
	ON PARSENAME(tlog.PostEtlSourceObjectFullName,3) = db.DatabaseName
		LEFT JOIN DQMF.dbo.MD_Object AS obj
		ON obj.ObjectID = tlog.ObjectID
		LEFT JOIN DQMF.dbo.MD_ObjectAttribute AS attr
		ON obj.ObjectID = attr.ObjectID
		AND cpro.ColumnName = attr.AttributePhysicalName
	JOIN biz_key
	ON biz_key.ColumnName = cpro.ColumnName
	AND biz_key.TableName != PARSENAME(tlog.PostEtlSourceObjectFullName,1)
	WHERE 1=1
	AND obj.IsActive=1
	AND attr.IsActive=1
	AND cpro.ColumnCount < tpro.RecordCount
	AND cpro.ColumnCount > 1
	AND cpro.ColumnCount < biz_key.RecordCount
	AND PARSENAME(tlog.PostEtlSourceObjectFullName,1) != 'DischargeFact'
	AND obj.ObjectType = 'Table'
	AND cpro.ColumnName != 'ETLAuditID'
)

--, 
-- -- not useful; need to traverse join tree with recursion and loop
-- -- could prolly be done with cross join and recursive CTE but easier in python
-- roots AS (
-- 	SELECT o.*, 0 AS Level
-- 	FROM fk_ref o
-- 	WHERE o.Child_SchemaName+'.'+o.Child_TableName NOT IN (
-- 		SELECT i.Parent_SchemaName+'.'+i.Parent_TableName
-- 		FROM fk_ref i
-- 	)
-- 	UNION ALL
-- 	SELECT fk_ref.*, roots.Level + 1
-- 	FROM fk_ref 
-- 	JOIN roots 
-- 	ON roots.Parent_SchemaName+'.'+roots.Parent_TableName = fk_ref.Child_SchemaName+'.'+fk_ref.Child_TableName
-- ), 
-- SELECT DISTINCT level, roots.Child_SchemaName, roots.Child_TableName, roots.FK_ColumnName, roots.Parent_SchemaName, roots.Parent_TableName
-- FROM roots
-- ORDER BY level ASC, roots.Child_SchemaName DESC, roots.Child_TableName ASC, roots.FK_ColumnName, roots.Parent_SchemaName, roots.Parent_TableName
-- OPTION (MAXRECURSION 0);

-- format joins for python
, pyfmt AS (
SELECT DISTINCT
	FORMATMESSAGE('CommunityMart.%s.%s', fk_ref.Parent_SchemaName, fk_ref.Parent_TableName) AS Parent
	,fk_ref.FK_ColumnName
	,fk_ref.Datatype
	,FORMATMESSAGE('CommunityMart.%s.%s', fk_ref.Child_SchemaName, fk_ref.Child_TableName) AS Child
FROM fk_ref
)
, pat_id AS (
	-- SELECT REPLACE('SourceSystemClientID','PatientID',pyfmt.Parent) AS Parent
	-- 	,pyfmt.FK_ColumnName
	-- 	,pyfmt.Datatype
	-- 	,pyfmt.Child
	-- FROM pyfmt
	-- WHERE pyfmt.Parent LIKE '%PatientFact'
	-- UNION
	SELECT *
	FROM pyfmt
)
SELECT *
FROM pat_id

