CREATE     procedure [dbo].[ddProjectPhase_GetList]
as
begin	
	SELECT [PhaseCode]
      ,[PhaseName]
      ,[ProjectCode]
      ,[DeveloperCode]
      ,[PhaseEmail]
      ,[SADAFlag]
	  ,case [SADAFlag] when 1 then 'Yes' else 'No' end as [SADAFlagYesNo]
	  ,FORMAT (ddProjectPhase.CreatedDate, 'dd/MM/yyyy') as CreatedDate
	  ,FORMAT (ddProjectPhase.UpdatedDate, 'dd/MM/yyyy') as UpdatedDate     
      ,ddProjectPhase.[CreatedUser]
      --,[UpdatedUser]
	  ,InternalUser.UserFullName as [UpdatedUser]
	  ,SurrogateID
	  ,dev.Name as DeveloperName
  FROM [dbo].ddProjectPhase
  left join ddProjectDeveloper dev on dev.id = ddProjectPhase.DeveloperCode  
  left join InternalUser on InternalUser.UserName = case when ddProjectPhase.UpdatedUser like 'K2:%' then Stuff(ddProjectPhase.UpdatedUser , 1, 3, '') else ddProjectPhase.UpdatedUser  end 
end