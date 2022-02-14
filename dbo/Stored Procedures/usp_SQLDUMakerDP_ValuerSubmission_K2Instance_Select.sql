CREATE procedure [dbo].[usp_SQLDUMakerDP_ValuerSubmission_K2Instance_Select] 
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
		valuer.Status as SolicitorStatus ,
		loads.LoanAmount as LoanAmount,
		loads.ApplicantName as ApplicantName,
		--valuer.UpdatedDate as SubmissionDate,
		FORMAT (valuer.UpdatedDate, 'dd/MM/yyyy') as SubmissionDate,		
		DATEDIFF(day, valuer.UpdatedDate, getdate()) as aging	,
		loads.MortgateCenterCode,
		loads.FinancingType,
		loads.TotalFinancingAmount,
		case when dumaker.DUMakerEmail is null then dumaker_lowerOMV.DUMakerEmail else dumaker.DUMakerEmail end as lastmodifieduser,
		--case when dumaker.DUMakerEmail is null then dumaker_lowerOMV.UpdatedDate else dumaker.UpdatedDate end as lastmodifieddate	,
		case when dumaker.DUMakerEmail is null then FORMAT (dumaker_lowerOMV.UpdatedDate, 'dd/MM/yyyy') else FORMAT (dumaker.UpdatedDate, 'dd/MM/yyyy') end as lastmodifieddate	,
		loads.CollateralPurpose as CollateralPurpose
	from SQLvaluerDPSubmission valuer
		--SQLDUMakerDP_ValuerSubmission_K2Instance instance
		--inner join SQLvaluerDPSubmission valuer on valuer.ARN = instance.arn 
		inner join sqlloads loads on loads.arn = valuer.ARN
		left join SQLDUMakerDP_ValuerSubmission dumaker on dumaker.arn = valuer.arn 
		left join SQLDUMakerDP_ValuerSubmission_LoweredOMV dumaker_lowerOMV on dumaker_lowerOMV.arn = valuer.arn 
		inner join MortgageAppTaskInstance  i on i.arn = valuer.ARN
			and i.Workflow = 'DPDUMakerValuerApproval'
	where i.TaskOwner = @AllocatedUser
end