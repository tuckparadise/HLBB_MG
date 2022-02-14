CREATE     procedure [dbo].[ddProjectDisbursementSubmission_WorkflowHistory_Select]
  @DeveloperCode nvarchar(max) = null, 
  @ProjectCode nvarchar(max) = null ,
  @PhaseCode nvarchar(max) = null ,
  @arn nvarchar(max) = null ,
@DateFrom datetime = null,
@DateTo datetime = null,
  @AddressLine1 nvarchar(max) = null 
  as
  begin
	
	SELECT h.[SubmissionFrom], 
		h.[arn]
		  ,RunningIDForCurrentSubmission
		  ,[FacilityAccountNumber]
		  ,[PaymentMode]
		  ,[PayeeID]
		  ,[PayeeName]
		  ,[BeneficiaryBank]
		  ,[BeneficiaryBankAccountNumber]
		  ,[AmountDisburse]		  
		  ,case when [PaymentReference] = 'Others' then 'Others-' + [FacilityAccountNumber] else  [PaymentReference] end as [PaymentReference]
		  ,[PaymentDescription]
		  ,h.RunningIDForCompletedSubmission	  
		  ,AccountFrom
		  ,[DisMakerEmail]
		  ,[DisMakerSubmissionDate]
		  ,[DisCheckerEmail]		  
		  , FORMAT (DisCheckerApprovedDate, 'dd/MM/yyyy') as DisCheckerApprovedDate
		  ,[RCOMakerEmail]
		  ,[RCOMakerApprovedDate]
		  ,[RCOCheckerEmail]
		  ,[RCOCheckerApprovedDate]
		  ,ApplicantName
		  ,LoanAmount
		  ,[AddressLine1]
		  ,l.developercode
		  ,l.projectcode
		  ,l.phasecode
		  , stuff(		
			COALESCE(', ' +  RTRIM( case when history.[PR_Stage2AFlag] = 1 then '2/2a' else null end),     '') +
			COALESCE(', ' +  RTRIM( case when history.[PR_Stage2BFlag] = 1 then '2b' else null end),     '') +
			COALESCE(', ' +  RTRIM( case when history.[PR_Stage2CFlag] = 1 then '2c' else null end),     '') +
			COALESCE(', ' +  RTRIM( case when history.[PR_Stage2DFlag] = 1 then '2d' else null end),     '') +
			COALESCE(', ' +  RTRIM( case when history.[PR_Stage2EFlag] = 1 then '2e' else null end),     '') +
			COALESCE(', ' +  RTRIM( case when history.[PR_Stage2FFlag] = 1 then '2f' else null end),     '') +
			COALESCE(', ' +  RTRIM( case when history.[PR_Stage2GFlag] = 1 then '2g' else null end),     '') +
			COALESCE(', ' +  RTRIM( case when history.[PR_Stage2HFlag] = 1 then '2h' else null end),     '') + 
			COALESCE(', ' +  RTRIM( case when history.[PR_Stage2IFlag] = 1 then '2i' else null end),     '') + 
			COALESCE(', ' +  RTRIM( case when history.[PR_Stage2JFlag] = 1 then '2j' else null end),     '') + 
			COALESCE(', ' +  RTRIM( case when history.[PR_Stage2KFlag] = 1 then '2k' else null end),     '') + 
			COALESCE(', ' +  RTRIM( case when history.PR_Stage3 = 1 then '3' else null end),     '') + 
			COALESCE(', ' +  RTRIM( case when history.PR_Stage4 = 1 then '4' else null end),     '') + 
			COALESCE(', ' +  RTRIM( case when history.PR_Stage5 = 1 then '5' else null end),     '') + 
			COALESCE(', ' +  RTRIM( case when history.PR_Stage6 = 1 then '6' else null end),     '') + 
			COALESCE(', ' +  RTRIM( case when history.PR_Stage7 = 1 then '7' else null end),     '') + 
			COALESCE(', ' +  RTRIM( case when history.PR_Stage8 = 1 then '8' else null end),     '') + 
			COALESCE(', ' +  RTRIM( case when history.PR_Stage9 = 1 then '9' else null end),     '') + 			
			COALESCE(', ' +  RTRIM( case when ltrim(rtrim(history.[PR_StageOthers])) = '' then null else  history.[PR_StageOthers] end ),     '') 
			--COALESCE(', ' +  RTRIM( history.[PR_StageOthers] ),     '') 
			, 1, 2, '') as BilingStage 
			,p.PhaseName
			,p.PhaseCode + '- ' + p.PhaseName as [Phase]
			,mapping.ProjectName
			, mapping.ProjectCode + '- ' + mapping.ProjectName as [Project]
	  FROM [dbo].vw_aaDisbursementPaymentHistory h
	  inner join sqlloads l on l.arn = h.arn 	  
	  inner join vw_aaDisbursementHistory history on history.arn = h.arn and h.SubmissionFrom = history.SubmissionFrom and h.BillingRunningID = history.BillingRunningID
	   left join ddProjectPhase p on p.PhaseCode = history.PhaseCode and p.ProjectCode = history.ProjectCode and p.DeveloperCode = history.DeveloperCode
  left join ddProjectDeveloperProjectMapping mapping on mapping.ProjectCode = history.ProjectCode and mapping.DeveloperCode = history.DeveloperCode
	  where 
		PaymentReference <> 'Legal Fee' 
		and PaymentReference <> 'Valuation Fee'
		and PaymentReference <> 'Legal Fee - Principal Pymt'
		and PaymentReference <> 'Valuation Fee - Principal Pymt'
		and PaymentReference <> 'MDTA/ MRTT'
		and PaymentReference <> 'MDTA/ MRTT - Principal Pymt'		
		and l.DeveloperCode = @DeveloperCode
		--and l.projectcode like case when @ProjectCode is null then '%' else @ProjectCode end 
		and l.phasecode like case when @phasecode is null then '%' else @phasecode end 
		and h.arn like case when @arn is null then '%' else @arn end 
		--and 	h.DisCheckerApprovedDate between @DateFrom and @DateTo	
		--and 	h.DisCheckerApprovedDate between case isnull(@DateFrom,'') when '' then '2000-01-01' else @DateFrom end and case isnull(@DateTo,'')  when '' then '2222-12-31' else DATEADD(day, 1, @DateTo) end				
		and 	h.DisCheckerApprovedDate between case isnull(@DateFrom,'') when '' then '2000-01-01' else @DateFrom end and case isnull(@DateTo,'')  when '' then '2222-12-31' else @DateTo end
		--and AddressLine1 like case when @AddressLine1 is null then '%' else @AddressLine1 end 
		and isnull(AddressLine1,'') like case when @AddressLine1 is null then '%' else @AddressLine1 end 
		--and 	[SubmittedDate] between @DateFrom and @DateTo	
		--and str(year(DisCheckerApprovedDate))  like case when @DateFrom is null then '%' else str(year(@DateFrom)) end
		--and str(month(DisCheckerApprovedDate))  like case when @DateFrom is null then '%' else str(month(@DateFrom)) end
		--and str(day(DisCheckerApprovedDate))  like case when @DateFrom is null then '%' else str(day(@DateFrom)) end
		order by h.DisCheckerApprovedDate desc
  end