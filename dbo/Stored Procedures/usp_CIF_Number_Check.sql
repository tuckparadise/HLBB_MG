CREATE procedure [dbo].[usp_CIF_Number_Check]
@cif nvarchar(max) = NULL,
@error nvarchar(max) = NULL OUTPUT 
as
begin	

	set @error = ''

	if (ltrim(rtrim(@cif)) = '')
	begin
		set @cif = '100'
	end 

	if (isnumeric(@cif) <> 1)
	begin
		set @error = 'Solicitor CIF Number field must be a number'
	end 
	
end