USE CommunityMart
GO

IF NOT EXISTS(SELECT * FROM sys.columns AS col WHERE col.name = 'AssessmentReasonID' AND OBJECT_NAME(col.object_id) = 'AssessmentContactFact') 
BEGIN
	ALTER TABLE dbo.AssessmentContactFact ADD AssessmentReasonID smallint;
END
PRINT 'dbo.AssessmentContactFact'USE CommunityMart
GO

IF NOT EXISTS(SELECT * FROM sys.columns AS col WHERE col.name = 'AssessmentTypeID' AND OBJECT_NAME(col.object_id) = 'AssessmentContactFact') 
BEGIN
	ALTER TABLE dbo.AssessmentContactFact ADD AssessmentTypeID smallint;
END
PRINT 'dbo.AssessmentContactFact'USE CommunityMart
GO

IF NOT EXISTS(SELECT * FROM sys.columns AS col WHERE col.name = 'SourceReferralID' AND OBJECT_NAME(col.object_id) = 'AssessmentContactFact') 
BEGIN
	ALTER TABLE dbo.AssessmentContactFact ADD SourceReferralID int;
END
PRINT 'dbo.AssessmentContactFact'USE CommunityMart
GO

IF NOT EXISTS(SELECT * FROM sys.columns AS col WHERE col.name = 'DeathLocationID' AND OBJECT_NAME(col.object_id) = 'AssessmentContactFact') 
BEGIN
	ALTER TABLE dbo.AssessmentContactFact ADD DeathLocationID smallint;
END
PRINT 'dbo.AssessmentContactFact'USE CommunityMart
GO

IF NOT EXISTS(SELECT * FROM sys.columns AS col WHERE col.name = 'EducationLevelCodeID' AND OBJECT_NAME(col.object_id) = 'AssessmentContactFact') 
BEGIN
	ALTER TABLE dbo.AssessmentContactFact ADD EducationLevelCodeID tinyint;
END
PRINT 'dbo.AssessmentContactFact'USE CommunityMart
GO

IF NOT EXISTS(SELECT * FROM sys.columns AS col WHERE col.name = 'EthnicityID' AND OBJECT_NAME(col.object_id) = 'AssessmentContactFact') 
BEGIN
	ALTER TABLE dbo.AssessmentContactFact ADD EthnicityID smallint;
END
PRINT 'dbo.AssessmentContactFact'USE CommunityMart
GO

IF NOT EXISTS(SELECT * FROM sys.columns AS col WHERE col.name = 'GenderID' AND OBJECT_NAME(col.object_id) = 'AssessmentContactFact') 
BEGIN
	ALTER TABLE dbo.AssessmentContactFact ADD GenderID tinyint;
END
PRINT 'dbo.AssessmentContactFact'USE CommunityMart
GO

IF NOT EXISTS(SELECT * FROM sys.columns AS col WHERE col.name = 'DischargeDispositionCodeID' AND OBJECT_NAME(col.object_id) = 'AssessmentContactFact') 
BEGIN
	ALTER TABLE dbo.AssessmentContactFact ADD DischargeDispositionCodeID int;
END
PRINT 'dbo.AssessmentContactFact'USE CommunityMart
GO

IF NOT EXISTS(SELECT * FROM sys.columns AS col WHERE col.name = 'DischargeOutcomeID' AND OBJECT_NAME(col.object_id) = 'AssessmentContactFact') 
BEGIN
	ALTER TABLE dbo.AssessmentContactFact ADD DischargeOutcomeID tinyint;
END
PRINT 'dbo.AssessmentContactFact'USE CommunityMart
GO

IF NOT EXISTS(SELECT * FROM sys.columns AS col WHERE col.name = 'LocalReportingOfficeID' AND OBJECT_NAME(col.object_id) = 'AssessmentContactFact') 
BEGIN
	ALTER TABLE dbo.AssessmentContactFact ADD LocalReportingOfficeID int;
END
PRINT 'dbo.AssessmentContactFact'USE CommunityMart
GO

IF NOT EXISTS(SELECT * FROM sys.columns AS col WHERE col.name = 'ReasonEndingServiceCodeID' AND OBJECT_NAME(col.object_id) = 'AssessmentContactFact') 
BEGIN
	ALTER TABLE dbo.AssessmentContactFact ADD ReasonEndingServiceCodeID int;
END
PRINT 'dbo.AssessmentContactFact'USE CommunityMart
GO

IF NOT EXISTS(SELECT * FROM sys.columns AS col WHERE col.name = 'ReferralPriorityID' AND OBJECT_NAME(col.object_id) = 'AssessmentContactFact') 
BEGIN
	ALTER TABLE dbo.AssessmentContactFact ADD ReferralPriorityID int;
END
PRINT 'dbo.AssessmentContactFact'USE CommunityMart
GO

IF NOT EXISTS(SELECT * FROM sys.columns AS col WHERE col.name = 'ReferralReasonID' AND OBJECT_NAME(col.object_id) = 'AssessmentContactFact') 
BEGIN
	ALTER TABLE dbo.AssessmentContactFact ADD ReferralReasonID int;
END
PRINT 'dbo.AssessmentContactFact'USE CommunityMart
GO

IF NOT EXISTS(SELECT * FROM sys.columns AS col WHERE col.name = 'ReferralSourceLookupID' AND OBJECT_NAME(col.object_id) = 'AssessmentContactFact') 
BEGIN
	ALTER TABLE dbo.AssessmentContactFact ADD ReferralSourceLookupID int;
END
PRINT 'dbo.AssessmentContactFact'USE CommunityMart
GO

IF NOT EXISTS(SELECT * FROM sys.columns AS col WHERE col.name = 'ReferralTypeID' AND OBJECT_NAME(col.object_id) = 'AssessmentContactFact') 
BEGIN
	ALTER TABLE dbo.AssessmentContactFact ADD ReferralTypeID tinyint;
END
PRINT 'dbo.AssessmentContactFact'USE CommunityMart
GO

IF NOT EXISTS(SELECT * FROM sys.columns AS col WHERE col.name = 'SourceSystemClientID' AND OBJECT_NAME(col.object_id) = 'AssessmentContactFact') 
BEGIN
	ALTER TABLE dbo.AssessmentContactFact ADD SourceSystemClientID int;
END
PRINT 'dbo.AssessmentContactFact'USE CommunityMart
GO

IF NOT EXISTS(SELECT * FROM sys.columns AS col WHERE col.name = 'DischargeDispositionID' AND OBJECT_NAME(col.object_id) = 'AssessmentContactFact') 
BEGIN
	ALTER TABLE dbo.AssessmentContactFact ADD DischargeDispositionID int;
END
PRINT 'dbo.AssessmentContactFact'USE CommunityMart
GO

IF NOT EXISTS(SELECT * FROM sys.columns AS col WHERE col.name = 'EducationLevelID' AND OBJECT_NAME(col.object_id) = 'AssessmentContactFact') 
BEGIN
	ALTER TABLE dbo.AssessmentContactFact ADD EducationLevelID tinyint;
END
PRINT 'dbo.AssessmentContactFact'USE CommunityMart
GO

IF NOT EXISTS(SELECT * FROM sys.columns AS col WHERE col.name = 'HSDAID' AND OBJECT_NAME(col.object_id) = 'AssessmentContactFact') 
BEGIN
	ALTER TABLE dbo.AssessmentContactFact ADD HSDAID int;
END
PRINT 'dbo.AssessmentContactFact'USE CommunityMart
GO

IF NOT EXISTS(SELECT * FROM sys.columns AS col WHERE col.name = 'CommunityProgramID' AND OBJECT_NAME(col.object_id) = 'AssessmentContactFact') 
BEGIN
	ALTER TABLE dbo.AssessmentContactFact ADD CommunityProgramID int;
END
PRINT 'dbo.AssessmentContactFact'USE CommunityMart
GO

IF NOT EXISTS(SELECT * FROM sys.columns AS col WHERE col.name = 'ProviderID' AND OBJECT_NAME(col.object_id) = 'AssessmentContactFact') 
BEGIN
	ALTER TABLE dbo.AssessmentContactFact ADD ProviderID int;
END
PRINT 'dbo.AssessmentContactFact'USE CommunityMart
GO

IF NOT EXISTS(SELECT * FROM sys.columns AS col WHERE col.name = 'FacilityID' AND OBJECT_NAME(col.object_id) = 'AssessmentContactFact') 
BEGIN
	ALTER TABLE dbo.AssessmentContactFact ADD FacilityID int;
END
PRINT 'dbo.AssessmentContactFact'USE CommunityMart
GO

IF NOT EXISTS(SELECT * FROM sys.columns AS col WHERE col.name = 'LevelOfCareId' AND OBJECT_NAME(col.object_id) = 'AssessmentContactFact') 
BEGIN
	ALTER TABLE dbo.AssessmentContactFact ADD LevelOfCareId int;
END
PRINT 'dbo.AssessmentContactFact'USE CommunityMart
GO

IF NOT EXISTS(SELECT * FROM sys.columns AS col WHERE col.name = 'ReasonEndingServiceID' AND OBJECT_NAME(col.object_id) = 'AssessmentContactFact') 
BEGIN
	ALTER TABLE dbo.AssessmentContactFact ADD ReasonEndingServiceID int;
END
PRINT 'dbo.AssessmentContactFact'USE CommunityMart
GO

IF NOT EXISTS(SELECT * FROM sys.columns AS col WHERE col.name = 'ReferralSourceID' AND OBJECT_NAME(col.object_id) = 'AssessmentContactFact') 
BEGIN
	ALTER TABLE dbo.AssessmentContactFact ADD ReferralSourceID int;
END
PRINT 'dbo.AssessmentContactFact'