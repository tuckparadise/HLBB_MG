﻿CREATE procedure [dbo].[usp_valuerinstance_remove]
  @arn nvarchar(100) = null,
  @error nvarchar(max) = null output 
  as
  begin
	
	set @error = ''

	/*
	delete from [dbo].[K2Instance]
	where Workflow= 'DPDUMakerValuerApproval'
		and arn =  @arn	
	*/
	
	delete from MortgageAppTaskInstance
	where Workflow= 'DPDUMakerValuerApproval'
		and arn = @arn

	-- dumaker submission 
	delete from SQLDUMakerDP_ValuerSubmission
	where arn = @arn 
	
	-- dumaker submission (lower omv)
	delete from SQLDUMakerDP_ValuerSubmission_LoweredOMV
	where arn = @arn 

		/*
		-- valuer submission
		delete from SQLValuerDPSubmission
		where arn = @arn

		delete from SQLValuerDPSubmissionRemark
		where arn = @arn

		-- delete valuer in staging 
		delete from SQLValuerDPSubmission_Staging
		where arn = @arn

		delete from SQLValuerDPSubmissionRemark_Staging
		where arn = @arn	
	
		declare @NewValCode nvarchar(max) , @RequiredValuation bit 

		select @NewValCode = [ValuerCode], @RequiredValuation = ValuationRequired
		from [SQLLOADS]
		where arn = @arn 

		if (@RequiredValuation = 1)
		begin
			insert into WorkflowHistory
			values ('Valuation Report',@arn,'Change of Valuer',@NewValCode,null,getdate())
		end 
		*/
	

	
  end