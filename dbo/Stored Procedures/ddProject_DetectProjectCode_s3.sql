create     procedure [dbo].[ddProject_DetectProjectCode_s3]
  @devcode nvarchar(max) = null
  as
  begin

	insert into 	[ddProjectAutoDetectProjectCode] (projectcode, projectname)
	select distinct projectcode, projectname
	from sqlloads 
	where DeveloperCode = @devcode
		and ProjectCode not in (select projectcode from [ddProjectAutoDetectProjectCode])

	select projectcode, projectname 
	from [ddProjectAutoDetectProjectCode]
  end