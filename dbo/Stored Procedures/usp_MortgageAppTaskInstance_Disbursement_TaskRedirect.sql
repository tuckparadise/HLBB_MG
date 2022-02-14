create      procedure [dbo].[usp_MortgageAppTaskInstance_Disbursement_TaskRedirect]
@role nvarchar(max) = null,
@arn nvarchar(max) = null,
@NewOwner nvarchar(max) = null,
@Operator nvarchar(max) = null,
@Error nvarchar(max) = null output
as
begin

	set @Error = ''

	if (@Operator like 'K2:%')
	begin		
		set @Operator = Stuff(@Operator, 1, 3, '')					

	end 

	if (@role is null or ltrim(rtrim(@role)) ='' )
	begin
		set @Error = @Error + 'Please select Role<br>'
	end 

	if (@arn is null or ltrim(rtrim(@arn)) ='' )
	begin
		set @Error = @Error + 'Please select CRA<br>'
	end 

	if (@NewOwner is null or ltrim(rtrim(@NewOwner)) ='' )
	begin
		set @Error = @Error + 'Please select New Owner<br>'
	end 

	declare @workflow nvarchar(max)

	if (@role = '1Disbursement Maker') set @workflow = 'DisbDUMakerSolicitorApproval'
	if (@role = '2Disbursement Checker') set @workflow = 'DisbDUCheckerSolicitorApproval'
	if (@role = '3RCO Maker') set @workflow = 'DisbRCOMakerSolicitorApproval'
	if (@role = '4RCO Checker') set @workflow = 'DisbRCOCheckerSolicitorApproval'

	if (@Error = '')
	begin
		if exists
		(
			select 1
			from [MortgageAppTaskInstance]
			where workflow = @workflow
				and arn = @arn 
		)
		begin
			insert into MortgageAppTaskInstance_logs
			SELECT [workflow]
				,[arn]
				,[TaskOwner]
				,[CreatedDate]
				,getdate()
				,[CreatedUser]
				,@Operator 
				,null
				,null
			from [MortgageAppTaskInstance]
			where workflow = @workflow
				and arn = @arn 

			update [MortgageAppTaskInstance]
			set [TaskOwner] = @NewOwner,
				UpdatedUser = @Operator,
				UpdatedDate = getdate()
			where workflow = @workflow
				and arn = @arn 
			
			if (@workflow = 'DisbDUMakerSolicitorApproval')
			begin
				insert into WorkflowHistory
				values ('Disbursement By Solicitor- Disbursement Maker',@arn,'Case Reassigned',@NewOwner,@Operator,getdate())
			end 
			if (@workflow = 'DisbDUCheckerSolicitorApproval')
			begin
				insert into WorkflowHistory
				values ('Disbursement By Solicitor- Disbursement Checker',@arn,'Case Reassigned',@NewOwner,@Operator,getdate())
			end 
			
			if (@workflow = 'DisbRCOMakerSolicitorApproval')
			begin
				insert into WorkflowHistory
				values ('Disbursement By Solicitor- RCO Maker',@arn,'Case Reassigned',@NewOwner,@Operator,getdate())
			end 

			if (@workflow = 'DisbRCOCheckerSolicitorApproval')
			begin
				insert into WorkflowHistory
				values ('Disbursement By Solicitor- RCO Checker',@arn,'Case Reassigned',@NewOwner,@Operator,getdate())
			end 

		end 
		else
		begin
			set @Error = 'Case does not exists'
		end 
	end 

end