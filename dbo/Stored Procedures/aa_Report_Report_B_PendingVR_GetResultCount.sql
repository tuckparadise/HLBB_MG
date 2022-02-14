CREATE   procedure	[dbo].[aa_Report_Report_B_PendingVR_GetResultCount]
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

	if (@error = '')
	begin	
		with cte (MortgateCenterCode, CreditApplicationNumber, CollateralPurpose, DisbursementManner, ApplicantName, SolicitorCode, ValuerCode, TotalFinancingAmount,
			[DateOfLOAcceptance],[DocumentationSubmissionDate],
			[DocumentationApprovalDate],[DocumentationApprovalMaker], [DocumentationRejectionDate], [DocumentationRejectionMaker], [DocumentationCancellationSubmissionDate], [DocumentationCancellationApprovalDate], [DocumentationCancellationApprovalMaker],[VRSubmissionDate],[VRApprovalDate],[VRApprovalMaker],
			[DocumentationStatus], [VRStatus],ValuationRequired,[VRCancellationSubmissionDate],[VRCancellationApprovalDate],[VRCancellationApprovalMaker], [VRLowerOMVSubmissionDate], [VRLowerOMVApprovalDate], [VRLowerOMVApprovalMaker])
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
			case when isnull(SQLLOADS.ValuationRequired,0) = 1 and valuer.Completed = 0 and Valuer_lowerOMV.Status = 'LowerOMV' and Valuer_lowerOMV.arn is not null then Valuer_lowerOMV.DUMakerEmail else null end as [VRLowerOMVApprovalMaker]
		from SQLLOADS
			LEFT JOIN vw_SQLSolicitorDPSubmission solicitor on solicitor.arn = SQLLOADS.arn 
			left join SQLDUMakerDP_SolicitorSubmission sol_dumaker on sol_dumaker.arn = SQLLOADS.arn 
			--left JOIN [dbo].[SQLSolicitorDPSubmission_updateinfo] Sol_UI on Sol_UI.arn = SQLLOADS.arn
			left JOIN SQLDUMakerDP_SolicitorSubmission_Rejected Sol_Rejected on Sol_Rejected.arn = SQLLOADS.arn	
			LEFT JOIN vw_SQLValuerDPSubmission valuer on valuer.arn = SQLLOADS.arn 
			left join SQLDUMakerDP_ValuerSubmission valuer_dumaker on valuer_dumaker.arn = SQLLOADS.arn 
			left JOIN [dbo].SQLDUMakerDP_ValuerSubmission_LoweredOMV Valuer_lowerOMV on Valuer_lowerOMV.arn = SQLLOADS.arn															
		where 
			sol_dumaker.UpdatedDate between @DateFrom and @DateTo	
				and isnull(MortgateCenterCode,'') like case when @MortgageCentreFlag = 1 then @MortgageCentre else '%' end 
				and isnull(SQLLOADS.SolicitorCode,'') like case when @SolCodeFlag = 1 then @SolCode else '%' end 
				and isnull(SQLLOADS.ValuerCode,'') like case when @ValCodeFlag = 1 then @ValCode else '%' end 	
				and solicitor.Completed =1 and solicitor.Status in ('Submitted','Resubmitted')  and sol_dumaker.Status = 'Completed'
				and isnull(SQLLOADS.ValuationRequired,0) = 1 and isnull(valuer.Completed,0) <> 1 and isnull(Valuer.Status,'') not in ('Submitted','Resubmitted')								
		)
		
		select @ResultCount = count(*)			
		from cte 
	end 
end