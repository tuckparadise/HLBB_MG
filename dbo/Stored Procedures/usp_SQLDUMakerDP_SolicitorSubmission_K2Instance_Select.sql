CREATE procedure [dbo].[usp_SQLDUMakerDP_SolicitorSubmission_K2Instance_Select] 
@AllocatedUser nvarchar(max)
as
begin
	
	if (@AllocatedUser like 'K2:%')
	begin		
		set @AllocatedUser = Stuff(@AllocatedUser, 1, 3, '')
			
		--select @index = CHARINDEX('\', @UserName)

		--set @UserName = Stuff(@UserName, 1,@index, '')

	end 

	select i.arn as arn,
		--instance.EventInstanceStartDate as EventInstanceStartDate,
		FORMAT (i.Createddate, 'dd/MM/yyyy') as EventInstanceStartDate,
		FORMAT (i.UpdatedDate, 'dd/MM/yyyy') as EventInstanceLastModifiedDate,
		i.createduser as createduser,
		i.updateduser as updateduser,
		solicitor.Status as SolicitorStatus ,
		loads.LoanAmount as LoanAmount,
		loads.ApplicantName as ApplicantName,
		--solicitor.UpdatedDate as SubmissionDate,
		FORMAT (solicitor.UpdatedDate, 'dd/MM/yyyy') as SubmissionDate,		
		DATEDIFF(day, solicitor.UpdatedDate, getdate()) as aging ,
		loads.MortgateCenterCode,
		loads.FinancingType,
		loads.TotalFinancingAmount,
		--case when dumaker.DUMakerEmail is null then dumaker.DUMakerEmail else dumaker_reject.DUMakerEmail end as lastmodifieduser,
		--case when dumaker.DUMakerEmail is null then dumaker.UpdatedDate else dumaker_reject.UpdatedDate end as lastmodifieddate		
		case when dumaker.DUMakerEmail is null then dumaker_reject.DUMakerEmail else dumaker.DUMakerEmail end as lastmodifieduser,
		--case when dumaker.DUMakerEmail is null then dumaker_reject.UpdatedDate else dumaker.UpdatedDate end as lastmodifieddate	,
		case when dumaker.DUMakerEmail is null then FORMAT (dumaker_reject.UpdatedDate, 'dd/MM/yyyy') else FORMAT (dumaker.UpdatedDate, 'dd/MM/yyyy') end as lastmodifieddate	,
		loads.CollateralPurpose as CollateralPurpose
	--from SQLDUMakerDP_SolicitorSubmission_K2Instance instance
	from SQLSolicitorDPSubmission solicitor
		--inner join SQLSolicitorDPSubmission solicitor on solicitor.ARN = instance.arn 
		inner join sqlloads loads on loads.arn = solicitor.ARN
		left join SQLDUMakerDP_SolicitorSubmission dumaker on dumaker.arn = solicitor.arn 
		left join SQLDUMakerDP_SolicitorSubmission_Rejected dumaker_reject on dumaker_reject.arn = solicitor.arn 
		inner join MortgageAppTaskInstance i on i.arn = solicitor.ARN
			and i.Workflow = 'DPDUMakerSolicitorApproval'
	where i.TaskOwner = @AllocatedUser 
	
	
end