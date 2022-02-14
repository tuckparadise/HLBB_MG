CREATE          procedure [dbo].[aa_SolDisbursementSubmission_DisMaker_Main]
@arn nvarchar(max) = null ,
@DisbursementMakerEmailAddress  nvarchar(max) = null ,
@DisbursementMakerDecision nvarchar(max) = null ,
@DisbursementMakerSubmissionCompleted nvarchar(max) = null ,
@DisbursementMakerRejectionReason nvarchar(max) = null ,
@BalanceAdviceLetterApplicableFlag bit = null 
,@UrgentFlag bit = null 
,@LS_RedemptionDueDateFlag bit = null 
,@LS_RedemptionDueDate datetime = null 
,@LS_ExtendedCompletionDateFlag bit = null 
,@LS_CompletionDate datetime = null 
,@LS_ExtendedCompletionDate datetime = null 
,@PR_DeveloperBillingDueDateFlag bit = null 
,@PR_Stage2AFlag bit = null 
,@PR_Stage2BFlag bit = null 
,@PR_Stage2CFlag bit = null 
,@PR_Stage2DFlag bit = null 
,@PR_Stage2EFlag bit = null 
,@PR_Stage2FFlag bit = null 
,@PR_Stage2GFlag bit = null 
,@PR_Stage2HFlag bit = null 
,@PR_StageOthers nvarchar(max) = null 
,@PR_EarliestBillingDueDate datetime = null 
,@PR_TotalBillingAmount nvarchar(max) = null 
,@PR_AnyBridgingFinancierFlag bit = null 
,@PR_BridgingFinancier nvarchar(max) = null 
,@PR_BridgingFinancierEmailAddress nvarchar(max) = null 
,@PR_BridgingFinancierRedemptionSum nvarchar(max) = null 
,@PR_RedemptionPaymentAccountNumber nvarchar(max) = null 
,@PR_BeneficiaryBank nvarchar(max) = null 
,@PR_BridgingFinancierRedemptionExpiryDate datetime = null 
,@PR_DeveloperName nvarchar(max) = null 
,@PR_DeveloperEmailAddress nvarchar(max) = null 
,@PR_DeveloperPIC nvarchar(max) = null 
,@PR_DeveloperHDA nvarchar(max) = null 
,@PR_DeveloperHDABank nvarchar(max) = null 
,@LF_PayeeName nvarchar(max) = null 
,@LF_BilledAmount nvarchar(max) = null 
,@LF_AccountNumber nvarchar(max) = null 
,@LF_Bank nvarchar(max) = null 
,@LF_PaymentDescription nvarchar(max) = null 
,@LF_PaymentMode nvarchar(max) = null 
,@PR_Stage2IFlag bit = null 
,@PR_Stage2JFlag bit = null 
,@PR_Stage2KFlag bit = null 
,@PR_Stage3 bit = null 
,@PR_Stage4 bit = null 
,@PR_Stage5 bit = null 
,@PR_Stage6 bit = null 
,@PR_Stage7 bit = null 
,@PR_Stage8 bit = null 
,@PR_Stage9 bit = null 
,@SadaFlag bit = null 
,@ConfirmationOfArchitectFlag bit = null 
,@ConfirmationOfArchitectRemark nvarchar(max) = null 
,@FinalBillingFlag bit = null 
,@SPADate datetime = null 
,@SPAConstructionPeriodInMonths int = null 
,@ExtendedConstructionPeriodInMonths int = null 
,@Error nvarchar(max) = null output 
as
begin	
	set @Error = ''

	
	if (@DisbursementMakerEmailAddress like 'K2:%')
	begin		
		set @DisbursementMakerEmailAddress = Stuff(@DisbursementMakerEmailAddress, 1, 3, '')
			
		--select @index = CHARINDEX('\', @UserName)

		--set @UserName = Stuff(@UserName, 1,@index, '')

	end 

	--validate data types 
	/*
	if (@PR_TotalBillingAmount  is not null or ltrim(rtrim(@PR_TotalBillingAmount)) <> '')
	begin
		
		if (isnumeric(@PR_TotalBillingAmount) = 0)
		begin
			set @error = @error + 'Total Billing Amount in the Billing Related Information tab must be a number<br>'
		end 
		
	end 
	*/

	if (@PR_BridgingFinancierRedemptionSum  is not null or ltrim(rtrim(@PR_BridgingFinancierRedemptionSum)) <> '')
	begin
		if (isnumeric(@PR_BridgingFinancierRedemptionSum) = 0)
		begin
			set @error = @error + 'Bridging Financier Redemption Sum in the Bridging Financier / Developer Information tab must be a number<br>'
		end 
	end 

	/* 20210327- remove integer checking 
	if (@PR_RedemptionPaymentAccountNumber  is not null or ltrim(rtrim(@PR_RedemptionPaymentAccountNumber)) <> '')
	begin
		if (isnumeric(@PR_RedemptionPaymentAccountNumber) = 0)
		begin
			set @error = @error + 'Redemption Payment Account Number in the Bridging Financier / Developer Information tab must be a number<br>'
		end 
	end 
	*/

	if (@LF_BilledAmount  is not null or ltrim(rtrim(@LF_BilledAmount)) <> '')
	begin
		if (isnumeric(@LF_BilledAmount) = 0)
		begin
			set @error = @error + 'Billed Amount in the Details of Legal Fee Financed by Bank tab must be a number<br>'
		end 
	end 

	if (@LF_AccountNumber  is not null or ltrim(rtrim(@LF_AccountNumber)) <> '')
	begin
		if (isnumeric(@LF_AccountNumber) = 0)
		begin
			set @error = @error + 'Account Number in the Details of Legal Fee Financed by Bank tab must be a number<br>'
		end 
	end 

	declare @SolicitorSubmissionOption nvarchar(max)
	--declare @DisbursementManner nvarchar(max)

	select @SolicitorSubmissionOption  = SolicitorSubmissionOption
	from aaSolDisbursementSubmission_DisMakerSubmission
	where arn = @arn

	if (@PR_BridgingFinancierEmailAddress  is not null or ltrim(rtrim(@PR_BridgingFinancierEmailAddress)) <> '')
	begin		
		IF NOT (
				CHARINDEX(' ',LTRIM(RTRIM(@PR_BridgingFinancierEmailAddress))) = 0 
		AND  LEFT(LTRIM(@PR_BridgingFinancierEmailAddress),1) <> '@' 
		AND  RIGHT(RTRIM(@PR_BridgingFinancierEmailAddress),1) <> '.' 
		AND  CHARINDEX('.',@PR_BridgingFinancierEmailAddress ,CHARINDEX('@',@PR_BridgingFinancierEmailAddress)) - CHARINDEX('@',@PR_BridgingFinancierEmailAddress ) > 1 
		AND  LEN(LTRIM(RTRIM(@PR_BridgingFinancierEmailAddress ))) - LEN(REPLACE(LTRIM(RTRIM(@PR_BridgingFinancierEmailAddress)),'@','')) = 1 
		AND  CHARINDEX('.',REVERSE(LTRIM(RTRIM(@PR_BridgingFinancierEmailAddress)))) >= 3 
		AND  (CHARINDEX('.@',@PR_BridgingFinancierEmailAddress ) = 0 AND CHARINDEX('..',@PR_BridgingFinancierEmailAddress ) = 0)
		)
		begin
			set @error = @error + 'Bridging Financier Email Address in the Bridging Financier / Developer Information tab is not in correct format<br>'
		end 
	end 

	/*
	if (@PR_DeveloperEmailAddress  is not null or ltrim(rtrim(@PR_DeveloperEmailAddress)) <> '')
	begin		
		IF NOT (
				CHARINDEX(' ',LTRIM(RTRIM(@PR_DeveloperEmailAddress))) = 0 
		AND  LEFT(LTRIM(@PR_DeveloperEmailAddress),1) <> '@' 
		AND  RIGHT(RTRIM(@PR_DeveloperEmailAddress),1) <> '.' 
		AND  CHARINDEX('.',@PR_DeveloperEmailAddress ,CHARINDEX('@',@PR_DeveloperEmailAddress)) - CHARINDEX('@',@PR_DeveloperEmailAddress ) > 1 
		AND  LEN(LTRIM(RTRIM(@PR_DeveloperEmailAddress ))) - LEN(REPLACE(LTRIM(RTRIM(@PR_DeveloperEmailAddress)),'@','')) = 1 
		AND  CHARINDEX('.',REVERSE(LTRIM(RTRIM(@PR_DeveloperEmailAddress)))) >= 3 
		AND  (CHARINDEX('.@',@PR_DeveloperEmailAddress ) = 0 AND CHARINDEX('..',@PR_DeveloperEmailAddress ) = 0)
		)
		begin
			set @error = @error + 'Developer Email Address in the Bridging Financier / Developer Information tab is not in correct format<br>'
		end 
	end 
	*/

	-- pr related validation 
	declare @disbursementmanner nvarchar(100)
	select @disbursementmanner = disbursementmanner
	from sqlloads 
	where arn = @arn 

	if (@DisbursementMakerSubmissionCompleted = 1 and @disbursementmanner='PR' and @DisbursementMakerDecision = 'All In Order')
	begin

		-- 20211204 - check if phase code added into the system 
		declare @phasecode2 nvarchar(max) 
		declare @projectcode2 nvarchar(max) 
		declare @devcode2 nvarchar(max) 

		set @phasecode2 = (select phasecode from SQLLOADS where arn = @arn)
		set @projectcode2 = (select ProjectCode from SQLLOADS where arn = @arn)
		set @devcode2 = (select DeveloperCode from SQLLOADS where arn = @arn)
			
		if not exists 
		(
			select 1 
			from ddProjectPhase
			where phasecode = @phasecode2 and projectcode = @projectcode2 and developercode = @devcode2				
		)
		begin		
			set @Error = @Error + 'No phase code set in the parameter. Please check with MG Admin / CRA.<br>'	
		end 
		-- 20211204 - check if phase code added into the system 

		if (@BalanceAdviceLetterApplicableFlag is null)
		begin
			set @error = @error + 'Please fill in Balance Letter Applicable field<br>'
		end 		

		/*
		if (@PR_DeveloperName  is null or ltrim(rtrim(@PR_DeveloperName)) = '')
		begin
			set @error = @error + 'Please fill in Developer Name field in the Bridging Financier/ Developer Information tab<br>'
		end 
		*/

		if (@PR_DeveloperHDABank  is null or ltrim(rtrim(@PR_DeveloperHDABank)) = '')
		begin
			set @error = @error + 'Please fill in Developer HDA Bank field in the Bridging Financier/ Developer Information tab<br>'
		end 

		if (@PR_DeveloperHDA  is null or ltrim(rtrim(@PR_DeveloperHDA)) = '')
		begin
			set @error = @error + 'Please fill in Developer HDA Account field in the Bridging Financier/ Developer Information tab<br>'
		end 

		--20210324- start bridging financial validation fixes 
		/*
		if (@PR_DeveloperPIC  is null or ltrim(rtrim(@PR_DeveloperPIC)) = '')
		begin
			set @error = @error + 'Please fill in Developer Person-In-Charge field in the Bridging Financier/ Developer Information tab<br>'
		end 

		if (@PR_DeveloperEmailAddress  is null or ltrim(rtrim(@PR_DeveloperEmailAddress)) = '')
		begin
			set @error = @error + 'Please fill in Developer Email Address field in the Bridging Financier/ Developer Information tab<br>'
		end 
		*/
		--20210324- end bridging financial validation fixes 

		if (@PR_DeveloperBillingDueDateFlag =1)
		begin
			/*
			if (@PR_StageOthers is null or ltrim(rtrim(@PR_StageOthers)) = '')
			begin
				set @error = @error + 'Please fill in Remarks field in the Billing Related Information tab<br>'
			end 
			*/

			if (@PR_EarliestBillingDueDate is null or ltrim(rtrim(@PR_EarliestBillingDueDate)) = '')
			begin
				set @error = @error + 'Please fill in Earliest Billing Due Date field in the Current Billing Related Information tab<br>'
			end 

			/*
			if (@PR_TotalBillingAmount is null or ltrim(rtrim(@PR_TotalBillingAmount)) = '')
			begin
				set @error = @error + 'Please fill in Total Billing Amount field in the Billing Related Information tab<br>'
			end 
			*/

			-- validate empty billing stage 								
			if (isnull(@PR_Stage2AFlag,'') = '' and isnull(@PR_Stage2BFlag,'') = '' and isnull(@PR_Stage2CFlag,'') = ''
				and isnull(@PR_Stage2DFlag,'') = '' and isnull(@PR_Stage2EFlag,'') = '' and isnull(@PR_Stage2FFlag,'') = ''
				and isnull(@PR_Stage2GFlag,'') = '' and isnull(@PR_Stage2HFlag,'') = '' and isnull(@PR_Stage2IFlag,'') = ''
				and isnull(@PR_Stage2JFlag,'') = '' and isnull(@PR_Stage2KFlag,'') = '' and isnull(@PR_Stage3,'') = ''
				and isnull(@PR_Stage4,'') = '' and isnull(@PR_Stage5,'') = '' and isnull(@PR_Stage6,'') = ''
				and isnull(@PR_Stage7,'') = '' and isnull(@PR_Stage8,'') = '' and isnull(@PR_Stage9,'') = ''
				and isnull(@PR_StageOthers,'') = ''
			)				
			begin
				set @error = @error + 'Please Select At Least 1 Billing Stage or enter Other Billing Stage<br>'
			end 

			-- check other billing stage format
			set @PR_StageOthers = lower(@PR_StageOthers)

			DECLARE @myTableVariable3 TABLE (Stage nvarchar(max))
			insert into @myTableVariable3 
			SELECT value 				
			FROM SplitString(REPLACE(@PR_StageOthers, ' ', ''), ',');

			if exists 
			(
				select 1
				from @myTableVariable3
				where Stage = ''
			)
			begin		

				set @Error = @Error + 'Please Check Other Billing Stage Format<br>'
			end 

			-- reject if user enter common billing stage into other billing field 
			declare @ExistingStage nvarchar(max) 
			declare @DuplicateStage nvarchar(max) 

			DECLARE @myTableVariable1 TABLE (Stage nvarchar(max),MatchedExisting bit)
			insert into @myTableVariable1 
			SELECT value, 
				--case when value in ('2/2a','2b','2c','2d','2f','2g','2f','2g','2h','2i','2j','2k','3','4','5','6','7','8','9') then 1 else 0 end flag
				case when value in ('2/2a','2b','2c','2d','2e','2f','2g','2h','2i','2j','2k','3','4','5','6','7','8','9') then 1 else 0 end flag
			FROM SplitString(REPLACE(@PR_StageOthers, ' ', ''), ',');

			if exists 
			(
				select Stage
				from @myTableVariable1
				where MatchedExisting = 1
			)
			begin
				--set @ExistingStage = 
				SELECT @ExistingStage = COALESCE(@ExistingStage + ',', '') + Stage 
				from @myTableVariable1
				where MatchedExisting = 1

				set @Error = @Error + 'Please Select Stage ' + @ExistingStage + ' From Billing Stage Field<br>'
			end 

			-- check duplicate in other billing field 
			DECLARE @myTableVariable2 TABLE (Stage nvarchar(max),DuplicateCount int)
			insert into @myTableVariable2 
			SELECT Stage, 
				count(*)
			FROM @myTableVariable1
			group by Stage

			if exists 
			(
				select Stage
				from @myTableVariable2
				where DuplicateCount > 1
			)
			begin
				SELECT @DuplicateStage = COALESCE(@DuplicateStage + ',', '') + Stage 
				from @myTableVariable2
				where DuplicateCount > 1

				set @Error = @Error + 'Stage ' + @DuplicateStage + ' Is Duplicated<br>'
			end
			-- other billing stage validation 
		end 
		if (@PR_AnyBridgingFinancierFlag =1)
		begin
			if (@PR_BeneficiaryBank is null or ltrim(rtrim(@PR_BeneficiaryBank)) = '')
			begin
				set @error = @error + 'Please fill in Beneficiary Bank field in the Bridging Financier/ Developer Information tab<br>'
			end 

			if (@PR_BridgingFinancier is null or ltrim(rtrim(@PR_BridgingFinancier)) = '')
			begin
				set @error = @error + 'Please fill in Bridging Financier field in the Bridging Financier/ Developer Information tab<br>'
			end 
			
			--if (@PR_BridgingFinancierRedemptionSum is null or ltrim(rtrim(@PR_BridgingFinancierRedemptionSum)) = '' or isnull(@PR_BridgingFinancierRedemptionSum,0) = 0)
			if (@PR_BridgingFinancierRedemptionSum is null or ltrim(rtrim(@PR_BridgingFinancierRedemptionSum)) = '' )
			begin
				set @error = @error + 'Please fill in Bridging Financier Redemption Sum field in the Bridging Financier/ Developer Information tab<br>'
			end 
						
			if (@PR_RedemptionPaymentAccountNumber is null or ltrim(rtrim(@PR_RedemptionPaymentAccountNumber)) = '')
			begin
				set @error = @error + 'Please fill in Redemption Payment Account Number field in the Bridging Financier/ Developer Information tab<br>'
			end 
			
			--20210324- start bridging financial validation fixes 
			/*
			if (@PR_BridgingFinancierEmailAddress is null or ltrim(rtrim(@PR_BridgingFinancierEmailAddress)) = '')
			begin
				set @error = @error + 'Please fill in Bridging Financier Email Address field in the Bridging Financier/ Developer Information tab<br>'
			end 
			*/

			--20210324- start bridging financial validation fixes 
			/*
			if (@PR_BridgingFinancierRedemptionExpiryDate is null or ltrim(rtrim(@PR_BridgingFinancierRedemptionExpiryDate)) = '')
			begin
				set @error = @error + 'Please fill in Bridging Financier Redemption Expiry Date field in the Bridging Financier/ Developer Information tab<br>'
			end 
			*/

			/*
			if (@PR_DeveloperEmailAddress  is null or ltrim(rtrim(@PR_DeveloperEmailAddress)) = '')
			begin
				set @error = @error + 'Please fill in Developer Email Address field in the Bridging Financier/ Developer Information tab<br>'
			end 
			*/

		end 

		-- 20210826 start validate SADA			
		declare @PhaseCode nvarchar(max)
		declare @ProjectCode nvarchar(max)
		declare @DevCode nvarchar(max)

		set @PhaseCode = (select phasecode from SQLLOADS where arn = @arn )
		set @ProjectCode = (select ProjectCode from SQLLOADS where arn = @arn )
		set @DevCode = (select DeveloperCode from SQLLOADS where arn = @arn )

		declare @DefaultSada bit
		set @DefaultSada = (select SADAFlag from ddProjectPhase where phasecode = @PhaseCode and ProjectCode = @ProjectCode and DeveloperCode = @DevCode )
			
		if ((@SolicitorSubmissionOption = 'Submitted' or @SolicitorSubmissionOption = 'Resubmitted') and @disbursementmanner='PR' and @DisbursementMakerDecision = 'All In Order' AND @DisbursementMakerSubmissionCompleted = 1 and @PR_DeveloperBillingDueDateFlag =1 and @DefaultSada = 1)
		begin
			--if (isnull(@ConfirmationOfArchitectFlag,'') = '')
			if (@ConfirmationOfArchitectFlag is null)
			begin
				set @error = @error + 'Confirmation From Architect Cannot Be Blank<br>'
			end 
		end 
		-- 20210826 end validate SADA

		-- 20210826 start validate final billing							
		--if (isnull(@FinalBillingFlag,'') = '')
		if (@disbursementmanner='PR' and  @DisbursementMakerDecision = 'All In Order' AND @DisbursementMakerSubmissionCompleted = 1 and @PR_DeveloperBillingDueDateFlag =1 and @FinalBillingFlag is null)
		begin
			set @error = @error + 'Final Billing Stage Cannot Be Blank<br>'			
		end 
		-- 20210826 end validate final billing	
	end 

	if (@DisbursementMakerSubmissionCompleted = 1 and @disbursementmanner='LS' and @DisbursementMakerDecision = 'All In Order')
	begin
		if (@BalanceAdviceLetterApplicableFlag is null)
		begin
			set @error = @error + 'Please fill in Balance Letter Applicable field<br>'
		end 

		if (@LS_RedemptionDueDateFlag =1)
		begin
			if (@LS_RedemptionDueDate  is null or ltrim(rtrim(@LS_RedemptionDueDate)) = '')
			begin
				set @error = @error + 'Please fill in Redemption Due Date field in the Redemption/ SPA Related Information tab<br>'
			end 

			/*
			if (@LS_CompletionDate  is null or ltrim(rtrim(@LS_CompletionDate)) = '')
			begin
				set @error = @error + 'Please fill in Completion Date field in the Redemption/ SPA Related Information tab<br>'
			end 				
			*/
		end 

		if (@LS_ExtendedCompletionDateFlag =1)
		begin
			if (@LS_CompletionDate  is null or ltrim(rtrim(@LS_CompletionDate)) = '')
			begin
				set @error = @error + 'Please fill in Completion Date field in the Redemption/ SPA Related Information tab<br>'
			end 

			if (@LS_ExtendedCompletionDate  is null or ltrim(rtrim(@LS_ExtendedCompletionDate)) = '')
			begin
				set @error = @error + 'Please fill in Extended Completion Date field in the Redemption/ SPA Related Information tab<br>'
			end 
		end 
	end 	

	

	/*
	select @DisbursementManner  = DisbursementManner
	from SQLLOADS
	where arn = @arn
	*/
	if ((@SolicitorSubmissionOption = 'Submitted' or @SolicitorSubmissionOption = 'Resubmitted') and @DisbursementMakerDecision = 'Not In Order' and @DisbursementMakerSubmissionCompleted = 1)
	begin
		if (ltrim(rtrim(@DisbursementMakerRejectionReason)) = '' or @DisbursementMakerRejectionReason is null)
		begin
			set @Error = @Error + 'Please fill in Rejection Remarks <br>'
		end 
	end 

	if (
		(@SolicitorSubmissionOption = 'Submitted' or @SolicitorSubmissionOption = 'Resubmitted') 
		and @DisbursementMakerDecision <> 'Not In Order' 
		and @DisbursementMakerSubmissionCompleted = 1
		)
	begin
		
		if (@DisbursementManner = 'LS')
		begin
			if not exists 
			(
				select 1
				from aaSolDisbursementSubmission_DisMakerSubmissionPaymentDetail
				where arn = @arn 
			)
			begin
				set @Error = @Error + 'Please add at least 1 payment <br>'				
			end 
			else
			begin
				if exists 
				(
					select 1
					from aaSolDisbursementSubmission_DisMakerSubmissionPaymentDetail
					where (AccountFrom is null or ltrim(rtrim(AccountFrom)) = '')
						and arn = @arn 
				)
				begin		
					set @Error = @Error + 'Please fill in Debit From for all the items in the payment tab <br>'	
				end 
			end 
		end 
		
		if (@DisbursementManner = 'PR')
		begin			
			if exists 
			(
				select 1
				from aaSolDisbursementSubmission_DisMakerSubmissionPaymentDetail
				where (AccountFrom is null or ltrim(rtrim(AccountFrom)) = '')
					and arn = @arn 
			)
			begin		
				set @Error = @Error + 'Please fill in Debit From for all the items in the payment tab <br>'	
			end 			
		end 
	end 
		
	-- validation legal fee	
	if exists
	(
		select 1
		from [aaSolDisbursementSubmission_DisMakerSubmissionPaymentDetail]
		where [PaymentReference] in ('Legal Fee','Legal Fee - Principal Pymt')
			and arn = @arn  
	)
	begin
		declare @legalfee money
		select @legalfee = LegalFeesFinancedAmount
		from sqlloads
		where arn = @arn 

		declare @legalfeeDisburse money
		set @legalfeeDisburse = 0

		-- legal fee: current submission 
		select @legalfeeDisburse = @legalfeeDisburse + isnull(sum([AmountDisburse]),0)
		from [aaSolDisbursementSubmission_DisMakerSubmissionPaymentDetail]
		where [PaymentReference] in ('Legal Fee','Legal Fee - Principal Pymt')
			and arn = @arn 
		
		-- legal fee: previous submission by sol 
		select @legalfeeDisburse = @legalfeeDisburse + isnull(sum([AmountDisburse]),0)
		from aaSolDisbursementSubmission_DisMakerSubmissionPaymentDetail_history
		where [PaymentReference] in ('Legal Fee','Legal Fee - Principal Pymt')
			and arn = @arn 

		-- legal fee: previous submission by billing 
		select @legalfeeDisburse = @legalfeeDisburse + isnull(sum([AmountDisburse]),0)
		from aaIntDisbursementSubmission_DisMakerSubmissionPaymentDetail_history
		where [PaymentReference] in ('Legal Fee','Legal Fee - Principal Pymt')
			and arn = @arn 

		-- legal fee: previous submission by developer portal  
		select @legalfeeDisburse = @legalfeeDisburse + isnull(sum([AmountDisburse]),0)
		from ddProjectDisbursementSubmission_DisMaker_PaymentDetail_history
		where [PaymentReference] in ('Legal Fee','Legal Fee - Principal Pymt')
			and arn = @arn 

		if ((@SolicitorSubmissionOption = 'Submitted' or @SolicitorSubmissionOption = 'Resubmitted') and @DisbursementMakerDecision = 'All In Order' and @DisbursementMakerSubmissionCompleted = 1 and @legalfeeDisburse > @legalfee)
		begin
			set @error = @error + 'Total Legal Fees Amount in payment tab is more than Legal Fees Financed Amount<br>'
		end 
	end 

	-- valuation valuation fee	
	if exists
	(
		select 1
		from [aaSolDisbursementSubmission_DisMakerSubmissionPaymentDetail]
		where [PaymentReference] in ('Valuation Fee','Valuation Fee - Principal Pymt')
			and arn = @arn  
	)
	begin
		declare @ValuationFee money
		select @ValuationFee = ValuationFeesFinancedAmount
		from sqlloads
		where arn = @arn 

		declare @ValuationFeeDisburse money
		set @ValuationFeeDisburse = 0

		-- valuation fee: current submission 
		select @ValuationFeeDisburse = @ValuationFeeDisburse + isnull(sum([AmountDisburse]),0)
		from [aaSolDisbursementSubmission_DisMakerSubmissionPaymentDetail]
		where [PaymentReference] in ('Valuation Fee','Valuation Fee - Principal Pymt')
			and arn = @arn 

		-- valuation fee: previous submission done by sol/ disbursement 
		select @ValuationFeeDisburse = @ValuationFeeDisburse + isnull(sum([AmountDisburse]),0)
		from aaSolDisbursementSubmission_DisMakerSubmissionPaymentDetail_history
		where [PaymentReference] in ('Valuation Fee','Valuation Fee - Principal Pymt')
			and arn = @arn 
		
		-- valuation fee: previous submission done by billing 
		select @ValuationFeeDisburse = @ValuationFeeDisburse + isnull(sum([AmountDisburse]),0)
		from aaIntDisbursementSubmission_DisMakerSubmissionPaymentDetail_history
		where [PaymentReference] in ('Valuation Fee','Valuation Fee - Principal Pymt')
			and arn = @arn 

		-- valuation fee: previous submission done by developer portal 
		select @ValuationFeeDisburse = @ValuationFeeDisburse + isnull(sum([AmountDisburse]),0)
		from ddProjectDisbursementSubmission_DisMaker_PaymentDetail_history
		where [PaymentReference] in ('Valuation Fee','Valuation Fee - Principal Pymt')
			and arn = @arn 

		if ((@SolicitorSubmissionOption = 'Submitted' or @SolicitorSubmissionOption = 'Resubmitted') and @DisbursementMakerDecision = 'All In Order' and @DisbursementMakerSubmissionCompleted = 1 and @ValuationFeeDisburse > @ValuationFee)
		begin
			set @error = @error + 'Total Valuation Fees Amount in payment tab is more than Valuation Fees Financed Amount<br>'
		end 
	end 

	-- MDTA valuation fee	
	if exists
	(
		select 1
		from [aaSolDisbursementSubmission_DisMakerSubmissionPaymentDetail]
		where 
			--[PaymentReference] in ('Valuation Fee','Valuation Fee - Principal Pymt')
			PaymentReference in ('MDTA/ MRTT','MDTA/ MRTT - Principal Pymt')
			and arn = @arn  
	)
	begin
		declare @MDTAFee money
		select @MDTAFee = MRTAFinancedAmount
		from sqlloads
		where arn = @arn 

		declare @MDTAFeeDisburse money
		set @MDTAFeeDisburse = 0

		--MDTA: current submission 
		select @MDTAFeeDisburse = @MDTAFeeDisburse + isnull(sum([AmountDisburse]),0)
		from [aaSolDisbursementSubmission_DisMakerSubmissionPaymentDetail]
		where 
			PaymentReference in ('MDTA/ MRTT','MDTA/ MRTT - Principal Pymt')			
			and arn = @arn 

		--MDTA: previous submission done by disbursement 
		select @MDTAFeeDisburse = @MDTAFeeDisburse + isnull(sum([AmountDisburse]),0)
		from aaSolDisbursementSubmission_DisMakerSubmissionPaymentDetail_history
		where 
			PaymentReference in ('MDTA/ MRTT','MDTA/ MRTT - Principal Pymt')			
			and arn = @arn 

		--MDTA: previous submission done by billing 
		select @MDTAFeeDisburse = @MDTAFeeDisburse + isnull(sum([AmountDisburse]),0)
		from aaIntDisbursementSubmission_DisMakerSubmissionPaymentDetail_history
		where 
			PaymentReference in ('MDTA/ MRTT','MDTA/ MRTT - Principal Pymt')			
			and arn = @arn 

		--MDTA: previous submission done by developer portal  
		select @MDTAFeeDisburse = @MDTAFeeDisburse + isnull(sum([AmountDisburse]),0)
		from ddProjectDisbursementSubmission_DisMaker_PaymentDetail_history
		where 
			PaymentReference in ('MDTA/ MRTT','MDTA/ MRTT - Principal Pymt')			
			and arn = @arn 

		if (@DisbursementMakerDecision = 'Approve' and @DisbursementMakerSubmissionCompleted = 1 and @MDTAFeeDisburse > @MDTAFee)
		begin
			set @error = @error + 'Total MDTA/ MRTT Fees Amount in payment tab is more than MDTA/ MRTT Fees Financed Amount<br>'
		end 

		if ((@SolicitorSubmissionOption = 'Submitted' or @SolicitorSubmissionOption = 'Resubmitted') and @DisbursementMakerDecision = 'All In Order' and @DisbursementMakerSubmissionCompleted = 1 and @MDTAFeeDisburse > @MDTAFee)
		begin
			set @error = @error + 'Total MDTA/ MRTT Fees Amount in payment tab is more than MDTA/ MRTT Fees Financed Amount<br>'
		end 
	end 
	
	-- amount disburse validation 
	if exists 
	(
		select 1
		from [aaSolDisbursementSubmission_DisMakerSubmissionPaymentDetail]
		where PaymentReference not in ('Legal Fee',
			'Legal Fee - Principal Pymt',
			'Valuation Fee',
			'Valuation Fee - Principal Pymt',
			'MDTA/ MRTT',
			'MDTA/ MRTT - Principal Pymt')
			and arn = @arn 
	)
	begin
		declare @FinancingAmountExcludeFLVM money 
		select @FinancingAmountExcludeFLVM = isnull(loanamount,0)
		from sqlloads 
		where arn = @arn 

		declare @TotalDisbursementAmountIncludeHistory money 
		set @TotalDisbursementAmountIncludeHistory = 0	
			
		select @TotalDisbursementAmountIncludeHistory = @TotalDisbursementAmountIncludeHistory + isnull(sum([AmountDisburse]),0)
		from [aaSolDisbursementSubmission_DisMakerSubmissionPaymentDetail]
		where arn = @arn 
			and PaymentReference not in ('Legal Fee',
				'Legal Fee - Principal Pymt',
				'Valuation Fee',
				'Valuation Fee - Principal Pymt',
				'MDTA/ MRTT',
				'MDTA/ MRTT - Principal Pymt')

		select @TotalDisbursementAmountIncludeHistory = @TotalDisbursementAmountIncludeHistory + isnull(sum([AmountDisburse]),0)
		from aaSolDisbursementSubmission_DisMakerSubmissionPaymentDetail_history
		where arn = @arn 
			and PaymentReference not in ('Legal Fee',
				'Legal Fee - Principal Pymt',
				'Valuation Fee',
				'Valuation Fee - Principal Pymt',
				'MDTA/ MRTT',
				'MDTA/ MRTT - Principal Pymt')

		select @TotalDisbursementAmountIncludeHistory = @TotalDisbursementAmountIncludeHistory + isnull(sum([AmountDisburse]),0)
		from aaIntDisbursementSubmission_DisMakerSubmissionPaymentDetail_history
		where arn = @arn 
			and PaymentReference not in ('Legal Fee',
				'Legal Fee - Principal Pymt',
				'Valuation Fee',
				'Valuation Fee - Principal Pymt',
				'MDTA/ MRTT',
				'MDTA/ MRTT - Principal Pymt')	
		
		-- submission done by developer portal previously
		select @TotalDisbursementAmountIncludeHistory = @TotalDisbursementAmountIncludeHistory + isnull(sum([AmountDisburse]),0)
		from ddProjectDisbursementSubmission_DisMaker_PaymentDetail_history
		where arn = @arn 
			and PaymentReference not in ('Legal Fee',
				'Legal Fee - Principal Pymt',
				'Valuation Fee',
				'Valuation Fee - Principal Pymt',
				'MDTA/ MRTT',
				'MDTA/ MRTT - Principal Pymt')	

		if ((@SolicitorSubmissionOption = 'Submitted' or @SolicitorSubmissionOption = 'Resubmitted') and @DisbursementMakerDecision = 'All In Order' and @DisbursementMakerSubmissionCompleted = 1 and @TotalDisbursementAmountIncludeHistory > @FinancingAmountExcludeFLVM)
		begin
			set @error = @error + 'Total Disbursement Amount is more than Financing Amount (exclude FLVM)<br>'
		end 
	end 
	

	if (@Error = '')
	begin		
		if (@DisbursementMakerSubmissionCompleted = 1)
		begin
			/*
			-- 20220105 - remove rejected status after action taken by maker instead of checker 
			delete from aaSolDisbursementSubmission_DisCheckerRejected
			where arn = @arn 

			delete from aaSolDisbursementSubmission_DisCheckerRejectedPaymentDetail
			where arn = @arn 
			*/
			delete from aaSolDisbursementSubmission_DisMakerRejected
			where arn = @arn 

			-- 20210320- start del sol submission submitted view table 
			delete from aaSolDisbursementSubmissionSubmittedView
			where arn = @arn 

			delete from aaSolDisbursementSubmissionSubmittedView_PaymentDetail
			where arn = @arn 
			-- 20210320- end del sol submission submitted view table 
		end 
		
		if ((@SolicitorSubmissionOption = 'Submitted' or @SolicitorSubmissionOption = 'Resubmitted') and @DisbursementMakerDecision = 'Not In Order' and @DisbursementMakerSubmissionCompleted = 1)
		begin
			
			-- 20210320- start move data to new sol submission rejected table 
			insert into aaSolDisbursementSubmissionSubmittedView
			select * from aaSolDisbursementSubmission
			where arn = @arn 

			insert into aaSolDisbursementSubmissionSubmittedView_PaymentDetail
			select * from aaSolDisbursementSubmission_PaymentDetail
			where arn = @arn 
			-- 20210320- end move data to new sol submission rejected table 

			INSERT INTO [dbo].[aaSolDisbursementSubmission_DisMakerRejected]
           ([arn]
           ,[BalanceAdviceLetterApplicableFlag]
           ,[UrgentFlag]
           ,[LS_RedemptionDueDateFlag]
           ,[LS_RedemptionDueDate]
           ,[LS_ExtendedCompletionDateFlag]
           ,[LS_CompletionDate]
           ,[LS_ExtendedCompletionDate]
           ,[PR_DeveloperBillingDueDateFlag]
           ,[PR_Stage2AFlag]
           ,[PR_Stage2BFlag]
           ,[PR_Stage2CFlag]
           ,[PR_Stage2DFlag]
           ,[PR_Stage2EFlag]
           ,[PR_Stage2FFlag]
           ,[PR_Stage2GFlag]
           ,[PR_Stage2HFlag]
           ,[PR_StageOthers]
           ,[PR_EarliestBillingDueDate]
           ,[PR_TotalBillingAmount]
           ,[PR_AnyBridgingFinancierFlag]
           ,[PR_BridgingFinancier]
           ,[PR_BridgingFinancierEmailAddress]
           ,[PR_BridgingFinancierRedemptionSum]
           ,[PR_RedemptionPaymentAccountNumber]
           ,[PR_BeneficiaryBank]
           ,[PR_BridgingFinancierRedemptionExpiryDate]
           ,[PR_DeveloperName]
           ,[PR_DeveloperEmailAddress]
           ,[PR_DeveloperPIC]
           ,[PR_DeveloperHDA]
           ,[PR_DeveloperHDABank]
           ,[LF_PayeeName]
           ,[LF_BilledAmount]
           ,[LF_AccountNumber]
           ,[LF_Bank]
           ,[LF_PaymentDescription]
           ,[LF_PaymentMode]
           ,[UpdateInfo_Reason]
           ,[UpdateInfo_Others]
           ,[CancelLoan_Remarks]
           ,[CancelLoan_File]
           ,[SolicitorSubmissionOption]
           ,[SolicitorSubmissionCompleted]
           ,[SolicitorCode]
           ,[SolicitorSubmissionDate]
           ,[SolicitorSubmissionPDFID]
           ,[DisbursementMakerEmailAddress]
           ,[DisbursementMakerDecision]
           ,[DisbursementMakerSubmissionCompleted]
           ,[DisbursementMakerRejectionReason]
           ,[DisbursementMakerSubmissionDate]
           ,[DisbursementMakerSubmissionPDFID]
           ,[DisbursementCheckerEmailAddress]
           ,[DisbursementCheckerDecision]
           ,[DisbursementCheckerSubmissionCompleted]
           ,[DisbursementCheckerRejectionReason]
           ,[DisbursementCheckerSubmissionDate]
           ,[DisbursementCheckerPDFID]
           ,[CreatedDate]
           ,[UpdatedDate]
		   	,[FinalBillingFlag] ,
			[ProjectSubmissionOption] ,
			[ProjectSubmissionCompleted] ,
			[DeveloperCode] ,
			[ProjectCode],
			[PhaseCode] ,
			[DeveloperLoginID] ,
			[ProjectSubmissionDate] ,
			[ProjectSubmissionPDFID],
			[PR_Stage2IFlag] ,
			[PR_Stage2JFlag] ,
			[PR_Stage2KFlag] ,
			[PR_Stage3] ,
			[PR_Stage4] ,
			[PR_Stage5] ,
			[PR_Stage6] ,
			[PR_Stage7] ,
			[PR_Stage8] ,
			[PR_Stage9] ,
			[Attachment1] ,
			[Attachment2] ,
			[DraftID] ,
			[SadaFlag] ,
			[ConfirmationOfArchitectFlag],
			[ConfirmationOfArchitectRemark] 
			  ,SPADate 
				,SPAConstructionPeriodInMonths 
				,ExtendedConstructionPeriodInMonths 
			)
		   SELECT [arn]
			  ,[BalanceAdviceLetterApplicableFlag]
			  ,[UrgentFlag]
			  ,[LS_RedemptionDueDateFlag]
			  ,[LS_RedemptionDueDate]
			  ,[LS_ExtendedCompletionDateFlag]
			  ,[LS_CompletionDate]
			  ,[LS_ExtendedCompletionDate]
			  ,[PR_DeveloperBillingDueDateFlag]
			  ,[PR_Stage2AFlag]
			  ,[PR_Stage2BFlag]
			  ,[PR_Stage2CFlag]
			  ,[PR_Stage2DFlag]
			  ,[PR_Stage2EFlag]
			  ,[PR_Stage2FFlag]
			  ,[PR_Stage2GFlag]
			  ,[PR_Stage2HFlag]
			  ,[PR_StageOthers]
			  ,[PR_EarliestBillingDueDate]
			  ,[PR_TotalBillingAmount]
			  ,[PR_AnyBridgingFinancierFlag]
			  ,[PR_BridgingFinancier]
			  ,[PR_BridgingFinancierEmailAddress]
			  ,[PR_BridgingFinancierRedemptionSum]
			  ,[PR_RedemptionPaymentAccountNumber]
			  ,[PR_BeneficiaryBank]
			  ,[PR_BridgingFinancierRedemptionExpiryDate]
			  ,[PR_DeveloperName]
			  ,[PR_DeveloperEmailAddress]
			  ,[PR_DeveloperPIC]
			  ,[PR_DeveloperHDA]
			  ,[PR_DeveloperHDABank]
			  ,[LF_PayeeName]
			  ,[LF_BilledAmount]
			  ,[LF_AccountNumber]
			  ,[LF_Bank]
			  ,[LF_PaymentDescription]
			  ,[LF_PaymentMode]
			  ,[UpdateInfo_Reason]
			  ,[UpdateInfo_Others]
			  ,[CancelLoan_Remarks]
			  ,[CancelLoan_File]
			  ,[SolicitorSubmissionOption]
			  ,[SolicitorSubmissionCompleted]
			  ,[SolicitorCode]
			  ,[SolicitorSubmissionDate]
			  ,[SolicitorSubmissionPDFID]
			  ,@DisbursementMakerEmailAddress
			  ,@DisbursementMakerDecision
			  ,@DisbursementMakerSubmissionCompleted
			  ,@DisbursementMakerRejectionReason
			  ,getdate()
			  ,null
			  ,[DisbursementCheckerEmailAddress]
			  ,[DisbursementCheckerDecision]
			  ,[DisbursementCheckerSubmissionCompleted]
			  ,[DisbursementCheckerRejectionReason]
			  ,[DisbursementCheckerSubmissionDate]
			  ,[DisbursementCheckerPDFID]
			  ,[CreatedDate]
			  ,getdate()
			  ,	[FinalBillingFlag] ,
			[ProjectSubmissionOption] ,
			[ProjectSubmissionCompleted] ,
			[DeveloperCode] ,
			[ProjectCode],
			[PhaseCode] ,
			[DeveloperLoginID] ,
			[ProjectSubmissionDate] ,
			[ProjectSubmissionPDFID],
			[PR_Stage2IFlag] ,
			[PR_Stage2JFlag] ,
			[PR_Stage2KFlag] ,
			[PR_Stage3] ,
			[PR_Stage4] ,
			[PR_Stage5] ,
			[PR_Stage6] ,
			[PR_Stage7] ,
			[PR_Stage8] ,
			[PR_Stage9] ,
			[Attachment1] ,
			[Attachment2] ,
			[DraftID] ,
			[SadaFlag] ,
			[ConfirmationOfArchitectFlag],
			[ConfirmationOfArchitectRemark] 
			  ,SPADate 
				,SPAConstructionPeriodInMonths 
				,ExtendedConstructionPeriodInMonths 
		  FROM [dbo].aaSolDisbursementSubmission_DisMakerSubmission
		  where arn = @arn 

		  /*
		  update aaSolDisbursementSubmission
			set DisbursementMakerEmailAddress = null, 
				DisbursementMakerDecision = null, 
				DisbursementMakerSubmissionCompleted = null, 
				DisbursementMakerRejectionReason = null,
				SolicitorSubmissionCompleted = 0,
				[UpdatedDate] = getdate()
			where arn = @arn 
			*/

			 update aaSolDisbursementSubmission
			set SolicitorSubmissionCompleted = 0,
				[UpdatedDate] = getdate()
			where arn = @arn 
			
			delete from aaSolDisbursementSubmission_DisMakerSubmission
			where arn = @arn 

			delete from aaSolDisbursementSubmission_DisMakerSubmissionPaymentDetail
			where arn = @arn 

			insert into MortgageAppTaskInstance_logs 
			select [workflow]
				,[arn]
				,[TaskOwner]
				,[CreatedDate]
				,getdate()
				,[CreatedUser]
				,[UpdatedUser]
				, 0
				, 1
			from MortgageAppTaskInstance
			where workflow = 'DisbDUMakerSolicitorApproval'
			and arn = @arn 

			delete from MortgageAppTaskInstance
			where workflow = 'DisbDUMakerSolicitorApproval'
			and arn = @arn 

			insert into WorkflowHistory
			values ('Disbursement By Solicitor',@arn,'Disbursement Rejected By Disbursement Maker',@DisbursementMakerEmailAddress,null,getdate())

		end 
		else
		begin
			update aaSolDisbursementSubmission_DisMakerSubmission
			set DisbursementMakerEmailAddress = @DisbursementMakerEmailAddress, 
				DisbursementMakerDecision = @DisbursementMakerDecision, 
				DisbursementMakerSubmissionCompleted = @DisbursementMakerSubmissionCompleted, 
				DisbursementMakerRejectionReason = @DisbursementMakerRejectionReason,	
				[DisbursementMakerSubmissionDate] = getdate(),
				[UpdatedDate] = getdate(),
				BalanceAdviceLetterApplicableFlag = @BalanceAdviceLetterApplicableFlag  
				,UrgentFlag = @UrgentFlag  
				,LS_RedemptionDueDateFlag   = @LS_RedemptionDueDateFlag  
				,LS_RedemptionDueDate = @LS_RedemptionDueDate 
				,LS_ExtendedCompletionDateFlag = @LS_ExtendedCompletionDateFlag  
				,LS_CompletionDate = @LS_CompletionDate 
				,LS_ExtendedCompletionDate = @LS_ExtendedCompletionDate 
				,PR_DeveloperBillingDueDateFlag = @PR_DeveloperBillingDueDateFlag  
				,PR_Stage2AFlag = @PR_Stage2AFlag  
				,PR_Stage2BFlag = @PR_Stage2BFlag  
				,PR_Stage2CFlag = @PR_Stage2CFlag  
				,PR_Stage2DFlag = @PR_Stage2DFlag  
				,PR_Stage2EFlag = @PR_Stage2EFlag  
				,PR_Stage2FFlag = @PR_Stage2FFlag  
				,PR_Stage2GFlag = @PR_Stage2GFlag  
				,PR_Stage2HFlag = @PR_Stage2HFlag  
				,PR_StageOthers = @PR_StageOthers  
				,PR_EarliestBillingDueDate = @PR_EarliestBillingDueDate 
				,PR_TotalBillingAmount = @PR_TotalBillingAmount  
				,PR_AnyBridgingFinancierFlag = @PR_AnyBridgingFinancierFlag  
				,PR_BridgingFinancier = @PR_BridgingFinancier  
				,PR_BridgingFinancierEmailAddress = @PR_BridgingFinancierEmailAddress  
				,PR_BridgingFinancierRedemptionSum = @PR_BridgingFinancierRedemptionSum  
				,PR_RedemptionPaymentAccountNumber = @PR_RedemptionPaymentAccountNumber  
				,PR_BeneficiaryBank= @PR_BeneficiaryBank  
				,PR_BridgingFinancierRedemptionExpiryDate = @PR_BridgingFinancierRedemptionExpiryDate 
				,PR_DeveloperName = @PR_DeveloperName  
				,PR_DeveloperEmailAddress = @PR_DeveloperEmailAddress  
				,PR_DeveloperPIC = @PR_DeveloperPIC  
				,PR_DeveloperHDA = @PR_DeveloperHDA  
				,PR_DeveloperHDABank = @PR_DeveloperHDABank  
				,LF_PayeeName = @LF_PayeeName  
				,LF_BilledAmount = @LF_BilledAmount  
				,LF_AccountNumber= @LF_AccountNumber  
				,LF_Bank= @LF_Bank  
				,LF_PaymentDescription= @LF_PaymentDescription  
				,LF_PaymentMode = @LF_PaymentMode  
				,PR_Stage2IFlag = @PR_Stage2IFlag 
				,PR_Stage2JFlag = @PR_Stage2JFlag 
				,PR_Stage2KFlag = @PR_Stage2KFlag 
				,PR_Stage3 = @PR_Stage3
				,PR_Stage4 = @PR_Stage4
				,PR_Stage5 = @PR_Stage5
				,PR_Stage6 = @PR_Stage6
				,PR_Stage7 = @PR_Stage7
				,PR_Stage8 = @PR_Stage8
				,PR_Stage9 = @PR_Stage9
				,SadaFlag = @SadaFlag
				,ConfirmationOfArchitectFlag = @ConfirmationOfArchitectFlag
				,ConfirmationOfArchitectRemark = @ConfirmationOfArchitectRemark
				,FinalBillingFlag = @FinalBillingFlag
				,SPADate = @SPADate 
				,SPAConstructionPeriodInMonths = @SPAConstructionPeriodInMonths 
				,ExtendedConstructionPeriodInMonths = @ExtendedConstructionPeriodInMonths 
			where arn = @arn 

			update aaSolDisbursementSubmission_DisMakerSubmissionPaymentDetail
			set DisMakerEmail = @DisbursementMakerEmailAddress,
				DisMakerSubmissionDate = getdate()

			if ((@SolicitorSubmissionOption = 'Submitted' or @SolicitorSubmissionOption = 'Resubmitted') and @DisbursementMakerDecision = 'All In Order' and @DisbursementMakerSubmissionCompleted = 1)
			begin
				insert into MortgageAppTaskInstance_logs 
				select [workflow]
					,[arn]
					,[TaskOwner]
					,[CreatedDate]
					,getdate()
					,[CreatedUser]
					,[UpdatedUser]
					, 0
					, 1
				from MortgageAppTaskInstance
				where workflow = 'DisbDUMakerSolicitorApproval'
				and arn = @arn 

				delete from MortgageAppTaskInstance
				where workflow = 'DisbDUMakerSolicitorApproval'
				and arn = @arn 

				insert into WorkflowHistory
				values ('Disbursement By Solicitor',@arn,'Disbursement Approved By Disbursement Maker',@DisbursementMakerEmailAddress,null,getdate())
			end 

			-- 20210419- start audit trails for PR related info for first advice 
			if ((@SolicitorSubmissionOption = 'Submitted' or @SolicitorSubmissionOption = 'Resubmitted') and @DisbursementMakerDecision = 'All In Order' and @DisbursementMakerSubmissionCompleted = 1)
			begin
				if exists 
				(
					select 1
					from aaSolDisbursementSubmission_DisMakerSubmission_History h
					inner join SQLLOADS on h.arn = SQLLOADS.arn 
					where (SolicitorSubmissionOption = 'Submitted' or SolicitorSubmissionOption = 'Resubmitted') 
						and h.arn = @arn 
						and SQLLOADS.DisbursementManner = 'PR'						
					group by h.arn 
					having count(*) = 1
				)
				begin
										
					-- start HDA / Project Account Bank
					if (isnull(@PR_DeveloperHDABank,'') <> '')
					begin
						declare @PreviousValue_PR_DeveloperHDABank nvarchar(max) 				
						set @PreviousValue_PR_DeveloperHDABank = (select top 1 ConcatenatedNewValue from aaDI_ProjectAccountBankAuditLog where OperationPrimaryKeysValue = @arn order by InsertedDateTime desc )
					
						if (isnull(@PreviousValue_PR_DeveloperHDABank,'') <> @PR_DeveloperHDABank)
						begin
							insert into aaDI_ProjectAccountBankAuditLog						
							values ('HDA / Project Account Bank',
								'EDIT', 
								'arn',
								@arn, 
								'HDA / Project Account Bank',
								@PreviousValue_PR_DeveloperHDABank, 
								@PR_DeveloperHDABank,
								@DisbursementMakerEmailAddress,
								getdate(),
								null,
								null
							)
						end 
					end 				
					-- end 				

					-- Developer’s HDA / Project Account
					if (isnull(@PR_DeveloperHDA,'') <> '')
					begin
						declare @PreviousValue_PR_DeveloperHDA nvarchar(max) 				
						set @PreviousValue_PR_DeveloperHDA = (select top 1 ConcatenatedNewValue from aaDI_ProjectAccountAuditLog where OperationPrimaryKeysValue = @arn order by InsertedDateTime desc )
					
						if (isnull(@PreviousValue_PR_DeveloperHDA,'') <> @PR_DeveloperHDA)
						begin
							insert into aaDI_ProjectAccountAuditLog						
							values ('Developer’s HDA / Project Account',
								'EDIT', 
								'arn',
								@arn, 
								'Developer’s HDA / Project Account',
								@PreviousValue_PR_DeveloperHDA, 
								@PR_DeveloperHDA,
								@DisbursementMakerEmailAddress,
								getdate(),
								null,
								null
							)
						end 
					end 

					-- Bridging Financier Redemption Sum
					--if (isnull(@PR_BridgingFinancierRedemptionSum,'') <> '')
					--begin
						declare @PreviousValue_PR_BridgingFinancierRedemptionSum nvarchar(max) 				
						set @PreviousValue_PR_BridgingFinancierRedemptionSum = (select top 1 ConcatenatedNewValue from aaBF_BridgingFinancierRedemptionSumAuditLog where OperationPrimaryKeysValue = @arn order by InsertedDateTime desc )
					
						if (isnull(@PreviousValue_PR_BridgingFinancierRedemptionSum,'') <> isnull(@PR_BridgingFinancierRedemptionSum,''))
						begin
							insert into aaBF_BridgingFinancierRedemptionSumAuditLog						
							values ('Bridging Financier Redemption Sum',
								'EDIT', 
								'arn',
								@arn, 
								'Bridging Financier Redemption Sum',
								@PreviousValue_PR_BridgingFinancierRedemptionSum, 
								@PR_BridgingFinancierRedemptionSum,
								@DisbursementMakerEmailAddress,
								getdate(),
								null,
								null
							)
						end 
					--end 

					-- Redemption Payment Account Number
					--if (isnull(@PR_RedemptionPaymentAccountNumber,'') <> '')
					--begin
						declare @PreviousValue_PR_RedemptionPaymentAccountNumber nvarchar(max) 				
						set @PreviousValue_PR_RedemptionPaymentAccountNumber = (select top 1 ConcatenatedNewValue from aaBF_RedemptionPaymentAccountNumberAuditLog where OperationPrimaryKeysValue = @arn order by InsertedDateTime desc )
					
						if (isnull(@PreviousValue_PR_RedemptionPaymentAccountNumber,'') <> isnull(@PR_RedemptionPaymentAccountNumber,''))
						begin
							insert into aaBF_RedemptionPaymentAccountNumberAuditLog						
							values ('Redemption Payment Account Number',
								'EDIT', 
								'arn',
								@arn, 
								'Redemption Payment Account Number',
								@PreviousValue_PR_RedemptionPaymentAccountNumber, 
								@PR_RedemptionPaymentAccountNumber,
								@DisbursementMakerEmailAddress,
								getdate(),
								null,
								null
							)
						end 
					--end 
					
				end 
			end 
			-- end 


			if (@SolicitorSubmissionOption = 'Cancelled' and @DisbursementMakerSubmissionCompleted = 1)
			begin
				insert into MortgageAppTaskInstance_logs 
				select [workflow]
					,[arn]
					,[TaskOwner]
					,[CreatedDate]
					,getdate()
					,[CreatedUser]
					,[UpdatedUser]
					, 0
					, 1
				from MortgageAppTaskInstance
				where workflow = 'DisbDUMakerSolicitorApproval'
				and arn = @arn 

				delete from MortgageAppTaskInstance
				where workflow = 'DisbDUMakerSolicitorApproval'
				and arn = @arn 

				insert into WorkflowHistory
				values ('Disbursement By Solicitor',@arn,'Cancellation Approved By Disbursement Maker',@DisbursementMakerEmailAddress,null,getdate())
			end 
		end 
					
	end

end