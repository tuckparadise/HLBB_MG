create   procedure [dbo].[tbd_ddProjectDisbursementSubmission_draft_Master_save]
@ProjectCode nvarchar(max) = null
,@PR_Stage2AFlag bit = null 
,@PR_Stage2BFlag bit = null 
,@PR_Stage2CFlag bit = null 
,@PR_Stage2DFlag bit = null 
,@PR_Stage2EFlag bit = null 
,@PR_Stage2FFlag bit = null 
,@PR_Stage2GFlag bit = null 
,@PR_Stage2HFlag bit = null 
,@PR_StageOthers nvarchar(max) = null 
,@PR_FinalBillingFlag bit = null 
,@Error nvarchar(max) = null output 
as
begin
	update ddProjectDisbursementSubmission_draft_Master
	set PR_Stage2AFlag = PR_Stage2AFlag, 
		PR_Stage2BFlag = PR_Stage2BFlag,
		PR_Stage2CFlag = PR_Stage2CFlag,
		PR_Stage2DFlag = PR_Stage2DFlag,
		PR_Stage2EFlag = PR_Stage2EFlag,
		PR_Stage2FFlag = PR_Stage2FFlag,
		PR_Stage2GFlag = PR_Stage2GFlag,
		PR_Stage2HFlag = PR_Stage2HFlag
	where projectcode = @ProjectCode

end