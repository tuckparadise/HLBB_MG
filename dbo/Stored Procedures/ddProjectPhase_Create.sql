CREATE       procedure [dbo].[ddProjectPhase_Create]
@PhaseCode nvarchar(max) = null,
@PhaseName nvarchar(max) = null,
@ProjectCode nvarchar(max) = null,
@ProjectName nvarchar(max) = null,
@DeveloperCode nvarchar(max) = null,
@Email nvarchar(max) = null, 	 	
@SADA bit = null, 	
@LoginUserEmail nvarchar(max) = null, 	
@Error nvarchar(max) = null output 
as
begin

	set @Error = ''
	
	if (
		@PhaseCode is null or
		rtrim(ltrim(@PhaseCode)) = '' or  
		--@Password is null or
		--rtrim(ltrim(@Password)) = '' or 
		@PhaseName is null or
		rtrim(ltrim(@PhaseName)) = '' or
		--@Email is null or
		--rtrim(ltrim(@Email)) = '' or 
		@SADA is null or
		rtrim(ltrim(@SADA)) = '' or 
		@DeveloperCode is null or
		rtrim(ltrim(@DeveloperCode)) = '' or 
		@ProjectCode is null or
		rtrim(ltrim(@ProjectCode)) = ''  
		--@ProjectName is null or
		--rtrim(ltrim(@ProjectName)) = '' 
	)
	begin
		set @Error = 'Please fill in all compulsory fields'
	end 
	
	if (@Error = '')
	begin
		if exists 
		(
			select 1
			from [ddProjectPhase]
			where				
				--DeveloperCode = @DeveloperCode
				--and ProjectCode = @ProjectCode 
				--and 
				PhaseCode = @PhaseCode 
		)
		begin
			set @Error = 'Duplicate Phase Code'
		end 
	end 
end