USE [TestLog]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ValueHistogram_ColumnValue]') AND parent_object_id = OBJECT_ID(N'[dbo].[ValueHistogram]'))
ALTER TABLE [dbo].[ValueHistogram] DROP CONSTRAINT [FK_ValueHistogram_ColumnValue]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ValueHistogram_ColumnProfile]') AND parent_object_id = OBJECT_ID(N'[dbo].[ValueHistogram]'))
ALTER TABLE [dbo].[ValueHistogram] DROP CONSTRAINT [FK_ValueHistogram_ColumnProfile]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ValueComparison_ColumnValue]') AND parent_object_id = OBJECT_ID(N'[dbo].[ValueComparison]'))
ALTER TABLE [dbo].[ValueComparison] DROP CONSTRAINT [FK_ValueComparison_ColumnValue]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ValueComparison_ColumnComparison]') AND parent_object_id = OBJECT_ID(N'[dbo].[ValueComparison]'))
ALTER TABLE [dbo].[ValueComparison] DROP CONSTRAINT [FK_ValueComparison_ColumnComparison]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_DataSetProfile_UserDescription]') AND parent_object_id = OBJECT_ID(N'[dbo].[DataSetProfile]'))
ALTER TABLE [dbo].[DataSetProfile] DROP CONSTRAINT [FK_DataSetProfile_UserDescription]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_DataSetProfile_DataSet]') AND parent_object_id = OBJECT_ID(N'[dbo].[DataSetProfile]'))
ALTER TABLE [dbo].[DataSetProfile] DROP CONSTRAINT [FK_DataSetProfile_DataSet]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_DataSetComparison_UserDescription]') AND parent_object_id = OBJECT_ID(N'[dbo].[DataSetComparison]'))
ALTER TABLE [dbo].[DataSetComparison] DROP CONSTRAINT [FK_DataSetComparison_UserDescription]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_DataSetComparison_DataSetB]') AND parent_object_id = OBJECT_ID(N'[dbo].[DataSetComparison]'))
ALTER TABLE [dbo].[DataSetComparison] DROP CONSTRAINT [FK_DataSetComparison_DataSetB]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_DataSetComparison_DataSetA]') AND parent_object_id = OBJECT_ID(N'[dbo].[DataSetComparison]'))
ALTER TABLE [dbo].[DataSetComparison] DROP CONSTRAINT [FK_DataSetComparison_DataSetA]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_DataSetColumn_DataSet]') AND parent_object_id = OBJECT_ID(N'[dbo].[DataSetColumn]'))
ALTER TABLE [dbo].[DataSetColumn] DROP CONSTRAINT [FK_DataSetColumn_DataSet]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_DataSet_UserDescription]') AND parent_object_id = OBJECT_ID(N'[dbo].[DataSet]'))
ALTER TABLE [dbo].[DataSet] DROP CONSTRAINT [FK_DataSet_UserDescription]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ColumnValue_DataSetColumn]') AND parent_object_id = OBJECT_ID(N'[dbo].[ColumnValue]'))
ALTER TABLE [dbo].[ColumnValue] DROP CONSTRAINT [FK_ColumnValue_DataSetColumn]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ColumnProfile_DataSetProfile]') AND parent_object_id = OBJECT_ID(N'[dbo].[ColumnProfile]'))
ALTER TABLE [dbo].[ColumnProfile] DROP CONSTRAINT [FK_ColumnProfile_DataSetProfile]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ColumnProfile_DataSetColumn]') AND parent_object_id = OBJECT_ID(N'[dbo].[ColumnProfile]'))
ALTER TABLE [dbo].[ColumnProfile] DROP CONSTRAINT [FK_ColumnProfile_DataSetColumn]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ColumnComparison_DataSetComparison]') AND parent_object_id = OBJECT_ID(N'[dbo].[ColumnComparison]'))
ALTER TABLE [dbo].[ColumnComparison] DROP CONSTRAINT [FK_ColumnComparison_DataSetComparison]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ColumnComparison_DataSetColumnB]') AND parent_object_id = OBJECT_ID(N'[dbo].[ColumnComparison]'))
ALTER TABLE [dbo].[ColumnComparison] DROP CONSTRAINT [FK_ColumnComparison_DataSetColumnB]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ColumnComparison_DataSetColumnA]') AND parent_object_id = OBJECT_ID(N'[dbo].[ColumnComparison]'))
ALTER TABLE [dbo].[ColumnComparison] DROP CONSTRAINT [FK_ColumnComparison_DataSetColumnA]
GO
/****** Object:  Table [dbo].[ValueHistogram]    Script Date: 6/25/2016 9:43:12 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ValueHistogram]') AND type in (N'U'))
DROP TABLE [dbo].[ValueHistogram]
GO
/****** Object:  Index [IX_ValueComparison]    Script Date: 6/25/2016 9:43:12 PM ******/
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[ValueComparison]') AND name = N'IX_ValueComparison')
DROP INDEX [IX_ValueComparison] ON [dbo].[ValueComparison] WITH ( ONLINE = OFF )
GO
/****** Object:  Table [dbo].[ValueComparison]    Script Date: 6/25/2016 9:43:12 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ValueComparison]') AND type in (N'U'))
DROP TABLE [dbo].[ValueComparison]
GO
/****** Object:  Index [IX_UserDescription]    Script Date: 6/25/2016 9:43:12 PM ******/
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[UserDescription]') AND name = N'IX_UserDescription')
DROP INDEX [IX_UserDescription] ON [dbo].[UserDescription] WITH ( ONLINE = OFF )
GO
/****** Object:  Table [dbo].[UserDescription]    Script Date: 6/25/2016 9:43:12 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UserDescription]') AND type in (N'U'))
DROP TABLE [dbo].[UserDescription]
GO
/****** Object:  Table [dbo].[DataSetProfile]    Script Date: 6/25/2016 9:43:12 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DataSetProfile]') AND type in (N'U'))
DROP TABLE [dbo].[DataSetProfile]
GO
/****** Object:  Index [IX_DataSetComparison]    Script Date: 6/25/2016 9:43:12 PM ******/
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[DataSetComparison]') AND name = N'IX_DataSetComparison')
DROP INDEX [IX_DataSetComparison] ON [dbo].[DataSetComparison] WITH ( ONLINE = OFF )
GO
/****** Object:  Table [dbo].[DataSetComparison]    Script Date: 6/25/2016 9:43:12 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DataSetComparison]') AND type in (N'U'))
DROP TABLE [dbo].[DataSetComparison]
GO
/****** Object:  Index [IX_DataSetColumn]    Script Date: 6/25/2016 9:43:12 PM ******/
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[DataSetColumn]') AND name = N'IX_DataSetColumn')
DROP INDEX [IX_DataSetColumn] ON [dbo].[DataSetColumn] WITH ( ONLINE = OFF )
GO
/****** Object:  Table [dbo].[DataSetColumn]    Script Date: 6/25/2016 9:43:12 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DataSetColumn]') AND type in (N'U'))
DROP TABLE [dbo].[DataSetColumn]
GO
/****** Object:  Table [dbo].[DataSet]    Script Date: 6/25/2016 9:43:12 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DataSet]') AND type in (N'U'))
DROP TABLE [dbo].[DataSet]
GO
/****** Object:  Index [IX_ColumnValue]    Script Date: 6/25/2016 9:43:12 PM ******/
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[ColumnValue]') AND name = N'IX_ColumnValue')
DROP INDEX [IX_ColumnValue] ON [dbo].[ColumnValue] WITH ( ONLINE = OFF )
GO
/****** Object:  Table [dbo].[ColumnValue]    Script Date: 6/25/2016 9:43:12 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ColumnValue]') AND type in (N'U'))
DROP TABLE [dbo].[ColumnValue]
GO
/****** Object:  Index [IX_ColumnProfile]    Script Date: 6/25/2016 9:43:12 PM ******/
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[ColumnProfile]') AND name = N'IX_ColumnProfile')
DROP INDEX [IX_ColumnProfile] ON [dbo].[ColumnProfile] WITH ( ONLINE = OFF )
GO
/****** Object:  Table [dbo].[ColumnProfile]    Script Date: 6/25/2016 9:43:12 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ColumnProfile]') AND type in (N'U'))
DROP TABLE [dbo].[ColumnProfile]
GO
/****** Object:  Index [IX_ColumnComparison]    Script Date: 6/25/2016 9:43:12 PM ******/
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[ColumnComparison]') AND name = N'IX_ColumnComparison')
DROP INDEX [IX_ColumnComparison] ON [dbo].[ColumnComparison] WITH ( ONLINE = OFF )
GO
/****** Object:  Table [dbo].[ColumnComparison]    Script Date: 6/25/2016 9:43:12 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ColumnComparison]') AND type in (N'U'))
DROP TABLE [dbo].[ColumnComparison]
GO
USE [master]
GO
/****** Object:  Database [TestLog]    Script Date: 6/25/2016 9:43:12 PM ******/
IF  EXISTS (SELECT name FROM sys.databases WHERE name = N'TestLog')
DROP DATABASE [TestLog]
GO
/****** Object:  Database [TestLog]    Script Date: 6/25/2016 9:43:12 PM ******/
IF NOT EXISTS (SELECT name FROM sys.databases WHERE name = N'TestLog')
BEGIN
CREATE DATABASE [TestLog]
END

GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [TestLog].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [TestLog] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [TestLog] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [TestLog] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [TestLog] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [TestLog] SET ARITHABORT OFF 
GO
ALTER DATABASE [TestLog] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [TestLog] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [TestLog] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [TestLog] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [TestLog] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [TestLog] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [TestLog] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [TestLog] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [TestLog] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [TestLog] SET  DISABLE_BROKER 
GO
ALTER DATABASE [TestLog] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [TestLog] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [TestLog] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [TestLog] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [TestLog] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [TestLog] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [TestLog] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [TestLog] SET RECOVERY FULL 
GO
ALTER DATABASE [TestLog] SET  MULTI_USER 
GO
ALTER DATABASE [TestLog] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [TestLog] SET DB_CHAINING OFF 
GO
ALTER DATABASE [TestLog] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [TestLog] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
EXEC sys.sp_db_vardecimal_storage_format N'TestLog', N'ON'
GO
USE [TestLog]
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [TestLog]
GO
/****** Object:  Table [dbo].[ColumnComparison]    Script Date: 6/25/2016 9:43:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ColumnComparison]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ColumnComparison](
	[ColumnComparisonID] [int] IDENTITY(1,1) NOT NULL,
	[DataSetComparisonID] [int] NOT NULL,
	[DataSetColumnAID] [int] NOT NULL,
	[DataSetColumnBID] [int] NOT NULL,
	[ColumnMatchCount] [int] NOT NULL,
 CONSTRAINT [PK_ColumnComparison] PRIMARY KEY NONCLUSTERED 
(
	[ColumnComparisonID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Index [IX_ColumnComparison]    Script Date: 6/25/2016 9:43:12 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[ColumnComparison]') AND name = N'IX_ColumnComparison')
CREATE UNIQUE CLUSTERED INDEX [IX_ColumnComparison] ON [dbo].[ColumnComparison]
(
	[ColumnComparisonID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ColumnProfile]    Script Date: 6/25/2016 9:43:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ColumnProfile]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ColumnProfile](
	[ColumnProfileID] [int] IDENTITY(1,1) NOT NULL,
	[DataSetProfileID] [int] NOT NULL,
	[DataSetColumnID] [int] NOT NULL,
	[UniqueCount] [int] NOT NULL,
	[NonUniqueCount] [int] NOT NULL,
	[NullCount] [int] NOT NULL,
 CONSTRAINT [PK_ColumnProfile] PRIMARY KEY NONCLUSTERED 
(
	[ColumnProfileID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Index [IX_ColumnProfile]    Script Date: 6/25/2016 9:43:12 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[ColumnProfile]') AND name = N'IX_ColumnProfile')
CREATE UNIQUE CLUSTERED INDEX [IX_ColumnProfile] ON [dbo].[ColumnProfile]
(
	[ColumnProfileID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ColumnValue]    Script Date: 6/25/2016 9:43:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ColumnValue]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ColumnValue](
	[ColumnValueID] [int] IDENTITY(1,1) NOT NULL,
	[DataSetColumnID] [int] NOT NULL,
	[ColumnValue] [varchar](200) NOT NULL,
 CONSTRAINT [PK_ColumnValue] PRIMARY KEY NONCLUSTERED 
(
	[ColumnValueID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Index [IX_ColumnValue]    Script Date: 6/25/2016 9:43:12 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[ColumnValue]') AND name = N'IX_ColumnValue')
CREATE UNIQUE CLUSTERED INDEX [IX_ColumnValue] ON [dbo].[ColumnValue]
(
	[ColumnValueID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DataSet]    Script Date: 6/25/2016 9:43:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DataSet]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[DataSet](
	[DataSetID] [int] IDENTITY(1,1) NOT NULL,
	[UserQuery] [varchar](max) NOT NULL,
	[UserDescriptionID] [int] NULL,
	[ServerName] [varchar](100) NULL,
 CONSTRAINT [PK_DataSet] PRIMARY KEY NONCLUSTERED 
(
	[DataSetID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [IX_DataSet] UNIQUE CLUSTERED 
(
	[DataSetID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[DataSetColumn]    Script Date: 6/25/2016 9:43:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DataSetColumn]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[DataSetColumn](
	[DataSetColumnID] [int] IDENTITY(1,1) NOT NULL,
	[DataSetID] [int] NOT NULL,
	[ColumnName] [varchar](100) NOT NULL,
	[ColumnTypeID] [int] NOT NULL,
 CONSTRAINT [PK_DataSetColumn] PRIMARY KEY NONCLUSTERED 
(
	[DataSetColumnID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Index [IX_DataSetColumn]    Script Date: 6/25/2016 9:43:12 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[DataSetColumn]') AND name = N'IX_DataSetColumn')
CREATE UNIQUE CLUSTERED INDEX [IX_DataSetColumn] ON [dbo].[DataSetColumn]
(
	[DataSetColumnID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DataSetComparison]    Script Date: 6/25/2016 9:43:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DataSetComparison]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[DataSetComparison](
	[DataSetComparisonID] [int] IDENTITY(1,1) NOT NULL,
	[DataSetAID] [int] NOT NULL,
	[DataSetBID] [int] NOT NULL,
	[KeyMatchCount] [int] NOT NULL,
	[RecordMatchCount] [int] NOT NULL,
	[UserDescriptionID] [int] NULL,
 CONSTRAINT [PK_DataSetComparison] PRIMARY KEY NONCLUSTERED 
(
	[DataSetComparisonID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Index [IX_DataSetComparison]    Script Date: 6/25/2016 9:43:12 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[DataSetComparison]') AND name = N'IX_DataSetComparison')
CREATE UNIQUE CLUSTERED INDEX [IX_DataSetComparison] ON [dbo].[DataSetComparison]
(
	[DataSetComparisonID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DataSetProfile]    Script Date: 6/25/2016 9:43:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DataSetProfile]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[DataSetProfile](
	[DataSetProfileID] [int] IDENTITY(1,1) NOT NULL,
	[DataSetID] [int] NOT NULL,
	[RecordCount] [int] NOT NULL,
	[UserDescriptionID] [int] NULL,
 CONSTRAINT [PK_DataSetProfile] PRIMARY KEY NONCLUSTERED 
(
	[DataSetProfileID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [IX_DataSetProfile] UNIQUE CLUSTERED 
(
	[DataSetProfileID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[UserDescription]    Script Date: 6/25/2016 9:43:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UserDescription]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[UserDescription](
	[UserDescriptionID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[DataRequestID] [int] NULL,
	[Description] [varchar](max) NULL,
	[UserDescriptionDate] [datetime] NOT NULL,
 CONSTRAINT [PK_UserDescription] PRIMARY KEY NONCLUSTERED 
(
	[UserDescriptionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Index [IX_UserDescription]    Script Date: 6/25/2016 9:43:12 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[UserDescription]') AND name = N'IX_UserDescription')
CREATE UNIQUE CLUSTERED INDEX [IX_UserDescription] ON [dbo].[UserDescription]
(
	[UserDescriptionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ValueComparison]    Script Date: 6/25/2016 9:43:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ValueComparison]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ValueComparison](
	[ValueComparisonID] [int] IDENTITY(1,1) NOT NULL,
	[ColumnComparisonID] [int] NULL,
	[ColumnValueID] [int] NULL,
	[ValueMatchCount] [int] NULL,
 CONSTRAINT [PK_ValueComparison] PRIMARY KEY NONCLUSTERED 
(
	[ValueComparisonID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Index [IX_ValueComparison]    Script Date: 6/25/2016 9:43:12 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[ValueComparison]') AND name = N'IX_ValueComparison')
CREATE UNIQUE CLUSTERED INDEX [IX_ValueComparison] ON [dbo].[ValueComparison]
(
	[ValueComparisonID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ValueHistogram]    Script Date: 6/25/2016 9:43:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ValueHistogram]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ValueHistogram](
	[ValueHistogramID] [int] IDENTITY(1,1) NOT NULL,
	[ColumnProfileID] [int] NOT NULL,
	[ColumnValueID] [int] NOT NULL,
	[ValueCount] [int] NOT NULL,
 CONSTRAINT [PK_ValueHistogram] PRIMARY KEY CLUSTERED 
(
	[ValueHistogramID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ColumnComparison_DataSetColumnA]') AND parent_object_id = OBJECT_ID(N'[dbo].[ColumnComparison]'))
ALTER TABLE [dbo].[ColumnComparison]  WITH CHECK ADD  CONSTRAINT [FK_ColumnComparison_DataSetColumnA] FOREIGN KEY([DataSetColumnAID])
REFERENCES [dbo].[DataSetColumn] ([DataSetColumnID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ColumnComparison_DataSetColumnA]') AND parent_object_id = OBJECT_ID(N'[dbo].[ColumnComparison]'))
ALTER TABLE [dbo].[ColumnComparison] CHECK CONSTRAINT [FK_ColumnComparison_DataSetColumnA]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ColumnComparison_DataSetColumnB]') AND parent_object_id = OBJECT_ID(N'[dbo].[ColumnComparison]'))
ALTER TABLE [dbo].[ColumnComparison]  WITH CHECK ADD  CONSTRAINT [FK_ColumnComparison_DataSetColumnB] FOREIGN KEY([DataSetColumnBID])
REFERENCES [dbo].[DataSetColumn] ([DataSetColumnID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ColumnComparison_DataSetColumnB]') AND parent_object_id = OBJECT_ID(N'[dbo].[ColumnComparison]'))
ALTER TABLE [dbo].[ColumnComparison] CHECK CONSTRAINT [FK_ColumnComparison_DataSetColumnB]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ColumnComparison_DataSetComparison]') AND parent_object_id = OBJECT_ID(N'[dbo].[ColumnComparison]'))
ALTER TABLE [dbo].[ColumnComparison]  WITH CHECK ADD  CONSTRAINT [FK_ColumnComparison_DataSetComparison] FOREIGN KEY([ColumnComparisonID])
REFERENCES [dbo].[DataSetComparison] ([DataSetComparisonID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ColumnComparison_DataSetComparison]') AND parent_object_id = OBJECT_ID(N'[dbo].[ColumnComparison]'))
ALTER TABLE [dbo].[ColumnComparison] CHECK CONSTRAINT [FK_ColumnComparison_DataSetComparison]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ColumnProfile_DataSetColumn]') AND parent_object_id = OBJECT_ID(N'[dbo].[ColumnProfile]'))
ALTER TABLE [dbo].[ColumnProfile]  WITH CHECK ADD  CONSTRAINT [FK_ColumnProfile_DataSetColumn] FOREIGN KEY([DataSetColumnID])
REFERENCES [dbo].[DataSetColumn] ([DataSetColumnID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ColumnProfile_DataSetColumn]') AND parent_object_id = OBJECT_ID(N'[dbo].[ColumnProfile]'))
ALTER TABLE [dbo].[ColumnProfile] CHECK CONSTRAINT [FK_ColumnProfile_DataSetColumn]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ColumnProfile_DataSetProfile]') AND parent_object_id = OBJECT_ID(N'[dbo].[ColumnProfile]'))
ALTER TABLE [dbo].[ColumnProfile]  WITH CHECK ADD  CONSTRAINT [FK_ColumnProfile_DataSetProfile] FOREIGN KEY([DataSetProfileID])
REFERENCES [dbo].[DataSetProfile] ([DataSetProfileID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ColumnProfile_DataSetProfile]') AND parent_object_id = OBJECT_ID(N'[dbo].[ColumnProfile]'))
ALTER TABLE [dbo].[ColumnProfile] CHECK CONSTRAINT [FK_ColumnProfile_DataSetProfile]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ColumnValue_DataSetColumn]') AND parent_object_id = OBJECT_ID(N'[dbo].[ColumnValue]'))
ALTER TABLE [dbo].[ColumnValue]  WITH CHECK ADD  CONSTRAINT [FK_ColumnValue_DataSetColumn] FOREIGN KEY([DataSetColumnID])
REFERENCES [dbo].[DataSetColumn] ([DataSetColumnID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ColumnValue_DataSetColumn]') AND parent_object_id = OBJECT_ID(N'[dbo].[ColumnValue]'))
ALTER TABLE [dbo].[ColumnValue] CHECK CONSTRAINT [FK_ColumnValue_DataSetColumn]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_DataSet_UserDescription]') AND parent_object_id = OBJECT_ID(N'[dbo].[DataSet]'))
ALTER TABLE [dbo].[DataSet]  WITH CHECK ADD  CONSTRAINT [FK_DataSet_UserDescription] FOREIGN KEY([UserDescriptionID])
REFERENCES [dbo].[UserDescription] ([UserDescriptionID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_DataSet_UserDescription]') AND parent_object_id = OBJECT_ID(N'[dbo].[DataSet]'))
ALTER TABLE [dbo].[DataSet] CHECK CONSTRAINT [FK_DataSet_UserDescription]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_DataSetColumn_DataSet]') AND parent_object_id = OBJECT_ID(N'[dbo].[DataSetColumn]'))
ALTER TABLE [dbo].[DataSetColumn]  WITH CHECK ADD  CONSTRAINT [FK_DataSetColumn_DataSet] FOREIGN KEY([DataSetID])
REFERENCES [dbo].[DataSet] ([DataSetID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_DataSetColumn_DataSet]') AND parent_object_id = OBJECT_ID(N'[dbo].[DataSetColumn]'))
ALTER TABLE [dbo].[DataSetColumn] CHECK CONSTRAINT [FK_DataSetColumn_DataSet]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_DataSetComparison_DataSetA]') AND parent_object_id = OBJECT_ID(N'[dbo].[DataSetComparison]'))
ALTER TABLE [dbo].[DataSetComparison]  WITH CHECK ADD  CONSTRAINT [FK_DataSetComparison_DataSetA] FOREIGN KEY([DataSetAID])
REFERENCES [dbo].[DataSet] ([DataSetID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_DataSetComparison_DataSetA]') AND parent_object_id = OBJECT_ID(N'[dbo].[DataSetComparison]'))
ALTER TABLE [dbo].[DataSetComparison] CHECK CONSTRAINT [FK_DataSetComparison_DataSetA]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_DataSetComparison_DataSetB]') AND parent_object_id = OBJECT_ID(N'[dbo].[DataSetComparison]'))
ALTER TABLE [dbo].[DataSetComparison]  WITH CHECK ADD  CONSTRAINT [FK_DataSetComparison_DataSetB] FOREIGN KEY([DataSetBID])
REFERENCES [dbo].[DataSet] ([DataSetID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_DataSetComparison_DataSetB]') AND parent_object_id = OBJECT_ID(N'[dbo].[DataSetComparison]'))
ALTER TABLE [dbo].[DataSetComparison] CHECK CONSTRAINT [FK_DataSetComparison_DataSetB]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_DataSetComparison_UserDescription]') AND parent_object_id = OBJECT_ID(N'[dbo].[DataSetComparison]'))
ALTER TABLE [dbo].[DataSetComparison]  WITH CHECK ADD  CONSTRAINT [FK_DataSetComparison_UserDescription] FOREIGN KEY([UserDescriptionID])
REFERENCES [dbo].[UserDescription] ([UserDescriptionID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_DataSetComparison_UserDescription]') AND parent_object_id = OBJECT_ID(N'[dbo].[DataSetComparison]'))
ALTER TABLE [dbo].[DataSetComparison] CHECK CONSTRAINT [FK_DataSetComparison_UserDescription]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_DataSetProfile_DataSet]') AND parent_object_id = OBJECT_ID(N'[dbo].[DataSetProfile]'))
ALTER TABLE [dbo].[DataSetProfile]  WITH CHECK ADD  CONSTRAINT [FK_DataSetProfile_DataSet] FOREIGN KEY([DataSetID])
REFERENCES [dbo].[DataSet] ([DataSetID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_DataSetProfile_DataSet]') AND parent_object_id = OBJECT_ID(N'[dbo].[DataSetProfile]'))
ALTER TABLE [dbo].[DataSetProfile] CHECK CONSTRAINT [FK_DataSetProfile_DataSet]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_DataSetProfile_UserDescription]') AND parent_object_id = OBJECT_ID(N'[dbo].[DataSetProfile]'))
ALTER TABLE [dbo].[DataSetProfile]  WITH CHECK ADD  CONSTRAINT [FK_DataSetProfile_UserDescription] FOREIGN KEY([UserDescriptionID])
REFERENCES [dbo].[UserDescription] ([UserDescriptionID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_DataSetProfile_UserDescription]') AND parent_object_id = OBJECT_ID(N'[dbo].[DataSetProfile]'))
ALTER TABLE [dbo].[DataSetProfile] CHECK CONSTRAINT [FK_DataSetProfile_UserDescription]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ValueComparison_ColumnComparison]') AND parent_object_id = OBJECT_ID(N'[dbo].[ValueComparison]'))
ALTER TABLE [dbo].[ValueComparison]  WITH CHECK ADD  CONSTRAINT [FK_ValueComparison_ColumnComparison] FOREIGN KEY([ColumnComparisonID])
REFERENCES [dbo].[ColumnComparison] ([ColumnComparisonID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ValueComparison_ColumnComparison]') AND parent_object_id = OBJECT_ID(N'[dbo].[ValueComparison]'))
ALTER TABLE [dbo].[ValueComparison] CHECK CONSTRAINT [FK_ValueComparison_ColumnComparison]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ValueComparison_ColumnValue]') AND parent_object_id = OBJECT_ID(N'[dbo].[ValueComparison]'))
ALTER TABLE [dbo].[ValueComparison]  WITH CHECK ADD  CONSTRAINT [FK_ValueComparison_ColumnValue] FOREIGN KEY([ColumnValueID])
REFERENCES [dbo].[ColumnValue] ([ColumnValueID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ValueComparison_ColumnValue]') AND parent_object_id = OBJECT_ID(N'[dbo].[ValueComparison]'))
ALTER TABLE [dbo].[ValueComparison] CHECK CONSTRAINT [FK_ValueComparison_ColumnValue]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ValueHistogram_ColumnProfile]') AND parent_object_id = OBJECT_ID(N'[dbo].[ValueHistogram]'))
ALTER TABLE [dbo].[ValueHistogram]  WITH CHECK ADD  CONSTRAINT [FK_ValueHistogram_ColumnProfile] FOREIGN KEY([ColumnProfileID])
REFERENCES [dbo].[ColumnProfile] ([ColumnProfileID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ValueHistogram_ColumnProfile]') AND parent_object_id = OBJECT_ID(N'[dbo].[ValueHistogram]'))
ALTER TABLE [dbo].[ValueHistogram] CHECK CONSTRAINT [FK_ValueHistogram_ColumnProfile]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ValueHistogram_ColumnValue]') AND parent_object_id = OBJECT_ID(N'[dbo].[ValueHistogram]'))
ALTER TABLE [dbo].[ValueHistogram]  WITH CHECK ADD  CONSTRAINT [FK_ValueHistogram_ColumnValue] FOREIGN KEY([ColumnValueID])
REFERENCES [dbo].[ColumnValue] ([ColumnValueID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ValueHistogram_ColumnValue]') AND parent_object_id = OBJECT_ID(N'[dbo].[ValueHistogram]'))
ALTER TABLE [dbo].[ValueHistogram] CHECK CONSTRAINT [FK_ValueHistogram_ColumnValue]
GO
USE [master]
GO
ALTER DATABASE [TestLog] SET  READ_WRITE 
GO
