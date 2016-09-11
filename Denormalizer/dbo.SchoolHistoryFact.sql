

--#region BR dbo.SchoolHistoryFact
SET @UpdatedBy = 'VCH\GCrowell'
SET @CreatedBy ='VCH\GCrowell'
SET @IsActive = 1;
SET @IsLogged = 1;
SET @GUID = '7a1ebc68-77c7-11e6-84fc-00232444dba2'
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
	,CommunityServiceLocationID
FROM dbo.SchoolHistoryFact
JOIN dbo.PersonFact
ON dbo.PersonFact.SourceSystemClientID=dbo.SchoolHistoryFact.SourceSystemClientID
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
JOIN Dim.CommunityServiceLocation
ON Dim.CommunityServiceLocation.CommunityServiceLocationID=dbo.SchoolHistoryFact.CommunityServiceLocationID
END
'
EXEC [dbo].[SetBizRule] 
@pBRId=@BRID, 
@pShortNameOfTest='dbo.SchoolHistoryFact', 
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
--#endregion BR dbo.SchoolHistoryFact

