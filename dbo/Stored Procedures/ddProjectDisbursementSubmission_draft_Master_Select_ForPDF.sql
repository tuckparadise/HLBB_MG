--[ddProjectDisbursementSubmission_draft_Master_Select_ForPDF] 27

CREATE     procedure [dbo].[ddProjectDisbursementSubmission_draft_Master_Select_ForPDF]
@DraftID bigint= null 
as
begin

SELECT [PR_Stage2AFlag]
      ,[PR_Stage2BFlag]
      ,[PR_Stage2CFlag]
      ,[PR_Stage2DFlag]
      ,[PR_Stage2EFlag]
      ,[PR_Stage2FFlag]
      ,[PR_Stage2GFlag]
      ,[PR_Stage2HFlag]
      ,[PR_Stage2IFlag]
      ,[PR_Stage2JFlag]
      ,[PR_Stage2KFlag]
      ,[PR_Stage3]
      ,[PR_Stage4]
      ,[PR_Stage5]
      ,[PR_Stage6]
      ,[PR_Stage7]
      ,[PR_Stage8]
      ,[PR_Stage9]
      ,[PR_StageOthers]
      ,[PR_EarliestBillingDueDate]
      ,[PR_TotalBillingAmount]
      --,[FinalBillingFlag]
	  ,case when [FinalBillingFlag] = 1 then 1 when [FinalBillingFlag] = 0 then 0 else null end as [FinalBillingFlag]
	  ,case when [FinalBillingFlag] = 1 then 'Yes' when [FinalBillingFlag] = 0 then 'No' else 'N/A' end as [FinalBillingFlagText]
      ,m.[DeveloperCode] as [DeveloperCode]
      ,m.[ProjectCode] as [ProjectCode]
      ,m.[PhaseCode] as [PhaseCode]
      ,[DeveloperLoginID]
      ,m.[CreatedDate] as [CreatedDate]
      ,m.[UpdatedDate] as [UpdatedDate]
      ,[DraftID]
	  ,ProjectName
	  ,d.name as [DeveloperName]
	  ,ph.PhaseName as [PhaseName]
  FROM [dbo].[ddProjectDisbursementSubmission_draft_Master_Staging] m
  inner join ddProjectDeveloperProjectMapping p on p.DeveloperCode = m.DeveloperCode and p.ProjectCode = m.ProjectCode
  inner join ddProjectDeveloper d on d.ID = m.DeveloperCode 
  inner join ddProjectPhase ph on ph.DeveloperCode = m.DeveloperCode and ph.ProjectCode = m.ProjectCode and ph.PhaseCode = m.PhaseCode  
	where draftID = @DraftID

end