CREATE   procedure [dbo].[ddProject_DetectProjectCode]
  @DeveloperCode nvarchar(100) = null ,
  @ProjectCodeCount int = null output
  as
  begin
	set @ProjectCodeCount = 0
	
	select distinct projectcode, projectname 
	from sqlloads 
	where DeveloperCode = @DeveloperCode


  end