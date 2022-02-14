CREATE procedure [dbo].[usp_Admin_GenerateSolicitorForm_Check]
  @arn nvarchar(max)=NULL ,
  @output nvarchar(max) = NULL OUTPUT 
  as
  begin

	set @output = ''

	
	if (ltrim(rtrim(@arn)) = '' or @arn is null)
	begin
		set @output = 'Please fill in ARN'
	end 
	else
	begin
		
		if not exists
		(
			select 1 
			from SQLLOADS
			where arn = @arn 
		)
		begin
			set @output = 'ARN does not exists in the system'
		end 
		else
		begin
			if not exists
			(
				select 1
				from SQLDUMakerDP_SolicitorSubmission
				where status = 'Completed'
					and arn = @arn 
			)
			begin
				set @output = 'Unable to print form for this ARN at this moment'
			end 
			
		end 
		
	end 

	
	
  end