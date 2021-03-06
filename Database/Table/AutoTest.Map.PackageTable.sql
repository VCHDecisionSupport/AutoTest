USE AutoTest
GO

/*
2017-02-27 Graham Crowell DR9581 initial deployment
*/

DECLARE @sql varchar(max);

DECLARE @name varchar(100) = 'Map.PackageTable'
RAISERROR(@name,0,1) WITH NOWAIT;

IF OBJECT_ID(@name) IS NOT NULL
	SET @sql = 'DROP TABLE '+@name;
	RAISERROR(@sql,0,1) WITH NOWAIT;
	EXEC(@sql);
GO

CREATE TABLE Map.PackageTable
(
	PackageName varchar(500)
	,DatabaseName varchar(500)
	,SchemaName varchar(500)
	,TableName varchar(500)
	,IsProfilingOn bit DEFAULT 1
	,AlertThresholdAbsolutePercentChange decimal(2,2) DEFAULT 0.1
);
GO


------------------------------------------------------------------------------
-- sql embedded in C# app: SqlServicesUtilies to populate Map.PackageTable
------------------------------------------------------------------------------
-- DECLARE @packageName varchar(100) = 'PackageName'
-- 		,@databaseName varchar(100) = 'DatabaseName'
-- 		,@schemaName varchar(100) = 'SchemaName'
-- 		,@tableName varchar(100) = 'TableName'

-- ;WITH pkg_tab AS (
-- 	SELECT @packageName AS PackageName
-- 		,@databaseName AS DatabaseName
-- 		,@schemaName AS SchemaName
-- 		,@tableName AS TableName
-- )
-- MERGE INTO AutoTest.Map.PackageTable AS dest
-- USING pkg_tab
-- ON pkg_tab.PackageName = dest.PackageName
-- AND pkg_tab.DatabaseName = dest.DatabaseName
-- AND pkg_tab.SchemaName = dest.SchemaName
-- AND pkg_tab.TableName = dest.TableName
-- WHEN NOT MATCHED THEN
-- INSERT (PackageName, DatabaseName, SchemaName, TableName)
-- VALUES (pkg_tab.PackageName, pkg_tab.DatabaseName, pkg_tab.SchemaName, pkg_tab.TableName);


-- SELECT * FROM Map.PackageTable;
