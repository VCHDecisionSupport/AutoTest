
USE CommunityMart
GO

IF EXISTS(SELECT * FROM sys.columns AS col WHERE col.name = 'PatientID' AND OBJECT_NAME(col.object_id) = 'YouthClinicActivityFact') 
BEGIN
	ALTER TABLE CommunityMart.dbo.YouthClinicActivityFact ALTER COLUMN PatientID int NULL;
	PRINT 'PatientID';
END

USE CommunityMart
GO

IF EXISTS(SELECT * FROM sys.columns AS col WHERE col.name = 'SourceSystemClientID' AND OBJECT_NAME(col.object_id) = 'YouthClinicActivityFact') 
BEGIN
	ALTER TABLE CommunityMart.dbo.YouthClinicActivityFact ALTER COLUMN SourceSystemClientID int NULL;
	PRINT 'CommunityMart.dbo.PersonFact.SourceSystemClientID';
END

USE CommunityMart
GO

IF EXISTS(SELECT * FROM sys.columns AS col WHERE col.name = 'CommunityServiceLocationID' AND OBJECT_NAME(col.object_id) = 'YouthClinicActivityFact') 
BEGIN
	ALTER TABLE CommunityMart.dbo.YouthClinicActivityFact ALTER COLUMN CommunityServiceLocationID int NULL;
	PRINT 'CommunityMart.Dim.CommunityServiceLocation.CommunityServiceLocationID';
END

USE CommunityMart
GO

IF EXISTS(SELECT * FROM sys.columns AS col WHERE col.name = 'SourceAssessmentID' AND OBJECT_NAME(col.object_id) = 'YouthClinicActivityFact') 
BEGIN
	ALTER TABLE CommunityMart.dbo.YouthClinicActivityFact ALTER COLUMN SourceAssessmentID int NULL;
	PRINT 'CommunityMart.dbo.AssessmentHeaderFact.SourceAssessmentID';
END

USE CommunityMart
GO

IF EXISTS(SELECT * FROM sys.columns AS col WHERE col.name = 'AssessmentReasonID' AND OBJECT_NAME(col.object_id) = 'YouthClinicActivityFact') 
BEGIN
	ALTER TABLE CommunityMart.dbo.YouthClinicActivityFact ALTER COLUMN AssessmentReasonID smallint NULL;
	PRINT 'CommunityMart.Dim.AssessmentReason.AssessmentReasonID';
END

USE CommunityMart
GO

IF EXISTS(SELECT * FROM sys.columns AS col WHERE col.name = 'AssessmentTypeID' AND OBJECT_NAME(col.object_id) = 'YouthClinicActivityFact') 
BEGIN
	ALTER TABLE CommunityMart.dbo.YouthClinicActivityFact ALTER COLUMN AssessmentTypeID smallint NULL;
	PRINT 'CommunityMart.Dim.AssessmentType.AssessmentTypeID';
END

USE CommunityMart
GO

IF EXISTS(SELECT * FROM sys.columns AS col WHERE col.name = 'SourceReferralID' AND OBJECT_NAME(col.object_id) = 'YouthClinicActivityFact') 
BEGIN
	ALTER TABLE CommunityMart.dbo.YouthClinicActivityFact ALTER COLUMN SourceReferralID int NULL;
	PRINT 'CommunityMart.dbo.ReferralFact.SourceReferralID';
END

USE CommunityMart
GO

IF EXISTS(SELECT * FROM sys.columns AS col WHERE col.name = 'LocalReportingOfficeID' AND OBJECT_NAME(col.object_id) = 'YouthClinicActivityFact') 
BEGIN
	ALTER TABLE CommunityMart.dbo.YouthClinicActivityFact ALTER COLUMN LocalReportingOfficeID int NULL;
	PRINT 'CommunityMart.Dim.LocalReportingOffice.LocalReportingOfficeID';
END

USE CommunityMart
GO

IF EXISTS(SELECT * FROM sys.columns AS col WHERE col.name = 'SourceAssessmentID' AND OBJECT_NAME(col.object_id) = 'YouthClinicActivityFact') 
BEGIN
	ALTER TABLE CommunityMart.dbo.YouthClinicActivityFact ALTER COLUMN SourceAssessmentID int NULL;
	PRINT 'CommunityMart.dbo.CDPreviousTestResultFact.SourceAssessmentID';
END

USE CommunityMart
GO

IF EXISTS(SELECT * FROM sys.columns AS col WHERE col.name = 'CommunityDiseaseID' AND OBJECT_NAME(col.object_id) = 'YouthClinicActivityFact') 
BEGIN
	ALTER TABLE CommunityMart.dbo.YouthClinicActivityFact ALTER COLUMN CommunityDiseaseID int NULL;
	PRINT 'CommunityMart.Dim.CommunityDisease.CommunityDiseaseID';
END

USE CommunityMart
GO

IF EXISTS(SELECT * FROM sys.columns AS col WHERE col.name = 'DischargeDispositionID' AND OBJECT_NAME(col.object_id) = 'YouthClinicActivityFact') 
BEGIN
	ALTER TABLE CommunityMart.dbo.YouthClinicActivityFact ALTER COLUMN DischargeDispositionID int NULL;
	PRINT 'CommunityMart.Dim.DischargeDisposition.DischargeDispositionID';
END

USE CommunityMart
GO

IF EXISTS(SELECT * FROM sys.columns AS col WHERE col.name = 'ReasonEndingServiceID' AND OBJECT_NAME(col.object_id) = 'YouthClinicActivityFact') 
BEGIN
	ALTER TABLE CommunityMart.dbo.YouthClinicActivityFact ALTER COLUMN ReasonEndingServiceID int NULL;
	PRINT 'CommunityMart.Dim.ReasonEndingService.ReasonEndingServiceID';
END

USE CommunityMart
GO

IF EXISTS(SELECT * FROM sys.columns AS col WHERE col.name = 'ReferralPriorityID' AND OBJECT_NAME(col.object_id) = 'YouthClinicActivityFact') 
BEGIN
	ALTER TABLE CommunityMart.dbo.YouthClinicActivityFact ALTER COLUMN ReferralPriorityID int NULL;
	PRINT 'CommunityMart.Dim.ReferralPriority.ReferralPriorityID';
END

USE CommunityMart
GO

IF EXISTS(SELECT * FROM sys.columns AS col WHERE col.name = 'ReferralSourceID' AND OBJECT_NAME(col.object_id) = 'YouthClinicActivityFact') 
BEGIN
	ALTER TABLE CommunityMart.dbo.YouthClinicActivityFact ALTER COLUMN ReferralSourceID int NULL;
	PRINT 'CommunityMart.Dim.ReferralSource.ReferralSourceID';
END

USE CommunityMart
GO

IF EXISTS(SELECT * FROM sys.columns AS col WHERE col.name = 'ReferralSourceLookupID' AND OBJECT_NAME(col.object_id) = 'YouthClinicActivityFact') 
BEGIN
	ALTER TABLE CommunityMart.dbo.YouthClinicActivityFact ALTER COLUMN ReferralSourceLookupID int NULL;
	PRINT 'CommunityMart.Dim.ReferralSourceLookup.ReferralSourceLookupID';
END

USE CommunityMart
GO

IF EXISTS(SELECT * FROM sys.columns AS col WHERE col.name = 'ProviderID' AND OBJECT_NAME(col.object_id) = 'YouthClinicActivityFact') 
BEGIN
	ALTER TABLE CommunityMart.dbo.YouthClinicActivityFact ALTER COLUMN ProviderID int NULL;
	PRINT 'CommunityMart.Dim.Provider.ProviderID';
END

USE CommunityMart
GO

IF EXISTS(SELECT * FROM sys.columns AS col WHERE col.name = 'ReferralReasonID' AND OBJECT_NAME(col.object_id) = 'YouthClinicActivityFact') 
BEGIN
	ALTER TABLE CommunityMart.dbo.YouthClinicActivityFact ALTER COLUMN ReferralReasonID int NULL;
	PRINT 'CommunityMart.Dim.ReferralReason.ReferralReasonID';
END

USE CommunityMart
GO

IF EXISTS(SELECT * FROM sys.columns AS col WHERE col.name = 'GenderID' AND OBJECT_NAME(col.object_id) = 'YouthClinicActivityFact') 
BEGIN
	ALTER TABLE CommunityMart.dbo.YouthClinicActivityFact ALTER COLUMN GenderID tinyint NULL;
	PRINT 'CommunityMart.Dim.Gender.GenderID';
END

USE CommunityMart
GO

IF EXISTS(SELECT * FROM sys.columns AS col WHERE col.name = 'ServiceProviderCategoryCodeID' AND OBJECT_NAME(col.object_id) = 'YouthClinicActivityFact') 
BEGIN
	ALTER TABLE CommunityMart.dbo.YouthClinicActivityFact ALTER COLUMN ServiceProviderCategoryCodeID int NULL;
	PRINT 'CommunityMart.Dim.ServiceProviderCategoryLookup.ServiceProviderCategoryCodeID';
END

USE CommunityMart
GO

IF EXISTS(SELECT * FROM sys.columns AS col WHERE col.name = 'DeathLocationID' AND OBJECT_NAME(col.object_id) = 'YouthClinicActivityFact') 
BEGIN
	ALTER TABLE CommunityMart.dbo.YouthClinicActivityFact ALTER COLUMN DeathLocationID smallint NULL;
	PRINT 'CommunityMart.Dim.DeathLocation.DeathLocationID';
END

USE CommunityMart
GO

IF EXISTS(SELECT * FROM sys.columns AS col WHERE col.name = 'EducationLevelCodeID' AND OBJECT_NAME(col.object_id) = 'YouthClinicActivityFact') 
BEGIN
	ALTER TABLE CommunityMart.dbo.YouthClinicActivityFact ALTER COLUMN EducationLevelCodeID tinyint NULL;
	PRINT 'CommunityMart.Dim.EducationLevelLookup.EducationLevelCodeID';
END

USE CommunityMart
GO

IF EXISTS(SELECT * FROM sys.columns AS col WHERE col.name = 'EthnicityID' AND OBJECT_NAME(col.object_id) = 'YouthClinicActivityFact') 
BEGIN
	ALTER TABLE CommunityMart.dbo.YouthClinicActivityFact ALTER COLUMN EthnicityID smallint NULL;
	PRINT 'CommunityMart.Dim.Ethnicity.EthnicityID';
END

USE CommunityMart
GO

IF EXISTS(SELECT * FROM sys.columns AS col WHERE col.name = 'DischargeDispositionCodeID' AND OBJECT_NAME(col.object_id) = 'YouthClinicActivityFact') 
BEGIN
	ALTER TABLE CommunityMart.dbo.YouthClinicActivityFact ALTER COLUMN DischargeDispositionCodeID int NULL;
	PRINT 'CommunityMart.Dim.DischargeDispositionLookupCOM.DischargeDispositionCodeID';
END

USE CommunityMart
GO

IF EXISTS(SELECT * FROM sys.columns AS col WHERE col.name = 'DischargeOutcomeID' AND OBJECT_NAME(col.object_id) = 'YouthClinicActivityFact') 
BEGIN
	ALTER TABLE CommunityMart.dbo.YouthClinicActivityFact ALTER COLUMN DischargeOutcomeID tinyint NULL;
	PRINT 'CommunityMart.Dim.DischargeOutcome.DischargeOutcomeID';
END

USE CommunityMart
GO

IF EXISTS(SELECT * FROM sys.columns AS col WHERE col.name = 'ReasonEndingServiceCodeID' AND OBJECT_NAME(col.object_id) = 'YouthClinicActivityFact') 
BEGIN
	ALTER TABLE CommunityMart.dbo.YouthClinicActivityFact ALTER COLUMN ReasonEndingServiceCodeID int NULL;
	PRINT 'CommunityMart.Dim.ReasonEndingServiceLookup.ReasonEndingServiceCodeID';
END

USE CommunityMart
GO

IF EXISTS(SELECT * FROM sys.columns AS col WHERE col.name = 'ReferralTypeID' AND OBJECT_NAME(col.object_id) = 'YouthClinicActivityFact') 
BEGIN
	ALTER TABLE CommunityMart.dbo.YouthClinicActivityFact ALTER COLUMN ReferralTypeID tinyint NULL;
	PRINT 'CommunityMart.Dim.ReferralType.ReferralTypeID';
END

USE CommunityMart
GO

IF EXISTS(SELECT * FROM sys.columns AS col WHERE col.name = 'EducationLevelID' AND OBJECT_NAME(col.object_id) = 'YouthClinicActivityFact') 
BEGIN
	ALTER TABLE CommunityMart.dbo.YouthClinicActivityFact ALTER COLUMN EducationLevelID tinyint NULL;
	PRINT 'CommunityMart.Dim.EducationLevel.EducationLevelID';
END

USE CommunityMart
GO

IF EXISTS(SELECT * FROM sys.columns AS col WHERE col.name = 'HSDAID' AND OBJECT_NAME(col.object_id) = 'YouthClinicActivityFact') 
BEGIN
	ALTER TABLE CommunityMart.dbo.YouthClinicActivityFact ALTER COLUMN HSDAID int NULL;
	PRINT 'CommunityMart.Dim.HSDA.HSDAID';
END

USE CommunityMart
GO

IF EXISTS(SELECT * FROM sys.columns AS col WHERE col.name = 'CommunityProgramID' AND OBJECT_NAME(col.object_id) = 'YouthClinicActivityFact') 
BEGIN
	ALTER TABLE CommunityMart.dbo.YouthClinicActivityFact ALTER COLUMN CommunityProgramID int NULL;
	PRINT 'CommunityMart.Dim.CommunityProgram.CommunityProgramID';
END

USE CommunityMart
GO

IF EXISTS(SELECT * FROM sys.columns AS col WHERE col.name = 'FacilityID' AND OBJECT_NAME(col.object_id) = 'YouthClinicActivityFact') 
BEGIN
	ALTER TABLE CommunityMart.dbo.YouthClinicActivityFact ALTER COLUMN FacilityID int NULL;
	PRINT 'CommunityMart.Dim.Facility.FacilityID';
END

USE CommunityMart
GO

IF EXISTS(SELECT * FROM sys.columns AS col WHERE col.name = 'LevelOfCareId' AND OBJECT_NAME(col.object_id) = 'YouthClinicActivityFact') 
BEGIN
	ALTER TABLE CommunityMart.dbo.YouthClinicActivityFact ALTER COLUMN LevelOfCareId int NULL;
	PRINT 'CommunityMart.Dim.LevelOfCare.LevelOfCareId';
END
