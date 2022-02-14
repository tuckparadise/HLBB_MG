CREATE procedure [dbo].[usp_Maintenance_SQLValuer_Login_Check]
@ValuerCode nvarchar(100),
@ValuerPassword nvarchar(100),
@error nvarchar(max)  = null output
as
begin

	set @error = ''

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
				set @error = 'Current password is incorrect'
			end 
		end 
		*/
	end 		 
end