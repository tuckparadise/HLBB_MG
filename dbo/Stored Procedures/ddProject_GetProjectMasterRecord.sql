CREATE     procedure [dbo].[ddProject_GetProjectMasterRecord]
@ID nvarchar(max) = null ,
@error nvarchar(max) = null output 
as
begin
	set @error = ''

	SELECT ID
      ,[Password]
      ,[Status]
      ,[Name]                        
	  ,FORMAT ([CreatedDate], 'dd/MM/yyyy') as [CreatedDate]      
	  ,FORMAT ([UpdatedDate], 'dd/MM/yyyy') as [UpdatedDate]
      ,[CreatedUser]
      ,[UpdatedUser]      
	  ,FORMAT (LastLoginDatetime, 'dd/MM/yyyy') as ProjectLastLoginDatetime
      ,[PasswordForceReset]      
	  ,FORMAT ([PasswordExpiryDate], 'dd/MM/yyyy') as [PasswordExpiryDate]      
	  ,FORMAT ([PasswordExpiryWarningDate], 'dd/MM/yyyy') as [PasswordExpiryWarningDate]      
	  ,FORMAT ([IDLastLockedDatetime], 'dd/MM/yyyy') as [IDLastLockedDatetime]
      ,[AcknowledgementFlag]
      ,[Email]
  FROM [dbo].ddProjectDeveloper
  where ID = @ID 
end