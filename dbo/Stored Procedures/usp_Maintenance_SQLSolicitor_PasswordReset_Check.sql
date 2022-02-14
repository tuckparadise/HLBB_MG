CREATE procedure [dbo].[usp_Maintenance_SQLSolicitor_PasswordReset_Check]
@SolicitorCode nvarchar(100) = null,
@error nvarchar(max)  = null output
as
begin

	set @Error = ''

	if (		
		@SolicitorCode is null or
		rtrim(ltrim(@SolicitorCode)) = '' 		
	)
	begin
		set @Error = 'Please fill in Solicitor Code'
	end 
	else
	begin 
		if not exists
		(
			select 1
			from SQLSolicitor
			where SolicitorCode = @SolicitorCode
		)
		begin
			set @Error = 'Solicitor Code does not exists in the system'
		end 
		else
		begin
			if not exists
			(
				select 1
				from SQLSolicitor
				where SolicitorCode = @SolicitorCode
					and Status = 'Active'
			)
			begin
				set @Error = 'Solicitor Code is not Active in the system'
			end 
			else 
			begin	
				if not exists 
				(					
					select 1
					from (select top 100 * from sqlloads where solicitorcode = @solicitorcode order by updateddate desc) tbl 
					where tbl.SolicitorEmail is not null or ltrim(rtrim(solicitoremail)) <> ''
				)
				begin
					set @Error = 'Cannot locate email for the Solicitor Code. Please check with the bank'
				end 
			end 
		end 
	end 

 
end