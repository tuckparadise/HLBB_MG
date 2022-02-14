CREATE       procedure [dbo].[ddProjectPhase_GetProjectMasterRecord]
@ID bigint = null ,
@error nvarchar(max) = null output 
as
begin
	set @error = ''

	SELECT [PhaseCode]
      ,[PhaseName]
      ,[ProjectCode]
      ,[DeveloperCode]
      ,[PhaseEmail]
      ,[SADAFlag]
      --,[CreatedDate]
	  ,FORMAT ([CreatedDate], 'dd/MM/yyyy') as [CreatedDate]
      ,[UpdatedDate]
	  --,FORMAT ([CreatedDate], 'dd/MM/yyyy') as [CreatedDate]
      ,[CreatedUser]
      ,[UpdatedUser]
      ,[SurrogateID]
  FROM [dbo].[ddProjectPhase]
  where [SurrogateID] = @ID
end