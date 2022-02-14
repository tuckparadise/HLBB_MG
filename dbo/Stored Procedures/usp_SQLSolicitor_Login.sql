CREATE procedure [dbo].[usp_SQLSolicitor_Login]
@SolicitorCode nvarchar(100) = null,
@SolicitorPassword nvarchar(max) = null,
@error nvarchar(max)  = null output
as
begin

	set @error = ''

	
	if (		
		@SolicitorCode is null or
		rtrim(ltrim(@SolicitorCode)) = '' 		
	)
	begin
		set @Error = 'Please enter Solicitor Code'
	end 
	else
	begin
		if (		
			@SolicitorPassword is null or
			rtrim(ltrim(@SolicitorPassword)) = '' 		
		)
		begin
			set @Error = 'Please enter Password'
		end 
		else
		begin
			if not exists 
			(
				select 1 
				from dbo.SQLSolicitor
				where SolicitorCode = @SolicitorCode 	
			)
			begin
				set @error = 'Solicitor Code does not exists in the system'
			end 
			else 
			begin
				if not exists 
				(
					select 1 
					from dbo.SQLSolicitor
					where SolicitorCode = @SolicitorCode 
						and Status = 'Active'	
				)
				begin
					set @error = 'Solicitor Code is not active in the system'
				end 
				/*
				else
				begin
					if not exists 
					(
						select 1 
						from dbo.SQLSolicitor
						where SolicitorCode = @SolicitorCode 
							and Status = 'Active'	
							and SolicitorPassword = @SolicitorPassword
					)
					begin
						set @error = 'Password is incorrect'
					end 
				end 
				*/
			end 	
		end 
	end 
		 
end