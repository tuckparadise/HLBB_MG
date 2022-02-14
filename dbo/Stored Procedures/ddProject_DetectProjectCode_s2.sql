create     procedure [dbo].[ddProject_DetectProjectCode_s2]  
@ProjectCode nvarchar(max) = null ,
  @ProjectName nvarchar(max) = null 
  as
  begin
	
	insert into [ddProjectAutoDetectProjectCode] (projectcode,projectName)
	values (@ProjectCode, @ProjectName)

  end