/*
declare @phasecode nvarchar(max) 
set @phasecode = 'B050500201'
declare @devcode nvarchar(max) 
set @devcode = 'B0505'

exec [ddProjectDisbursementSubmission_SubmissionHistory_Select] @devcode,null,@phasecode,null,null,null,null


declare @phasecode nvarchar(max) 
set @phasecode = '111'
declare @devcode nvarchar(max) 
set @devcode = '1111'

exec [ddProjectDisbursementSubmission_SubmissionHistory_Select] @devcode,null,@phasecode,null,null,null,null


  select * 
  FROM [dbo].[ddProjectDisbursementSubmission_SubmissionHistory2] h  
  left join ddProjectPhase p on p.PhaseCode = h.PhaseCode and p.ProjectCode = h.ProjectCode and p.DeveloperCode = h.DeveloperCode
  left join ddProjectDeveloperProjectMapping mapping on mapping.ProjectCode = h.ProjectCode and mapping.DeveloperCode = h.DeveloperCode
  where h.phasecode = 'B050500201'

  select * from [ddProjectDisbursementSubmission_SubmissionHistory2]

  
  select * from ddProjectDeveloper
  where id = 'B0505'

  select * from ddProjectDeveloperProjectMapping
  where developercode = 'B0505'
	and projectcode = 'B0505002'

	  select * from ddProjectDeveloperProjectMapping
  where developercode = '1111'
	and projectcode = '111'

  update ddProjectDeveloper
  set Email = 'jasonangot@toshibatec.com.my'
   where id = 'B0505' 
  
  select * from ddProjectDeveloperSubUser
  where id = 'B0505-2'

  */

  CREATE   procedure [dbo].[ddProjectDisbursementSubmission_SubmissionHistory_Select]
  @DeveloperCode nvarchar(max) = null, 
  @ProjectCode nvarchar(max) = null ,
  @PhaseCode nvarchar(max) = null ,
  @arn nvarchar(max) = null ,
@DateFrom datetime = null,
@DateTo datetime = null,
  @AddressLine1 nvarchar(max) = null 
  as
  begin
	
	
	SELECT 
      --[PR_EarliestBillingDueDate]
	   FORMAT (PR_EarliestBillingDueDate, 'dd/MM/yyyy') as PR_EarliestBillingDueDate
      ,[PR_TotalBillingAmount]
	  ,[FinalBillingFlag] 
      ,case when [FinalBillingFlag] = 1 then 'Yes' else 'No' end as [FinalBilling]
      ,h.[DeveloperCode]
      ,h.[ProjectCode]
      ,h.[PhaseCode]	  
      ,[DeveloperLoginID]
      ,[PDFID]
      ,[DraftID]
      ,[PrimaryCustomerName]
      ,h.[ARN]
      ,[FinancingAmount]
      ,h.[AddressLine1]
      ,[BillingAmount]
      --,[SubmittedDate]
	  ,FORMAT ([SubmittedDate], 'dd/MM/yyyy') as [SubmissionDate]
      ,[ExtraField1]
      ,[ExtraField2]
      ,[ExtraField3]
      ,[ExtraField4]	  
	  ,stuff(		
	COALESCE(', ' +  RTRIM( case when [PR_Stage2AFlag] = 1 then '2/2a' else null end),     '') +
	COALESCE(', ' +  RTRIM( case when [PR_Stage2BFlag] = 1 then '2b' else null end),     '') +
	COALESCE(', ' +  RTRIM( case when [PR_Stage2CFlag] = 1 then '2c' else null end),     '') +
	COALESCE(', ' +  RTRIM( case when [PR_Stage2DFlag] = 1 then '2d' else null end),     '') +
	COALESCE(', ' +  RTRIM( case when [PR_Stage2EFlag] = 1 then '2e' else null end),     '') +
	COALESCE(', ' +  RTRIM( case when [PR_Stage2FFlag] = 1 then '2f' else null end),     '') +
	COALESCE(', ' +  RTRIM( case when [PR_Stage2GFlag] = 1 then '2g' else null end),     '') +
	COALESCE(', ' +  RTRIM( case when [PR_Stage2HFlag] = 1 then '2h' else null end),     '') + 
	COALESCE(', ' +  RTRIM( case when [PR_Stage2IFlag] = 1 then '2i' else null end),     '') + 
	COALESCE(', ' +  RTRIM( case when [PR_Stage2JFlag] = 1 then '2j' else null end),     '') + 
	COALESCE(', ' +  RTRIM( case when [PR_Stage2KFlag] = 1 then '2k' else null end),     '') + 
	COALESCE(', ' +  RTRIM( case when PR_Stage3 = 1 then '3' else null end),     '') + 
	COALESCE(', ' +  RTRIM( case when PR_Stage4 = 1 then '4' else null end),     '') + 
	COALESCE(', ' +  RTRIM( case when PR_Stage5 = 1 then '5' else null end),     '') + 
	COALESCE(', ' +  RTRIM( case when PR_Stage6 = 1 then '6' else null end),     '') + 
	COALESCE(', ' +  RTRIM( case when PR_Stage7 = 1 then '7' else null end),     '') + 
	COALESCE(', ' +  RTRIM( case when PR_Stage8 = 1 then '8' else null end),     '') + 
	COALESCE(', ' +  RTRIM( case when PR_Stage9 = 1 then '9' else null end),     '') + 
	COALESCE(', ' +  RTRIM( case when ltrim(rtrim([PR_StageOthers])) = '' then null else  [PR_StageOthers] end ),     '') 
	--COALESCE(', ' +  RTRIM( [PR_StageOthers] ),     '') 
	, 1, 2, '') as SubmittedBilingStages 
	,p.PhaseName
	,p.PhaseCode + '- ' + p.PhaseName as [Phase]
	,mapping.ProjectName
	, mapping.ProjectCode + '- ' + mapping.ProjectName as [Project]
  FROM [dbo].[ddProjectDisbursementSubmission_SubmissionHistory2] h  
  left join ddProjectPhase p on p.PhaseCode = h.PhaseCode and p.ProjectCode = h.ProjectCode and p.DeveloperCode = h.DeveloperCode
  left join ddProjectDeveloperProjectMapping mapping on mapping.ProjectCode = h.ProjectCode and mapping.DeveloperCode = h.DeveloperCode
	where h.DeveloperCode = @DeveloperCode
		--and h.projectcode like case when @ProjectCode is null then '%' else @ProjectCode end 
		and h.phasecode like case when @phasecode is null then '%' else @phasecode end 
		--and arn like case when isnull(@arn,'') = '' then '%' else @arn end 
		and arn like case when @arn is null then '%' else @arn end 
	--and 	[SubmittedDate] between @DateFrom and @DateTo	
	and isnull(AddressLine1,'') like case when @AddressLine1 is null then '%' else @AddressLine1 end 
			--and isnull(AddressLine1,'') like case when isnull(@AddressLine1,'') = '' then '%' else @AddressLine1 end 
		--and 	[SubmittedDate] between @DateFrom and @DateTo	
		and str(year(SubmittedDate))  like case when @DateFrom is null then '%' else str(year(@DateFrom)) end
		and str(month(SubmittedDate))  like case when @DateFrom is null then '%' else str(month(@DateFrom)) end
		and str(day(SubmittedDate))  like case when @DateFrom is null then '%' else str(day(@DateFrom)) end
	order by SubmittedDate desc
  end