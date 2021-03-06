USE AutoTest
GO

DECLARE @name nvarchar(max);
DECLARE @sql nvarchar(max);

SET @name = 'dbo.uspInitPkgRegressionTest';
SET @sql = FORMATMESSAGE('CREATE PROC %s AS BEGIN SELECT 1 AS [one] END;',@name);

RAISERROR(@name, 1, 1) WITH NOWAIT;

IF OBJECT_ID(@name,'P') IS NULL
BEGIN
	EXEC(@sql);
END
GO
ALTER PROC dbo.uspInitPkgRegressionTest
	@pPkgExecKey int
AS
BEGIN
BEGIN TRY
	SELECT @pPkgExecKey AS PkgExecKey
	SET NOCOUNT ON;
	DECLARE @start datetime2 = GETDATE();
	DECLARE @runtime int = 0;
	DECLARE @rowcount int;
	RAISERROR('uspInitPkgRegressionTest(PkgExecKey=%i)', 0, 1, @pPkgExecKey) WITH NOWAIT;
	
	DECLARE @sql nvarchar(max);
	DECLARE @param nvarchar(max);

	DECLARE 
		@RegressionTableCount int = 0
		,@ProfileTableCount int = 0
		,@TestConfigID int
		,@PreEtlSourceObjectFullName varchar(200)
		,@PostEtlSourceObjectFullName varchar(200)
		,@SnapShotBaseName varchar(200)
		,@KeyColumns varchar(500)
		,@PreEtlSnapShotCreationElapsedSeconds int = 0
		,@PreEtlSnapShotName varchar(200)
		,@DatabaseName varchar(200)
		,@SchemaName varchar(200)
		,@TableName varchar(200)

	-- setup regression test specs: copy configurations from DQMF.dbo.ETL_PackageObject insert into AutoTest.dbo.TestConfig
	INSERT INTO AutoTest.dbo.TestConfig (TestTypeID, PreEtlSourceObjectFullName, PostEtlSourceObjectFullName, TestDate, ObjectID, PkgExecKey)
	SELECT 
		pgkobj.TestTypeID
		,CASE 
			-- RuntimeRegressionTest tables require snap shots:  PreEtlSourceObjectFullName stores fully qualified name of table to be snap shot
			WHEN tt.TestTypeDesc = 'RuntimeRegressionTest' THEN db.DatabaseName +'.'+obj.ObjectSchemaName+'.'+obj.ObjectPhysicalName 
			-- RuntimeProfile do not need snap shots
			WHEN tt.TestTypeDesc = 'RuntimeProfile' THEN NULL
			ELSE NULL
		END
		AS PreEtlSourceObjectFullName
		,db.DatabaseName +'.'+obj.ObjectSchemaName+'.'+obj.ObjectPhysicalName AS PostEtlSourceObjectFullName
		,GETDATE()
		,obj.ObjectID
		,pkglog.PkgExecKey
	FROM DQMF.dbo.ETL_PackageObject AS pgkobj
	JOIN DQMF.dbo.MD_Object AS obj
	ON pgkobj.ObjectID = obj.ObjectID
	JOIN DQMF.dbo.MD_Database AS db
	ON obj.DatabaseId = db.DatabaseId
	JOIN DQMF.dbo.AuditPkgExecution AS pkglog
	ON pgkobj.PackageID = pkglog.PkgKey
	JOIN AutoTest.dbo.TestType AS tt
	ON pgkobj.TestTypeID = tt.TestTypeID
	WHERE 1=1
	AND obj.IsActive = 1
	AND obj.IsObjectInDB = 1
	--let DQMF.dbo.ETL_PackageObject control which tables are tested
	--AND obj.ObjectPurpose = 'Fact'
	AND pkglog.PkgExecKey = @pPkgExecKey

	
--#region create pre-etl snap shots
DECLARE cur CURSOR
	FOR
	SELECT 
		TestConfigID
		,PreEtlSourceObjectFullName
		,PostEtlSourceObjectFullName
		,SnapShotBaseName
		,PreEtlSnapShotName
	FROM AutoTest.dbo.TestConfig
	WHERE PkgExecKey = @pPkgExecKey
	AND PreEtlSourceObjectFullName IS NOT NULL
	ORDER BY TestConfigID ASC

	OPEN cur;

	FETCH NEXT FROM cur INTO @TestConfigID, @PreEtlSourceObjectFullName, @PostEtlSourceObjectFullName, @SnapShotBaseName, @PreEtlSnapShotName

	-- copy snap shots of tests to be regression tested
	WHILE @@FETCH_STATUS = 0
	BEGIN
		DECLARE @PreEtlQuery nvarchar(max) = FORMATMESSAGE(' (SELECT * FROM %s) ', @PreEtlSourceObjectFullName);
		SET @DatabaseName = PARSENAME(@PreEtlSourceObjectFullName,3)
		SET @SchemaName = PARSENAME(@PreEtlSourceObjectFullName,2)
		SET @TableName = PARSENAME(@PreEtlSourceObjectFullName,1)
		EXEC AutoTest.dbo.uspGetKey @pDatabaseName = @DatabaseName, @pSchemaName = @SchemaName, @pObjectName = @TableName, @pColStr=@KeyColumns OUTPUT
		EXEC @PreEtlSnapShotCreationElapsedSeconds = AutoTest.dbo.uspCreateQuerySnapShot @pQuery = @PreEtlQuery, @pKeyColumns = @KeyColumns, @pHashKeyColumns = @KeyColumns, @pDestTableName = @PreEtlSnapShotName

		UPDATE TestConfig SET
			PreEtlSnapShotCreationElapsedSeconds = @PreEtlSnapShotCreationElapsedSeconds
		FROM AutoTest.dbo.TestConfig tlog
		WHERE tlog.TestConfigID = @TestConfigID

		FETCH NEXT FROM cur INTO @TestConfigID, @PreEtlSourceObjectFullName, @PostEtlSourceObjectFullName, @SnapShotBaseName, @PreEtlSnapShotName
	END

	CLOSE cur;
	DEALLOCATE cur;
--#endregion create pre-etl snap shots

	SELECT @RegressionTableCount = COUNT(*)
	FROM AutoTest.dbo.TestConfig tconfig
	JOIN AutoTest.dbo.TestType AS tt
	ON tconfig.TestTypeID = tt.TestTypeID
	WHERE 1=1
	AND tconfig.PkgExecKey = @pPkgExecKey	
	AND tt.TestTypeDesc = 'RuntimeRegressionTest'

	SELECT @ProfileTableCount = COUNT(*)
	FROM AutoTest.dbo.TestConfig tconfig
	JOIN AutoTest.dbo.TestType AS tt
	ON tconfig.TestTypeID = tt.TestTypeID
	WHERE 1=1
	AND tconfig.PkgExecKey = @pPkgExecKey	
	AND tt.TestTypeDesc = 'RuntimeProfile'

	SELECT @runtime=DATEDIFF(second, @start, sysdatetime());
	RAISERROR('!dbo.uspInitPkgRegressionTest: runtime: %i seconds (%i table/view are prepared for regression testing, %i tables/views will be stand alone profiled)', 0, 1, @runtime, @RegressionTableCount, @ProfileTableCount) WITH NOWAIT;
	RETURN(@runtime);
END TRY
BEGIN CATCH
	DECLARE @ErrorNumber int;
	DECLARE @ErrorSeverity int;
	DECLARE @ErrorState int;
	DECLARE @ErrorProcedure int;
	DECLARE @ErrorLine int;
	DECLARE @ErrorMessage varchar(max);
	DECLARE @UserMessage nvarchar(max);

	SELECT 
		@ErrorNumber = ERROR_NUMBER(),
		@ErrorSeverity = ERROR_SEVERITY(),
		@ErrorState = ERROR_STATE(),
		@ErrorProcedure = ERROR_PROCEDURE(),
		@ErrorLine = ERROR_LINE(),
		@ErrorMessage = ERROR_MESSAGE()

	SET @UserMessage = FORMATMESSAGE('AutoTest proc ERROR: %s 
		Error Message: %s
		Line Number: %i
		Severity: %i
		State: %i
		Error Number: %i
	',@ErrorProcedure, @ErrorMessage, @ErrorNumber, @ErrorLine, @ErrorSeverity, @ErrorState, @ErrorNumber);

	RAISERROR(@UserMessage,0,1) WITH NOWAIT, LOG
END CATCH;
END
GO
