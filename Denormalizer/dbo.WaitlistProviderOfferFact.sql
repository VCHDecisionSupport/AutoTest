

--#region BR dbo.WaitlistProviderOfferFact
SET @UpdatedBy = 'VCH\GCrowell'
SET @CreatedBy ='VCH\GCrowell'
SET @IsActive = 1;
SET @IsLogged = 1;
SET @GUID = '7a45f47a-77c7-11e6-b679-00232444dba2'
SELECT @BRID=BRID FROM dbo.DQMF_BizRule WHERE GUID=@GUID

SET @ActionSQL = '
BEGIN
	SELECT
	WaitlistReasonOfferRemovedID
	,SourceWaitlistDefinitionID
	,WaitlistTypeID
	,ProviderID
	,LevelOfCareId
	,FacilityID
	,HSDAID
	,ProviderID
	,LevelOfCareId
	,FacilityID
	,HSDAID
	,WaitlistProviderOfferStatusID
FROM dbo.WaitlistProviderOfferFact
JOIN Dim.WaitlistReasonOfferRemoved
ON Dim.WaitlistReasonOfferRemoved.WaitlistReasonOfferRemovedID=dbo.WaitlistProviderOfferFact.WaitlistReasonOfferRemovedID
JOIN dbo.WaitlistDefinitionFact
ON dbo.WaitlistDefinitionFact.SourceWaitlistDefinitionID=dbo.WaitlistProviderOfferFact.SourceWaitlistDefinitionID
	JOIN Dim.WaitlistType
	ON Dim.WaitlistType.WaitlistTypeID=dbo.WaitlistDefinitionFact.WaitlistTypeID
	JOIN Dim.Provider
	ON Dim.Provider.ProviderID=dbo.WaitlistDefinitionFact.ProviderID
		JOIN Dim.LevelOfCare
		ON Dim.LevelOfCare.LevelOfCareId=Dim.Provider.LevelOfCareId
		JOIN Dim.Facility
		ON Dim.Facility.FacilityID=Dim.Provider.FacilityID
			JOIN Dim.HSDA
			ON Dim.HSDA.HSDAID=Dim.Facility.HSDAID
JOIN Dim.Provider
ON Dim.Provider.ProviderID=dbo.WaitlistProviderOfferFact.ProviderID
	JOIN Dim.LevelOfCare
	ON Dim.LevelOfCare.LevelOfCareId=Dim.Provider.LevelOfCareId
	JOIN Dim.Facility
	ON Dim.Facility.FacilityID=Dim.Provider.FacilityID
		JOIN Dim.HSDA
		ON Dim.HSDA.HSDAID=Dim.Facility.HSDAID
JOIN Dim.WaitlistProviderOfferStatus
ON Dim.WaitlistProviderOfferStatus.WaitlistProviderOfferStatusID=dbo.WaitlistProviderOfferFact.WaitlistProviderOfferStatusID
END
'
EXEC [dbo].[SetBizRule] 
@pBRId=@BRID, 
@pShortNameOfTest='dbo.WaitlistProviderOfferFact', 
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
--#endregion BR dbo.WaitlistProviderOfferFact

