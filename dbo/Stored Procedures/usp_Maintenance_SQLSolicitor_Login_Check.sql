CREATE procedure [dbo].[usp_Maintenance_SQLSolicitor_Login_Check]
@SolicitorCode nvarchar(100),
@SolicitorPassword nvarchar(100),
@error nvarchar(max)  = null output
as
begin

	set @error = ''

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
				set @error = 'Current password is incorrect'
			end 
		end 
		*/
	end 		 
end