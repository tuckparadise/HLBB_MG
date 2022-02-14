CREATE   procedure [dbo].[usp_MortgageAppTaskInstance_TaskRedirect]
@workflow nvarchar(max) = null,
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

	if (@arn is null or ltrim(rtrim(@arn)) ='' )
	begin
		set @Error = @Error + 'Please select CRA<br>'
	end 

	if (@NewOwner is null or ltrim(rtrim(@NewOwner)) ='' )
	begin
		set @Error = @Error + 'Please select New Owner<br>'
	end 

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
			
			if (@workflow = 'DPDUMakerValuerApproval')
			begin
				insert into WorkflowHistory
				values ('Valuation Report',@arn,'Case Reassigned',@NewOwner,@Operator,getdate())
			end 
			if (@workflow = 'DPDUMakerSolicitorApproval')
			begin
				insert into WorkflowHistory
				values ('Documentation',@arn,'Case Reassigned',@NewOwner,@Operator,getdate())
			end 
		
		end 
		else
		begin
			set @Error = 'Case does not exists'
		end 
	end 

end