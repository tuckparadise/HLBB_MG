/*
select * from ddProject_Report_PaymentHistory
select * from vw_aaDisbursementPaymentHistory

alter table ddProject_Report_PaymentHistory
add SubmissionFrom nvarchar(max) 
go

select * from ddProjectPhase
where phasecode = 'T001110201'
	and developercode = 'T0011'

select phasecode,developercode,projectcode,* from vw_aaDisbursementHistory
where phasecode = 'T001110201'
	and developercode = 'T0011'

*/

CREATE         procedure [dbo].[ddProject_Admin_PaymentHistory_GetRecordCount]
@DeveloperCode nvarchar(max) = null, 
@ProjectCode nvarchar(max) = null ,
@PhaseCode nvarchar(max) = null ,
@arn nvarchar(max) = null ,
@DateFrom datetime = null,
@DateTo datetime = null,
@TimeFromHour int = null,
@TimeToHour int = null,
@TimeFromMin int = null,
@TimeToMin int = null,
@MortgageCentre nvarchar(max) = null, 
@IncludeFLVM bit = null, 
@DeveloperName nvarchar(max) = null ,
@PhaseName nvarchar(max) = null ,
@ReportUser nvarchar(max) = null ,
@RecordCount nvarchar(max) = null output  
  as
  begin
	
	set @RecordCount = 0
	/*
	Declare @queryFromDate datetime 
	set @queryFromDate = @DateFrom
	set @queryFromDate = DATEADD(HOUR, @TimeFromHour, @queryFromDate) 
	set @queryFromDate = DATEADD(MINUTE, @TimeFromMin, @queryFromDate) 

	
	Declare @queryToDate datetime 
	set @queryToDate = @DateFrom
	set @queryToDate = DATEADD(HOUR, @TimeToHour, @queryFromDate) 
	set @queryToDate = DATEADD(MINUTE, @TimeToMin, @queryFromDate) 
	*/

	if (@ReportUser like 'K2:%')
	begin		
		set @ReportUser = Stuff(@ReportUser, 1, 3, '')					
	end 

	delete from ddProject_Report_PaymentHistory
	where reportUser = @ReportUser
	
	if (isnull(@IncludeFLVM,0) = 1)
	begin		
		insert into ddProject_Report_PaymentHistory
		SELECT 
		l.MortgateCenterCode as [MortgageCentre]
		,h.[arn] as [CreditApplicationNumber]
		,d.[Name] as [DeveloperName]
		,l.developercode as [DeveloperCode]
		,p.PhaseName as [PhaseName]
		,l.phasecode as [PhaseCode]
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
			--COALESCE(', ' +  RTRIM( history.[PR_StageOthers] ),     '') 
			COALESCE(', ' +  RTRIM( case when ltrim(rtrim(history.[PR_StageOthers])) = '' then null else  history.[PR_StageOthers] end ),     '') 
			, 1, 2, '') as BillingStage 
			, FORMAT (DisCheckerApprovedDate, 'dd/MM/yyyy HH:mm:ss') as DisbursementCheckerApprovalDate
			,AccountFrom as [DebitFrom]
			,[PaymentMode]
			,[PayeeName]
			,[PayeeID]
			,[BeneficiaryBank]
			,[BeneficiaryBankAccountNumber]
			,[AmountDisburse] as [Amount]
			,case when [PaymentReference] = 'Others' then 'Others-' + [FacilityAccountNumber] else  [PaymentReference] end as [PaymentReference]
			,[AddressLine1] as [Unit/Parcel No.]
			,[PaymentDescription]
			,dismaker.userfullname as DisbursementMakerName
			,dischecker.userfullname as DisbursementCheckerName		
			,@ReportUser
			,h.SubmissionFrom
			--,BillingRunningID
			/*
		h.[SubmissionFrom], 		
		  ,RunningIDForCurrentSubmission
		  ,[FacilityAccountNumber]		  
		  ,h.RunningIDForCompletedSubmission	  		  
		  ,[DisMakerSubmissionDate]
		  ,[RCOMakerEmail]
		  ,[RCOMakerApprovedDate]
		  ,[RCOCheckerEmail]
		  ,[RCOCheckerApprovedDate]
		  ,ApplicantName
		  ,LoanAmount
		  ,l.projectcode
		  ,p.PhaseCode + '- ' + p.PhaseName as [Phase]
			,mapping.ProjectName
			, mapping.ProjectCode + '- ' + mapping.ProjectName as [Project]
			*/					
	  FROM [dbo].vw_aaDisbursementPaymentHistory h
	  inner join sqlloads l on l.arn = h.arn 	  
	  inner join vw_aaDisbursementHistory history on history.arn = h.arn and h.SubmissionFrom = history.SubmissionFrom and h.BillingRunningID = history.BillingRunningID
	   --left join ddProjectPhase p on p.PhaseCode = history.PhaseCode and p.ProjectCode = history.ProjectCode and p.DeveloperCode = history.DeveloperCode
	   left join ddProjectPhase p on p.PhaseCode = l.PhaseCode and p.ProjectCode = l.ProjectCode and p.DeveloperCode = l.DeveloperCode
		left join ddProjectDeveloperProjectMapping mapping on mapping.ProjectCode = history.ProjectCode and mapping.DeveloperCode = history.DeveloperCode
		left join ddProjectDeveloper d on d.id = l.developercode
		left join InternalUser dismaker on dismaker.UserName = h.[DisMakerEmail] 
		left join InternalUser dischecker on dischecker.UserName = h.[DisCheckerEmail] 		
		left join ddProjectDeveloper on ddProjectDeveloper.ID = l.DeveloperCode
		--left join ddProjectPhase on ddProjectPhase.PhaseCode = l.PhaseCode and ddProjectPhase.DeveloperCode = l.DeveloperCode
	  where 		
		/*
		PaymentReference <> 'Legal Fee' 
		and PaymentReference <> 'Valuation Fee'
		and PaymentReference <> 'Legal Fee - Principal Pymt'
		and PaymentReference <> 'Valuation Fee - Principal Pymt'
		and PaymentReference <> 'MDTA/ MRTT'
		and PaymentReference <> 'MDTA/ MRTT - Principal Pymt'	
		
		and l.DeveloperCode = @DeveloperCode
		and l.projectcode like case when @ProjectCode is null then '%' else @ProjectCode end 
		and l.phasecode like case when @phasecode is null then '%' else @phasecode end 
		*/
		--h.arn like case when @arn is null then '%' else @arn end 
		--and 	h.DisCheckerApprovedDate between @DateFrom and @DateTo	
		--and 	h.DisCheckerApprovedDate between case isnull(@DateFrom,'') when '' then '2000-01-01' else @DateFrom end and case isnull(@DateTo,'')  when '' then '2222-12-31' else DATEADD(day, 1, @DateTo) end
		l.MortgateCenterCode like case when @MortgageCentre is null then '%' else @MortgageCentre end 
		and l.DeveloperCode like case when @DeveloperCode is null then '%' else @DeveloperCode end 
		and l.PhaseCode like case when @PhaseCode is null then '%' else @PhaseCode end 
		--and DisCheckerApprovedDate between @queryFromDate and @queryToDate	
		and DisCheckerApprovedDate between @DateFrom and @DateTo		
		--str(year(DisCheckerApprovedDate))  like case when @DateFrom is null then '%' else str(year(@DateFrom)) end
		--and str(month(DisCheckerApprovedDate))  like case when @DateFrom is null then '%' else str(month(@DateFrom)) end
		--and str(day(DisCheckerApprovedDate))  like case when @DateFrom is null then '%' else str(day(@DateFrom)) end
		and l.DisbursementManner = 'PR'
		and ddProjectDeveloper.Name like case when @DeveloperName is null then '%' else @DeveloperName end 
		and p.PhaseName like case when @PhaseName is null then '%' else @PhaseName end 
		order by DisCheckerApprovedDate desc
	end

	if (isnull(@IncludeFLVM,0) = 0)
	begin
		insert into ddProject_Report_PaymentHistory
		SELECT 
		l.MortgateCenterCode as [MortgageCentre]
		,h.[arn] as [CreditApplicationNumber]
		,d.[Name] as [DeveloperName]
		,l.developercode as [DeveloperCode]
		,p.PhaseName as [PhaseName]
		,l.phasecode as [PhaseCode]
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
			--COALESCE(', ' +  RTRIM( history.[PR_StageOthers] ),     '') 
			COALESCE(', ' +  RTRIM( case when ltrim(rtrim(history.[PR_StageOthers])) = '' then null else  history.[PR_StageOthers] end ),     '') 
			, 1, 2, '') as BillingStage 
			, FORMAT (DisCheckerApprovedDate, 'dd/MM/yyyy HH:mm:ss') as DisbursementCheckerApprovalDate
			,AccountFrom as [DebitFrom]
			,[PaymentMode]
			,[PayeeName]
			,[PayeeID]
			,[BeneficiaryBank]
			,[BeneficiaryBankAccountNumber]
			,[AmountDisburse] as [Amount]
			,case when [PaymentReference] = 'Others' then 'Others-' + [FacilityAccountNumber] else  [PaymentReference] end as [PaymentReference]
			,[AddressLine1] as [Unit/Parcel No.]
			,[PaymentDescription]
			,dismaker.userfullname as DisbursementMakerName
			,dischecker.userfullname as DisbursementCheckerName		
			,@ReportUser		
			,h.SubmissionFrom
	  FROM [dbo].vw_aaDisbursementPaymentHistory h
	  inner join sqlloads l on l.arn = h.arn 	  
	  inner join vw_aaDisbursementHistory history on history.arn = h.arn and h.SubmissionFrom = history.SubmissionFrom and h.BillingRunningID = history.BillingRunningID
	   --left join ddProjectPhase p on p.PhaseCode = history.PhaseCode and p.ProjectCode = history.ProjectCode and p.DeveloperCode = history.DeveloperCode
	   left join ddProjectPhase p on p.PhaseCode = l.PhaseCode and p.ProjectCode = l.ProjectCode and p.DeveloperCode = l.DeveloperCode
		left join ddProjectDeveloperProjectMapping mapping on mapping.ProjectCode = history.ProjectCode and mapping.DeveloperCode = history.DeveloperCode
		left join ddProjectDeveloper d on d.id = l.developercode
		left join InternalUser dismaker on dismaker.UserName = h.[DisMakerEmail] 
		left join InternalUser dischecker on dischecker.UserName = h.[DisCheckerEmail] 
		left join ddProjectDeveloper on ddProjectDeveloper.ID = l.DeveloperCode
		--left join ddProjectPhase on ddProjectPhase.PhaseCode = l.PhaseCode and ddProjectPhase.DeveloperCode = l.DeveloperCode
	  where 		
		PaymentReference <> 'Legal Fee' 
			and PaymentReference <> 'Valuation Fee'
			and PaymentReference <> 'Legal Fee - Principal Pymt'
			and PaymentReference <> 'Valuation Fee - Principal Pymt'
			and PaymentReference <> 'MDTA/ MRTT'
			and PaymentReference <> 'MDTA/ MRTT - Principal Pymt'	
			--and   PaymentReference not in ('Legal Fee','Valuation Fee','Legal Fee - Principal Pymt','Valuation Fee - Principal Pymt','MDTA/ MRTT','MDTA/ MRTT - Principal Pymt') 	
			--and case when isnull(@IncludeFLVM,0) = 0  then 1=1 and PaymentReference not in  ('Legal Fee','Valuation Fee','Legal Fee - Principal Pymt','Valuation Fee - Principal Pymt','MDTA/ MRTT','MDTA/ MRTT - Principal Pymt') 	
		/*
		and l.DeveloperCode = @DeveloperCode
		and l.projectcode like case when @ProjectCode is null then '%' else @ProjectCode end 
		and l.phasecode like case when @phasecode is null then '%' else @phasecode end 
		*/
		--h.arn like case when @arn is null then '%' else @arn end 
		--and 	h.DisCheckerApprovedDate between @DateFrom and @DateTo	
		--and 	h.DisCheckerApprovedDate between case isnull(@DateFrom,'') when '' then '2000-01-01' else @DateFrom end and case isnull(@DateTo,'')  when '' then '2222-12-31' else DATEADD(day, 1, @DateTo) end
		and l.MortgateCenterCode like case when @MortgageCentre is null then '%' else @MortgageCentre end 
		and l.DeveloperCode like case when @DeveloperCode is null then '%' else @DeveloperCode end 
		and l.PhaseCode like case when @PhaseCode is null then '%' else @PhaseCode end 
		--and DisCheckerApprovedDate between @queryFromDate and @queryToDate	
		and DisCheckerApprovedDate between @DateFrom and @DateTo		
		--str(year(DisCheckerApprovedDate))  like case when @DateFrom is null then '%' else str(year(@DateFrom)) end
		--and str(month(DisCheckerApprovedDate))  like case when @DateFrom is null then '%' else str(month(@DateFrom)) end
		--and str(day(DisCheckerApprovedDate))  like case when @DateFrom is null then '%' else str(day(@DateFrom)) end
		and l.DisbursementManner = 'PR'
		and ddProjectDeveloper.Name like case when @DeveloperName is null then '%' else @DeveloperName end 
		and p.PhaseName like case when @PhaseName is null then '%' else @PhaseName end 
		order by DisCheckerApprovedDate desc
	end
	
	set @RecordCount = (select count(*) from ddProject_Report_PaymentHistory
	where reportUser = @ReportUser )
	
	/*
	if (isnull(@IncludeFLVM,0) = 1)
	begin
		set @RecordCount = (SELECT count(*)		
		FROM [dbo].vw_aaDisbursementPaymentHistory h
			inner join sqlloads l on l.arn = h.arn 	  
			inner join vw_aaDisbursementHistory history on history.arn = h.arn and h.SubmissionFrom = history.SubmissionFrom and h.BillingRunningID = history.BillingRunningID
			left join ddProjectPhase p on p.PhaseCode = history.PhaseCode and p.ProjectCode = history.ProjectCode and p.DeveloperCode = history.DeveloperCode
			left join ddProjectDeveloperProjectMapping mapping on mapping.ProjectCode = history.ProjectCode and mapping.DeveloperCode = history.DeveloperCode
			left join ddProjectDeveloper d on d.id = l.developercode
			left join InternalUser dismaker on dismaker.UserName = h.[DisMakerEmail] 
			left join InternalUser dischecker on dischecker.UserName = h.[DisCheckerEmail] 
			left join ddProjectDeveloper on ddProjectDeveloper.ID = l.DeveloperCode
				left join ddProjectPhase on ddProjectPhase.PhaseCode = l.PhaseCode and ddProjectPhase.DeveloperCode = l.DeveloperCode
		where 		
			l.MortgateCenterCode like case when @MortgageCentre is null then '%' else @MortgageCentre end 
			and l.DeveloperCode like case when @DeveloperCode is null then '%' else @DeveloperCode end 
			and l.PhaseCode like case when @PhaseCode is null then '%' else @PhaseCode end 
			--and DisCheckerApprovedDate between @queryFromDate and @queryToDate		
			and DisCheckerApprovedDate between @DateFrom and @DateTo	
			and ddProjectDeveloper.Name like case when @DeveloperName is null then '%' else @DeveloperName end 
			and ddProjectPhase.PhaseName like case when @PhaseName is null then '%' else @PhaseName end 
			and l.DisbursementManner = 'PR'
			)
	end 
	else
	begin
		set @RecordCount = (SELECT count(*)		
		FROM [dbo].vw_aaDisbursementPaymentHistory h
			inner join sqlloads l on l.arn = h.arn 	  
			inner join vw_aaDisbursementHistory history on history.arn = h.arn and h.SubmissionFrom = history.SubmissionFrom and h.BillingRunningID = history.BillingRunningID
			left join ddProjectPhase p on p.PhaseCode = history.PhaseCode and p.ProjectCode = history.ProjectCode and p.DeveloperCode = history.DeveloperCode
			left join ddProjectDeveloperProjectMapping mapping on mapping.ProjectCode = history.ProjectCode and mapping.DeveloperCode = history.DeveloperCode
			left join ddProjectDeveloper d on d.id = l.developercode
			left join InternalUser dismaker on dismaker.UserName = h.[DisMakerEmail] 
			left join InternalUser dischecker on dischecker.UserName = h.[DisCheckerEmail] 
			left join ddProjectDeveloper on ddProjectDeveloper.ID = l.DeveloperCode
			left join ddProjectPhase on ddProjectPhase.PhaseCode = l.PhaseCode and ddProjectPhase.DeveloperCode = l.DeveloperCode
		where 		
			l.MortgateCenterCode like case when @MortgageCentre is null then '%' else @MortgageCentre end 
			and l.DeveloperCode like case when @DeveloperCode is null then '%' else @DeveloperCode end 
			and l.PhaseCode like case when @PhaseCode is null then '%' else @PhaseCode end 
			--and DisCheckerApprovedDate between @queryFromDate and @queryToDate		
			and DisCheckerApprovedDate between @DateFrom and @DateTo		
			and PaymentReference <> 'Legal Fee' 
			and PaymentReference <> 'Valuation Fee'
			and PaymentReference <> 'Legal Fee - Principal Pymt'
			and PaymentReference <> 'Valuation Fee - Principal Pymt'
			and PaymentReference <> 'MDTA/ MRTT'
			and PaymentReference <> 'MDTA/ MRTT - Principal Pymt'	
			and l.DisbursementManner = 'PR'
			and ddProjectDeveloper.Name like case when @DeveloperName is null then '%' else @DeveloperName end 
				and ddProjectPhase.PhaseName like case when @PhaseName is null then '%' else @PhaseName end 
			)
	end 
	*/


  end