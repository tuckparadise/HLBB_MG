﻿CREATE   procedure [dbo].[ddProjectDisbursementSubmission_draft_Master_insert]
@DeveloperCode nvarchar(max) = null ,
@ProjectCode nvarchar(max) = null ,
@PhaseCode nvarchar(max) = null ,
@DeveloperLoginID nvarchar(max) = null ,
@PR_Stage2AFlag bit =null,
@PR_Stage2BFlag bit =null,
@PR_Stage2CFlag bit =null ,
@PR_Stage2DFlag bit =null ,
@PR_Stage2EFlag bit =null ,
@PR_Stage2FFlag bit =null ,
@PR_Stage2GFlag bit =null ,
@PR_Stage2HFlag bit =null ,
@PR_Stage2IFlag bit =null ,
@PR_Stage2JFlag bit =null ,
@PR_Stage2KFlag bit =null ,
@PR_Stage3Flag bit =null ,
@PR_Stage4Flag bit =null ,
@PR_Stage5Flag bit =null ,
@PR_Stage6Flag bit =null ,
@PR_Stage7Flag bit =null ,
@PR_Stage8Flag bit =null ,
@PR_Stage9Flag bit =null ,
@PR_StageOthers nvarchar(max) = null ,
@FinalBillingFlag bit =null ,
@PR_EarliestBillingDueDate datetime = null,
@DraftID bigint = null 
as
begin

	update ddProjectDisbursementSubmission_draft_Master
	set PR_Stage2AFlag = @PR_Stage2AFlag, 
		PR_Stage2BFlag = @PR_Stage2BFlag, 
		PR_Stage2CFlag = @PR_Stage2CFlag, 
		PR_Stage2DFlag = @PR_Stage2DFlag, 
		PR_Stage2EFlag = @PR_Stage2EFlag, 
		PR_Stage2FFlag = @PR_Stage2FFlag, 
		PR_Stage2GFlag = @PR_Stage2GFlag, 
		PR_Stage2HFlag = @PR_Stage2HFlag, 
		PR_Stage2IFlag = @PR_Stage2IFlag, 
		PR_Stage2JFlag = @PR_Stage2JFlag, 
		PR_Stage2KFlag = @PR_Stage2KFlag, 
		PR_Stage3  = @PR_Stage3Flag ,
		PR_Stage4  = @PR_Stage4Flag ,
		PR_Stage5  = @PR_Stage5Flag ,
		PR_Stage6  = @PR_Stage6Flag ,
		PR_Stage7  = @PR_Stage7Flag ,
		PR_Stage8  = @PR_Stage8Flag ,
		PR_Stage9  = @PR_Stage9Flag ,
		PR_StageOthers= @PR_StageOthers,
		FinalBillingFlag = @FinalBillingFlag,			
		UpdatedDate = getdate(),		
		PR_EarliestBillingDueDate = @PR_EarliestBillingDueDate
	where DraftID = @DraftID

end