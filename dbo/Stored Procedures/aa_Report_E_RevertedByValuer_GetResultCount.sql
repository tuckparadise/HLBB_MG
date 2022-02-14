﻿CREATE   procedure [dbo].[aa_Report_E_RevertedByValuer_GetResultCount] 
-- actual usage is for update info 
@Category nvarchar(max) = null, 
@DateFrom datetime = null,
@DateTo datetime = null,
@MortgageCentre nvarchar(max) = null,
@MortgageCentreFlag bit = null,
@SolCode nvarchar(max) = null,
@SolCodeFlag bit = null,
@ValCode nvarchar(max) = null,
@ValCodeFlag bit = null,
@DocVRANDFlag bit = null,
@Error nvarchar(max) = null OUTPUT ,
@ResultCount bigint = null OUTPUT 
as
begin
	--set @ResultCount = 0 
	set @Error= ''
	
	truncate table aaMortgageReport_RevertedByVal;

	if (@Category = 'LowerOMV Submission')
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
			-- loweromv submitted 
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
					when solicitor.Completed =0 and Sol_Rejected.Status = 'Cancelled'					and Sol_Rejected.arn is not null then 'Cancellation Rejected' 
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
				VRMakerinstance.TaskOwner as [CurrentVRMaker],
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
				and isnull(SQLLOADS.ValuationRequired,0) = 1 and valuer.Completed = 1 and Valuer.Status = 'LowerOMV'
			union
			-- loweromv approved 
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
					when solicitor.Completed =0 and Sol_Rejected.Status = 'Cancelled'					and Sol_Rejected.arn is not null then 'Cancellation Rejected' 
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
				VRMakerinstance.TaskOwner as [CurrentVRMaker],
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
				Valuer_lowerOMV.ValuerUpdatedDate  between @DateFrom and @DateTo	
				and isnull(MortgateCenterCode,'') like case when @MortgageCentreFlag = 1 then @MortgageCentre else '%' end 
				and isnull(SQLLOADS.SolicitorCode,'') like case when @SolCodeFlag = 1 then @SolCode else '%' end 
				and isnull(SQLLOADS.ValuerCode,'') like case when @ValCodeFlag = 1 then @ValCode else '%' end 	
				and isnull(SQLLOADS.ValuationRequired,0) = 1 and valuer.Completed = 0 and Valuer_lowerOMV.Status = 'LowerOMV' and Valuer_lowerOMV.arn is not null
			)
			select @ResultCount = count(*)			
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
					when solicitor.Completed =0 and Sol_Rejected.Status = 'Cancelled'					and Sol_Rejected.arn is not null then 'Cancellation Rejected' 
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
				VRMakerinstance.TaskOwner as [CurrentVRMaker],
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
				and isnull(SQLLOADS.ValuationRequired,0) = 1 and valuer.Completed = 1 and valuer.status = 'Cancelled'
			)
			select @ResultCount = count(*)			
			from cte 			
	end 	

	
	if (@Category = 'VR Submission')
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
					when solicitor.Completed =0 and Sol_Rejected.Status = 'Cancelled'					and Sol_Rejected.arn is not null then 'Cancellation Rejected' 
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
				VRMakerinstance.TaskOwner as [CurrentVRMaker],
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
			select @ResultCount = count(*)			
			from cte 			
	end 	

	-- 20210426- update status fixes 
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
					when solicitor.Completed =0 and Sol_Rejected.Status = 'Cancelled'					and Sol_Rejected.arn is not null then 'Cancellation Rejected' 
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
				VRMakerinstance.TaskOwner as [CurrentVRMaker],
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
				v_updateInfo.UpdatedDate between @DateFrom and @DateTo	
				and isnull(MortgateCenterCode,'') like case when @MortgageCentreFlag = 1 then @MortgageCentre else '%' end 
				and isnull(SQLLOADS.SolicitorCode,'') like case when @SolCodeFlag = 1 then @SolCode else '%' end 
				and isnull(SQLLOADS.ValuerCode,'') like case when @ValCodeFlag = 1 then @ValCode else '%' end 	
				--and isnull(SQLLOADS.ValuationRequired,0) = 1 and valuer.Completed = 1 and Valuer.Status in ('Submitted','Resubmitted')
			)
			select @ResultCount = count(*)			
			from cte 			
	end 	

end