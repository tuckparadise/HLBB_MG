--[aa_Report_A_CaseAccepted] 'Acceptance', '2020-01-02', '2021-01-01', null, null, null, null, null, null, null, null, null, null, null


CREATE         procedure [dbo].[aa_Report_A_CaseAccepted]
@Category nvarchar(max) = null,
@DateFrom datetime = null,
@DateTo datetime = null,
@MortgageCentre nvarchar(max) = null,
@MortgageCentreFlag bit = null,
@DocStatus nvarchar(max) = null,
@DocStatusFlag bit = null,
@VRStatus nvarchar(max) = null,
@VRStatusFlag bit = null,
@SolCode nvarchar(max) = null,
@SolCodeFlag bit = null,
@ValCode nvarchar(max) = null,
@ValCodeFlag bit = null,
@DocVRANDFlag bit = null
as
begin

	--set @error = ''
	
	/*
	--if (isnull(@Category,'') = '') set @error =  @error + 'Category cannot be blank<br>'
	if (isnull(@DateFrom,'') = '') set @error =  @error + 'Date From cannot be blank<br>'
	if (isnull(@DateTo,'') = '') set @error =  @error + 'Date To cannot be blank<br>'
	if (DATEDIFF(day, @DateFrom, @DateTo) > 180) set @error =  @error + 'Date range cannot be more than 180 days<br>'
	
	if (isnull(@MortgageCentre,'') = '' and @MortgageCentreFlag = 1) set @error =  @error + 'Mortgage Centre cannot be blank<br>'
	if (isnull(@DocStatus,'') = '' and @DocStatusFlag = 1) set @error =  @error + 'Documentation Status cannot be blank<br>'
	if (isnull(@VRStatus,'') = '' and @VRStatusFlag = 1) set @error =  @error + 'VR Status cannot be blank<br>'
	if (isnull(@SolCode,'') = '' and @SolCodeFlag = 1) set @error =  @error + 'Solicitor Code cannot be blank<br>'
	if (isnull(@ValCode,'') = '' and @ValCodeFlag = 1) set @error =  @error + 'Valuer Code cannot be blank<br>'

	if (@ValCodeFlag = 1 and @VRStatus = 'N/A') set @error =  @error + 'N/A status is not valid for category Valuer Submission Case<br>'
	*/
	
	--if (@error = '')
	--begin	
		
		/*
		IF EXISTS(SELECT * FROM   aaMortgageReport_AcceptanceSubmitted) DROP TABLE aaMortgageReport_AcceptanceSubmitted

		create table aaMortgageReport_AcceptanceSubmitted
		(
			MortgateCenterCode nvarchar(max), 
			CreditApplicationNumber nvarchar(max), 
			CollateralPurpose nvarchar(max), 
			DisbursementManner nvarchar(max), 
			ApplicantName nvarchar(max), 
			SolicitorCode nvarchar(max), 
			ValuerCode nvarchar(max), 
			TotalFinancingAmount nvarchar(max),
			[DateOfLOAcceptance] nvarchar(max),	
			ValuationRequired nvarchar(max),
			[DocumentationStatus] nvarchar(max), 
			[VRStatus] nvarchar(max),
			[DocumentationSubmissionDate] nvarchar(max),			
			[DocumentationApprovalDate] nvarchar(max),
			[DocumentationApprovalMaker] nvarchar(max), 			
			[DocumentationRejectionDate] nvarchar(max), 
			[DocumentationRejectionMaker] nvarchar(max), 
			[CancellationSubmissionDate] nvarchar(max), 
			[CancellationApprovalDate] nvarchar(max), 
			[CancellationApprovalMaker] nvarchar(max), 			
			[VRSubmissionDate] nvarchar(max),
			[VRApprovalDate] nvarchar(max),
			[VRApprovalMaker] nvarchar(max)	
		)
		*/

		truncate table aaMortgageReport_AcceptanceSubmitted

		if (@Category = 'Acceptance')
		begin
			
			--with cte (MortgateCenterCode, CreditApplicationNumber, CollateralPurpose, DisbursementManner, ApplicantName, SolicitorCode, ValuerCode, TotalFinancingAmount,[DateOfLOAcceptance],[DocumentationSubmissionDate],
			--	[DocumentationApprovalDate],[DocumentationApprovalMaker], [DocumentationRejectionDate], [DocumentationRejectionMaker], [CancellationSubmissionDate], [CancellationApprovalDate], [VRSubmissionDate],[VRApprovalDate],[VRApprovalMaker],
			--	[DocumentationStatus], [VRStatus],[CancellationApprovalMaker],ValuationRequired)
			with cte (MortgateCenterCode, CreditApplicationNumber, CollateralPurpose, DisbursementManner, ApplicantName, SolicitorCode, ValuerCode, TotalFinancingAmount,
				[DateOfLOAcceptance],[DocumentationSubmissionDate],
				[DocumentationApprovalDate],[DocumentationApprovalMaker], [DocumentationRejectionDate], [DocumentationRejectionMaker], [DocumentationCancellationSubmissionDate], [DocumentationCancellationApprovalDate], [DocumentationCancellationApprovalMaker],[VRSubmissionDate],[VRApprovalDate],[VRApprovalMaker],
				[DocumentationStatus], [VRStatus],ValuationRequired,[VRCancellationSubmissionDate],[VRCancellationApprovalDate],[VRCancellationApprovalMaker], [VRLowerOMVSubmissionDate], [VRLowerOMVApprovalDate], [VRLowerOMVApprovalMaker],
				SolicitorName,ValuerName,[DocumentatationSolicitorReferenceNumber],[DocumentatationExecutionDateByCustomer],[DocumentatationSNPCompletionDate],[DocumentatationSNPExtendedCompletionDate],[DocumentatationDeveloperBillingDueDate],
				[DocumentatationHardCopyReceivedDate], [VRValuerReferenceNumber], [VRMarketValue], [VRFireInsuranceValue], [VRLowerOMVLowerOMVReasons], [VRLowerOMVLowerOMVReasonsRemarks], [CurrentDocumentMaker], [CurrentVRMaker],
				[VRCancellationAgeing], [VRSubmissionAgeing], [VRLowerOMVAgeing],[DocumentationCancellationAgeing],[DocumentationSubmissionnAgeing],
				[SolicitorUpdateStatusOption], [SolicitorUpdateStatusRemarks], [SolicitorUpdateStatusDate], [ValuerUpdateStatusOption],[ValuerUpdateStatusRemarks],[ValuerUpdateStatusDate] )
			as
			(
			select MortgateCenterCode, SQLLOADS.arn as [CreditApplicationNumber], CollateralPurpose, DisbursementManner, ApplicantName, SQLLOADS.SolicitorCode, SQLLOADS.ValuerCode, TotalFinancingAmount,
				FORMAT (SQLLOADS.[DateOfLOAcceptance], 'dd/MM/yyyy') as [DateOfLOAcceptance],
				case when solicitor.Completed =1 and solicitor.Status in ('Submitted','Resubmitted') then FORMAT (solicitor.UpdatedDate, 'dd/MM/yyyy') when solicitor.Completed =0 and Sol_Rejected.Status in ('Submitted','Resubmitted') and Sol_Rejected.arn is not null then FORMAT (Sol_Rejected.SolicitorUpdatedDate, 'dd/MM/yyyy') else null end as [DocumentationSubmissionDate],					
				case when solicitor.Completed =1 and solicitor.Status in ('Submitted','Resubmitted')  and sol_dumaker.Status = 'Completed' then FORMAT (sol_dumaker.UpdatedDate, 'dd/MM/yyyy') else null end as [DocumentationApprovalDate],
				case when solicitor.Completed =1 and solicitor.Status in ('Submitted','Resubmitted')  and sol_dumaker.Status = 'Completed' then sol_dumaker.DUMakerEmail else null end as [DocumentationApprovalMaker],
				case when solicitor.Completed =0 and Sol_Rejected.Status in ('Submitted','Resubmitted') and Sol_Rejected.arn is not null then FORMAT (Sol_Rejected.UpdatedDate, 'dd/MM/yyyy') else null end as [DocumentationRejectionDate],					
				case when solicitor.Completed =0 and Sol_Rejected.Status in ('Submitted','Resubmitted') and Sol_Rejected.arn is not null then Sol_Rejected.DUMakerEmail else null end as [DocumentationRejectionMaker],			
				case when solicitor.Completed =1 and solicitor.Status = 'Cancelled' then FORMAT (solicitor.UpdatedDate, 'dd/MM/yyyy') else null end as [DocumentationCancellationSubmissionDate],
				case when solicitor.Completed =1 and solicitor.Status = 'Cancelled'	and sol_dumaker.Status = 'Completed' then FORMAT (sol_dumaker.UpdatedDate, 'dd/MM/yyyy') else null end as [DocumentationCancellationApprovalDate],
				case when solicitor.Completed =1 and solicitor.Status = 'Cancelled'	and sol_dumaker.Status = 'Completed' then sol_dumaker.DUMakerEmail else null end as [DocumentationCancellationApprovalMaker],
				case when isnull(SQLLOADS.ValuationRequired,0) = 1 and valuer.Completed = 1 and Valuer.Status in ('Submitted','Resubmitted') then FORMAT (valuer.UpdatedDate, 'dd/MM/yyyy') else null end as [VRSubmissionDate],
				case when isnull(SQLLOADS.ValuationRequired,0) = 1 and valuer.Completed = 1 and Valuer.Status in ('Submitted','Resubmitted') and valuer_dumaker.Status = 'Completed' then FORMAT (valuer_dumaker.UpdatedDate, 'dd/MM/yyyy') else null end as [VRApprovalDate],
				case when isnull(SQLLOADS.ValuationRequired,0) = 1 and valuer.Completed = 1 and Valuer.Status in ('Submitted','Resubmitted') and valuer_dumaker.Status = 'Completed' then valuer_dumaker.DUMakerEmail else null end as [VRApprovalMaker],
				case 					
					when solicitor.Completed =1 and solicitor.Status in ('Submitted','Resubmitted')  and sol_dumaker.Status = 'Completed' then 'Documentation Approved' 
					when solicitor.Completed =1 and solicitor.Status = 'Cancelled'					and sol_dumaker.Status = 'Completed' then 'Cancellation Approved' 										
					when solicitor.Completed =1 and solicitor.Status = 'Cancelled'														then 'Cancellation Submitted' 						
					--when solicitor.Completed =1 and solicitor.Status in ('Submitted','Resubmitted') and Sol_Rejected.arn is not null  then 'Documentation Submitted' 	
					when solicitor.Completed =0 and Sol_Rejected.Status in ('Submitted','Resubmitted') and Sol_Rejected.arn is not null  then 'Documentation Rejected' 
					--when solicitor.Completed =0 and Sol_Rejected.Status = 'Cancelled'					and Sol_Rejected.arn is not null then 'Cancellation Rejected' 
					when solicitor.Completed =1 and solicitor.Status in ('Submitted','Resubmitted') then 'Documentation Submitted' 																						
					else 'New' 
				end as [DocumentationStatus],
				case 
					when isnull(SQLLOADS.ValuationRequired,0) = 0 then 'N/A'
					when isnull(SQLLOADS.ValuationRequired,0) = 1 and valuer.Completed = 1 and valuer.status = 'Cancelled' and valuer_dumaker.Status = 'Completed'  then 'Cancellation Approved'
					when isnull(SQLLOADS.ValuationRequired,0) = 1 and valuer.Completed = 1 and Valuer.Status in ('Submitted','Resubmitted') and valuer_dumaker.Status = 'Completed' then 'VR Approved'					
					when isnull(SQLLOADS.ValuationRequired,0) = 1 and valuer.Completed = 0 and Valuer_lowerOMV.Status = 'LowerOMV' and Valuer_lowerOMV.arn is not null then 'LowerOMV Approved'
					when isnull(SQLLOADS.ValuationRequired,0) = 1 and valuer.Completed = 1 and Valuer.Status = 'LowerOMV' then 'LowerOMV Submitted'					
					when isnull(SQLLOADS.ValuationRequired,0) = 1 and valuer.Completed = 1 and valuer.status = 'Cancelled' then 'Cancellation Submitted'
					when isnull(SQLLOADS.ValuationRequired,0) = 1 and valuer.Completed = 1 and Valuer.Status in ('Submitted','Resubmitted')  then 'VR Submitted'										
					else 'New'
				end as [VRStatus],
				SQLLOADS.ValuationRequired,
				case when isnull(SQLLOADS.ValuationRequired,0) = 1 and valuer.Completed = 1 and valuer.status = 'Cancelled' then FORMAT (valuer.UpdatedDate, 'dd/MM/yyyy') else null end as [VRCancellationSubmissionDate],
				case when isnull(SQLLOADS.ValuationRequired,0) = 1 and valuer.Completed = 1 and valuer.status = 'Cancelled' and valuer_dumaker.Status = 'Completed' then FORMAT (valuer_dumaker.UpdatedDate, 'dd/MM/yyyy') else null end as [VRCancellationApprovalDate],
				case when isnull(SQLLOADS.ValuationRequired,0) = 1 and valuer.Completed = 1 and valuer.status = 'Cancelled' and valuer_dumaker.Status = 'Completed' then valuer_dumaker.DUMakerEmail else null end as [VRCancellationApprovalMaker]			,	
				case when isnull(SQLLOADS.ValuationRequired,0) = 1 and valuer.Completed = 1 and Valuer.Status = 'LowerOMV' then FORMAT (valuer.UpdatedDate, 'dd/MM/yyyy') when isnull(SQLLOADS.ValuationRequired,0) = 1 and valuer.Completed = 0 and Valuer_lowerOMV.Status = 'LowerOMV' and Valuer_lowerOMV.arn is not null then FORMAT (Valuer_lowerOMV.ValuerUpdatedDate, 'dd/MM/yyyy') else null end as [VRLowerOMVSubmissionDate],
				case when isnull(SQLLOADS.ValuationRequired,0) = 1 and valuer.Completed = 0 and Valuer_lowerOMV.Status = 'LowerOMV' and Valuer_lowerOMV.arn is not null then FORMAT (Valuer_lowerOMV.UpdatedDate, 'dd/MM/yyyy') else null end as [VRLowerOMVApprovalDate],
				case when isnull(SQLLOADS.ValuationRequired,0) = 1 and valuer.Completed = 0 and Valuer_lowerOMV.Status = 'LowerOMV' and Valuer_lowerOMV.arn is not null then Valuer_lowerOMV.DUMakerEmail else null end as [VRLowerOMVApprovalMaker],
				sqlloads.SolicitorName, 
				sqlloads.ValuerName, 
				case when solicitor.Completed =1 and solicitor.Status in ('Submitted','Resubmitted') then solicitor.SolicitorReferenceNumber else null end as [DocumentatationSolicitorReferenceNumber],
				--case when solicitor.Completed =1 and solicitor.Status in ('Submitted','Resubmitted') then solicitor.ExecutionDateByCustomer else null end as [DocumentatationExecutionDateByCustomer],
				--case when solicitor.Completed =1 and solicitor.Status in ('Submitted','Resubmitted') then solicitor.SNPCompletionDate else null end as [DocumentatationSNPCompletionDate],
				--case when solicitor.Completed =1 and solicitor.Status in ('Submitted','Resubmitted') then solicitor.SNPExtendedCompletionDate else null end as [DocumentatationSNPExtendedCompletionDate],

				--20210426 format date fixes
				case when solicitor.Completed =1 and solicitor.Status in ('Submitted','Resubmitted') then FORMAT(solicitor.ExecutionDateByCustomer, 'dd/MM/yyyy') else null end as [DocumentatationExecutionDateByCustomer],
				case when solicitor.Completed =1 and solicitor.Status in ('Submitted','Resubmitted') then FORMAT(solicitor.SNPCompletionDate, 'dd/MM/yyyy') else null end as [DocumentatationSNPCompletionDate],
				case when solicitor.Completed =1 and solicitor.Status in ('Submitted','Resubmitted') then FORMAT(solicitor.SNPExtendedCompletionDate, 'dd/MM/yyyy') else null end as [DocumentatationSNPExtendedCompletionDate],

				case when solicitor.Completed =1 and solicitor.Status in ('Submitted','Resubmitted') then FORMAT(solicitor.DeveloperBillingDueDate, 'dd/MM/yyyy') else null end as [DocumentatationDeveloperBillingDueDate],				
				case when solicitor.Completed =1 and solicitor.Status in ('Submitted','Resubmitted')  and sol_dumaker.Status = 'Completed' then format(sol_dumaker.HardCopyReceivedDate ,'dd/MM/yyyy') else null end as [DocumentatationHardCopyReceivedDate],
				case when isnull(SQLLOADS.ValuationRequired,0) = 1 and valuer.Completed = 1 and Valuer.Status in ('Submitted','Resubmitted') then valuer.ValuerReference else null end as [VRValuerReferenceNumber],
				case when isnull(SQLLOADS.ValuationRequired,0) = 1 and valuer.Completed = 1 and Valuer.Status in ('Submitted','Resubmitted') then valuer.MarketValue else null end as [VRMarketValue],
				case when isnull(SQLLOADS.ValuationRequired,0) = 1 and valuer.Completed = 1 and Valuer.Status in ('Submitted','Resubmitted') then valuer.FireInsuranceValue else null end as [VRFireInsuranceValue],
				case when isnull(SQLLOADS.ValuationRequired,0) = 1 and valuer.Completed = 1 and Valuer.Status = 'LowerOMV' then valuer.VLowerOMVStatus when isnull(SQLLOADS.ValuationRequired,0) = 1 and valuer.Completed = 0 and Valuer_lowerOMV.Status = 'LowerOMV' and Valuer_lowerOMV.arn is not null then Valuer_lowerOMV.VLowerOMVStatus else null end as [VRLowerOMVLowerOMVReasons],
				case when isnull(SQLLOADS.ValuationRequired,0) = 1 and valuer.Completed = 1 and Valuer.Status = 'LowerOMV' then valuer.VLowerOMVReasons when isnull(SQLLOADS.ValuationRequired,0) = 1 and valuer.Completed = 0 and Valuer_lowerOMV.Status = 'LowerOMV' and Valuer_lowerOMV.arn is not null then Valuer_lowerOMV.VLowerOMVReasons else null end as [VRLowerOMVLowerOMVReasonsRemarks],
				DUMakerinstance.TaskOwner as [CurrentDocumentMaker],
				VRMakerinstance.TaskOwner as [CurrentVRMaker]	,
				case when isnull(SQLLOADS.ValuationRequired,0) = 1 and valuer.Completed = 1 and valuer.status = 'Cancelled' and valuer_dumaker.Status = 'Completed' then DATEDIFF(day, valuer.UpdatedDate, valuer_dumaker.UpdatedDate) 
					when isnull(SQLLOADS.ValuationRequired,0) = 1 and valuer.Completed = 1 and valuer.status = 'Cancelled'  then DATEDIFF(day, valuer.UpdatedDate, getdate()) 					
					else null end as [VRCancellationAgeing], 
				case when isnull(SQLLOADS.ValuationRequired,0) = 1 and valuer.Completed = 1 and Valuer.Status in ('Submitted','Resubmitted') and valuer_dumaker.Status = 'Completed' then DATEDIFF(day, valuer.UpdatedDate, valuer_dumaker.UpdatedDate) 
					when isnull(SQLLOADS.ValuationRequired,0) = 1 and valuer.Completed = 1 and Valuer.Status in ('Submitted','Resubmitted')  then DATEDIFF(day, valuer.UpdatedDate, getdate()) 					
					else null end as [VRSubmissionAgeing],
				case when isnull(SQLLOADS.ValuationRequired,0) = 1 and valuer.Completed = 0 and Valuer_lowerOMV.Status = 'LowerOMV' and Valuer_lowerOMV.arn is not null then DATEDIFF(day, Valuer_lowerOMV.ValuerUpdatedDate, Valuer_lowerOMV.UpdatedDate) 
					when isnull(SQLLOADS.ValuationRequired,0) = 1 and valuer.Completed = 1 and Valuer.Status = 'LowerOMV'  then DATEDIFF(day, valuer.UpdatedDate, getdate()) 					
					else null end as [VRLowerOMVAgeing],
				case when solicitor.Completed =1 and solicitor.Status = 'Cancelled'	and sol_dumaker.Status = 'Completed' then DATEDIFF(day, solicitor.UpdatedDate, sol_dumaker.UpdatedDate) 
					when solicitor.Completed =1 and solicitor.Status = 'Cancelled'  then DATEDIFF(day, solicitor.UpdatedDate, getdate()) 					
					else null end as [DocumentationCancellationAgeing], 
				case when solicitor.Completed =1 and solicitor.Status in ('Submitted','Resubmitted')  and sol_dumaker.Status = 'Completed' then DATEDIFF(day, solicitor.UpdatedDate, sol_dumaker.UpdatedDate) 
					when solicitor.Completed =0 and Sol_Rejected.Status in ('Submitted','Resubmitted') and Sol_Rejected.arn is not null  then DATEDIFF(day, Sol_Rejected.SolicitorUpdatedDate, Sol_Rejected.UpdatedDate) 					
					when solicitor.Completed =1 and solicitor.Status in ('Submitted','Resubmitted') then DATEDIFF(day, solicitor.UpdatedDate, getdate()) 
					else null end as [DocumentationSubmissionnAgeing],
				s_updateInfo.SStatus as [SolicitorUpdateStatusOption],
				s_updateInfo.SStatusOthers as [SolicitorUpdateStatusRemarks],			
				FORMAT (s_updateInfo.UpdatedDate, 'dd/MM/yyyy') as [SolicitorUpdateStatusDate],
				v_updateInfo.VUpdateInfoStatus as [ValuerUpdateStatusOption],
				v_updateInfo.VUpdateInfoStatusOthers as [ValuerUpdateStatusRemarks],
				FORMAT (v_updateInfo.UpdatedDate, 'dd/MM/yyyy') as [ValuerUpdateStatusDate]
			from SQLLOADS
				LEFT JOIN vw_SQLSolicitorDPSubmission solicitor on solicitor.arn = SQLLOADS.arn 
				left join SQLDUMakerDP_SolicitorSubmission sol_dumaker on sol_dumaker.arn = SQLLOADS.arn 
				--left JOIN [dbo].[SQLSolicitorDPSubmission_updateinfo] Sol_UI on Sol_UI.arn = SQLLOADS.arn
				left JOIN SQLDUMakerDP_SolicitorSubmission_Rejected Sol_Rejected on Sol_Rejected.arn = SQLLOADS.arn	
				LEFT JOIN vw_SQLValuerDPSubmission valuer on valuer.arn = SQLLOADS.arn 
				left join SQLDUMakerDP_ValuerSubmission valuer_dumaker on valuer_dumaker.arn = SQLLOADS.arn 
				left JOIN [dbo].SQLDUMakerDP_ValuerSubmission_LoweredOMV Valuer_lowerOMV on Valuer_lowerOMV.arn = SQLLOADS.arn	
				left join [MortgageAppTaskInstance] DUMakerinstance on DUMakerinstance.arn = sqlloads.arn and DUMakerinstance.workflow = 'DPDUMakerSolicitorApproval'
				left join [MortgageAppTaskInstance] VRMakerinstance on VRMakerinstance.arn = sqlloads.arn and VRMakerinstance.workflow = 'DPDUMakerValuerApproval'
				left join SQLValuerDPSubmission_UpdateInfo v_updateInfo on v_updateInfo.arn = sqlloads.arn 
				left join SQLSolicitorDPSubmission_UpdateInfo s_updateInfo on s_updateInfo.arn = sqlloads.arn 
			where 
				[DateOfLOAcceptance] between @DateFrom and @DateTo		
				and isnull(MortgateCenterCode,'') like case when @MortgageCentreFlag = 1 then @MortgageCentre else '%' end 
				and isnull(SQLLOADS.SolicitorCode,'') like case when @SolCodeFlag = 1 then @SolCode else '%' end 
				and isnull(SQLLOADS.ValuerCode,'') like case when @ValCodeFlag = 1 then @ValCode else '%' end 	
			)
			insert into aaMortgageReport_AcceptanceSubmitted
			(
				MortgateCenterCode, 
				CreditApplicationNumber, 
				CollateralPurpose, 
				DisbursementManner, 
				ApplicantName, 
				SolicitorCode, 
				ValuerCode, 
				TotalFinancingAmount,
				[DateOfLOAcceptance],
				[DocumentationSubmissionDate],
				[DocumentationApprovalDate],
				[DocumentationApprovalMaker], 
				[DocumentationRejectionDate], 
				[DocumentationRejectionMaker], 
				[DocumentationCancellationSubmissionDate], 
				[DocumentationCancellationApprovalDate], 
				[VRSubmissionDate],
				[VRApprovalDate],
				[VRApprovalMaker],
				[DocumentationStatus], 
				[VRStatus],
				[DocumentationCancellationApprovalMaker] ,
				ValuationRequired,
				[VRCancellationSubmissionDate],[VRCancellationApprovalDate],[VRCancellationApprovalMaker]
				, [VRLowerOMVSubmissionDate], [VRLowerOMVApprovalDate], [VRLowerOMVApprovalMaker],
				SolicitorName,ValuerName,[DocumentatationSolicitorReferenceNumber],[DocumentatationExecutionDateByCustomer],[DocumentatationSNPCompletionDate],[DocumentatationSNPExtendedCompletionDate],[DocumentatationDeveloperBillingDueDate],
				[DocumentatationHardCopyReceivedDate], [VRValuerReferenceNumber], [VRMarketValue], [VRFireInsuranceValue], [VRLowerOMVLowerOMVReasons], [VRLowerOMVLowerOMVReasonsRemarks], [CurrentDocumentMaker], [CurrentVRMaker],
				[VRCancellationAgeing], [VRSubmissionAgeing], [VRLowerOMVAgeing],[DocumentationCancellationAgeing],[DocumentationSubmissionnAgeing],
				[SolicitorUpdateStatusOption], [SolicitorUpdateStatusRemarks], [SolicitorUpdateStatusDate], [ValuerUpdateStatusOption],[ValuerUpdateStatusRemarks],[ValuerUpdateStatusDate]
			)
			select 
				MortgateCenterCode, 
				CreditApplicationNumber, 
				CollateralPurpose, 
				DisbursementManner, 
				ApplicantName, 
				SolicitorCode, 
				ValuerCode, 
				TotalFinancingAmount,
				[DateOfLOAcceptance],
				[DocumentationSubmissionDate],
				[DocumentationApprovalDate],
				[DocumentationApprovalMaker], 
				[DocumentationRejectionDate], 
				[DocumentationRejectionMaker], 
				[DocumentationCancellationSubmissionDate], 
				[DocumentationCancellationApprovalDate], 
				[VRSubmissionDate],
				[VRApprovalDate],
				[VRApprovalMaker],
				[DocumentationStatus], 
				[VRStatus],
				[DocumentationCancellationApprovalMaker] ,
				ValuationRequired,
				[VRCancellationSubmissionDate],[VRCancellationApprovalDate],[VRCancellationApprovalMaker]
				, [VRLowerOMVSubmissionDate], [VRLowerOMVApprovalDate], [VRLowerOMVApprovalMaker],
				SolicitorName,ValuerName,[DocumentatationSolicitorReferenceNumber],[DocumentatationExecutionDateByCustomer],[DocumentatationSNPCompletionDate],[DocumentatationSNPExtendedCompletionDate],[DocumentatationDeveloperBillingDueDate],
				[DocumentatationHardCopyReceivedDate], [VRValuerReferenceNumber], [VRMarketValue], [VRFireInsuranceValue], [VRLowerOMVLowerOMVReasons], [VRLowerOMVLowerOMVReasonsRemarks], [CurrentDocumentMaker], [CurrentVRMaker],
				[VRCancellationAgeing], [VRSubmissionAgeing], [VRLowerOMVAgeing],[DocumentationCancellationAgeing],[DocumentationSubmissionnAgeing],
				[SolicitorUpdateStatusOption], [SolicitorUpdateStatusRemarks], [SolicitorUpdateStatusDate], [ValuerUpdateStatusOption],[ValuerUpdateStatusRemarks],[ValuerUpdateStatusDate]
			from cte 
			where cte.VRStatus like case when @VRStatusFlag = 1 then @VRStatus else '%' end 
				and cte.DOcumentationStatus like case when @DocStatusFlag = 1 then @DocStatus else '%' end 
			order by [DateOfLOAcceptance] asc		
		end 

		
		if (@Category = 'Valuer Submission')
		begin				
			with cte (MortgateCenterCode, CreditApplicationNumber, CollateralPurpose, DisbursementManner, ApplicantName, SolicitorCode, ValuerCode, TotalFinancingAmount,
				[DateOfLOAcceptance],[DocumentationSubmissionDate],
				[DocumentationApprovalDate],[DocumentationApprovalMaker], [DocumentationRejectionDate], [DocumentationRejectionMaker], [DocumentationCancellationSubmissionDate], [DocumentationCancellationApprovalDate], [DocumentationCancellationApprovalMaker],[VRSubmissionDate],[VRApprovalDate],[VRApprovalMaker],
				[DocumentationStatus], [VRStatus],ValuationRequired,[VRCancellationSubmissionDate],[VRCancellationApprovalDate],[VRCancellationApprovalMaker], [VRLowerOMVSubmissionDate], [VRLowerOMVApprovalDate], [VRLowerOMVApprovalMaker],
				SolicitorName,ValuerName,[DocumentatationSolicitorReferenceNumber],[DocumentatationExecutionDateByCustomer],[DocumentatationSNPCompletionDate],[DocumentatationSNPExtendedCompletionDate],[DocumentatationDeveloperBillingDueDate],
				[DocumentatationHardCopyReceivedDate], [VRValuerReferenceNumber], [VRMarketValue], [VRFireInsuranceValue], [VRLowerOMVLowerOMVReasons], [VRLowerOMVLowerOMVReasonsRemarks], [CurrentDocumentMaker], [CurrentVRMaker],
				[VRCancellationAgeing], [VRSubmissionAgeing], [VRLowerOMVAgeing],[DocumentationCancellationAgeing],[DocumentationSubmissionnAgeing],
				[SolicitorUpdateStatusOption], [SolicitorUpdateStatusRemarks], [SolicitorUpdateStatusDate], [ValuerUpdateStatusOption],[ValuerUpdateStatusRemarks],[ValuerUpdateStatusDate])
				as
				(
				select MortgateCenterCode, SQLLOADS.arn as [CreditApplicationNumber], CollateralPurpose, DisbursementManner, ApplicantName, SQLLOADS.SolicitorCode, SQLLOADS.ValuerCode, TotalFinancingAmount,
				FORMAT (SQLLOADS.[DateOfLOAcceptance], 'dd/MM/yyyy') as [DateOfLOAcceptance],
				case when solicitor.Completed =1 and solicitor.Status in ('Submitted','Resubmitted') then FORMAT (solicitor.UpdatedDate, 'dd/MM/yyyy') when solicitor.Completed =0 and Sol_Rejected.Status in ('Submitted','Resubmitted') and Sol_Rejected.arn is not null then FORMAT (Sol_Rejected.SolicitorUpdatedDate, 'dd/MM/yyyy') else null end as [DocumentationSubmissionDate],					
				case when solicitor.Completed =1 and solicitor.Status in ('Submitted','Resubmitted')  and sol_dumaker.Status = 'Completed' then FORMAT (sol_dumaker.UpdatedDate, 'dd/MM/yyyy') else null end as [DocumentationApprovalDate],
				case when solicitor.Completed =1 and solicitor.Status in ('Submitted','Resubmitted')  and sol_dumaker.Status = 'Completed' then sol_dumaker.DUMakerEmail else null end as [DocumentationApprovalMaker],
				case when solicitor.Completed =0 and Sol_Rejected.Status in ('Submitted','Resubmitted') and Sol_Rejected.arn is not null then FORMAT (Sol_Rejected.UpdatedDate, 'dd/MM/yyyy') else null end as [DocumentationRejectionDate],					
				case when solicitor.Completed =0 and Sol_Rejected.Status in ('Submitted','Resubmitted') and Sol_Rejected.arn is not null then Sol_Rejected.DUMakerEmail else null end as [DocumentationRejectionMaker],			
				case when solicitor.Completed =1 and solicitor.Status = 'Cancelled' then FORMAT (solicitor.UpdatedDate, 'dd/MM/yyyy') else null end as [DocumentationCancellationSubmissionDate],
				case when solicitor.Completed =1 and solicitor.Status = 'Cancelled'	and sol_dumaker.Status = 'Completed' then FORMAT (sol_dumaker.UpdatedDate, 'dd/MM/yyyy') else null end as [DocumentationCancellationApprovalDate],
				case when solicitor.Completed =1 and solicitor.Status = 'Cancelled'	and sol_dumaker.Status = 'Completed' then sol_dumaker.DUMakerEmail else null end as [DocumentationCancellationApprovalMaker],
				case when isnull(SQLLOADS.ValuationRequired,0) = 1 and valuer.Completed = 1 and Valuer.Status in ('Submitted','Resubmitted') then FORMAT (valuer.UpdatedDate, 'dd/MM/yyyy') else null end as [VRSubmissionDate],
				case when isnull(SQLLOADS.ValuationRequired,0) = 1 and valuer.Completed = 1 and Valuer.Status in ('Submitted','Resubmitted') and valuer_dumaker.Status = 'Completed' then FORMAT (valuer_dumaker.UpdatedDate, 'dd/MM/yyyy') else null end as [VRApprovalDate],
				case when isnull(SQLLOADS.ValuationRequired,0) = 1 and valuer.Completed = 1 and Valuer.Status in ('Submitted','Resubmitted') and valuer_dumaker.Status = 'Completed' then valuer_dumaker.DUMakerEmail else null end as [VRApprovalMaker],
				case 					
					when solicitor.Completed =1 and solicitor.Status in ('Submitted','Resubmitted')  and sol_dumaker.Status = 'Completed' then 'Documentation Approved' 
					when solicitor.Completed =1 and solicitor.Status = 'Cancelled'					and sol_dumaker.Status = 'Completed' then 'Cancellation Approved' 										
					when solicitor.Completed =1 and solicitor.Status = 'Cancelled'														then 'Cancellation Submitted' 						
					--when solicitor.Completed =1 and solicitor.Status in ('Submitted','Resubmitted') and Sol_Rejected.arn is not null  then 'Documentation Submitted' 	
					when solicitor.Completed =0 and Sol_Rejected.Status in ('Submitted','Resubmitted') and Sol_Rejected.arn is not null  then 'Documentation Rejected' 
					--when solicitor.Completed =0 and Sol_Rejected.Status = 'Cancelled'					and Sol_Rejected.arn is not null then 'Cancellation Rejected' 
					when solicitor.Completed =1 and solicitor.Status in ('Submitted','Resubmitted') then 'Documentation Submitted' 																						
					else 'New' 
				end as [DocumentationStatus],
				case 
					when isnull(SQLLOADS.ValuationRequired,0) = 0 then 'N/A'
					when isnull(SQLLOADS.ValuationRequired,0) = 1 and valuer.Completed = 1 and valuer.status = 'Cancelled' and valuer_dumaker.Status = 'Completed'  then 'Cancellation Approved'
					when isnull(SQLLOADS.ValuationRequired,0) = 1 and valuer.Completed = 1 and Valuer.Status in ('Submitted','Resubmitted') and valuer_dumaker.Status = 'Completed' then 'VR Approved'					
					when isnull(SQLLOADS.ValuationRequired,0) = 1 and valuer.Completed = 0 and Valuer_lowerOMV.Status = 'LowerOMV' and Valuer_lowerOMV.arn is not null then 'LowerOMV Approved'
					when isnull(SQLLOADS.ValuationRequired,0) = 1 and valuer.Completed = 1 and Valuer.Status = 'LowerOMV' then 'LowerOMV Submitted'					
					when isnull(SQLLOADS.ValuationRequired,0) = 1 and valuer.Completed = 1 and valuer.status = 'Cancelled' then 'Cancellation Submitted'
					when isnull(SQLLOADS.ValuationRequired,0) = 1 and valuer.Completed = 1 and Valuer.Status in ('Submitted','Resubmitted')  then 'VR Submitted'										
					else 'New'
				end as [VRStatus],
				SQLLOADS.ValuationRequired,
				case when isnull(SQLLOADS.ValuationRequired,0) = 1 and valuer.Completed = 1 and valuer.status = 'Cancelled' then FORMAT (valuer.UpdatedDate, 'dd/MM/yyyy') else null end as [VRCancellationSubmissionDate],
				case when isnull(SQLLOADS.ValuationRequired,0) = 1 and valuer.Completed = 1 and valuer.status = 'Cancelled' and valuer_dumaker.Status = 'Completed' then FORMAT (valuer_dumaker.UpdatedDate, 'dd/MM/yyyy') else null end as [VRCancellationApprovalDate],
				case when isnull(SQLLOADS.ValuationRequired,0) = 1 and valuer.Completed = 1 and valuer.status = 'Cancelled' and valuer_dumaker.Status = 'Completed' then valuer_dumaker.DUMakerEmail else null end as [VRCancellationApprovalMaker]			,	
				case when isnull(SQLLOADS.ValuationRequired,0) = 1 and valuer.Completed = 1 and Valuer.Status = 'LowerOMV' then FORMAT (valuer.UpdatedDate, 'dd/MM/yyyy') when isnull(SQLLOADS.ValuationRequired,0) = 1 and valuer.Completed = 0 and Valuer_lowerOMV.Status = 'LowerOMV' and Valuer_lowerOMV.arn is not null then FORMAT (Valuer_lowerOMV.ValuerUpdatedDate, 'dd/MM/yyyy') else null end as [VRLowerOMVSubmissionDate],
				case when isnull(SQLLOADS.ValuationRequired,0) = 1 and valuer.Completed = 0 and Valuer_lowerOMV.Status = 'LowerOMV' and Valuer_lowerOMV.arn is not null then FORMAT (Valuer_lowerOMV.UpdatedDate, 'dd/MM/yyyy') else null end as [VRLowerOMVApprovalDate],
				case when isnull(SQLLOADS.ValuationRequired,0) = 1 and valuer.Completed = 0 and Valuer_lowerOMV.Status = 'LowerOMV' and Valuer_lowerOMV.arn is not null then Valuer_lowerOMV.DUMakerEmail else null end as [VRLowerOMVApprovalMaker],
				sqlloads.SolicitorName, 
				sqlloads.ValuerName, 
				case when solicitor.Completed =1 and solicitor.Status in ('Submitted','Resubmitted') then solicitor.SolicitorReferenceNumber else null end as [DocumentatationSolicitorReferenceNumber],
				--case when solicitor.Completed =1 and solicitor.Status in ('Submitted','Resubmitted') then solicitor.ExecutionDateByCustomer else null end as [DocumentatationExecutionDateByCustomer],
				--case when solicitor.Completed =1 and solicitor.Status in ('Submitted','Resubmitted') then solicitor.SNPCompletionDate else null end as [DocumentatationSNPCompletionDate],
				--case when solicitor.Completed =1 and solicitor.Status in ('Submitted','Resubmitted') then solicitor.SNPExtendedCompletionDate else null end as [DocumentatationSNPExtendedCompletionDate],

				--20210426 format date fixes
				case when solicitor.Completed =1 and solicitor.Status in ('Submitted','Resubmitted') then FORMAT(solicitor.ExecutionDateByCustomer, 'dd/MM/yyyy') else null end as [DocumentatationExecutionDateByCustomer],
				case when solicitor.Completed =1 and solicitor.Status in ('Submitted','Resubmitted') then FORMAT(solicitor.SNPCompletionDate, 'dd/MM/yyyy') else null end as [DocumentatationSNPCompletionDate],
				case when solicitor.Completed =1 and solicitor.Status in ('Submitted','Resubmitted') then FORMAT(solicitor.SNPExtendedCompletionDate, 'dd/MM/yyyy') else null end as [DocumentatationSNPExtendedCompletionDate],

				case when solicitor.Completed =1 and solicitor.Status in ('Submitted','Resubmitted') then FORMAT(solicitor.DeveloperBillingDueDate, 'dd/MM/yyyy') else null end as [DocumentatationDeveloperBillingDueDate],				
				case when solicitor.Completed =1 and solicitor.Status in ('Submitted','Resubmitted')  and sol_dumaker.Status = 'Completed' then format(sol_dumaker.HardCopyReceivedDate ,'dd/MM/yyyy') else null end as [DocumentatationHardCopyReceivedDate],
				case when isnull(SQLLOADS.ValuationRequired,0) = 1 and valuer.Completed = 1 and Valuer.Status in ('Submitted','Resubmitted') then valuer.ValuerReference else null end as [VRValuerReferenceNumber],
				case when isnull(SQLLOADS.ValuationRequired,0) = 1 and valuer.Completed = 1 and Valuer.Status in ('Submitted','Resubmitted') then valuer.MarketValue else null end as [VRMarketValue],
				case when isnull(SQLLOADS.ValuationRequired,0) = 1 and valuer.Completed = 1 and Valuer.Status in ('Submitted','Resubmitted') then valuer.FireInsuranceValue else null end as [VRFireInsuranceValue],
				case when isnull(SQLLOADS.ValuationRequired,0) = 1 and valuer.Completed = 1 and Valuer.Status = 'LowerOMV' then valuer.VLowerOMVStatus when isnull(SQLLOADS.ValuationRequired,0) = 1 and valuer.Completed = 0 and Valuer_lowerOMV.Status = 'LowerOMV' and Valuer_lowerOMV.arn is not null then Valuer_lowerOMV.VLowerOMVStatus else null end as [VRLowerOMVLowerOMVReasons],
				case when isnull(SQLLOADS.ValuationRequired,0) = 1 and valuer.Completed = 1 and Valuer.Status = 'LowerOMV' then valuer.VLowerOMVReasons when isnull(SQLLOADS.ValuationRequired,0) = 1 and valuer.Completed = 0 and Valuer_lowerOMV.Status = 'LowerOMV' and Valuer_lowerOMV.arn is not null then Valuer_lowerOMV.VLowerOMVReasons else null end as [VRLowerOMVLowerOMVReasonsRemarks],
				DUMakerinstance.TaskOwner as [CurrentDocumentMaker],
				VRMakerinstance.TaskOwner as [CurrentVRMaker]	,
				case when isnull(SQLLOADS.ValuationRequired,0) = 1 and valuer.Completed = 1 and valuer.status = 'Cancelled' and valuer_dumaker.Status = 'Completed' then DATEDIFF(day, valuer.UpdatedDate, valuer_dumaker.UpdatedDate) 
					when isnull(SQLLOADS.ValuationRequired,0) = 1 and valuer.Completed = 1 and valuer.status = 'Cancelled'  then DATEDIFF(day, valuer.UpdatedDate, getdate()) 					
					else null end as [VRCancellationAgeing], 
				case when isnull(SQLLOADS.ValuationRequired,0) = 1 and valuer.Completed = 1 and Valuer.Status in ('Submitted','Resubmitted') and valuer_dumaker.Status = 'Completed' then DATEDIFF(day, valuer.UpdatedDate, valuer_dumaker.UpdatedDate) 
					when isnull(SQLLOADS.ValuationRequired,0) = 1 and valuer.Completed = 1 and Valuer.Status in ('Submitted','Resubmitted')  then DATEDIFF(day, valuer.UpdatedDate, getdate()) 					
					else null end as [VRSubmissionAgeing],
				case when isnull(SQLLOADS.ValuationRequired,0) = 1 and valuer.Completed = 0 and Valuer_lowerOMV.Status = 'LowerOMV' and Valuer_lowerOMV.arn is not null then DATEDIFF(day, Valuer_lowerOMV.ValuerUpdatedDate, Valuer_lowerOMV.UpdatedDate) 
					when isnull(SQLLOADS.ValuationRequired,0) = 1 and valuer.Completed = 1 and Valuer.Status = 'LowerOMV'  then DATEDIFF(day, valuer.UpdatedDate, getdate()) 					
					else null end as [VRLowerOMVAgeing],
				case when solicitor.Completed =1 and solicitor.Status = 'Cancelled'	and sol_dumaker.Status = 'Completed' then DATEDIFF(day, solicitor.UpdatedDate, sol_dumaker.UpdatedDate) 
					when solicitor.Completed =1 and solicitor.Status = 'Cancelled'  then DATEDIFF(day, solicitor.UpdatedDate, getdate()) 					
					else null end as [DocumentationCancellationAgeing], 
				case when solicitor.Completed =1 and solicitor.Status in ('Submitted','Resubmitted')  and sol_dumaker.Status = 'Completed' then DATEDIFF(day, solicitor.UpdatedDate, sol_dumaker.UpdatedDate) 
					when solicitor.Completed =0 and Sol_Rejected.Status in ('Submitted','Resubmitted') and Sol_Rejected.arn is not null  then DATEDIFF(day, Sol_Rejected.SolicitorUpdatedDate, Sol_Rejected.UpdatedDate) 					
					when solicitor.Completed =1 and solicitor.Status in ('Submitted','Resubmitted') then DATEDIFF(day, solicitor.UpdatedDate, getdate()) 
					else null end as [DocumentationSubmissionnAgeing],
				s_updateInfo.SStatus as [SolicitorUpdateStatusOption],
				s_updateInfo.SStatusOthers as [SolicitorUpdateStatusRemarks],			
				FORMAT (s_updateInfo.UpdatedDate, 'dd/MM/yyyy') as [SolicitorUpdateStatusDate],
				v_updateInfo.VUpdateInfoStatus as [ValuerUpdateStatusOption],
				v_updateInfo.VUpdateInfoStatusOthers as [ValuerUpdateStatusRemarks],
				FORMAT (v_updateInfo.UpdatedDate, 'dd/MM/yyyy') as [ValuerUpdateStatusDate]
				from SQLLOADS
					LEFT JOIN vw_SQLSolicitorDPSubmission solicitor on solicitor.arn = SQLLOADS.arn 
					left join SQLDUMakerDP_SolicitorSubmission sol_dumaker on sol_dumaker.arn = SQLLOADS.arn 
					--left JOIN [dbo].[SQLSolicitorDPSubmission_updateinfo] Sol_UI on Sol_UI.arn = SQLLOADS.arn
					left JOIN SQLDUMakerDP_SolicitorSubmission_Rejected Sol_Rejected on Sol_Rejected.arn = SQLLOADS.arn	
					LEFT JOIN vw_SQLValuerDPSubmission valuer on valuer.arn = SQLLOADS.arn 
					left join SQLDUMakerDP_ValuerSubmission valuer_dumaker on valuer_dumaker.arn = SQLLOADS.arn 
					left JOIN [dbo].SQLDUMakerDP_ValuerSubmission_LoweredOMV Valuer_lowerOMV on Valuer_lowerOMV.arn = SQLLOADS.arn		
					left join [MortgageAppTaskInstance] DUMakerinstance on DUMakerinstance.arn = sqlloads.arn and DUMakerinstance.workflow = 'DPDUMakerSolicitorApproval'
					left join [MortgageAppTaskInstance] VRMakerinstance on VRMakerinstance.arn = sqlloads.arn and VRMakerinstance.workflow = 'DPDUMakerValuerApproval'
					left join SQLValuerDPSubmission_UpdateInfo v_updateInfo on v_updateInfo.arn = sqlloads.arn 
					left join SQLSolicitorDPSubmission_UpdateInfo s_updateInfo on s_updateInfo.arn = sqlloads.arn 
				where 
					valuer.UpdatedDate between @DateFrom and @DateTo	
					and isnull(MortgateCenterCode,'') like case when @MortgageCentreFlag = 1 then @MortgageCentre else '%' end 
					and isnull(SQLLOADS.SolicitorCode,'') like case when @SolCodeFlag = 1 then @SolCode else '%' end 
					and isnull(SQLLOADS.ValuerCode,'') like case when @ValCodeFlag = 1 then @ValCode else '%' end 	
					and isnull(SQLLOADS.ValuationRequired,0) = 1 and valuer.Completed = 1 and Valuer.Status in ('Submitted','Resubmitted')	
				)
				insert into aaMortgageReport_AcceptanceSubmitted
				(
					MortgateCenterCode, 
					CreditApplicationNumber, 
					CollateralPurpose, 
					DisbursementManner, 
					ApplicantName, 
					SolicitorCode, 
					ValuerCode, 
					TotalFinancingAmount,
					[DateOfLOAcceptance],
					[DocumentationSubmissionDate],
					[DocumentationApprovalDate],
					[DocumentationApprovalMaker], 
					[DocumentationRejectionDate], 
					[DocumentationRejectionMaker], 
					[DocumentationCancellationSubmissionDate], 
					[DocumentationCancellationApprovalDate], 
					[VRSubmissionDate],
					[VRApprovalDate],
					[VRApprovalMaker],
					[DocumentationStatus], 
					[VRStatus],
					[DocumentationCancellationApprovalMaker] ,
					ValuationRequired,
					[VRCancellationSubmissionDate],[VRCancellationApprovalDate],[VRCancellationApprovalMaker]
					, [VRLowerOMVSubmissionDate], [VRLowerOMVApprovalDate], [VRLowerOMVApprovalMaker],
					SolicitorName,ValuerName,[DocumentatationSolicitorReferenceNumber],[DocumentatationExecutionDateByCustomer],[DocumentatationSNPCompletionDate],[DocumentatationSNPExtendedCompletionDate],[DocumentatationDeveloperBillingDueDate],
					[DocumentatationHardCopyReceivedDate], [VRValuerReferenceNumber], [VRMarketValue], [VRFireInsuranceValue], [VRLowerOMVLowerOMVReasons], [VRLowerOMVLowerOMVReasonsRemarks], [CurrentDocumentMaker], [CurrentVRMaker],
					[VRCancellationAgeing], [VRSubmissionAgeing], [VRLowerOMVAgeing],[DocumentationCancellationAgeing],[DocumentationSubmissionnAgeing] ,
					[SolicitorUpdateStatusOption], [SolicitorUpdateStatusRemarks], [SolicitorUpdateStatusDate], [ValuerUpdateStatusOption],[ValuerUpdateStatusRemarks],[ValuerUpdateStatusDate]
				)
				select 
					MortgateCenterCode, 
					CreditApplicationNumber, 
					CollateralPurpose, 
					DisbursementManner, 
					ApplicantName, 
					SolicitorCode, 
					ValuerCode, 
					TotalFinancingAmount,
					[DateOfLOAcceptance],
					[DocumentationSubmissionDate],
					[DocumentationApprovalDate],
					[DocumentationApprovalMaker], 
					[DocumentationRejectionDate], 
					[DocumentationRejectionMaker], 
					[DocumentationCancellationSubmissionDate], 
					[DocumentationCancellationApprovalDate], 
					[VRSubmissionDate],
					[VRApprovalDate],
					[VRApprovalMaker],
					[DocumentationStatus], 
					[VRStatus],
					[DocumentationCancellationApprovalMaker] ,
					ValuationRequired,
					[VRCancellationSubmissionDate],[VRCancellationApprovalDate],[VRCancellationApprovalMaker]
					, [VRLowerOMVSubmissionDate], [VRLowerOMVApprovalDate], [VRLowerOMVApprovalMaker],
					SolicitorName,ValuerName,[DocumentatationSolicitorReferenceNumber],[DocumentatationExecutionDateByCustomer],[DocumentatationSNPCompletionDate],[DocumentatationSNPExtendedCompletionDate],[DocumentatationDeveloperBillingDueDate],
					[DocumentatationHardCopyReceivedDate], [VRValuerReferenceNumber], [VRMarketValue], [VRFireInsuranceValue], [VRLowerOMVLowerOMVReasons], [VRLowerOMVLowerOMVReasonsRemarks], [CurrentDocumentMaker], [CurrentVRMaker],
					[VRCancellationAgeing], [VRSubmissionAgeing], [VRLowerOMVAgeing],[DocumentationCancellationAgeing],[DocumentationSubmissionnAgeing] ,
					[SolicitorUpdateStatusOption], [SolicitorUpdateStatusRemarks], [SolicitorUpdateStatusDate], [ValuerUpdateStatusOption],[ValuerUpdateStatusRemarks],[ValuerUpdateStatusDate]
				from cte 
				where cte.VRStatus like case when @VRStatusFlag = 1 then @VRStatus else '%' end 
					and cte.DOcumentationStatus like case when @DocStatusFlag = 1 then @DocStatus else '%' end 
				order by [VRSubmissionDate] asc	

			
		end 
		
		if (@Category = 'Solicitor Submission')
		begin				
			with cte (MortgateCenterCode, CreditApplicationNumber, CollateralPurpose, DisbursementManner, ApplicantName, SolicitorCode, ValuerCode, TotalFinancingAmount,
				[DateOfLOAcceptance],[DocumentationSubmissionDate],
				[DocumentationApprovalDate],[DocumentationApprovalMaker], [DocumentationRejectionDate], [DocumentationRejectionMaker], [DocumentationCancellationSubmissionDate], [DocumentationCancellationApprovalDate], [DocumentationCancellationApprovalMaker],[VRSubmissionDate],[VRApprovalDate],[VRApprovalMaker],
				[DocumentationStatus], [VRStatus],ValuationRequired,[VRCancellationSubmissionDate],[VRCancellationApprovalDate],[VRCancellationApprovalMaker], [VRLowerOMVSubmissionDate], [VRLowerOMVApprovalDate], [VRLowerOMVApprovalMaker],
				SolicitorName,ValuerName,[DocumentatationSolicitorReferenceNumber],[DocumentatationExecutionDateByCustomer],[DocumentatationSNPCompletionDate],[DocumentatationSNPExtendedCompletionDate],[DocumentatationDeveloperBillingDueDate],
				[DocumentatationHardCopyReceivedDate], [VRValuerReferenceNumber], [VRMarketValue], [VRFireInsuranceValue], [VRLowerOMVLowerOMVReasons], [VRLowerOMVLowerOMVReasonsRemarks], [CurrentDocumentMaker], [CurrentVRMaker],
				[VRCancellationAgeing], [VRSubmissionAgeing], [VRLowerOMVAgeing],[DocumentationCancellationAgeing],[DocumentationSubmissionnAgeing],
				[SolicitorUpdateStatusOption], [SolicitorUpdateStatusRemarks], [SolicitorUpdateStatusDate], [ValuerUpdateStatusOption],[ValuerUpdateStatusRemarks],[ValuerUpdateStatusDate])
				as
				(
				--submitted case 
				select MortgateCenterCode, SQLLOADS.arn as [CreditApplicationNumber], CollateralPurpose, DisbursementManner, ApplicantName, SQLLOADS.SolicitorCode, SQLLOADS.ValuerCode, TotalFinancingAmount,
				FORMAT (SQLLOADS.[DateOfLOAcceptance], 'dd/MM/yyyy') as [DateOfLOAcceptance],
				case when solicitor.Completed =1 and solicitor.Status in ('Submitted','Resubmitted') then FORMAT (solicitor.UpdatedDate, 'dd/MM/yyyy') when solicitor.Completed =0 and Sol_Rejected.Status in ('Submitted','Resubmitted') and Sol_Rejected.arn is not null then FORMAT (Sol_Rejected.SolicitorUpdatedDate, 'dd/MM/yyyy') else null end as [DocumentationSubmissionDate],					
				case when solicitor.Completed =1 and solicitor.Status in ('Submitted','Resubmitted')  and sol_dumaker.Status = 'Completed' then FORMAT (sol_dumaker.UpdatedDate, 'dd/MM/yyyy') else null end as [DocumentationApprovalDate],
				case when solicitor.Completed =1 and solicitor.Status in ('Submitted','Resubmitted')  and sol_dumaker.Status = 'Completed' then sol_dumaker.DUMakerEmail else null end as [DocumentationApprovalMaker],
				case when solicitor.Completed =0 and Sol_Rejected.Status in ('Submitted','Resubmitted') and Sol_Rejected.arn is not null then FORMAT (Sol_Rejected.UpdatedDate, 'dd/MM/yyyy') else null end as [DocumentationRejectionDate],					
				case when solicitor.Completed =0 and Sol_Rejected.Status in ('Submitted','Resubmitted') and Sol_Rejected.arn is not null then Sol_Rejected.DUMakerEmail else null end as [DocumentationRejectionMaker],			
				case when solicitor.Completed =1 and solicitor.Status = 'Cancelled' then FORMAT (solicitor.UpdatedDate, 'dd/MM/yyyy') else null end as [DocumentationCancellationSubmissionDate],
				case when solicitor.Completed =1 and solicitor.Status = 'Cancelled'	and sol_dumaker.Status = 'Completed' then FORMAT (sol_dumaker.UpdatedDate, 'dd/MM/yyyy') else null end as [DocumentationCancellationApprovalDate],
				case when solicitor.Completed =1 and solicitor.Status = 'Cancelled'	and sol_dumaker.Status = 'Completed' then sol_dumaker.DUMakerEmail else null end as [DocumentationCancellationApprovalMaker],
				case when isnull(SQLLOADS.ValuationRequired,0) = 1 and valuer.Completed = 1 and Valuer.Status in ('Submitted','Resubmitted') then FORMAT (valuer.UpdatedDate, 'dd/MM/yyyy') else null end as [VRSubmissionDate],
				case when isnull(SQLLOADS.ValuationRequired,0) = 1 and valuer.Completed = 1 and Valuer.Status in ('Submitted','Resubmitted') and valuer_dumaker.Status = 'Completed' then FORMAT (valuer_dumaker.UpdatedDate, 'dd/MM/yyyy') else null end as [VRApprovalDate],
				case when isnull(SQLLOADS.ValuationRequired,0) = 1 and valuer.Completed = 1 and Valuer.Status in ('Submitted','Resubmitted') and valuer_dumaker.Status = 'Completed' then valuer_dumaker.DUMakerEmail else null end as [VRApprovalMaker],
				case 					
					when solicitor.Completed =1 and solicitor.Status in ('Submitted','Resubmitted')  and sol_dumaker.Status = 'Completed' then 'Documentation Approved' 
					when solicitor.Completed =1 and solicitor.Status = 'Cancelled'					and sol_dumaker.Status = 'Completed' then 'Cancellation Approved' 										
					when solicitor.Completed =1 and solicitor.Status = 'Cancelled'														then 'Cancellation Submitted' 						
					--when solicitor.Completed =1 and solicitor.Status in ('Submitted','Resubmitted') and Sol_Rejected.arn is not null  then 'Documentation Submitted' 	
					when solicitor.Completed =0 and Sol_Rejected.Status in ('Submitted','Resubmitted') and Sol_Rejected.arn is not null  then 'Documentation Rejected' 
					--when solicitor.Completed =0 and Sol_Rejected.Status = 'Cancelled'					and Sol_Rejected.arn is not null then 'Cancellation Rejected' 
					when solicitor.Completed =1 and solicitor.Status in ('Submitted','Resubmitted') then 'Documentation Submitted' 																						
					else 'New' 
				end as [DocumentationStatus],
				case 
					when isnull(SQLLOADS.ValuationRequired,0) = 0 then 'N/A'
					when isnull(SQLLOADS.ValuationRequired,0) = 1 and valuer.Completed = 1 and valuer.status = 'Cancelled' and valuer_dumaker.Status = 'Completed'  then 'Cancellation Approved'
					when isnull(SQLLOADS.ValuationRequired,0) = 1 and valuer.Completed = 1 and Valuer.Status in ('Submitted','Resubmitted') and valuer_dumaker.Status = 'Completed' then 'VR Approved'					
					when isnull(SQLLOADS.ValuationRequired,0) = 1 and valuer.Completed = 0 and Valuer_lowerOMV.Status = 'LowerOMV' and Valuer_lowerOMV.arn is not null then 'LowerOMV Approved'
					when isnull(SQLLOADS.ValuationRequired,0) = 1 and valuer.Completed = 1 and Valuer.Status = 'LowerOMV' then 'LowerOMV Submitted'					
					when isnull(SQLLOADS.ValuationRequired,0) = 1 and valuer.Completed = 1 and valuer.status = 'Cancelled' then 'Cancellation Submitted'
					when isnull(SQLLOADS.ValuationRequired,0) = 1 and valuer.Completed = 1 and Valuer.Status in ('Submitted','Resubmitted')  then 'VR Submitted'										
					else 'New'
				end as [VRStatus],
				SQLLOADS.ValuationRequired,
				case when isnull(SQLLOADS.ValuationRequired,0) = 1 and valuer.Completed = 1 and valuer.status = 'Cancelled' then FORMAT (valuer.UpdatedDate, 'dd/MM/yyyy') else null end as [VRCancellationSubmissionDate],
				case when isnull(SQLLOADS.ValuationRequired,0) = 1 and valuer.Completed = 1 and valuer.status = 'Cancelled' and valuer_dumaker.Status = 'Completed' then FORMAT (valuer_dumaker.UpdatedDate, 'dd/MM/yyyy') else null end as [VRCancellationApprovalDate],
				case when isnull(SQLLOADS.ValuationRequired,0) = 1 and valuer.Completed = 1 and valuer.status = 'Cancelled' and valuer_dumaker.Status = 'Completed' then valuer_dumaker.DUMakerEmail else null end as [VRCancellationApprovalMaker]			,	
				case when isnull(SQLLOADS.ValuationRequired,0) = 1 and valuer.Completed = 1 and Valuer.Status = 'LowerOMV' then FORMAT (valuer.UpdatedDate, 'dd/MM/yyyy') when isnull(SQLLOADS.ValuationRequired,0) = 1 and valuer.Completed = 0 and Valuer_lowerOMV.Status = 'LowerOMV' and Valuer_lowerOMV.arn is not null then FORMAT (Valuer_lowerOMV.ValuerUpdatedDate, 'dd/MM/yyyy') else null end as [VRLowerOMVSubmissionDate],
				case when isnull(SQLLOADS.ValuationRequired,0) = 1 and valuer.Completed = 0 and Valuer_lowerOMV.Status = 'LowerOMV' and Valuer_lowerOMV.arn is not null then FORMAT (Valuer_lowerOMV.UpdatedDate, 'dd/MM/yyyy') else null end as [VRLowerOMVApprovalDate],
				case when isnull(SQLLOADS.ValuationRequired,0) = 1 and valuer.Completed = 0 and Valuer_lowerOMV.Status = 'LowerOMV' and Valuer_lowerOMV.arn is not null then Valuer_lowerOMV.DUMakerEmail else null end as [VRLowerOMVApprovalMaker],
				sqlloads.SolicitorName, 
				sqlloads.ValuerName, 
				case when solicitor.Completed =1 and solicitor.Status in ('Submitted','Resubmitted') then solicitor.SolicitorReferenceNumber else null end as [DocumentatationSolicitorReferenceNumber],
				--case when solicitor.Completed =1 and solicitor.Status in ('Submitted','Resubmitted') then solicitor.ExecutionDateByCustomer else null end as [DocumentatationExecutionDateByCustomer],
				--case when solicitor.Completed =1 and solicitor.Status in ('Submitted','Resubmitted') then solicitor.SNPCompletionDate else null end as [DocumentatationSNPCompletionDate],
				--case when solicitor.Completed =1 and solicitor.Status in ('Submitted','Resubmitted') then solicitor.SNPExtendedCompletionDate else null end as [DocumentatationSNPExtendedCompletionDate],

				--20210426 format date fixes
				case when solicitor.Completed =1 and solicitor.Status in ('Submitted','Resubmitted') then FORMAT(solicitor.ExecutionDateByCustomer, 'dd/MM/yyyy') else null end as [DocumentatationExecutionDateByCustomer],
				case when solicitor.Completed =1 and solicitor.Status in ('Submitted','Resubmitted') then FORMAT(solicitor.SNPCompletionDate, 'dd/MM/yyyy') else null end as [DocumentatationSNPCompletionDate],
				case when solicitor.Completed =1 and solicitor.Status in ('Submitted','Resubmitted') then FORMAT(solicitor.SNPExtendedCompletionDate, 'dd/MM/yyyy') else null end as [DocumentatationSNPExtendedCompletionDate],

				case when solicitor.Completed =1 and solicitor.Status in ('Submitted','Resubmitted') then FORMAT(solicitor.DeveloperBillingDueDate, 'dd/MM/yyyy') else null end as [DocumentatationDeveloperBillingDueDate],				
				case when solicitor.Completed =1 and solicitor.Status in ('Submitted','Resubmitted')  and sol_dumaker.Status = 'Completed' then format(sol_dumaker.HardCopyReceivedDate ,'dd/MM/yyyy') else null end as [DocumentatationHardCopyReceivedDate],
				case when isnull(SQLLOADS.ValuationRequired,0) = 1 and valuer.Completed = 1 and Valuer.Status in ('Submitted','Resubmitted') then valuer.ValuerReference else null end as [VRValuerReferenceNumber],
				case when isnull(SQLLOADS.ValuationRequired,0) = 1 and valuer.Completed = 1 and Valuer.Status in ('Submitted','Resubmitted') then valuer.MarketValue else null end as [VRMarketValue],
				case when isnull(SQLLOADS.ValuationRequired,0) = 1 and valuer.Completed = 1 and Valuer.Status in ('Submitted','Resubmitted') then valuer.FireInsuranceValue else null end as [VRFireInsuranceValue],
				case when isnull(SQLLOADS.ValuationRequired,0) = 1 and valuer.Completed = 1 and Valuer.Status = 'LowerOMV' then valuer.VLowerOMVStatus when isnull(SQLLOADS.ValuationRequired,0) = 1 and valuer.Completed = 0 and Valuer_lowerOMV.Status = 'LowerOMV' and Valuer_lowerOMV.arn is not null then Valuer_lowerOMV.VLowerOMVStatus else null end as [VRLowerOMVLowerOMVReasons],
				case when isnull(SQLLOADS.ValuationRequired,0) = 1 and valuer.Completed = 1 and Valuer.Status = 'LowerOMV' then valuer.VLowerOMVReasons when isnull(SQLLOADS.ValuationRequired,0) = 1 and valuer.Completed = 0 and Valuer_lowerOMV.Status = 'LowerOMV' and Valuer_lowerOMV.arn is not null then Valuer_lowerOMV.VLowerOMVReasons else null end as [VRLowerOMVLowerOMVReasonsRemarks],
				DUMakerinstance.TaskOwner as [CurrentDocumentMaker],
				VRMakerinstance.TaskOwner as [CurrentVRMaker]	,
				case when isnull(SQLLOADS.ValuationRequired,0) = 1 and valuer.Completed = 1 and valuer.status = 'Cancelled' and valuer_dumaker.Status = 'Completed' then DATEDIFF(day, valuer.UpdatedDate, valuer_dumaker.UpdatedDate) 
					when isnull(SQLLOADS.ValuationRequired,0) = 1 and valuer.Completed = 1 and valuer.status = 'Cancelled'  then DATEDIFF(day, valuer.UpdatedDate, getdate()) 					
					else null end as [VRCancellationAgeing], 
				case when isnull(SQLLOADS.ValuationRequired,0) = 1 and valuer.Completed = 1 and Valuer.Status in ('Submitted','Resubmitted') and valuer_dumaker.Status = 'Completed' then DATEDIFF(day, valuer.UpdatedDate, valuer_dumaker.UpdatedDate) 
					when isnull(SQLLOADS.ValuationRequired,0) = 1 and valuer.Completed = 1 and Valuer.Status in ('Submitted','Resubmitted')  then DATEDIFF(day, valuer.UpdatedDate, getdate()) 					
					else null end as [VRSubmissionAgeing],
				case when isnull(SQLLOADS.ValuationRequired,0) = 1 and valuer.Completed = 0 and Valuer_lowerOMV.Status = 'LowerOMV' and Valuer_lowerOMV.arn is not null then DATEDIFF(day, Valuer_lowerOMV.ValuerUpdatedDate, Valuer_lowerOMV.UpdatedDate) 
					when isnull(SQLLOADS.ValuationRequired,0) = 1 and valuer.Completed = 1 and Valuer.Status = 'LowerOMV'  then DATEDIFF(day, valuer.UpdatedDate, getdate()) 					
					else null end as [VRLowerOMVAgeing],
				case when solicitor.Completed =1 and solicitor.Status = 'Cancelled'	and sol_dumaker.Status = 'Completed' then DATEDIFF(day, solicitor.UpdatedDate, sol_dumaker.UpdatedDate) 
					when solicitor.Completed =1 and solicitor.Status = 'Cancelled'  then DATEDIFF(day, solicitor.UpdatedDate, getdate()) 					
					else null end as [DocumentationCancellationAgeing], 
				case when solicitor.Completed =1 and solicitor.Status in ('Submitted','Resubmitted')  and sol_dumaker.Status = 'Completed' then DATEDIFF(day, solicitor.UpdatedDate, sol_dumaker.UpdatedDate) 
					when solicitor.Completed =0 and Sol_Rejected.Status in ('Submitted','Resubmitted') and Sol_Rejected.arn is not null  then DATEDIFF(day, Sol_Rejected.SolicitorUpdatedDate, Sol_Rejected.UpdatedDate) 					
					when solicitor.Completed =1 and solicitor.Status in ('Submitted','Resubmitted') then DATEDIFF(day, solicitor.UpdatedDate, getdate()) 
					else null end as [DocumentationSubmissionnAgeing],
				s_updateInfo.SStatus as [SolicitorUpdateStatusOption],
				s_updateInfo.SStatusOthers as [SolicitorUpdateStatusRemarks],			
				FORMAT (s_updateInfo.UpdatedDate, 'dd/MM/yyyy') as [SolicitorUpdateStatusDate],
				v_updateInfo.VUpdateInfoStatus as [ValuerUpdateStatusOption],
				v_updateInfo.VUpdateInfoStatusOthers as [ValuerUpdateStatusRemarks],
				FORMAT (v_updateInfo.UpdatedDate, 'dd/MM/yyyy') as [ValuerUpdateStatusDate]
				from SQLLOADS
					LEFT JOIN vw_SQLSolicitorDPSubmission solicitor on solicitor.arn = SQLLOADS.arn 
					left join SQLDUMakerDP_SolicitorSubmission sol_dumaker on sol_dumaker.arn = SQLLOADS.arn 
					--left JOIN [dbo].[SQLSolicitorDPSubmission_updateinfo] Sol_UI on Sol_UI.arn = SQLLOADS.arn
					left JOIN SQLDUMakerDP_SolicitorSubmission_Rejected Sol_Rejected on Sol_Rejected.arn = SQLLOADS.arn	
					LEFT JOIN vw_SQLValuerDPSubmission valuer on valuer.arn = SQLLOADS.arn 
					left join SQLDUMakerDP_ValuerSubmission valuer_dumaker on valuer_dumaker.arn = SQLLOADS.arn 
					left JOIN [dbo].SQLDUMakerDP_ValuerSubmission_LoweredOMV Valuer_lowerOMV on Valuer_lowerOMV.arn = SQLLOADS.arn		
					left join [MortgageAppTaskInstance] DUMakerinstance on DUMakerinstance.arn = sqlloads.arn and DUMakerinstance.workflow = 'DPDUMakerSolicitorApproval'
					left join [MortgageAppTaskInstance] VRMakerinstance on VRMakerinstance.arn = sqlloads.arn and VRMakerinstance.workflow = 'DPDUMakerValuerApproval'
					left join SQLValuerDPSubmission_UpdateInfo v_updateInfo on v_updateInfo.arn = sqlloads.arn 
					left join SQLSolicitorDPSubmission_UpdateInfo s_updateInfo on s_updateInfo.arn = sqlloads.arn 
				where 
					solicitor.UpdatedDate between @DateFrom and @DateTo	
					and isnull(MortgateCenterCode,'') like case when @MortgageCentreFlag = 1 then @MortgageCentre else '%' end 
					and isnull(SQLLOADS.SolicitorCode,'') like case when @SolCodeFlag = 1 then @SolCode else '%' end 
					and isnull(SQLLOADS.ValuerCode,'') like case when @ValCodeFlag = 1 then @ValCode else '%' end 	
					and solicitor.Completed =1 and solicitor.Status in ('Submitted','Resubmitted')
				
				union
				-- rejected case 
				select MortgateCenterCode, SQLLOADS.arn as [CreditApplicationNumber], CollateralPurpose, DisbursementManner, ApplicantName, SQLLOADS.SolicitorCode, SQLLOADS.ValuerCode, TotalFinancingAmount,
				FORMAT (SQLLOADS.[DateOfLOAcceptance], 'dd/MM/yyyy') as [DateOfLOAcceptance],
				case when solicitor.Completed =1 and solicitor.Status in ('Submitted','Resubmitted') then FORMAT (solicitor.UpdatedDate, 'dd/MM/yyyy') when solicitor.Completed =0 and Sol_Rejected.Status in ('Submitted','Resubmitted') and Sol_Rejected.arn is not null then FORMAT (Sol_Rejected.SolicitorUpdatedDate, 'dd/MM/yyyy') else null end as [DocumentationSubmissionDate],					
				case when solicitor.Completed =1 and solicitor.Status in ('Submitted','Resubmitted')  and sol_dumaker.Status = 'Completed' then FORMAT (sol_dumaker.UpdatedDate, 'dd/MM/yyyy') else null end as [DocumentationApprovalDate],
				case when solicitor.Completed =1 and solicitor.Status in ('Submitted','Resubmitted')  and sol_dumaker.Status = 'Completed' then sol_dumaker.DUMakerEmail else null end as [DocumentationApprovalMaker],
				case when solicitor.Completed =0 and Sol_Rejected.Status in ('Submitted','Resubmitted') and Sol_Rejected.arn is not null then FORMAT (Sol_Rejected.UpdatedDate, 'dd/MM/yyyy') else null end as [DocumentationRejectionDate],					
				case when solicitor.Completed =0 and Sol_Rejected.Status in ('Submitted','Resubmitted') and Sol_Rejected.arn is not null then Sol_Rejected.DUMakerEmail else null end as [DocumentationRejectionMaker],			
				case when solicitor.Completed =1 and solicitor.Status = 'Cancelled' then FORMAT (solicitor.UpdatedDate, 'dd/MM/yyyy') else null end as [DocumentationCancellationSubmissionDate],
				case when solicitor.Completed =1 and solicitor.Status = 'Cancelled'	and sol_dumaker.Status = 'Completed' then FORMAT (sol_dumaker.UpdatedDate, 'dd/MM/yyyy') else null end as [DocumentationCancellationApprovalDate],
				case when solicitor.Completed =1 and solicitor.Status = 'Cancelled'	and sol_dumaker.Status = 'Completed' then sol_dumaker.DUMakerEmail else null end as [DocumentationCancellationApprovalMaker],
				case when isnull(SQLLOADS.ValuationRequired,0) = 1 and valuer.Completed = 1 and Valuer.Status in ('Submitted','Resubmitted') then FORMAT (valuer.UpdatedDate, 'dd/MM/yyyy') else null end as [VRSubmissionDate],
				case when isnull(SQLLOADS.ValuationRequired,0) = 1 and valuer.Completed = 1 and Valuer.Status in ('Submitted','Resubmitted') and valuer_dumaker.Status = 'Completed' then FORMAT (valuer_dumaker.UpdatedDate, 'dd/MM/yyyy') else null end as [VRApprovalDate],
				case when isnull(SQLLOADS.ValuationRequired,0) = 1 and valuer.Completed = 1 and Valuer.Status in ('Submitted','Resubmitted') and valuer_dumaker.Status = 'Completed' then valuer_dumaker.DUMakerEmail else null end as [VRApprovalMaker],
				case 					
					when solicitor.Completed =1 and solicitor.Status in ('Submitted','Resubmitted')  and sol_dumaker.Status = 'Completed' then 'Documentation Approved' 
					when solicitor.Completed =1 and solicitor.Status = 'Cancelled'					and sol_dumaker.Status = 'Completed' then 'Cancellation Approved' 										
					when solicitor.Completed =1 and solicitor.Status = 'Cancelled'														then 'Cancellation Submitted' 						
					--when solicitor.Completed =1 and solicitor.Status in ('Submitted','Resubmitted') and Sol_Rejected.arn is not null  then 'Documentation Submitted' 	
					when solicitor.Completed =0 and Sol_Rejected.Status in ('Submitted','Resubmitted') and Sol_Rejected.arn is not null  then 'Documentation Rejected' 
					--when solicitor.Completed =0 and Sol_Rejected.Status = 'Cancelled'					and Sol_Rejected.arn is not null then 'Cancellation Rejected' 
					when solicitor.Completed =1 and solicitor.Status in ('Submitted','Resubmitted') then 'Documentation Submitted' 																						
					else 'New' 
				end as [DocumentationStatus],
				case 
					when isnull(SQLLOADS.ValuationRequired,0) = 0 then 'N/A'
					when isnull(SQLLOADS.ValuationRequired,0) = 1 and valuer.Completed = 1 and valuer.status = 'Cancelled' and valuer_dumaker.Status = 'Completed'  then 'Cancellation Approved'
					when isnull(SQLLOADS.ValuationRequired,0) = 1 and valuer.Completed = 1 and Valuer.Status in ('Submitted','Resubmitted') and valuer_dumaker.Status = 'Completed' then 'VR Approved'					
					when isnull(SQLLOADS.ValuationRequired,0) = 1 and valuer.Completed = 0 and Valuer_lowerOMV.Status = 'LowerOMV' and Valuer_lowerOMV.arn is not null then 'LowerOMV Approved'
					when isnull(SQLLOADS.ValuationRequired,0) = 1 and valuer.Completed = 1 and Valuer.Status = 'LowerOMV' then 'LowerOMV Submitted'					
					when isnull(SQLLOADS.ValuationRequired,0) = 1 and valuer.Completed = 1 and valuer.status = 'Cancelled' then 'Cancellation Submitted'
					when isnull(SQLLOADS.ValuationRequired,0) = 1 and valuer.Completed = 1 and Valuer.Status in ('Submitted','Resubmitted')  then 'VR Submitted'										
					else 'New'
				end as [VRStatus],
				SQLLOADS.ValuationRequired,
				case when isnull(SQLLOADS.ValuationRequired,0) = 1 and valuer.Completed = 1 and valuer.status = 'Cancelled' then FORMAT (valuer.UpdatedDate, 'dd/MM/yyyy') else null end as [VRCancellationSubmissionDate],
				case when isnull(SQLLOADS.ValuationRequired,0) = 1 and valuer.Completed = 1 and valuer.status = 'Cancelled' and valuer_dumaker.Status = 'Completed' then FORMAT (valuer_dumaker.UpdatedDate, 'dd/MM/yyyy') else null end as [VRCancellationApprovalDate],
				case when isnull(SQLLOADS.ValuationRequired,0) = 1 and valuer.Completed = 1 and valuer.status = 'Cancelled' and valuer_dumaker.Status = 'Completed' then valuer_dumaker.DUMakerEmail else null end as [VRCancellationApprovalMaker]			,	
				case when isnull(SQLLOADS.ValuationRequired,0) = 1 and valuer.Completed = 1 and Valuer.Status = 'LowerOMV' then FORMAT (valuer.UpdatedDate, 'dd/MM/yyyy') when isnull(SQLLOADS.ValuationRequired,0) = 1 and valuer.Completed = 0 and Valuer_lowerOMV.Status = 'LowerOMV' and Valuer_lowerOMV.arn is not null then FORMAT (Valuer_lowerOMV.ValuerUpdatedDate, 'dd/MM/yyyy') else null end as [VRLowerOMVSubmissionDate],
				case when isnull(SQLLOADS.ValuationRequired,0) = 1 and valuer.Completed = 0 and Valuer_lowerOMV.Status = 'LowerOMV' and Valuer_lowerOMV.arn is not null then FORMAT (Valuer_lowerOMV.UpdatedDate, 'dd/MM/yyyy') else null end as [VRLowerOMVApprovalDate],
				case when isnull(SQLLOADS.ValuationRequired,0) = 1 and valuer.Completed = 0 and Valuer_lowerOMV.Status = 'LowerOMV' and Valuer_lowerOMV.arn is not null then Valuer_lowerOMV.DUMakerEmail else null end as [VRLowerOMVApprovalMaker],
				sqlloads.SolicitorName, 
				sqlloads.ValuerName, 
				case when solicitor.Completed =1 and solicitor.Status in ('Submitted','Resubmitted') then solicitor.SolicitorReferenceNumber else null end as [DocumentatationSolicitorReferenceNumber],
				--case when solicitor.Completed =1 and solicitor.Status in ('Submitted','Resubmitted') then solicitor.ExecutionDateByCustomer else null end as [DocumentatationExecutionDateByCustomer],
				--case when solicitor.Completed =1 and solicitor.Status in ('Submitted','Resubmitted') then solicitor.SNPCompletionDate else null end as [DocumentatationSNPCompletionDate],
				--case when solicitor.Completed =1 and solicitor.Status in ('Submitted','Resubmitted') then solicitor.SNPExtendedCompletionDate else null end as [DocumentatationSNPExtendedCompletionDate],

				--20210426 format date fixes
				case when solicitor.Completed =1 and solicitor.Status in ('Submitted','Resubmitted') then FORMAT(solicitor.ExecutionDateByCustomer, 'dd/MM/yyyy') else null end as [DocumentatationExecutionDateByCustomer],
				case when solicitor.Completed =1 and solicitor.Status in ('Submitted','Resubmitted') then FORMAT(solicitor.SNPCompletionDate, 'dd/MM/yyyy') else null end as [DocumentatationSNPCompletionDate],
				case when solicitor.Completed =1 and solicitor.Status in ('Submitted','Resubmitted') then FORMAT(solicitor.SNPExtendedCompletionDate, 'dd/MM/yyyy') else null end as [DocumentatationSNPExtendedCompletionDate],

				case when solicitor.Completed =1 and solicitor.Status in ('Submitted','Resubmitted') then FORMAT(solicitor.DeveloperBillingDueDate, 'dd/MM/yyyy') else null end as [DocumentatationDeveloperBillingDueDate],				
				case when solicitor.Completed =1 and solicitor.Status in ('Submitted','Resubmitted')  and sol_dumaker.Status = 'Completed' then format(sol_dumaker.HardCopyReceivedDate ,'dd/MM/yyyy') else null end as [DocumentatationHardCopyReceivedDate],
				case when isnull(SQLLOADS.ValuationRequired,0) = 1 and valuer.Completed = 1 and Valuer.Status in ('Submitted','Resubmitted') then valuer.ValuerReference else null end as [VRValuerReferenceNumber],
				case when isnull(SQLLOADS.ValuationRequired,0) = 1 and valuer.Completed = 1 and Valuer.Status in ('Submitted','Resubmitted') then valuer.MarketValue else null end as [VRMarketValue],
				case when isnull(SQLLOADS.ValuationRequired,0) = 1 and valuer.Completed = 1 and Valuer.Status in ('Submitted','Resubmitted') then valuer.FireInsuranceValue else null end as [VRFireInsuranceValue],
				case when isnull(SQLLOADS.ValuationRequired,0) = 1 and valuer.Completed = 1 and Valuer.Status = 'LowerOMV' then valuer.VLowerOMVStatus when isnull(SQLLOADS.ValuationRequired,0) = 1 and valuer.Completed = 0 and Valuer_lowerOMV.Status = 'LowerOMV' and Valuer_lowerOMV.arn is not null then Valuer_lowerOMV.VLowerOMVStatus else null end as [VRLowerOMVLowerOMVReasons],
				case when isnull(SQLLOADS.ValuationRequired,0) = 1 and valuer.Completed = 1 and Valuer.Status = 'LowerOMV' then valuer.VLowerOMVReasons when isnull(SQLLOADS.ValuationRequired,0) = 1 and valuer.Completed = 0 and Valuer_lowerOMV.Status = 'LowerOMV' and Valuer_lowerOMV.arn is not null then Valuer_lowerOMV.VLowerOMVReasons else null end as [VRLowerOMVLowerOMVReasonsRemarks],
				DUMakerinstance.TaskOwner as [CurrentDocumentMaker],
				VRMakerinstance.TaskOwner as [CurrentVRMaker]	,
				case when isnull(SQLLOADS.ValuationRequired,0) = 1 and valuer.Completed = 1 and valuer.status = 'Cancelled' and valuer_dumaker.Status = 'Completed' then DATEDIFF(day, valuer.UpdatedDate, valuer_dumaker.UpdatedDate) 
					when isnull(SQLLOADS.ValuationRequired,0) = 1 and valuer.Completed = 1 and valuer.status = 'Cancelled'  then DATEDIFF(day, valuer.UpdatedDate, getdate()) 					
					else null end as [VRCancellationAgeing], 
				case when isnull(SQLLOADS.ValuationRequired,0) = 1 and valuer.Completed = 1 and Valuer.Status in ('Submitted','Resubmitted') and valuer_dumaker.Status = 'Completed' then DATEDIFF(day, valuer.UpdatedDate, valuer_dumaker.UpdatedDate) 
					when isnull(SQLLOADS.ValuationRequired,0) = 1 and valuer.Completed = 1 and Valuer.Status in ('Submitted','Resubmitted')  then DATEDIFF(day, valuer.UpdatedDate, getdate()) 					
					else null end as [VRSubmissionAgeing],
				case when isnull(SQLLOADS.ValuationRequired,0) = 1 and valuer.Completed = 0 and Valuer_lowerOMV.Status = 'LowerOMV' and Valuer_lowerOMV.arn is not null then DATEDIFF(day, Valuer_lowerOMV.ValuerUpdatedDate, Valuer_lowerOMV.UpdatedDate) 
					when isnull(SQLLOADS.ValuationRequired,0) = 1 and valuer.Completed = 1 and Valuer.Status = 'LowerOMV'  then DATEDIFF(day, valuer.UpdatedDate, getdate()) 					
					else null end as [VRLowerOMVAgeing],
				case when solicitor.Completed =1 and solicitor.Status = 'Cancelled'	and sol_dumaker.Status = 'Completed' then DATEDIFF(day, solicitor.UpdatedDate, sol_dumaker.UpdatedDate) 
					when solicitor.Completed =1 and solicitor.Status = 'Cancelled'  then DATEDIFF(day, solicitor.UpdatedDate, getdate()) 					
					else null end as [DocumentationCancellationAgeing], 
				case when solicitor.Completed =1 and solicitor.Status in ('Submitted','Resubmitted')  and sol_dumaker.Status = 'Completed' then DATEDIFF(day, solicitor.UpdatedDate, sol_dumaker.UpdatedDate) 
					when solicitor.Completed =0 and Sol_Rejected.Status in ('Submitted','Resubmitted') and Sol_Rejected.arn is not null  then DATEDIFF(day, Sol_Rejected.SolicitorUpdatedDate, Sol_Rejected.UpdatedDate) 					
					when solicitor.Completed =1 and solicitor.Status in ('Submitted','Resubmitted') then DATEDIFF(day, solicitor.UpdatedDate, getdate()) 
					else null end as [DocumentationSubmissionnAgeing],
				s_updateInfo.SStatus as [SolicitorUpdateStatusOption],
				s_updateInfo.SStatusOthers as [SolicitorUpdateStatusRemarks],			
				FORMAT (s_updateInfo.UpdatedDate, 'dd/MM/yyyy') as [SolicitorUpdateStatusDate],
				v_updateInfo.VUpdateInfoStatus as [ValuerUpdateStatusOption],
				v_updateInfo.VUpdateInfoStatusOthers as [ValuerUpdateStatusRemarks],
				FORMAT (v_updateInfo.UpdatedDate, 'dd/MM/yyyy') as [ValuerUpdateStatusDate]
				from SQLLOADS
					LEFT JOIN vw_SQLSolicitorDPSubmission solicitor on solicitor.arn = SQLLOADS.arn 
					left join SQLDUMakerDP_SolicitorSubmission sol_dumaker on sol_dumaker.arn = SQLLOADS.arn 
					--left JOIN [dbo].[SQLSolicitorDPSubmission_updateinfo] Sol_UI on Sol_UI.arn = SQLLOADS.arn
					left JOIN SQLDUMakerDP_SolicitorSubmission_Rejected Sol_Rejected on Sol_Rejected.arn = SQLLOADS.arn	
					LEFT JOIN vw_SQLValuerDPSubmission valuer on valuer.arn = SQLLOADS.arn 
					left join SQLDUMakerDP_ValuerSubmission valuer_dumaker on valuer_dumaker.arn = SQLLOADS.arn 
					left JOIN [dbo].SQLDUMakerDP_ValuerSubmission_LoweredOMV Valuer_lowerOMV on Valuer_lowerOMV.arn = SQLLOADS.arn	
					left join [MortgageAppTaskInstance] DUMakerinstance on DUMakerinstance.arn = sqlloads.arn and DUMakerinstance.workflow = 'DPDUMakerSolicitorApproval'
					left join [MortgageAppTaskInstance] VRMakerinstance on VRMakerinstance.arn = sqlloads.arn and VRMakerinstance.workflow = 'DPDUMakerValuerApproval'
					left join SQLValuerDPSubmission_UpdateInfo v_updateInfo on v_updateInfo.arn = sqlloads.arn 
					left join SQLSolicitorDPSubmission_UpdateInfo s_updateInfo on s_updateInfo.arn = sqlloads.arn 
				where 
					Sol_Rejected.SolicitorUpdatedDate between @DateFrom and @DateTo	
					and isnull(MortgateCenterCode,'') like case when @MortgageCentreFlag = 1 then @MortgageCentre else '%' end 
					and isnull(SQLLOADS.SolicitorCode,'') like case when @SolCodeFlag = 1 then @SolCode else '%' end 
					and isnull(SQLLOADS.ValuerCode,'') like case when @ValCodeFlag = 1 then @ValCode else '%' end 	
					--and solicitor.Completed =1 and solicitor.Status in ('Submitted','Resubmitted')
					and solicitor.Completed =0 and Sol_Rejected.Status in ('Submitted','Resubmitted') and Sol_Rejected.arn is not null
				
				)
				insert into aaMortgageReport_AcceptanceSubmitted
				(
					MortgateCenterCode, 
					CreditApplicationNumber, 
					CollateralPurpose, 
					DisbursementManner, 
					ApplicantName, 
					SolicitorCode, 
					ValuerCode, 
					TotalFinancingAmount,
					[DateOfLOAcceptance],
					[DocumentationSubmissionDate],
					[DocumentationApprovalDate],
					[DocumentationApprovalMaker], 
					[DocumentationRejectionDate], 
					[DocumentationRejectionMaker], 
					[DocumentationCancellationSubmissionDate], 
					[DocumentationCancellationApprovalDate], 
					[VRSubmissionDate],
					[VRApprovalDate],
					[VRApprovalMaker],
					[DocumentationStatus], 
					[VRStatus],
					[DocumentationCancellationApprovalMaker] ,
					ValuationRequired,
					[VRCancellationSubmissionDate],[VRCancellationApprovalDate],[VRCancellationApprovalMaker]
					, [VRLowerOMVSubmissionDate], [VRLowerOMVApprovalDate], [VRLowerOMVApprovalMaker],
					SolicitorName,ValuerName,[DocumentatationSolicitorReferenceNumber],[DocumentatationExecutionDateByCustomer],[DocumentatationSNPCompletionDate],[DocumentatationSNPExtendedCompletionDate],[DocumentatationDeveloperBillingDueDate],
					[DocumentatationHardCopyReceivedDate], [VRValuerReferenceNumber], [VRMarketValue], [VRFireInsuranceValue], [VRLowerOMVLowerOMVReasons], [VRLowerOMVLowerOMVReasonsRemarks], [CurrentDocumentMaker], [CurrentVRMaker],
					[VRCancellationAgeing], [VRSubmissionAgeing], [VRLowerOMVAgeing],[DocumentationCancellationAgeing],[DocumentationSubmissionnAgeing],
					[SolicitorUpdateStatusOption], [SolicitorUpdateStatusRemarks], [SolicitorUpdateStatusDate], [ValuerUpdateStatusOption],[ValuerUpdateStatusRemarks],[ValuerUpdateStatusDate]
				)
				select 
					MortgateCenterCode, 
					CreditApplicationNumber, 
					CollateralPurpose, 
					DisbursementManner, 
					ApplicantName, 
					SolicitorCode, 
					ValuerCode, 
					TotalFinancingAmount,
					[DateOfLOAcceptance],
					[DocumentationSubmissionDate],
					[DocumentationApprovalDate],
					[DocumentationApprovalMaker], 
					[DocumentationRejectionDate], 
					[DocumentationRejectionMaker], 
					[DocumentationCancellationSubmissionDate], 
					[DocumentationCancellationApprovalDate], 
					[VRSubmissionDate],
					[VRApprovalDate],
					[VRApprovalMaker],
					[DocumentationStatus], 
					[VRStatus],
					[DocumentationCancellationApprovalMaker] ,
					ValuationRequired,
					[VRCancellationSubmissionDate],[VRCancellationApprovalDate],[VRCancellationApprovalMaker]
					, [VRLowerOMVSubmissionDate], [VRLowerOMVApprovalDate], [VRLowerOMVApprovalMaker],
					SolicitorName,ValuerName,[DocumentatationSolicitorReferenceNumber],[DocumentatationExecutionDateByCustomer],[DocumentatationSNPCompletionDate],[DocumentatationSNPExtendedCompletionDate],[DocumentatationDeveloperBillingDueDate],
					[DocumentatationHardCopyReceivedDate], [VRValuerReferenceNumber], [VRMarketValue], [VRFireInsuranceValue], [VRLowerOMVLowerOMVReasons], [VRLowerOMVLowerOMVReasonsRemarks], [CurrentDocumentMaker], [CurrentVRMaker],
					[VRCancellationAgeing], [VRSubmissionAgeing], [VRLowerOMVAgeing],[DocumentationCancellationAgeing],[DocumentationSubmissionnAgeing] ,
					[SolicitorUpdateStatusOption], [SolicitorUpdateStatusRemarks], [SolicitorUpdateStatusDate], [ValuerUpdateStatusOption],[ValuerUpdateStatusRemarks],[ValuerUpdateStatusDate]
				from cte 
				where cte.VRStatus like case when @VRStatusFlag = 1 then @VRStatus else '%' end 
					and cte.DOcumentationStatus like case when @DocStatusFlag = 1 then @DocStatus else '%' end 
				order by [DocumentationSubmissionDate] asc	

			
		end 

		select 
			MortgateCenterCode, 
			CreditApplicationNumber, 
			CollateralPurpose, 
			DisbursementManner, 
			--ApplicantName, 
			SolicitorCode, 
			SolicitorName,			
			TotalFinancingAmount,
			[DateOfLOAcceptance],	
			case when (isnull(ValuationRequired,0) = 0) then 'N' else 'Y' end as ValuationRequired,
			[DocumentationStatus], 			
			[DocumentationSubmissionDate],			
			[DocumentatationSolicitorReferenceNumber] as [Solicitor Reference Number],			
			[DocumentatationExecutionDateByCustomer] as [Execution Date By Customer],
			[DocumentatationSNPCompletionDate] as [SNP Completion Date],
			[DocumentatationSNPExtendedCompletionDate] as [SNP Extended Completion Date],
			[DocumentatationDeveloperBillingDueDate] as [Developer Billing Due Date],	
			[CurrentDocumentMaker],
			[DocumentationApprovalDate],
			[DocumentationApprovalMaker], 						
			[DocumentatationHardCopyReceivedDate] as [Documentation Hard Copy Received Date],
			[DocumentationRejectionDate], 
			[DocumentationRejectionMaker], 
			[DocumentationSubmissionnAgeing] as [DocumentationSubmissionAgeing],
			[DocumentationCancellationSubmissionDate], 
			[DocumentationCancellationApprovalDate], 
			[DocumentationCancellationApprovalMaker], 				
			[DocumentationCancellationAgeing],
			[SolicitorUpdateStatusOption], 
			[SolicitorUpdateStatusRemarks], 
			[SolicitorUpdateStatusDate],
			ValuerCode, 
			ValuerName,
			[VRStatus],			
			[VRSubmissionDate],
			[VRValuerReferenceNumber],
			[VRMarketValue],
			[VRFireInsuranceValue],
			[CurrentVRMaker],
			[VRApprovalDate],
			[VRApprovalMaker]		,
			[VRSubmissionAgeing],
			[VRCancellationSubmissionDate],
			[VRCancellationApprovalDate],
			[VRCancellationApprovalMaker],
			[VRCancellationAgeing],
			[VRLowerOMVSubmissionDate], 
			[VRLowerOMVLowerOMVReasons], 
			[VRLowerOMVLowerOMVReasonsRemarks], 
			[VRLowerOMVApprovalDate], 
			[VRLowerOMVApprovalMaker],
			[VRLowerOMVAgeing],			 
			 [ValuerUpdateStatusOption],
			 [ValuerUpdateStatusRemarks],
			 [ValuerUpdateStatusDate]
		from aaMortgageReport_AcceptanceSubmitted 

		/*
			with CTE 
			(	[ARN]
				,[Status]
				,[BranchAddr1]
				,[BranchAddr2]
				,[BranchAddr3]
				,[BranchAddrCity]
				,[BranchAddrCountry]
				,[BranchAddrPostCode]
				,[BranchAddrState]
				,[BranchManagerEmailAddress]
				,[BranchManagerName]
				,[ClosingBranch]			  
				,DateOfLOAcceptance
				,[FinancingType]
				,[MortgateCenterCode]
				,[MortgateCenterEmail]
				,[PFSalesEmailAddress]
				,[PFCSalesName]
				,[SolicitorAccountNbr]
				,[SolicitorAccountType]
				,[SolicitorAddr1]
				,[SolicitorAddr2]
				,[SolicitorAddr3]
				,[SolicitorAddrCity]
				,[SolicitorAddrCountry]
				,[SolicitorAddrPostCode]
				,[SolicitorAddrState]
				,[SolicitorEmail]
				,[SolInternalStatus]
				,[SolicitorName]
				,[SolicitorCode]
				,[TopUpLoanIndicator]
				,[ChargorIDNumber]
				,[ChargorName]
				,[CustomerAddr1]
				,[CustomerAddr2]
				,[CustomerAddr3]
				,[CustomerAddrCity]
				,[CustomerAddrCountry]
				,[CustomerAddrPostCode]
				,[CustomerAddrState]
				,[ApplicantEmail]
				,[CustomerID]
				,[ApplicantName]
				,[CustomerName]
				,[EStatementFlagIndicator]
				,[GuarantorIDNumber]
				,[GuarantorName]
				,[DisbursementManner]
				,[LoanAmount]
				,[FacilityAmount1]
				,[FacilityAmount2]
				,[FacilityAmount3]
				,[FacilityAmount4]
				,[FinancingProductName1]
				,[FinancingProductName2]
				,[FinancingProductName3]
				,[FinancingProductName4]
				,[GracePeriod]
				,[LegalFeesFinancedAmount]
				,[MRTAFinancedAmount]
				,[PurposeCode]
				,[TotalFinancingAmount]
				,[ValuationFeesFinancedAmount]
				,[BuildUpArea]
				,[DeveloperCode]
				,[DeveloperName]
				,[CollateralPurpose]
				,[LandArea]
				,[ProjectCode]
				,[ProjectName]
				,[PropertyAddress]
				,[PropertyType]
				,[ValuationRequired]
				,[TitleDetailsLO]
				,[ValuerAccountNBR]
				,[ValuerAccountType]
				,[ValuerAddr1]
				,[ValuerAddr2]
				,[ValuerAddr3]
				,[ValuerAddrCity]
				,[ValuerAddrCountry]
				,[ValuerAddrPostCode]
				,[ValuerAddrState]
				,[ValuerCode]
				,[ValuerEmail]
				,[ValuerName]
				,[VerbalIndicativeValue]
				,[RESPONSECODE]
				,[RESPONSEDESCRIPTION]     			
				,[CreatedDate]
				,[UpdatedDate]						
				,[Aging]
				,[DocumentationStatus]
				,[VRStatus]
			)
			as
			(
			SELECT LOADS.[ARN] as [ARN]
				,LOADS.[Status] as [Status]
				,[BranchAddr1]
				,[BranchAddr2]
				,[BranchAddr3]
				,[BranchAddrCity]
				,[BranchAddrCountry]
				,[BranchAddrPostCode]
				,[BranchAddrState]
				,[BranchManagerEmailAddress]
				,[BranchManagerName]
				,[ClosingBranch]			  
				,FORMAT (DateOfLOAcceptance, 'dd/MM/yyyy') as DateOfLOAcceptance
				,[FinancingType]
				,[MortgateCenterCode]
				,[MortgateCenterEmail]
				,[PFSalesEmailAddress]
				,[PFCSalesName]
				,[SolicitorAccountNbr]
				,[SolicitorAccountType]
				,[SolicitorAddr1]
				,[SolicitorAddr2]
				,[SolicitorAddr3]
				,[SolicitorAddrCity]
				,[SolicitorAddrCountry]
				,[SolicitorAddrPostCode]
				,[SolicitorAddrState]
				,[SolicitorEmail]
				,[SolInternalStatus]
				,[SolicitorName]
				,LOADS.[SolicitorCode] as [SolicitorCode]
				,[TopUpLoanIndicator]
				,[ChargorIDNumber]
				,[ChargorName]
				,[CustomerAddr1]
				,[CustomerAddr2]
				,[CustomerAddr3]
				,[CustomerAddrCity]
				,[CustomerAddrCountry]
				,[CustomerAddrPostCode]
				,[CustomerAddrState]
				,[ApplicantEmail]
				,[CustomerID]
				,[ApplicantName]
				,[CustomerName]
				,[EStatementFlagIndicator]
				,[GuarantorIDNumber]
				,[GuarantorName]
				,[DisbursementManner]
				,[LoanAmount]
				,[FacilityAmount1]
				,[FacilityAmount2]
				,[FacilityAmount3]
				,[FacilityAmount4]
				,[FinancingProductName1]
				,[FinancingProductName2]
				,[FinancingProductName3]
				,[FinancingProductName4]
				,[GracePeriod]
				,[LegalFeesFinancedAmount]
				,[MRTAFinancedAmount]
				,[PurposeCode]
				,[TotalFinancingAmount]
				,[ValuationFeesFinancedAmount]
				,[BuildUpArea]
				,[DeveloperCode]
				,[DeveloperName]
				,[CollateralPurpose]
				,[LandArea]
				,[ProjectCode]
				,[ProjectName]
				,[PropertyAddress]
				,[PropertyType]
				,[ValuationRequired]
				,[TitleDetailsLO]
				,[ValuerAccountNBR]
				,[ValuerAccountType]
				,[ValuerAddr1]
				,[ValuerAddr2]
				,[ValuerAddr3]
				,[ValuerAddrCity]
				,[ValuerAddrCountry]
				,[ValuerAddrPostCode]
				,[ValuerAddrState]
				,LOADS.[ValuerCode] as [ValuerCode]
				,[ValuerEmail]
				,[ValuerName]
				,[VerbalIndicativeValue]
				,[RESPONSECODE]
				,[RESPONSEDESCRIPTION]     			
				,FORMAT (LOADS.[CreatedDate], 'dd/MM/yyyy') as [CreatedDate]
				,FORMAT (LOADS.[UpdatedDate], 'dd/MM/yyyy') as [UpdatedDate]			  
				, DATEDIFF(day, valuer.UpdatedDate, getdate()) as [Aging]
				, case 
					when Sol_UI.arn is not null then 'UpdateInfo' 
					when solicitor.Completed =1 and solicitor.Status = 'Cancelled' then 'Cancelled' 						
					when Sol_Rejected.arn is not null and solicitor.Completed = 1 then 'Resubmitted' 
					when Sol_Rejected.arn is not null and solicitor.Completed = 0 then 'Rejected' 
					when solicitor.Completed =1 and solicitor.Status = 'Submitted' then 'Submitted' 																													
					else 'New' 
				end as [DocumentationStatus]
				,case 
					when valuer_ui.arn is not null then 'UpdateInfo'
					when valuer.Completed = 1 and valuer.status = 'Cancelled' then 'Cancelled'
					when valuer.Completed = 1 and Valuer_lowerOMV.arn is not null and valuer.Completed = 1 then 'Resubmitted'
					when valuer.Completed = 1 and Valuer.Status = 'LowerOMV' then 'LowerOMV'
					when valuer.Completed = 1 and Valuer.Status = 'Submitted' then 'Submitted'
					else 'New'
				end as [VRStatus]
			FROM [dbo].[SQLLOADS] LOADS
				LEFT JOIN [dbo].vw_SQLValuerDPSubmission valuer on valuer.arn = LOADS.arn 
				left JOIN [dbo].[SQLValuerDPSubmission_updateinfo] valuer_ui on valuer_ui.arn = LOADS.arn
				left join SQLDUMakerDP_ValuerSubmission dumaker on dumaker.arn = valuer.arn 
				left JOIN [dbo].SQLDUMakerDP_ValuerSubmission_LoweredOMV Valuer_lowerOMV on Valuer_lowerOMV.arn = LOADS.arn											
				LEFT JOIN [dbo].[vw_SQLSolicitorDPSubmission] solicitor on solicitor.arn = LOADS.arn 
				left JOIN [dbo].[SQLSolicitorDPSubmission_updateinfo] Sol_UI on Sol_UI.arn = LOADS.arn
				left JOIN [dbo].SQLDUMakerDP_SolicitorSubmission_Rejected Sol_Rejected on Sol_Rejected.arn = LOADS.arn									
			where 
				--valuer.Status in ('Submitted', 'Cancelled', 'LowerOMV', 'Resubmitted')				
				--and 
				LOADS.ValuationRequired = 1
				and valuer.UpdatedDate between @DateFrom and @DateFrom
				and LOADS.ARN not in (select arn from [dbo].SQLDUMakerDP_ValuerSubmission where Status in ('Completed'))				
				and MortgateCenterCode like case when @MortgageCentreFlag = 1 then @MortgageCentre else '*' end 
				and LOADS.SolicitorCode like case when @SolCodeFlag = 1 then @SolCode else '*' end 
				and LOADS.ValuerCode like case when @ValCodeFlag = 1 then @ValCode else '*' end 					
				--and valuer.Status like case when @VRStatusFlag = 1 then @VRStatus else '*' end 
			)
			select * 
			from cte 
			where cte.VRStatus like case when @VRStatusFlag = 1 then @VRStatus else '*' end 
				and cte.DOcumentationStatus like case when @DocStatusFlag = 1 then @DocStatus else '*' end 
		*/	
		/*
		if (@Category = 'Solicitor Submission')
		begin						
			with CTE 
			(	[ARN]
				,[Status]
				,[BranchAddr1]
				,[BranchAddr2]
				,[BranchAddr3]
				,[BranchAddrCity]
				,[BranchAddrCountry]
				,[BranchAddrPostCode]
				,[BranchAddrState]
				,[BranchManagerEmailAddress]
				,[BranchManagerName]
				,[ClosingBranch]			  
				,DateOfLOAcceptance
				,[FinancingType]
				,[MortgateCenterCode]
				,[MortgateCenterEmail]
				,[PFSalesEmailAddress]
				,[PFCSalesName]
				,[SolicitorAccountNbr]
				,[SolicitorAccountType]
				,[SolicitorAddr1]
				,[SolicitorAddr2]
				,[SolicitorAddr3]
				,[SolicitorAddrCity]
				,[SolicitorAddrCountry]
				,[SolicitorAddrPostCode]
				,[SolicitorAddrState]
				,[SolicitorEmail]
				,[SolInternalStatus]
				,[SolicitorName]
				,[SolicitorCode]
				,[TopUpLoanIndicator]
				,[ChargorIDNumber]
				,[ChargorName]
				,[CustomerAddr1]
				,[CustomerAddr2]
				,[CustomerAddr3]
				,[CustomerAddrCity]
				,[CustomerAddrCountry]
				,[CustomerAddrPostCode]
				,[CustomerAddrState]
				,[ApplicantEmail]
				,[CustomerID]
				,[ApplicantName]
				,[CustomerName]
				,[EStatementFlagIndicator]
				,[GuarantorIDNumber]
				,[GuarantorName]
				,[DisbursementManner]
				,[LoanAmount]
				,[FacilityAmount1]
				,[FacilityAmount2]
				,[FacilityAmount3]
				,[FacilityAmount4]
				,[FinancingProductName1]
				,[FinancingProductName2]
				,[FinancingProductName3]
				,[FinancingProductName4]
				,[GracePeriod]
				,[LegalFeesFinancedAmount]
				,[MRTAFinancedAmount]
				,[PurposeCode]
				,[TotalFinancingAmount]
				,[ValuationFeesFinancedAmount]
				,[BuildUpArea]
				,[DeveloperCode]
				,[DeveloperName]
				,[CollateralPurpose]
				,[LandArea]
				,[ProjectCode]
				,[ProjectName]
				,[PropertyAddress]
				,[PropertyType]
				,[ValuationRequired]
				,[TitleDetailsLO]
				,[ValuerAccountNBR]
				,[ValuerAccountType]
				,[ValuerAddr1]
				,[ValuerAddr2]
				,[ValuerAddr3]
				,[ValuerAddrCity]
				,[ValuerAddrCountry]
				,[ValuerAddrPostCode]
				,[ValuerAddrState]
				,[ValuerCode]
				,[ValuerEmail]
				,[ValuerName]
				,[VerbalIndicativeValue]
				,[RESPONSECODE]
				,[RESPONSEDESCRIPTION]     			
				,[CreatedDate]
				,[UpdatedDate]						
				,[Aging]
				,[DocumentationStatus]
				,[VRStatus]
			)
			as
			(
			SELECT LOADS.[ARN] as [ARN]
				,LOADS.[Status] as [Status]
				,[BranchAddr1]
				,[BranchAddr2]
				,[BranchAddr3]
				,[BranchAddrCity]
				,[BranchAddrCountry]
				,[BranchAddrPostCode]
				,[BranchAddrState]
				,[BranchManagerEmailAddress]
				,[BranchManagerName]
				,[ClosingBranch]			  
				,FORMAT (DateOfLOAcceptance, 'dd/MM/yyyy') as DateOfLOAcceptance
				,[FinancingType]
				,[MortgateCenterCode]
				,[MortgateCenterEmail]
				,[PFSalesEmailAddress]
				,[PFCSalesName]
				,[SolicitorAccountNbr]
				,[SolicitorAccountType]
				,[SolicitorAddr1]
				,[SolicitorAddr2]
				,[SolicitorAddr3]
				,[SolicitorAddrCity]
				,[SolicitorAddrCountry]
				,[SolicitorAddrPostCode]
				,[SolicitorAddrState]
				,[SolicitorEmail]
				,[SolInternalStatus]
				,[SolicitorName]
				,LOADS.[SolicitorCode] as [SolicitorCode]
				,[TopUpLoanIndicator]
				,[ChargorIDNumber]
				,[ChargorName]
				,[CustomerAddr1]
				,[CustomerAddr2]
				,[CustomerAddr3]
				,[CustomerAddrCity]
				,[CustomerAddrCountry]
				,[CustomerAddrPostCode]
				,[CustomerAddrState]
				,[ApplicantEmail]
				,[CustomerID]
				,[ApplicantName]
				,[CustomerName]
				,[EStatementFlagIndicator]
				,[GuarantorIDNumber]
				,[GuarantorName]
				,[DisbursementManner]
				,[LoanAmount]
				,[FacilityAmount1]
				,[FacilityAmount2]
				,[FacilityAmount3]
				,[FacilityAmount4]
				,[FinancingProductName1]
				,[FinancingProductName2]
				,[FinancingProductName3]
				,[FinancingProductName4]
				,[GracePeriod]
				,[LegalFeesFinancedAmount]
				,[MRTAFinancedAmount]
				,[PurposeCode]
				,[TotalFinancingAmount]
				,[ValuationFeesFinancedAmount]
				,[BuildUpArea]
				,[DeveloperCode]
				,[DeveloperName]
				,[CollateralPurpose]
				,[LandArea]
				,[ProjectCode]
				,[ProjectName]
				,[PropertyAddress]
				,[PropertyType]
				,[ValuationRequired]
				,[TitleDetailsLO]
				,[ValuerAccountNBR]
				,[ValuerAccountType]
				,[ValuerAddr1]
				,[ValuerAddr2]
				,[ValuerAddr3]
				,[ValuerAddrCity]
				,[ValuerAddrCountry]
				,[ValuerAddrPostCode]
				,[ValuerAddrState]
				,LOADS.[ValuerCode] as [ValuerCode]
				,[ValuerEmail]
				,[ValuerName]
				,[VerbalIndicativeValue]
				,[RESPONSECODE]
				,[RESPONSEDESCRIPTION]     			
				,FORMAT (LOADS.[CreatedDate], 'dd/MM/yyyy') as [CreatedDate]
				,FORMAT (LOADS.[UpdatedDate], 'dd/MM/yyyy') as [UpdatedDate]			  
				, DATEDIFF(day, DateOfLOAcceptance, getdate()) as [Aging]
				, case 
					when sol_dumaker.Status = 'Completed' and solicitor.Status = 'Cancelled' then 'Ended-Cancelled' 
					when sol_dumaker.Status = 'Completed' then 'Ended-Approved' 
					when Sol_UI.arn is not null then 'UpdateInfo' 
					when solicitor.Completed =1 and solicitor.Status = 'Cancelled' then 'Cancelled' 						
					when Sol_Rejected.arn is not null and solicitor.Completed = 1 then 'Resubmitted' 
					when Sol_Rejected.arn is not null and solicitor.Completed = 0 then 'Rejected' 
					when solicitor.Completed =1 and solicitor.Status = 'Submitted' then 'Submitted' 																													
					else 'New' 
				end as [DocumentationStatus]
				,case 
					when isnull(LOADS.ValuationRequired,0) = 0 then 'N/A'
					when valuer_dumaker.Status = 'Completed' and valuer.status = 'Cancelled' then 'Ended-Cancelled'
					when valuer_dumaker.Status = 'Completed' then 'Ended-Approved'
					when valuer_ui.arn is not null then 'UpdateInfo'
					when valuer.Completed = 1 and valuer.status = 'Cancelled' then 'Cancelled'
					when valuer.Completed = 1 and Valuer_lowerOMV.arn is not null and valuer.Completed = 1 then 'Resubmitted'
					when valuer.Completed = 1 and Valuer.Status = 'LowerOMV' then 'LowerOMV'
					when valuer.Completed = 1 and Valuer.Status = 'Submitted' then 'Submitted'
					else 'New'
				end as [VRStatus]
			FROM [dbo].[SQLLOADS] LOADS
				LEFT JOIN [dbo].vw_SQLValuerDPSubmission valuer on valuer.arn = LOADS.arn 
				LEFT JOIN [dbo].[vw_SQLSolicitorDPSubmission] solicitor on solicitor.arn = LOADS.arn 
				left JOIN [dbo].[SQLValuerDPSubmission_updateinfo] valuer_ui on valuer_ui.arn = LOADS.arn
				left join SQLDUMakerDP_SolicitorSubmission sol_dumaker on sol_dumaker.arn = LOADS.arn 
				left join SQLDUMakerDP_ValuerSubmission valuer_dumaker on valuer_dumaker.arn = LOADS.arn 
				left JOIN [dbo].SQLDUMakerDP_ValuerSubmission_LoweredOMV Valuer_lowerOMV on Valuer_lowerOMV.arn = LOADS.arn															
				left JOIN [dbo].[SQLSolicitorDPSubmission_updateinfo] Sol_UI on Sol_UI.arn = LOADS.arn
				left JOIN [dbo].SQLDUMakerDP_SolicitorSubmission_Rejected Sol_Rejected on Sol_Rejected.arn = LOADS.arn									
			where 				
				solicitor.UpdatedDate between @DateFrom and @DateFrom
				--[DateOfLOAcceptance] between '2020-12-01' and '2020-12-31'				
				and MortgateCenterCode like case when @MortgageCentreFlag = 1 then @MortgageCentre else '%' end 
				and LOADS.SolicitorCode like case when @SolCodeFlag = 1 then @SolCode else '%' end 
				and LOADS.ValuerCode like case when @ValCodeFlag = 1 then @ValCode else '%' end 									
			)
			select * 
			from cte 
			where cte.VRStatus like case when @VRStatusFlag = 1 then @VRStatus else '%' end 
				and cte.DOcumentationStatus like case when @DocStatusFlag = 1 then @DocStatus else '%' end 
			order by [DateOfLOAcceptance] desc
		end 
		*/
	--end 	

	/*
			with disb_history (arn, firstRunningIDForCompletedSubmission) as
				(
				select arn,  min(RunningIDForCompletedSubmission) as firstRunningIDForCompletedSubmission
				from aaSolDisbursementSubmission_DisMakerSubmission_History
				group by arn 
			),
			disb_history_detail (arn, firstRunningIDForCompletedSubmission, BalanceAdviceLetterApplicableFlag,SolicitorSubmissionOption) as 
			(
				select disb_history.arn, disb_history.firstRunningIDForCompletedSubmission, h.BalanceAdviceLetterApplicableFlag, h.SolicitorSubmissionOption
				from disb_history
					inner join aaSolDisbursementSubmission_DisMakerSubmission_History h on h.arn = disb_history.arn and h.RunningIDForCompletedSubmission= disb_history.firstRunningIDForCompletedSubmission
			),	
			CTE 
			(	[ARN]
				,[Status]
				,[BranchAddr1]
				,[BranchAddr2]
				,[BranchAddr3]
				,[BranchAddrCity]
				,[BranchAddrCountry]
				,[BranchAddrPostCode]
				,[BranchAddrState]
				,[BranchManagerEmailAddress]
				,[BranchManagerName]
				,[ClosingBranch]			  
				,DateOfLOAcceptance
				,[FinancingType]
				,[MortgateCenterCode]
				,[MortgateCenterEmail]
				,[PFSalesEmailAddress]
				,[PFCSalesName]
				,[SolicitorAccountNbr]
				,[SolicitorAccountType]
				,[SolicitorAddr1]
				,[SolicitorAddr2]
				,[SolicitorAddr3]
				,[SolicitorAddrCity]
				,[SolicitorAddrCountry]
				,[SolicitorAddrPostCode]
				,[SolicitorAddrState]
				,[SolicitorEmail]
				,[SolInternalStatus]
				,[SolicitorName]
				,[SolicitorCode]
				,[TopUpLoanIndicator]
				,[ChargorIDNumber]
				,[ChargorName]
				,[CustomerAddr1]
				,[CustomerAddr2]
				,[CustomerAddr3]
				,[CustomerAddrCity]
				,[CustomerAddrCountry]
				,[CustomerAddrPostCode]
				,[CustomerAddrState]
				,[ApplicantEmail]
				,[CustomerID]
				,[ApplicantName]
				,[CustomerName]
				,[EStatementFlagIndicator]
				,[GuarantorIDNumber]
				,[GuarantorName]
				,[DisbursementManner]
				,[LoanAmount]
				,[FacilityAmount1]
				,[FacilityAmount2]
				,[FacilityAmount3]
				,[FacilityAmount4]
				,[FinancingProductName1]
				,[FinancingProductName2]
				,[FinancingProductName3]
				,[FinancingProductName4]
				,[GracePeriod]
				,[LegalFeesFinancedAmount]
				,[MRTAFinancedAmount]
				,[PurposeCode]
				,[TotalFinancingAmount]
				,[ValuationFeesFinancedAmount]
				,[BuildUpArea]
				,[DeveloperCode]
				,[DeveloperName]
				,[CollateralPurpose]
				,[LandArea]
				,[ProjectCode]
				,[ProjectName]
				,[PropertyAddress]
				,[PropertyType]
				,[ValuationRequired]
				,[TitleDetailsLO]
				,[ValuerAccountNBR]
				,[ValuerAccountType]
				,[ValuerAddr1]
				,[ValuerAddr2]
				,[ValuerAddr3]
				,[ValuerAddrCity]
				,[ValuerAddrCountry]
				,[ValuerAddrPostCode]
				,[ValuerAddrState]
				,[ValuerCode]
				,[ValuerEmail]
				,[ValuerName]
				,[VerbalIndicativeValue]
				,[RESPONSECODE]
				,[RESPONSEDESCRIPTION]     			
				,[CreatedDate]
				,[UpdatedDate]						
				,[Aging]
				,[DocumentationStatus]
				,[VRStatus]
			)
			as
			(
			SELECT LOADS.[ARN] as [ARN]
				,LOADS.[Status] as [Status]
				,[BranchAddr1]
				,[BranchAddr2]
				,[BranchAddr3]
				,[BranchAddrCity]
				,[BranchAddrCountry]
				,[BranchAddrPostCode]
				,[BranchAddrState]
				,[BranchManagerEmailAddress]
				,[BranchManagerName]
				,[ClosingBranch]			  
				,FORMAT (DateOfLOAcceptance, 'dd/MM/yyyy') as DateOfLOAcceptance
				,[FinancingType]
				,[MortgateCenterCode]
				,[MortgateCenterEmail]
				,[PFSalesEmailAddress]
				,[PFCSalesName]
				,[SolicitorAccountNbr]
				,[SolicitorAccountType]
				,[SolicitorAddr1]
				,[SolicitorAddr2]
				,[SolicitorAddr3]
				,[SolicitorAddrCity]
				,[SolicitorAddrCountry]
				,[SolicitorAddrPostCode]
				,[SolicitorAddrState]
				,[SolicitorEmail]
				,[SolInternalStatus]
				,[SolicitorName]
				,LOADS.[SolicitorCode] as [SolicitorCode]
				,[TopUpLoanIndicator]
				,[ChargorIDNumber]
				,[ChargorName]
				,[CustomerAddr1]
				,[CustomerAddr2]
				,[CustomerAddr3]
				,[CustomerAddrCity]
				,[CustomerAddrCountry]
				,[CustomerAddrPostCode]
				,[CustomerAddrState]
				,[ApplicantEmail]
				,[CustomerID]
				,[ApplicantName]
				,[CustomerName]
				,[EStatementFlagIndicator]
				,[GuarantorIDNumber]
				,[GuarantorName]
				,[DisbursementManner]
				,[LoanAmount]
				,[FacilityAmount1]
				,[FacilityAmount2]
				,[FacilityAmount3]
				,[FacilityAmount4]
				,[FinancingProductName1]
				,[FinancingProductName2]
				,[FinancingProductName3]
				,[FinancingProductName4]
				,[GracePeriod]
				,[LegalFeesFinancedAmount]
				,[MRTAFinancedAmount]
				,[PurposeCode]
				,[TotalFinancingAmount]
				,[ValuationFeesFinancedAmount]
				,[BuildUpArea]
				,[DeveloperCode]
				,[DeveloperName]
				,[CollateralPurpose]
				,[LandArea]
				,[ProjectCode]
				,[ProjectName]
				,[PropertyAddress]
				,[PropertyType]
				,[ValuationRequired]
				,[TitleDetailsLO]
				,[ValuerAccountNBR]
				,[ValuerAccountType]
				,[ValuerAddr1]
				,[ValuerAddr2]
				,[ValuerAddr3]
				,[ValuerAddrCity]
				,[ValuerAddrCountry]
				,[ValuerAddrPostCode]
				,[ValuerAddrState]
				,LOADS.[ValuerCode] as [ValuerCode]
				,[ValuerEmail]
				,[ValuerName]
				,[VerbalIndicativeValue]
				,[RESPONSECODE]
				,[RESPONSEDESCRIPTION]     			
				,FORMAT (LOADS.[CreatedDate], 'dd/MM/yyyy') as [CreatedDate]
				,FORMAT (LOADS.[UpdatedDate], 'dd/MM/yyyy') as [UpdatedDate]			  
				, DATEDIFF(day, DateOfLOAcceptance, getdate()) as [Aging]
				, case 					
					when disb_UpdateInfo.arn is not null and disb_Rejected.arn is null then 'Disbursement- Update Info Submitted'
					when disb.SolicitorSubmissionOption in ('Cancelled') and disb.RCOMakerSubmissionCompleted = 1 then 'Disbursement- Cancellation Approved By Disbursement Maker'
					when disb.SolicitorSubmissionOption in ('Cancelled') and disb.SolicitorSubmissionCompleted = 1 then 'Disbursement- Cancellation Submitted'
					when disb.SolicitorSubmissionOption in ('Submitted','Resubmitted') and disb.RCOMakerSubmissionCompleted = 1 then 'Disbursement Approved By Disbursement Maker'
					when disb.SolicitorSubmissionOption in ('Submitted','Resubmitted') and disb.DisbursementCheckerSubmissionCompleted = 1 then 'Disbursement Approved By Disbursement Checker'
					when disb.SolicitorSubmissionOption in ('Submitted','Resubmitted') and disb.DisbursementMakerSubmissionCompleted = 1 then 'Disbursement Approved By Disbursement Maker'
					when disb.SolicitorSubmissionOption in ('Submitted','Resubmitted') and disb.SolicitorSubmissionCompleted = 1 then 'Disbursement Submitted'
					when disb_history_detail.SolicitorSubmissionOption in ('Cancelled') and disb_history_detail.arn is not null then 'Disbursement- Cancellation Approved By Disbursement Checker'
					when disb_history_detail.SolicitorSubmissionOption in ('Submitted','Resubmitted') and disb_history_detail.arn is not null then 'Disbursement Approved By RCO Checker'					
					when solicitor.Status in ('Submitted','Resubmitted')  and sol_dumaker.Status = 'Completed' then 'Documentation Approved' 
					when solicitor.Status = 'Cancelled' and sol_dumaker.Status = 'Completed' then 'Cancellation Approved' 					
					when Sol_UI.arn is not null then 'Update Info Submitted' 
					when solicitor.Completed =1 and solicitor.Status = 'Cancelled' then 'Cancellation Submitted' 						
					when Sol_Rejected.arn is not null and solicitor.Completed = 1 then 'Documentation Submitted' 
					when Sol_Rejected.arn is not null and solicitor.Completed = 0 then 'Documentation Rejected' 
					when solicitor.Completed =1 and solicitor.Status in ('Submitted','Resubmitted') then 'Documentation Submitted' 																													
					else 'New' 
				end as [DocumentationStatus]
				,case 
					when isnull(LOADS.ValuationRequired,0) = 0 then 'N/A'
					when valuer_dumaker.Status = 'Completed' and valuer.status = 'Cancelled' then 'Cancellation Approved'
					when valuer_dumaker.Status = 'Completed' then 'VR Approved'
					when valuer_ui.arn is not null then 'Update Info Submitted'
					when valuer.Completed = 1 and valuer.status = 'Cancelled' then 'Cancellation Submitted'
					when valuer.Completed = 1 and Valuer.Status in ('Submitted','Resubmitted') and valuer.Completed = 1 then 'VR Submitted'
					when valuer.Completed = 1 and Valuer.Status = 'LowerOMV' then 'LowerOMV Submitted'
					when Valuer_lowerOMV.arn is not null then 'LowerOMV Approved'
					when valuer.Completed = 1 and Valuer.Status in ('Submitted','Resubmitted') then 'VR Submitted'
					else 'New'
				end as [VRStatus]
			FROM [dbo].[SQLLOADS] LOADS
				LEFT JOIN [dbo].vw_SQLValuerDPSubmission valuer on valuer.arn = LOADS.arn 
				LEFT JOIN [dbo].[vw_SQLSolicitorDPSubmission] solicitor on solicitor.arn = LOADS.arn 
				left JOIN [dbo].[SQLValuerDPSubmission_updateinfo] valuer_ui on valuer_ui.arn = LOADS.arn
				left join SQLDUMakerDP_SolicitorSubmission sol_dumaker on sol_dumaker.arn = LOADS.arn 
				left join SQLDUMakerDP_ValuerSubmission valuer_dumaker on valuer_dumaker.arn = LOADS.arn 
				left JOIN [dbo].SQLDUMakerDP_ValuerSubmission_LoweredOMV Valuer_lowerOMV on Valuer_lowerOMV.arn = LOADS.arn															
				left JOIN [dbo].[SQLSolicitorDPSubmission_updateinfo] Sol_UI on Sol_UI.arn = LOADS.arn
				left JOIN [dbo].SQLDUMakerDP_SolicitorSubmission_Rejected Sol_Rejected on Sol_Rejected.arn = LOADS.arn		
				left join aaSolDisbursementSubmission_DisMakerSubmission disb on disb.arn = LOADS.arn 
				left join disb_history_detail on disb_history_detail.arn = LOADS.arn 		
				left join aaSolDisbursementSubmission_UpdateInfo disb_UpdateInfo on disb_UpdateInfo.arn = LOADS.arn 		
				left join aaSolDisbursementSubmission_DisMakerRejected disb_Rejected on disb_Rejected.arn = LOADS.arn 						
								
			where 				
				[DateOfLOAcceptance] between @DateFrom and @DateFrom							
				and MortgateCenterCode like case when @MortgageCentreFlag = 1 then @MortgageCentre else '%' end 
				and LOADS.SolicitorCode like case when @SolCodeFlag = 1 then @SolCode else '%' end 
				and LOADS.ValuerCode like case when @ValCodeFlag = 1 then @ValCode else '%' end 									
			)
			select * 
			from cte 
			where cte.VRStatus like case when @VRStatusFlag = 1 then @VRStatus else '%' end 
				and cte.DOcumentationStatus like case when @DocStatusFlag = 1 then @DocStatus else '%' end 
			order by [DateOfLOAcceptance] desc
			*/
			--declare @ResultCount int 
			
end