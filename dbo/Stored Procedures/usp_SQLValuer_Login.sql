CREATE procedure [dbo].[usp_SQLValuer_Login]
@ValuerCode nvarchar(100) = null,
@ValuerPassword nvarchar(max) = null,
@error nvarchar(max)  = null output
as
begin

	set @error = ''

	
	if (		
		@ValuerCode is null or
		rtrim(ltrim(@ValuerCode)) = '' 		
	)
	begin
		set @Error = 'Please enter Valuer Code'
	end 
	else
	begin
		if (		
			@ValuerPassword is null or
			rtrim(ltrim(@ValuerPassword)) = '' 		
		)
		begin
			set @Error = 'Please enter Password'
		end 
		else
		begin
			if not exists 
			(
				select 1 
				from dbo.SQLValuer
				where ValuerCode = @ValuerCode 	
			)
			begin
				set @error = 'Valuer Code does not exists in the system'
			end 
			else 
			begin
				if not exists 
				(
					select 1 
					from dbo.SQLValuer
					where ValuerCode = @ValuerCode 
						and Status = 'Active'	
				)
				begin
					set @error = 'Valuer Code is not active in the system'
				end 
				/*
				else
				begin
					if not exists 
					(
						select 1 
						from dbo.SQLValuer
						where ValuerCode = @ValuerCode 
							and Status = 'Active'	
							and ValuerPassword = @ValuerPassword
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