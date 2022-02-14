CREATE procedure [dbo].[usp_Maintenance_SQLValuer_PasswordReset_Check]
@ValuerCode nvarchar(100)  = null,
@error nvarchar(max)  = null output
as
begin

	set @Error = ''

	if (		
		@ValuerCode is null or
		rtrim(ltrim(@ValuerCode)) = '' 		
	)
	begin
		set @Error = 'Please fill in Valuer Code'
	end 
	else
	begin 
		if not exists
		(
			select 1
			from SQLValuer
			where ValuerCode = @ValuerCode
		)
		begin
			set @Error = 'Valuer Code does not exists in the system'
		end 
		else
		begin
			if not exists
			(
				select 1
				from SQLValuer
				where ValuerCode = @ValuerCode
					and Status = 'Active'
			)
			begin
				set @Error = 'Valuer Code is not Active in the system'
			end 
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
		end 
	end 

 
end