USE AutoTest
GO

DECLARE @name nvarchar(max);
DECLARE @sql nvarchar(max);

SET @name = 'dbo.uspAdHocDataCompare';
SET @sql = FORMATMESSAGE('CREATE PROC %s AS BEGIN SELECT 1 AS [one] END;',@name);

RAISERROR(@name, 1, 1) WITH NOWAIT;

IF OBJECT_ID(@name,'P') IS NULL
BEGIN
	EXEC(@sql);
END
GO
ALTER PROC dbo.uspAdHocDataCompare
	@pPreEtlDatabaseName varchar(100)
	,@pPreEtlSchemaName varchar(100)
	,@pPreEtlTableName varchar(100)
	,@pPostEtlDatabaseName varchar(100)
	,@pPostEtlSchemaName varchar(100)
	,@pPostEtlTableName varchar(100)
	,@pObjectPkColumns varchar(100)
AS
BEGIN
BEGIN TRY
	SET NOCOUNT ON;
	DECLARE @start datetime2 = GETDATE();
	DECLARE @runtime int = 0;
	RAISERROR('uspAdHocDataCompare', 0, 1) WITH NOWAIT,LOG;
	
	DECLARE @sql nvarchar(max);
	DECLARE @param nvarchar(max);
	
	DECLARE 
		@Prefix varchar(100)
		,@PreEtlSnapShotName varchar(200)
		,@PostEtlSnapShotName varchar(200)
		,@PreEtlSourceObjectFullName varchar(500)
		,@PostEtlSourceObjectFullName varchar(500)
		,@TestConfigID int
		,@SnapShotBaseName varchar(500)
		,@PreEtlSnapShotCreationElapsedSeconds int
		,@PostEtlSnapShotCreationElapsedSeconds int
		,@TestRuntimeSeconds int
		,@TestTypeID int
	
	SET @PreEtlSourceObjectFullName = FORMATMESSAGE('%s.%s.%s',@pPreEtlDatabaseName, @pPreEtlSchemaName, @pPreEtlTableName)
	SET @PostEtlSourceObjectFullName = FORMATMESSAGE('%s.%s.%s',@pPostEtlDatabaseName, @pPostEtlSchemaName, @pPostEtlTableName)

	SELECT @TestTypeID = TestTypeID FROM AutoTest.dbo.TestType WHERE TestTypeDesc = 'AdHocDataComparison'

	INSERT INTO TestConfig (TestTypeID, PreEtlSourceObjectFullName, PostEtlSourceObjectFullName, TestDate) 
	VALUES(@TestTypeID, @PreEtlSourceObjectFullName, @PostEtlSourceObjectFullName, GETDATE());
	
	SET @TestConfigID = @@IDENTITY;

	-- SET @SnapShotBaseName = FORMATMESSAGE('TestConfigID%i',@TestConfigID);
	-- RAISERROR('@SnapShotBaseName=%s', 0, 1, @SnapShotBaseName) WITH NOWAIT;
	
	-- get SnapShot names from calculated columns in TestConfig
	SELECT 
		@PreEtlSnapShotName = PreEtlSnapShotName
		,@PostEtlSnapShotName = PostEtlSnapShotName
	FROM AutoTest.dbo.TestConfig tlog
	WHERE tlog.TestConfigID = @TestConfigID

	-- create snap shots
	DECLARE @pPreEtlQuery nvarchar(max) = FORMATMESSAGE(' (SELECT * FROM %s.%s.%s) ', @pPreEtlDatabaseName, @pPreEtlSchemaName, @pPreEtlTableName);
	EXEC @PreEtlSnapShotCreationElapsedSeconds = AutoTest.dbo.uspCreateQuerySnapShot @pQuery = @pPreEtlQuery, @pKeyColumns = @pObjectPkColumns, @pHashKeyColumns = @pObjectPkColumns, @pDestTableName = @PreEtlSnapShotName
	DECLARE @pPostEtlQuery nvarchar(max) = FORMATMESSAGE(' (SELECT * FROM %s.%s.%s) ', @pPostEtlDatabaseName, @pPostEtlSchemaName, @pPostEtlTableName);
	EXEC @PostEtlSnapShotCreationElapsedSeconds = AutoTest.dbo.uspCreateQuerySnapShot @pQuery = @pPostEtlQuery, @pKeyColumns = @pObjectPkColumns, @pHashKeyColumns = @pObjectPkColumns, @pDestTableName = @PostEtlSnapShotName

	UPDATE TestConfig SET
		PreEtlSnapShotCreationElapsedSeconds = @PreEtlSnapShotCreationElapsedSeconds
		,PostEtlSnapShotCreationElapsedSeconds = @PostEtlSnapShotCreationElapsedSeconds
	FROM AutoTest.dbo.TestConfig tlog
	WHERE tlog.TestConfigID = @TestConfigID

	EXEC @TestRuntimeSeconds = AutoTest.dbo.uspDataCompare @pTestConfigID = @TestConfigID

	UPDATE TestConfig SET
		TestRuntimeSeconds = @TestRuntimeSeconds
	FROM TestConfig tlog
	WHERE tlog.TestConfigID = @TestConfigID

	SELECT @runtime=DATEDIFF(second, @start, sysdatetime());
	RAISERROR('!dbo.uspAdHocDataCompare: runtime: %i seconds', 0, 1, @runtime) WITH NOWAIT;
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
-- DECLARE 
-- 	@pPreEtlDatabaseName varchar(100) = 'Lien'
-- 	,@pPreEtlSchemaName varchar(100) = 'Adtc'
-- 	,@pPreEtlTableName varchar(100) = 'SM_02_DischargeFact'
-- 	,@pPostEtlDatabaseName varchar(100) = 'Lien'
-- 	,@pPostEtlSchemaName varchar(100) = 'Adtc'
-- 	,@pPostEtlTableName varchar(100) = 'SM_03_DischargeFact'
-- 	,@pObjectPkColumns varchar(100) = 'PatientID, AccountNum'
-- --SET @pPreEtlDatabaseName = 'Prod'
-- --SET @pPreEtlSchemaName = 'dbo'
-- --SET @pPreEtlTableName = 'FactResellerSales's
-- --SET @pPostEtlDatabaseName = 'Prod'
-- --SET @pPostEtlSchemaName = 'dbo'
-- --SET @pPostEtlTableName = 'FactResellerSales'
-- --SET @pObjectPkColumns = '[SalesOrderNumber], [SalesOrderLineNumber]'
-- EXEC AutoTest.dbo.uspAdHocDataCompare 
-- 	@pPreEtlDatabaseName = @pPreEtlDatabaseName
-- 	,@pPreEtlSchemaName = @pPreEtlSchemaName
-- 	,@pPreEtlTableName = @pPreEtlTableName
-- 	,@pPostEtlDatabaseName = @pPostEtlDatabaseName
-- 	,@pPostEtlSchemaName = @pPostEtlSchemaName
-- 	,@pPostEtlTableName = @pPostEtlTableName
-- 	,@pObjectPkColumns = @pObjectPkColumns
