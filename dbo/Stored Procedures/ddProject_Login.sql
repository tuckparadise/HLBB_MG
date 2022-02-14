CREATE   procedure [dbo].[ddProject_Login]
@ProjectCode nvarchar(100) = null,
@ProjectPassword nvarchar(max) = null,
@error nvarchar(max)  = null output
as
begin

	set @error = ''

	
	if (		
		@ProjectCode is null or
		rtrim(ltrim(@ProjectCode)) = '' 		
	)
	begin
		set @Error = 'Please enter ID'
	end 
	else
	begin
		if (		
			@ProjectPassword is null or
			rtrim(ltrim(@ProjectPassword)) = '' 		
		)
		begin
			set @Error = 'Please enter Password'
		end 
		else
		begin
			if not exists 
			(
				select 1 
				from ddProject_vw_DeveloperLogin
				where ID = @ProjectCode 	
			)
			begin
				set @error = 'ID does not exists in the system'
			end 
			else 
			begin
				if not exists 
				(
					select 1 
					from ddProject_vw_DeveloperLogin
					where ID = @ProjectCode 
						and Status = 'Active'	
				)
				begin
					set @error = 'ID is not active in the system'
				end 				
			end 	
		end 
	end 
		 
end