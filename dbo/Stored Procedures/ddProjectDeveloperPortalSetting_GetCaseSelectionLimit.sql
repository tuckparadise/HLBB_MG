create   procedure [dbo].[ddProjectDeveloperPortalSetting_GetCaseSelectionLimit]
@CaseSelectionLimit int output 
as
begin
	set @CaseSelectionLimit = (select [CaseSelectionLimit] from [dbo].[ddProjectDeveloperPortalSetting])
end