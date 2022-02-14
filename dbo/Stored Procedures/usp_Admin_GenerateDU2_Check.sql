CREATE procedure [dbo].[usp_Admin_GenerateDU2_Check]
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
				from SQLDUMakerDP_SolicitorSubmission_Rejected
				where arn = @arn 
			)
			begin
				set @output = 'Cannot generate DU2 letter for this case at this moment'
			end 
		end
	end 
	

	
  end