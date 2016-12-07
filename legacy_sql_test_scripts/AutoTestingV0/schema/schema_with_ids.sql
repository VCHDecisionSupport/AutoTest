USE DQMF
GO




DECLARE @sql nvarchar(max);
DECLARE @params nvarchar(max);

DECLARE fk_cur CURSOR
FOR
SELECT tab.name AS TableName, fk.name AS ForeignKeyName
FROM sys.foreign_keys AS fk
JOIN sys.tables AS tab
ON fk.parent_object_id = tab.object_id
WHERE tab.name NOT LIKE '%sys%'
AND tab.name NOT LIKE 'DQMF%'

OPEN fk_cur;

DECLARE @tb_name varchar(128);
DECLARE @fk_name varchar(128);

FETCH NEXT FROM fk_cur INTO @tb_name, @fk_name;

WHILE @@FETCH_STATUS = 0
BEGIN
	SELECT @tb_name, @fk_name;

	SET @sql = 'ALTER TABLE '+@tb_name +' DROP CONSTRAINT '+ @fk_name;
	PRINT @sql
	EXEC(@sql);
	FETCH NEXT FROM fk_cur INTO @tb_name, @fk_name;
END
GO
CLOSE fk_cur;
DEALLOCATE fk_cur;
GO




IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DataRequestTestConfig]') AND type in (N'U'))
    DROP TABLE [dbo].[DataRequestTestConfig]
GO
CREATE TABLE [dbo].[DataRequestTestConfig] (
[DataRequestTestConfigID] int IDENTITY(1,1) NOT NULL  
, [DataRequestID] int  NOT NULL  
, [PkgID] int  NOT NULL  
, [ObjectID] int  NULL  
)
GO

ALTER TABLE [dbo].[DataRequestTestConfig] ADD CONSTRAINT [DataRequestTestConfig_PK] PRIMARY KEY CLUSTERED (
[DataRequestTestConfigID]
)
GO
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ProfileTest]') AND type in (N'U'))
    DROP TABLE [dbo].[ProfileTest]
GO
CREATE TABLE [dbo].[ProfileTest] (
[ProfileTestID] int IDENTITY(1,1) NOT NULL  
, [DataRequestTestConfigID] int  NOT NULL  
, [DataRequestID] int  NULL  
, [PkgID] int  NULL  
, [ObjectID] int  NULL  
, [PkgExecKey] int  NULL  
, [TableProfileID] int  NULL  
)
GO

ALTER TABLE [dbo].[ProfileTest] ADD CONSTRAINT [ProfileTest_PK] PRIMARY KEY CLUSTERED (
[ProfileTestID]
)
GO
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ColumnProfile]') AND type in (N'U'))
    DROP TABLE [dbo].[ColumnProfile]
GO
CREATE TABLE [dbo].[ColumnProfile] (
[ColumnProfileID] int IDENTITY(1,1) NOT NULL  
, [TableProfileID] int  NOT NULL  
, [ColumnID] int  NOT NULL  
, [DistinctCount] int  NOT NULL  
, [NullCount] int  NOT NULL  
, [ZeroCount] int  NOT NULL  
, [BlankCount] int  NOT NULL  
)
GO

ALTER TABLE [dbo].[ColumnProfile] ADD CONSTRAINT [ColumnProfile_PK] PRIMARY KEY CLUSTERED (
[ColumnProfileID]
)
GO
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[RegressionTest]') AND type in (N'U'))
    DROP TABLE [dbo].[RegressionTest]
GO
CREATE TABLE [dbo].[RegressionTest] (
[RegressionTestID] int IDENTITY(1,1) NOT NULL  
, [DataRequestTestConfigID] int  NOT NULL  
, [DataRequestID] int  NULL  
, [PkgID] int  NULL  
, [ObjectID] int  NULL  
, [PkgExecKey] int  NULL  
, [PreEtlSnapShotDate] datetime  NULL  
, [PostEtlSnapShotDate] datetime  NULL  
, [PreEtlProfileID] int  NULL  
, [PostEtlProfileID] int  NULL  
, [RecordMatchProfileID] int  NULL  
, [PreEtlKeyMatchProfileID] int  NULL  
, [PostEtlKeyMatchProfileID] int  NULL  
, [PreEtlKeyMisMatchProfileID] int  NULL  
, [PostEtlKeyMisMatchProfileID] int  NULL  
, [?PKField] int  NULL  
)
GO

ALTER TABLE [dbo].[RegressionTest] ADD CONSTRAINT [RegressionTest_PK] PRIMARY KEY CLUSTERED (
[RegressionTestID]
)
GO
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ColumnHistogram]') AND type in (N'U'))
    DROP TABLE [dbo].[ColumnHistogram]
GO
CREATE TABLE [dbo].[ColumnHistogram] (
[ColumnHistogramID] int IDENTITY(1,1) NOT NULL  
, [ColumnProfileID] int  NOT NULL  
, [ColumnValue] nvarchar(200)  NULL  
, [ValueCount] int  NULL  
)
GO

ALTER TABLE [dbo].[ColumnHistogram] ADD CONSTRAINT [ColumnHistogram_PK] PRIMARY KEY CLUSTERED (
[ColumnHistogramID]
)
GO
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TableProfile]') AND type in (N'U'))
    DROP TABLE [dbo].[TableProfile]
GO
CREATE TABLE [dbo].[TableProfile] (
[TableProfileID] int IDENTITY(1,1) NOT NULL  
, [RecordCount] int  NULL  
, [ProfileDate] datetime  NULL  
)
GO

ALTER TABLE [dbo].[TableProfile] ADD CONSTRAINT [TableProfile_PK] PRIMARY KEY CLUSTERED (
[TableProfileID]
)
GO
GO

GO

ALTER TABLE [dbo].[ProfileTest] WITH CHECK ADD CONSTRAINT [DataRequestTestConfig_ProfileTest_FK1] FOREIGN KEY (
[DataRequestTestConfigID]
)
REFERENCES [dbo].[DataRequestTestConfig] (
[DataRequestTestConfigID]
)
ALTER TABLE [dbo].[ProfileTest] WITH CHECK ADD CONSTRAINT [TableProfile_ProfileTest_FK1] FOREIGN KEY (
[TableProfileID]
)
REFERENCES [dbo].[TableProfile] (
[TableProfileID]
)
GO

ALTER TABLE [dbo].[ColumnProfile] WITH CHECK ADD CONSTRAINT [TableProfile_ColumnProfile_FK1] FOREIGN KEY (
[TableProfileID]
)
REFERENCES [dbo].[TableProfile] (
[TableProfileID]
)
GO

ALTER TABLE [dbo].[RegressionTest] WITH CHECK ADD CONSTRAINT [TableProfile_RegressionTest_FK1] FOREIGN KEY (
[PostEtlProfileID]
)
REFERENCES [dbo].[TableProfile] (
[TableProfileID]
)
ALTER TABLE [dbo].[RegressionTest] WITH CHECK ADD CONSTRAINT [TableProfile_RegressionTest_FK7] FOREIGN KEY (
[PostEtlKeyMisMatchProfileID]
)
REFERENCES [dbo].[TableProfile] (
[TableProfileID]
)
ALTER TABLE [dbo].[RegressionTest] WITH CHECK ADD CONSTRAINT [TableProfile_RegressionTest_FK6] FOREIGN KEY (
[PreEtlKeyMisMatchProfileID]
)
REFERENCES [dbo].[TableProfile] (
[TableProfileID]
)
ALTER TABLE [dbo].[RegressionTest] WITH CHECK ADD CONSTRAINT [TableProfile_RegressionTest_FK5] FOREIGN KEY (
[PostEtlKeyMatchProfileID]
)
REFERENCES [dbo].[TableProfile] (
[TableProfileID]
)
ALTER TABLE [dbo].[RegressionTest] WITH CHECK ADD CONSTRAINT [TableProfile_RegressionTest_FK4] FOREIGN KEY (
[RecordMatchProfileID]
)
REFERENCES [dbo].[TableProfile] (
[TableProfileID]
)
ALTER TABLE [dbo].[RegressionTest] WITH CHECK ADD CONSTRAINT [TableProfile_RegressionTest_FK3] FOREIGN KEY (
[PreEtlKeyMatchProfileID]
)
REFERENCES [dbo].[TableProfile] (
[TableProfileID]
)
ALTER TABLE [dbo].[RegressionTest] WITH CHECK ADD CONSTRAINT [TableProfile_RegressionTest_FK2] FOREIGN KEY (
[PreEtlProfileID]
)
REFERENCES [dbo].[TableProfile] (
[TableProfileID]
)
ALTER TABLE [dbo].[RegressionTest] WITH CHECK ADD CONSTRAINT [DataRequestTestConfig_RegressionTest_FK1] FOREIGN KEY (
[DataRequestTestConfigID]
)
REFERENCES [dbo].[DataRequestTestConfig] (
[DataRequestTestConfigID]
)
GO

ALTER TABLE [dbo].[ColumnHistogram] WITH CHECK ADD CONSTRAINT [ColumnProfile_ColumnHistogram_FK1] FOREIGN KEY (
[ColumnProfileID]
)
REFERENCES [dbo].[ColumnProfile] (
[ColumnProfileID]
)
GO

GO

