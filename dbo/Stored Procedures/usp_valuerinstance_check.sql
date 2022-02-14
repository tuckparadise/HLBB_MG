CREATE procedure [dbo].[usp_valuerinstance_check]
  @arn nvarchar(100) = null,
  @error nvarchar(max) = null output 
  as
  begin
	set @error = ''

	if exists 
	(
		select 1
		from MortgageAppTaskInstance
		where Workflow= 'DPDUMakerValuerApproval'
			and arn = @arn
			
	)
	begin
		set @error = 'Instance Existed'
	end 

	/*
	if exists 
	(
		select * 
		from [dbo].[K2Instance]
		where Workflow= 'DPDUMakerValuerApproval'
			and arn =  @arn
	)
	begin	
		select K2SerialNumber as  K2SerialNumber
		from [dbo].[K2Instance]
		where Workflow= 'DPDUMakerValuerApproval'
			and arn =  @arn
	end 
	
	select K2SerialNumber as  K2SerialNumber
		from [dbo].[K2Instance]
		where Workflow= 'DPDUMakerValuerApproval'
			and arn =  @arn
	*/

  end