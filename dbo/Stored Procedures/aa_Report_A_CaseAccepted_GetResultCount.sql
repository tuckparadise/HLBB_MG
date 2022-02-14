/*
declare @error nvarchar(max) , @resultcount int 
exec [aa_Report_A_CaseAccepted] 'Acceptance', '2019-01-01', '2020-12-31', null, null, null, null, null, null, null, null, null, null, null
select @resultcount

declare @error nvarchar(max) , @resultcount int 
exec [aa_Report_A_CaseAccepted_GetResultCount] 'Acceptance', '2019-01-01', '2020-12-31', null, null, null, null, null, null, null, null, null, null, null, @error output, @resultcount output 
select @resultcount

select DateOfLOAcceptance, * 
from sqlloads
where 
[DateOfLOAcceptance] between '2019-01-01' and '2020-12-31'		
--and isnull(MortgateCenterCode,'') like '%'
*/



CREATE   procedure [dbo].[aa_Report_A_CaseAccepted_GetResultCount]
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
@DocVRANDFlag bit = null,
@Error nvarchar(max) = null OUTPUT ,
@ResultCount bigint = null OUTPUT 
as
begin
	--set @ResultCount = 0 
	set @Error= ''

	if (@error = '')
	begin	
		
		if (@Category = 'Acceptance')
		begin
			with cte (arn,[DocumentationStatus],[VRStatus])
			as
			(
			select SQLLOADS.arn,				
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
				end as [VRStatus]
			from SQLLOADS
				LEFT JOIN vw_SQLSolicitorDPSubmission solicitor on solicitor.arn = SQLLOADS.arn 
				left join SQLDUMakerDP_SolicitorSubmission sol_dumaker on sol_dumaker.arn = SQLLOADS.arn 
				--left JOIN [dbo].[SQLSolicitorDPSubmission_updateinfo] Sol_UI on Sol_UI.arn = SQLLOADS.arn
				left JOIN SQLDUMakerDP_SolicitorSubmission_Rejected Sol_Rejected on Sol_Rejected.arn = SQLLOADS.arn	
				LEFT JOIN vw_SQLValuerDPSubmission valuer on valuer.arn = SQLLOADS.arn 
				left join SQLDUMakerDP_ValuerSubmission valuer_dumaker on valuer_dumaker.arn = SQLLOADS.arn 
				left JOIN [dbo].SQLDUMakerDP_ValuerSubmission_LoweredOMV Valuer_lowerOMV on Valuer_lowerOMV.arn = SQLLOADS.arn															
			where 
				[DateOfLOAcceptance] between @DateFrom and @DateTo		
				and isnull(MortgateCenterCode,'') like case when @MortgageCentreFlag = 1 then @MortgageCentre else '%' end 
				and isnull(SQLLOADS.SolicitorCode,'') like case when @SolCodeFlag = 1 then @SolCode else '%' end 
				and isnull(SQLLOADS.ValuerCode,'') like case when @ValCodeFlag = 1 then @ValCode else '%' end 	
			)
			select @ResultCount = count(*)
			from cte 
			where cte.VRStatus like case when @VRStatusFlag = 1 then @VRStatus else '%' end 
				and cte.DOcumentationStatus like case when @DocStatusFlag = 1 then @DocStatus else '%' end 			
		end 

		if (@Category = 'Valuer Submission')
		begin
			with cte (arn,[DocumentationStatus],[VRStatus])
			as
			(
			select SQLLOADS.arn,				
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
				end as [VRStatus]
			from SQLLOADS
				LEFT JOIN vw_SQLSolicitorDPSubmission solicitor on solicitor.arn = SQLLOADS.arn 
				left join SQLDUMakerDP_SolicitorSubmission sol_dumaker on sol_dumaker.arn = SQLLOADS.arn 
				--left JOIN [dbo].[SQLSolicitorDPSubmission_updateinfo] Sol_UI on Sol_UI.arn = SQLLOADS.arn
				left JOIN SQLDUMakerDP_SolicitorSubmission_Rejected Sol_Rejected on Sol_Rejected.arn = SQLLOADS.arn	
				LEFT JOIN vw_SQLValuerDPSubmission valuer on valuer.arn = SQLLOADS.arn 
				left join SQLDUMakerDP_ValuerSubmission valuer_dumaker on valuer_dumaker.arn = SQLLOADS.arn 
				left JOIN [dbo].SQLDUMakerDP_ValuerSubmission_LoweredOMV Valuer_lowerOMV on Valuer_lowerOMV.arn = SQLLOADS.arn															
			where 
				--[DateOfLOAcceptance] between @DateFrom and @DateTo	
				valuer.UpdatedDate between @DateFrom and @DateTo	
				and isnull(MortgateCenterCode,'') like case when @MortgageCentreFlag = 1 then @MortgageCentre else '%' end 
				and isnull(SQLLOADS.SolicitorCode,'') like case when @SolCodeFlag = 1 then @SolCode else '%' end 
				and isnull(SQLLOADS.ValuerCode,'') like case when @ValCodeFlag = 1 then @ValCode else '%' end 	
				and isnull(SQLLOADS.ValuationRequired,0) = 1 and valuer.Completed = 1 and Valuer.Status in ('Submitted','Resubmitted')
			)
			select @ResultCount = count(*)
			from cte 
			where cte.VRStatus like case when @VRStatusFlag = 1 then @VRStatus else '%' end 
				and cte.DOcumentationStatus like case when @DocStatusFlag = 1 then @DocStatus else '%' end 			
		end 

		if (@Category = 'Solicitor Submission')
		begin
			with cte (arn,[DocumentationStatus],[VRStatus])
			as
			(
			--submitted case
			select SQLLOADS.arn,				
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
				end as [VRStatus]
			from SQLLOADS
				LEFT JOIN vw_SQLSolicitorDPSubmission solicitor on solicitor.arn = SQLLOADS.arn 
				left join SQLDUMakerDP_SolicitorSubmission sol_dumaker on sol_dumaker.arn = SQLLOADS.arn 
				--left JOIN [dbo].[SQLSolicitorDPSubmission_updateinfo] Sol_UI on Sol_UI.arn = SQLLOADS.arn
				left JOIN SQLDUMakerDP_SolicitorSubmission_Rejected Sol_Rejected on Sol_Rejected.arn = SQLLOADS.arn	
				LEFT JOIN vw_SQLValuerDPSubmission valuer on valuer.arn = SQLLOADS.arn 
				left join SQLDUMakerDP_ValuerSubmission valuer_dumaker on valuer_dumaker.arn = SQLLOADS.arn 
				left JOIN [dbo].SQLDUMakerDP_ValuerSubmission_LoweredOMV Valuer_lowerOMV on Valuer_lowerOMV.arn = SQLLOADS.arn															
			where 
				--[DateOfLOAcceptance] between @DateFrom and @DateTo	
				solicitor.UpdatedDate between @DateFrom and @DateTo	
				and isnull(MortgateCenterCode,'') like case when @MortgageCentreFlag = 1 then @MortgageCentre else '%' end 
				and isnull(SQLLOADS.SolicitorCode,'') like case when @SolCodeFlag = 1 then @SolCode else '%' end 
				and isnull(SQLLOADS.ValuerCode,'') like case when @ValCodeFlag = 1 then @ValCode else '%' end 	
				and solicitor.Completed =1 and solicitor.Status in ('Submitted','Resubmitted')
			union
			-- rejected case
			select SQLLOADS.arn,				
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
				end as [VRStatus]
			from SQLLOADS
				LEFT JOIN vw_SQLSolicitorDPSubmission solicitor on solicitor.arn = SQLLOADS.arn 
				left join SQLDUMakerDP_SolicitorSubmission sol_dumaker on sol_dumaker.arn = SQLLOADS.arn 
				--left JOIN [dbo].[SQLSolicitorDPSubmission_updateinfo] Sol_UI on Sol_UI.arn = SQLLOADS.arn
				left JOIN SQLDUMakerDP_SolicitorSubmission_Rejected Sol_Rejected on Sol_Rejected.arn = SQLLOADS.arn	
				LEFT JOIN vw_SQLValuerDPSubmission valuer on valuer.arn = SQLLOADS.arn 
				left join SQLDUMakerDP_ValuerSubmission valuer_dumaker on valuer_dumaker.arn = SQLLOADS.arn 
				left JOIN [dbo].SQLDUMakerDP_ValuerSubmission_LoweredOMV Valuer_lowerOMV on Valuer_lowerOMV.arn = SQLLOADS.arn															
			where 
				Sol_Rejected.SolicitorUpdatedDate between @DateFrom and @DateTo	
				and isnull(MortgateCenterCode,'') like case when @MortgageCentreFlag = 1 then @MortgageCentre else '%' end 
				and isnull(SQLLOADS.SolicitorCode,'') like case when @SolCodeFlag = 1 then @SolCode else '%' end 
				and isnull(SQLLOADS.ValuerCode,'') like case when @ValCodeFlag = 1 then @ValCode else '%' end 	
				--and solicitor.Completed =1 and solicitor.Status in ('Submitted','Resubmitted')
				and solicitor.Completed =0 and Sol_Rejected.Status in ('Submitted','Resubmitted') and Sol_Rejected.arn is not null
			)
			select @ResultCount = count(*)
			from cte 
			where cte.VRStatus like case when @VRStatusFlag = 1 then @VRStatus else '%' end 
				and cte.DOcumentationStatus like case when @DocStatusFlag = 1 then @DocStatus else '%' end 			
		end 
	end 
end