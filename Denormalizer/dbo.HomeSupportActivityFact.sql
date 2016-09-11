

--#region BR dbo.HomeSupportActivityFact
SET @UpdatedBy = 'VCH\GCrowell'
SET @CreatedBy ='VCH\GCrowell'
SET @IsActive = 1;
SET @IsLogged = 1;
SET @GUID = '7a2ee970-77c7-11e6-b010-00232444dba2'
SELECT @BRID=BRID FROM dbo.DQMF_BizRule WHERE GUID=@GUID

SET @ActionSQL = '
BEGIN
	SELECT
	SourceSystemClientID
	,EthnicityID
	,EducationLevelCodeID
	,EducationLevelID
	,DeathLocationID
	,GenderID
	,InterventionTypeID
	,ProviderID
	,LevelOfCareId
	,FacilityID
	,HSDAID
	,SourceInterventionID
	,InterventionID
	,InterventionTypeID
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
	,ProviderID
	,LevelOfCareId
	,FacilityID
	,HSDAID
	,InterventionID
	,InterventionTypeID
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
	,LocalReportingOfficeID
	,ProviderID
	,LevelOfCareId
	,FacilityID
	,HSDAID
	,CommunityProgramID
FROM dbo.HomeSupportActivityFact
JOIN dbo.PersonFact
ON dbo.PersonFact.SourceSystemClientID=dbo.HomeSupportActivityFact.SourceSystemClientID
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
JOIN Dim.InterventionType
ON Dim.InterventionType.InterventionTypeID=dbo.HomeSupportActivityFact.InterventionTypeID
JOIN Dim.Provider
ON Dim.Provider.ProviderID=dbo.HomeSupportActivityFact.ProviderID
	JOIN Dim.LevelOfCare
	ON Dim.LevelOfCare.LevelOfCareId=Dim.Provider.LevelOfCareId
	JOIN Dim.Facility
	ON Dim.Facility.FacilityID=Dim.Provider.FacilityID
		JOIN Dim.HSDA
		ON Dim.HSDA.HSDAID=Dim.Facility.HSDAID
JOIN dbo.InterventionFact
ON dbo.InterventionFact.SourceInterventionID=dbo.HomeSupportActivityFact.SourceInterventionID
	JOIN Dim.Intervention
	ON Dim.Intervention.InterventionID=dbo.InterventionFact.InterventionID
		JOIN Dim.InterventionType
		ON Dim.InterventionType.InterventionTypeID=Dim.Intervention.InterventionTypeID
	JOIN dbo.ReferralFact
	ON dbo.ReferralFact.SourceReferralID=dbo.InterventionFact.SourceReferralID
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
	JOIN Dim.Provider
	ON Dim.Provider.ProviderID=dbo.InterventionFact.ProviderID
		JOIN Dim.LevelOfCare
		ON Dim.LevelOfCare.LevelOfCareId=Dim.Provider.LevelOfCareId
		JOIN Dim.Facility
		ON Dim.Facility.FacilityID=Dim.Provider.FacilityID
			JOIN Dim.HSDA
			ON Dim.HSDA.HSDAID=Dim.Facility.HSDAID
JOIN Dim.Intervention
ON Dim.Intervention.InterventionID=dbo.HomeSupportActivityFact.InterventionID
	JOIN Dim.InterventionType
	ON Dim.InterventionType.InterventionTypeID=Dim.Intervention.InterventionTypeID
JOIN dbo.ReferralFact
ON dbo.ReferralFact.SourceReferralID=dbo.HomeSupportActivityFact.SourceReferralID
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
JOIN Dim.LocalReportingOffice
ON Dim.LocalReportingOffice.LocalReportingOfficeID=dbo.HomeSupportActivityFact.LocalReportingOfficeID
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
END
'
EXEC [dbo].[SetBizRule] 
@pBRId=@BRID, 
@pShortNameOfTest='dbo.HomeSupportActivityFact', 
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
--#endregion BR dbo.HomeSupportActivityFact

