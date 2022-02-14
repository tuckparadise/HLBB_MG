create     procedure [dbo].[ddProject_DetectProjectCode_GetCount]
  @DeveloperCode nvarchar(100) = null ,
  @ProjectCodeCount bigint = null output
  as
  begin	
	set @ProjectCodeCount = (select count(distinct projectcode) from sqlloads where DeveloperCode = @DeveloperCode )	

  end