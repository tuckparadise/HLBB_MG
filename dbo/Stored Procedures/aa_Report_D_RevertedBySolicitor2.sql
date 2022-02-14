CREATE         procedure [dbo].[aa_Report_D_RevertedBySolicitor2]
@Category nvarchar(max) = null ,
@DateFrom datetime = null,
@DateTo datetime = null,
@MortgageCentre nvarchar(max) = null,
@MortgageCentreFlag bit = null,
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
	--if (isnull(@DocStatus,'') = '' and @DocStatusFlag = 1) set @error =  @error + 'Documentation Status cannot be blank<br>'
	--if (isnull(@VRStatus,'') = '' and @VRStatusFlag = 1) set @error =  @error + 'VR Status cannot be blank<br>'
	if (isnull(@SolCode,'') = '' and @SolCodeFlag = 1) set @error =  @error + 'Solicitor Code cannot be blank<br>'
	if (isnull(@ValCode,'') = '' and @ValCodeFlag = 1) set @error =  @error + 'Valuer Code cannot be blank<br>'

	--if (@ValCodeFlag = 1 and @VRStatus = 'N/A') set @error =  @error + 'N/A status is not valid for category Valuer Submission Case<br>'
	*/

	truncate table aaMortgageReport_RevertedBySol;

	if (@Category = 'Documentation Approved')
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
				sol_dumaker.UpdatedDate between @DateFrom and @DateTo	
				and isnull(MortgateCenterCode,'') like case when @MortgageCentreFlag = 1 then @MortgageCentre else '%' end 
				and isnull(SQLLOADS.SolicitorCode,'') like case when @SolCodeFlag = 1 then @SolCode else '%' end 
				and isnull(SQLLOADS.ValuerCode,'') like case when @ValCodeFlag = 1 then @ValCode else '%' end 	
				and solicitor.Completed =1 and solicitor.Status in ('Submitted','Resubmitted')  and sol_dumaker.Status = 'Completed'
			)
			insert into aaMortgageReport_RevertedBySol
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
	end 	

	if (@Category = 'Cancellation Approved')
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
				sol_dumaker.UpdatedDate between @DateFrom and @DateTo	
				and isnull(MortgateCenterCode,'') like case when @MortgageCentreFlag = 1 then @MortgageCentre else '%' end 
				and isnull(SQLLOADS.SolicitorCode,'') like case when @SolCodeFlag = 1 then @SolCode else '%' end 
				and isnull(SQLLOADS.ValuerCode,'') like case when @ValCodeFlag = 1 then @ValCode else '%' end 					
				and solicitor.Completed =1 and solicitor.Status = 'Cancelled'					and sol_dumaker.Status = 'Completed'
			)
			insert into aaMortgageReport_RevertedBySol
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
	end 	

	
	if (@Category = 'Cancellation Submission')
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
				solicitor.UpdatedDate between @DateFrom and @DateTo	
				and isnull(MortgateCenterCode,'') like case when @MortgageCentreFlag = 1 then @MortgageCentre else '%' end 
				and isnull(SQLLOADS.SolicitorCode,'') like case when @SolCodeFlag = 1 then @SolCode else '%' end 
				and isnull(SQLLOADS.ValuerCode,'') like case when @ValCodeFlag = 1 then @ValCode else '%' end 					
				and solicitor.Completed =1 and solicitor.Status = 'Cancelled'
			)
			insert into aaMortgageReport_RevertedBySol
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
	end 	

	
	if (@Category = 'Documentation Rejected')
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
				Sol_Rejected.UpdatedDate between @DateFrom and @DateTo	
				and isnull(MortgateCenterCode,'') like case when @MortgageCentreFlag = 1 then @MortgageCentre else '%' end 
				and isnull(SQLLOADS.SolicitorCode,'') like case when @SolCodeFlag = 1 then @SolCode else '%' end 
				and isnull(SQLLOADS.ValuerCode,'') like case when @ValCodeFlag = 1 then @ValCode else '%' end 					
				and solicitor.Completed =0 and Sol_Rejected.Status in ('Submitted','Resubmitted') and Sol_Rejected.arn is not null
			)
			insert into aaMortgageReport_RevertedBySol
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
	end 	
	
	if (@Category = 'Cancellation Rejected')
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
				Sol_Rejected.UpdatedDate between @DateFrom and @DateTo	
				and isnull(MortgateCenterCode,'') like case when @MortgageCentreFlag = 1 then @MortgageCentre else '%' end 
				and isnull(SQLLOADS.SolicitorCode,'') like case when @SolCodeFlag = 1 then @SolCode else '%' end 
				and isnull(SQLLOADS.ValuerCode,'') like case when @ValCodeFlag = 1 then @ValCode else '%' end 					
				and solicitor.Completed =0 and Sol_Rejected.Status = 'Cancelled'					and Sol_Rejected.arn is not null
			)
			insert into aaMortgageReport_RevertedBySol
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
	end 	
	
	if (@Category = 'Documentation Submission')
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
				solicitor.UpdatedDate between @DateFrom and @DateTo	
				and isnull(MortgateCenterCode,'') like case when @MortgageCentreFlag = 1 then @MortgageCentre else '%' end 
				and isnull(SQLLOADS.SolicitorCode,'') like case when @SolCodeFlag = 1 then @SolCode else '%' end 
				and isnull(SQLLOADS.ValuerCode,'') like case when @ValCodeFlag = 1 then @ValCode else '%' end 	
				and solicitor.Completed =1 and solicitor.Status in ('Submitted','Resubmitted')  
			)
			insert into aaMortgageReport_RevertedBySol
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
	end 	

	-- update status fixes 
	if (@Category = 'Update Status')
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
				s_updateInfo.UpdatedDate between @DateFrom and @DateTo	
				and isnull(MortgateCenterCode,'') like case when @MortgageCentreFlag = 1 then @MortgageCentre else '%' end 
				and isnull(SQLLOADS.SolicitorCode,'') like case when @SolCodeFlag = 1 then @SolCode else '%' end 
				and isnull(SQLLOADS.ValuerCode,'') like case when @ValCodeFlag = 1 then @ValCode else '%' end 	
				--and solicitor.Completed =1 and solicitor.Status in ('Submitted','Resubmitted')  
			)
			insert into aaMortgageReport_RevertedBySol
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
	end 	

	/*
	if (@Category = 'Valuer Submission')
	begin	
		with cte (MortgateCenterCode, CreditApplicationNumber, CollateralPurpose, DisbursementManner, ApplicantName, SolicitorCode, ValuerCode, TotalFinancingAmount,
			[DateOfLOAcceptance],[DocumentationSubmissionDate],
			[DocumentationApprovalDate],[DocumentationApprovalMaker], [DocumentationRejectionDate], [DocumentationRejectionMaker], [DocumentationCancellationSubmissionDate], [DocumentationCancellationApprovalDate], [DocumentationCancellationApprovalMaker],[VRSubmissionDate],[VRApprovalDate],[VRApprovalMaker],
			[DocumentationStatus], [VRStatus],ValuationRequired,[VRCancellationSubmissionDate],[VRCancellationApprovalDate],[VRCancellationApprovalMaker], [VRLowerOMVSubmissionDate], [VRLowerOMVApprovalDate], [VRLowerOMVApprovalMaker],
			SolicitorName,ValuerName,[DocumentatationSolicitorReferenceNumber],[DocumentatationExecutionDateByCustomer],[DocumentatationSNPCompletionDate],[DocumentatationSNPExtendedCompletionDate],[DocumentatationDeveloperBillingDueDate],
					[DocumentatationHardCopyReceivedDate], [VRValuerReferenceNumber], [VRMarketValue], [VRFireInsuranceValue], [VRLowerOMVLowerOMVReasons], [VRLowerOMVLowerOMVReasonsRemarks], [CurrentDocumentMaker], [CurrentVRMaker])
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
				case when isnull(SQLLOADS.ValuationRequired,0) = 1 and valuer.Completed = 1 and valuer.status = 'Cancelled' and valuer_dumaker.Status = 'Completed' then valuer_dumaker.DUMakerEmail else null end as [VRCancellationApprovalMaker]	,		
				case when isnull(SQLLOADS.ValuationRequired,0) = 1 and valuer.Completed = 1 and Valuer.Status = 'LowerOMV' then FORMAT (valuer.UpdatedDate, 'dd/MM/yyyy') when isnull(SQLLOADS.ValuationRequired,0) = 1 and valuer.Completed = 0 and Valuer_lowerOMV.Status = 'LowerOMV' and Valuer_lowerOMV.arn is not null then FORMAT (Valuer_lowerOMV.ValuerUpdatedDate, 'dd/MM/yyyy') else null end as [VRLowerOMVSubmissionDate],
				case when isnull(SQLLOADS.ValuationRequired,0) = 1 and valuer.Completed = 0 and Valuer_lowerOMV.Status = 'LowerOMV' and Valuer_lowerOMV.arn is not null then FORMAT (Valuer_lowerOMV.UpdatedDate, 'dd/MM/yyyy') else null end as [VRLowerOMVApprovalDate],
				case when isnull(SQLLOADS.ValuationRequired,0) = 1 and valuer.Completed = 0 and Valuer_lowerOMV.Status = 'LowerOMV' and Valuer_lowerOMV.arn is not null then Valuer_lowerOMV.DUMakerEmail else null end as [VRLowerOMVApprovalMaker],
				sqlloads.SolicitorName, 
				sqlloads.ValuerName, 
				case when solicitor.Completed =1 and solicitor.Status in ('Submitted','Resubmitted') then solicitor.SolicitorReferenceNumber else null end as [DocumentatationSolicitorReferenceNumber],
				case when solicitor.Completed =1 and solicitor.Status in ('Submitted','Resubmitted') then solicitor.ExecutionDateByCustomer else null end as [DocumentatationExecutionDateByCustomer],
				case when solicitor.Completed =1 and solicitor.Status in ('Submitted','Resubmitted') then solicitor.SNPCompletionDate else null end as [DocumentatationSNPCompletionDate],
				case when solicitor.Completed =1 and solicitor.Status in ('Submitted','Resubmitted') then solicitor.SNPExtendedCompletionDate else null end as [DocumentatationSNPExtendedCompletionDate],
				case when solicitor.Completed =1 and solicitor.Status in ('Submitted','Resubmitted') then FORMAT(solicitor.DeveloperBillingDueDate, 'dd/MM/yyyy') else null end as [DocumentatationDeveloperBillingDueDate],				
				case when solicitor.Completed =1 and solicitor.Status in ('Submitted','Resubmitted')  and sol_dumaker.Status = 'Completed' then format(sol_dumaker.HardCopyReceivedDate ,'dd/MM/yyyy') else null end as [DocumentatationHardCopyReceivedDate],
				case when isnull(SQLLOADS.ValuationRequired,0) = 1 and valuer.Completed = 1 and Valuer.Status in ('Submitted','Resubmitted') then valuer.ValuerReference else null end as [VRValuerReferenceNumber],
				case when isnull(SQLLOADS.ValuationRequired,0) = 1 and valuer.Completed = 1 and Valuer.Status in ('Submitted','Resubmitted') then valuer.MarketValue else null end as [VRMarketValue],
				case when isnull(SQLLOADS.ValuationRequired,0) = 1 and valuer.Completed = 1 and Valuer.Status in ('Submitted','Resubmitted') then valuer.FireInsuranceValue else null end as [VRFireInsuranceValue],
				case when isnull(SQLLOADS.ValuationRequired,0) = 1 and valuer.Completed = 1 and Valuer.Status = 'LowerOMV' then valuer.VLowerOMVStatus when isnull(SQLLOADS.ValuationRequired,0) = 1 and valuer.Completed = 0 and Valuer_lowerOMV.Status = 'LowerOMV' and Valuer_lowerOMV.arn is not null then Valuer_lowerOMV.VLowerOMVStatus else null end as [VRLowerOMVLowerOMVReasons],
				case when isnull(SQLLOADS.ValuationRequired,0) = 1 and valuer.Completed = 1 and Valuer.Status = 'LowerOMV' then valuer.VLowerOMVReasons when isnull(SQLLOADS.ValuationRequired,0) = 1 and valuer.Completed = 0 and Valuer_lowerOMV.Status = 'LowerOMV' and Valuer_lowerOMV.arn is not null then Valuer_lowerOMV.VLowerOMVReasons else null end as [VRLowerOMVLowerOMVReasonsRemarks],
				DUMakerinstance.TaskOwner as [CurrentDocumentMaker],
				VRMakerinstance.TaskOwner as [CurrentVRMaker]
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
			where 
				valuer.UpdatedDate between @DateFrom and @DateTo	
				and isnull(MortgateCenterCode,'') like case when @MortgageCentreFlag = 1 then @MortgageCentre else '%' end 
				and isnull(SQLLOADS.SolicitorCode,'') like case when @SolCodeFlag = 1 then @SolCode else '%' end 
				and isnull(SQLLOADS.ValuerCode,'') like case when @ValCodeFlag = 1 then @ValCode else '%' end 	
				and isnull(SQLLOADS.ValuationRequired,0) = 1 and valuer.Completed = 1 and valuer.status = 'Cancelled'	
			)
			insert into aaMortgageReport_RevertedBySol
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
				[DocumentatationHardCopyReceivedDate], [VRValuerReferenceNumber], [VRMarketValue], [VRFireInsuranceValue], [VRLowerOMVLowerOMVReasons], [VRLowerOMVLowerOMVReasonsRemarks], [CurrentDocumentMaker], [CurrentVRMaker]
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
				[DocumentatationHardCopyReceivedDate], [VRValuerReferenceNumber], [VRMarketValue], [VRFireInsuranceValue], [VRLowerOMVLowerOMVReasons], [VRLowerOMVLowerOMVReasonsRemarks], [CurrentDocumentMaker], [CurrentVRMaker]
			from cte 
			--where cte.VRStatus like case when @VRStatusFlag = 1 then @VRStatus else '%' end 
			--	and cte.DOcumentationStatus like case when @DocStatusFlag = 1 then @DocStatus else '%' end 
			--order by [DocumentationSubmissionDate] asc	

			
	end 
	*/

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
			[SolicitorUpdateStatusOption], [SolicitorUpdateStatusRemarks], [SolicitorUpdateStatusDate],
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
			[VRCancellationSubmissionDate],[VRCancellationApprovalDate],[VRCancellationApprovalMaker],[VRCancellationAgeing],
			[VRLowerOMVSubmissionDate], [VRLowerOMVLowerOMVReasons], [VRLowerOMVLowerOMVReasonsRemarks], [VRLowerOMVApprovalDate], [VRLowerOMVApprovalMaker],[VRLowerOMVAgeing],			 
			 [ValuerUpdateStatusOption],[ValuerUpdateStatusRemarks],[ValuerUpdateStatusDate]
		from aaMortgageReport_RevertedBySol
		--order by [VRCancellationSubmissionDate] asc 
end