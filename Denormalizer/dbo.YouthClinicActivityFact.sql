

--#region BR dbo.YouthClinicActivityFact
SET @UpdatedBy = 'VCH\GCrowell'
SET @CreatedBy ='VCH\GCrowell'
SET @IsActive = 1;
SET @IsLogged = 1;
SET @GUID = '7a502dec-77c7-11e6-bbf5-00232444dba2'
SELECT @BRID=BRID FROM dbo.DQMF_BizRule WHERE GUID=@GUID

SET @ActionSQL = '
BEGIN
	SELECT
	ServiceProviderCategoryCodeID
	,SourceAssessmentID
	,AssessmentReasonID
	,SourceReferralID
	,ReferralReasonID
	,DischargeOutcomeID
	,ReferralTypeID
	,SourceSystemClientID
	,EthnicityID
	,EducationLevelCodeID
	,EducationLevelID
	,DeathLocationID
	,GenderID
	,ReasonEndingServiceCodeID
	,ReasonEndingServiceID
	,DischargeDispositionCodeID
	,DischargeDispositionID
	,ReferralSourceLookupID
	,ReferralSourceID
	,LocalReportingOfficeID
	,ProviderID
	,LevelOfCareId
	,FacilityID
	,HSDAID
	,CommunityProgramID
	,ReferralPriorityID
	,AssessmentTypeID
	,CommunityServiceLocationID
	,SourceAssessmentID
	,CommunityDiseaseID
FROM dbo.YouthClinicActivityFact
JOIN Dim.ServiceProviderCategoryLookup
ON Dim.ServiceProviderCategoryLookup.ServiceProviderCategoryCodeID=dbo.YouthClinicActivityFact.ServiceProviderCategoryCodeID
JOIN dbo.AssessmentHeaderFact
ON dbo.AssessmentHeaderFact.SourceAssessmentID=dbo.YouthClinicActivityFact.SourceAssessmentID
	JOIN Dim.AssessmentReason
	ON Dim.AssessmentReason.AssessmentReasonID=dbo.AssessmentHeaderFact.AssessmentReasonID
	JOIN dbo.ReferralFact
	ON dbo.ReferralFact.SourceReferralID=dbo.AssessmentHeaderFact.SourceReferralID
		JOIN Dim.ReferralReason
		ON Dim.ReferralReason.ReferralReasonID=dbo.ReferralFact.ReferralReasonID
		JOIN Dim.DischargeOutcome
		ON Dim.DischargeOutcome.DischargeOutcomeID=dbo.ReferralFact.DischargeOutcomeID
		JOIN Dim.ReferralType
		ON Dim.ReferralType.ReferralTypeID=dbo.ReferralFact.ReferralTypeID
		JOIN dbo.PersonFact
		ON dbo.PersonFact.SourceSystemClientID=dbo.ReferralFact.SourceSystemClientID
			JOIN Dim.Ethnicity
			ON Dim.Ethnicity.EthnicityID=dbo.PersonFact.EthnicityID
			JOIN Dim.EducationLevelLookup
			ON Dim.EducationLevelLookup.EducationLevelCodeID=dbo.PersonFact.EducationLevelCodeID
				JOIN Dim.EducationLevel
				ON Dim.EducationLevel.EducationLevelID=Dim.EducationLevelLookup.EducationLevelID
			JOIN Dim.DeathLocation
			ON Dim.DeathLocation.DeathLocationID=dbo.PersonFact.DeathLocationID
			JOIN Dim.Gender
			ON Dim.Gender.GenderID=dbo.PersonFact.GenderID
		JOIN Dim.ReasonEndingServiceLookup
		ON Dim.ReasonEndingServiceLookup.ReasonEndingServiceCodeID=dbo.ReferralFact.ReasonEndingServiceCodeID
			JOIN Dim.ReasonEndingService
			ON Dim.ReasonEndingService.ReasonEndingServiceID=Dim.ReasonEndingServiceLookup.ReasonEndingServiceID
		JOIN Dim.DischargeDispositionLookupCOM
		ON Dim.DischargeDispositionLookupCOM.DischargeDispositionCodeID=dbo.ReferralFact.DischargeDispositionCodeID
			JOIN Dim.DischargeDisposition
			ON Dim.DischargeDisposition.DischargeDispositionID=Dim.DischargeDispositionLookupCOM.DischargeDispositionID
		JOIN Dim.ReferralSourceLookup
		ON Dim.ReferralSourceLookup.ReferralSourceLookupID=dbo.ReferralFact.ReferralSourceLookupID
			JOIN Dim.ReferralSource
			ON Dim.ReferralSource.ReferralSourceID=Dim.ReferralSourceLookup.ReferralSourceID
		JOIN Dim.LocalReportingOffice
		ON Dim.LocalReportingOffice.LocalReportingOfficeID=dbo.ReferralFact.LocalReportingOfficeID
			JOIN Dim.Provider
			ON Dim.Provider.ProviderID=Dim.LocalReportingOffice.ProviderID
				JOIN Dim.LevelOfCare
				ON Dim.LevelOfCare.LevelOfCareId=Dim.Provider.LevelOfCareId
				JOIN Dim.Facility
				ON Dim.Facility.FacilityID=Dim.Provider.FacilityID
					JOIN Dim.HSDA
					ON Dim.HSDA.HSDAID=Dim.Facility.HSDAID
			JOIN Dim.CommunityProgram
			ON Dim.CommunityProgram.CommunityProgramID=Dim.LocalReportingOffice.CommunityProgramID
		JOIN Dim.ReferralPriority
		ON Dim.ReferralPriority.ReferralPriorityID=dbo.ReferralFact.ReferralPriorityID
	JOIN Dim.AssessmentType
	ON Dim.AssessmentType.AssessmentTypeID=dbo.AssessmentHeaderFact.AssessmentTypeID
JOIN Dim.CommunityServiceLocation
ON Dim.CommunityServiceLocation.CommunityServiceLocationID=dbo.YouthClinicActivityFact.CommunityServiceLocationID
JOIN dbo.CDPreviousTestResultFact
ON dbo.CDPreviousTestResultFact.SourceAssessmentID=dbo.YouthClinicActivityFact.SourceAssessmentID
	JOIN Dim.CommunityDisease
	ON Dim.CommunityDisease.CommunityDiseaseID=dbo.CDPreviousTestResultFact.CommunityDiseaseID
END
'
EXEC [dbo].[SetBizRule] 
@pBRId=@BRID, 
@pShortNameOfTest='dbo.YouthClinicActivityFact', 
@pRuleDesc='', 
@pConditionSQL='', 
@pActionID=, 
@pActionSQL=@ActionSQL,
@pOlsonTypeID=NULL, 
@pSeverityTypeID=NULL, 
@pSequence=, 
@pDefaultValue='0', 
@pDatabaseId=32, 
@pTargetObjectPhysicalName='', 
@pTargetAttributePhysicalName='', 
@pSourceObjectPhysicalName=NULL, 
@pSourceAttributePhysicalName=NULL, 
@pIsActive=@IsActive, 
@pComment='generated with python', 
@pCreatedBy=@CreatedBy,
@pUpdatedBy=@UpdatedBy,
@pIsLogged=@IsLogged, 
@pGUID=@GUID, 
@pFactTableObjectAttributeId=NULL

IF NOT EXISTS (SELECT * FROM dbo.DQMF_BizRuleSchedule bsc INNER JOIN dbo.DQMF_BizRule br ON bsc.BRID=br.BRID WHERE scheduleid= @DQMF_ScheduleId AND br.BRID=(SELECT BRID FROM DQMF_BizRule WHERE GUID=@GUID))
INSERT dbo.DQMF_BizRuleSchedule (BRID, ScheduleID) SELECT (SELECT BRID FROM DQMF_BizRule WHERE GUID=@GUID) AS BRID, @DQMF_ScheduleId 

DELETE BRM FROM dbo.DQMF_BizRuleLookupMapping BRM INNER JOIN dbo.DQMF_BizRule BR ON BRM.BRID = BR.BRID WHERE BR.GUID = @GUID
UPDATE DQMF.dbo.DQMF_BizRule SET IsLogged=@IsLogged, IsActive=@IsActive FROM DQMF.dbo.DQMF_BizRule AS br WHERE br.GUID = @GUID;
--#endregion BR dbo.YouthClinicActivityFact

