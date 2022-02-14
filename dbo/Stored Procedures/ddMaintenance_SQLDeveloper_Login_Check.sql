CREATE   procedure [dbo].[ddMaintenance_SQLDeveloper_Login_Check]
@ProjectCode nvarchar(100),
@ProjectPassword nvarchar(100),
@error nvarchar(max)  = null output
as
begin

	set @error = ''

	if not exists 
	(
		select 1 
		from dbo.ddProject_vw_DeveloperLogin
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
			from dbo.ddProject_vw_DeveloperLogin
			where ID = @ProjectCode 
				and Status = 'Active'	
		)
		begin
			set @error = 'ID is not active in the system'
		end 
		
	end 		 
end