CREATE   procedure [dbo].[ddMaintenance_SQLProject_PasswordReset_Check]
@ID nvarchar(100)  = null,
@error nvarchar(max)  = null output
as
begin

	set @Error = ''
	
	if (		
		@ID is null or
		rtrim(ltrim(@ID)) = '' 		
	)
	begin
		set @Error = 'Please fill in ID'
	end 
	else
	begin 
		if not exists
		(
			select 1
			from ddProject_vw_DeveloperLogin
			where ID = @ID
		)
		begin
			set @Error = 'ID does not exists in the system'
		end 
		else
		begin
			if not exists
			(
				select 1
				from ddProject_vw_DeveloperLogin
				where ID = @ID
					and Status = 'Active'
			)
			begin
				set @Error = 'ID is not Active in the system'
			end 
			/*
			else 
			begin	
				if not exists 
				(					
					select 1
					from (select top 100 * from sqlloads where Valuercode = @Valuercode order by updateddate desc) tbl 
					where tbl.ValuerEmail is not null or ltrim(rtrim(Valueremail)) <> ''
				)
				begin
					set @Error = 'Cannot locate email for the Valuer Code. Please check with the bank'
				end 
			end 
			*/
		end 
	end 

 
end