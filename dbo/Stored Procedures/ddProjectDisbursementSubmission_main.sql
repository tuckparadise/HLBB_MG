CREATE     procedure [dbo].[ddProjectDisbursementSubmission_main]
@DeveloperCode nvarchar(max) = null ,
@ProjectCode nvarchar(max) = null ,
@PhaseCode nvarchar(max) = null ,
@DeveloperLoginID nvarchar(max) = null ,
@DraftID bigint = null ,
@Error nvarchar(max) = null output 
as
begin
	declare @arn nvarchar(100)
	set @Error = ''

	declare @PR_EarliestBillingDueDate datetime 	
	set @PR_EarliestBillingDueDate = (select PR_EarliestBillingDueDate from ddProjectDisbursementSubmission_draft_Master where DraftID = @DraftID)

	if (@PR_EarliestBillingDueDate is null or ltrim(rtrim(@PR_EarliestBillingDueDate)) = '')
	begin
		set @error = @error + 'Please Fill In Billing Due Date Field <br>'
	end 

	if (isnull(@PR_EarliestBillingDueDate,'') <> '')
	begin
		declare @currentdate date 
		set @currentdate = getdate()

		if (@PR_EarliestBillingDueDate<=@currentdate)
		begin
			set @error = @error + 'Billing Due Date Must Be A Future Date<br>'
		end
	end 

	declare @FinalBilling bit 
	set @FinalBilling = (select FinalBillingFlag from ddProjectDisbursementSubmission_draft_Master where DraftID = @DraftID)

	if (@FinalBilling is null)
	begin
		set @error = @error + 'Please Fill In Final Billing Field <br>'
	end 

	declare @Stage2A bit 
	set @Stage2A = (select isnull(PR_Stage2AFlag,0) from ddProjectDisbursementSubmission_draft_Master where DraftID = @DraftID)

	declare @Stage2B bit 
	set @Stage2B = (select isnull(PR_Stage2BFlag,0) from ddProjectDisbursementSubmission_draft_Master where DraftID = @DraftID)

	declare @Stage2C bit 
	set @Stage2C = (select isnull(PR_Stage2CFlag,0) from ddProjectDisbursementSubmission_draft_Master where DraftID = @DraftID)

	declare @Stage2D bit 
	set @Stage2D = (select isnull(PR_Stage2DFlag,0) from ddProjectDisbursementSubmission_draft_Master where DraftID = @DraftID)

	declare @Stage2E bit 
	set @Stage2E = (select isnull(PR_Stage2EFlag,0) from ddProjectDisbursementSubmission_draft_Master where DraftID = @DraftID)

	declare @Stage2F bit 
	set @Stage2F = (select isnull(PR_Stage2FFlag,0) from ddProjectDisbursementSubmission_draft_Master where DraftID = @DraftID)

	declare @Stage2G bit 
	set @Stage2G = (select isnull(PR_Stage2GFlag,0) from ddProjectDisbursementSubmission_draft_Master where DraftID = @DraftID)

	declare @Stage2H bit 
	set @Stage2H = (select isnull(PR_Stage2HFlag,0) from ddProjectDisbursementSubmission_draft_Master where DraftID = @DraftID)

	declare @Stage2I bit 
	set @Stage2I = (select isnull(PR_Stage2IFlag,0) from ddProjectDisbursementSubmission_draft_Master where DraftID = @DraftID)

	declare @Stage2J bit 
	set @Stage2J = (select isnull(PR_Stage2JFlag,0) from ddProjectDisbursementSubmission_draft_Master where DraftID = @DraftID)

	declare @Stage2K bit 
	set @Stage2K = (select isnull(PR_Stage2KFlag,0) from ddProjectDisbursementSubmission_draft_Master where DraftID = @DraftID)

	declare @Stage3 bit 
	set @Stage3 = (select isnull(PR_Stage3,0) from ddProjectDisbursementSubmission_draft_Master where DraftID = @DraftID)

	declare @Stage4 bit 
	set @Stage4 = (select isnull(PR_Stage4,0) from ddProjectDisbursementSubmission_draft_Master where DraftID = @DraftID)

	declare @Stage5 bit 
	set @Stage5 = (select isnull(PR_Stage5,0) from ddProjectDisbursementSubmission_draft_Master where DraftID = @DraftID)

	declare @Stage6 bit 
	set @Stage6 = (select isnull(PR_Stage6,0) from ddProjectDisbursementSubmission_draft_Master where DraftID = @DraftID)

	declare @Stage7 bit 
	set @Stage7 = (select isnull(PR_Stage7,0) from ddProjectDisbursementSubmission_draft_Master where DraftID = @DraftID)

	declare @Stage8 bit 
	set @Stage8 = (select isnull(PR_Stage8,0) from ddProjectDisbursementSubmission_draft_Master where DraftID = @DraftID)

	declare @Stage9 bit 
	set @Stage9 = (select isnull(PR_Stage9,0) from ddProjectDisbursementSubmission_draft_Master where DraftID = @DraftID)

	declare @StageOthers nvarchar(max) 
	set @StageOthers = (select PR_StageOthers from ddProjectDisbursementSubmission_draft_Master where DraftID = @DraftID)

	set @StageOthers = lower(@StageOthers)

	if (@Stage2A = 0 and @Stage2B = 0 and @Stage2C = 0 and @Stage2D = 0 and @Stage2E = 0 and @Stage2F = 0 and @Stage2G = 0 and @Stage2H = 0 and @Stage2I = 0 and @Stage2J = 0 and @Stage2K = 0 and isnull(@StageOthers,'') = '' and @Stage3 = 0 and @Stage4 = 0 and @Stage5 = 0 and @Stage6 = 0 and @Stage7 = 0 and @Stage8 = 0 and @Stage9 = 0)
	begin
		set @error = @error + 'Please Select At Least 1 Billing Stage Or Fill In Other Billing Stage <br>'
	end 
	
	if (isnull(@StageOthers,'') <> '')
	begin		
		--set @Error = ''
		---set @StageOthers = '10, 11,12,8 ,, 7 ,11'
		DECLARE @myTableVariable3 TABLE (Stage nvarchar(max))
		insert into @myTableVariable3 
		SELECT value 				
		FROM SplitString(REPLACE(@StageOthers, ' ', ''), ',');

		if exists 
		(
			select 1
			from @myTableVariable3
			where Stage = ''
		)
		begin		

			set @Error = @Error + 'Other Billing Stage Format Is Invalid<br>'
		end 

		declare @ExistingStage nvarchar(max) 
		declare @DuplicateStage nvarchar(max) 

		DECLARE @myTableVariable1 TABLE (Stage nvarchar(max),MatchedExisting bit)
		insert into @myTableVariable1 
		SELECT value, 
			case when value in ('2/2a','2b','2c','2d','2f','2g','2f','2g','2h','2i','2j','2k','3','4','5','6','7','8','9') then 1 else 0 end flag
		FROM SplitString(REPLACE(@StageOthers, ' ', ''), ',');

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

			set @Error = @Error + 'Stage ' + @DuplicateStage + ' is duplicated<br>'
		end
	end 


	

	if (@error = '')
	begin
		DECLARE db_cursor CURSOR FOR 
		SELECT arn 
		FROM ddProjectDisbursementSubmission_draft
		--WHERE ProjectCode = @ProjectCode
		where DraftID = @DraftID

		OPEN db_cursor  
		FETCH NEXT FROM db_cursor INTO @arn  

		WHILE @@FETCH_STATUS = 0  
		BEGIN  
			declare @PR_TotalBillingAmount money 					
			declare @Attachment1 nvarchar(max)
			declare @Attachment2 nvarchar(max)
		
			set @PR_TotalBillingAmount = (select BillingAmount from ddProjectDisbursementSubmission_draft where arn = @arn and DraftID = @DraftID)
		
			set @Attachment1 = (select left(attachment1,100) from ddProjectDisbursementSubmission_draft where arn = @arn and DraftID = @DraftID)

			set @Attachment2 = (select left(attachment2,100) from ddProjectDisbursementSubmission_draft where arn = @arn and DraftID = @DraftID)

			/*
			--validate data types 
			if (@PR_TotalBillingAmount  is not null or ltrim(rtrim(@PR_TotalBillingAmount)) <> '')
			begin
				if (isnumeric(@PR_TotalBillingAmount) = 0)
				begin
					set @error = @error + 'Total Billing Amount in the Billing Related Information tab must be a number for case '+@arn+'<br>'
				
				end 
			end 
			*/

		

			--set @error = @error + @PR_TotalBillingAmount
			/*
			if (@PR_TotalBillingAmount is null or ltrim(rtrim(@PR_TotalBillingAmount)) = '')
			begin
				set @error = @error + 'Please fill in Total Billing Amount field in the Billing Related Information tab for case '+@arn+'<br>'
			end 
			*/

			if ((@Attachment1 is null or ltrim(rtrim(@Attachment1)) = '') and (@Attachment2 is null or ltrim(rtrim(@Attachment2)) = ''))
			begin
				set @error = @error + 'Please attach at least 1 attachment for case '+@arn+'<br>'
			end 

			FETCH NEXT FROM db_cursor INTO @arn 
		END 

		CLOSE db_cursor  
		DEALLOCATE db_cursor 

		if (@error = '')
		begin
			
			update ddProjectDisbursementSubmission_draft_Master
			set PR_StageOthers = lower(REPLACE(@StageOthers, ' ', ''))
			where DraftID = @DraftID  

			INSERT INTO [dbo].[ddProjectDisbursementSubmission_SubmissionHistory2]
           ([PR_Stage2AFlag]
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
           ,[FinalBillingFlag]
           ,[DeveloperCode]
           ,[ProjectCode]
           ,[PhaseCode]
           ,[DeveloperLoginID]
           ,[PDFID]
           ,[DraftID]
           ,[PrimaryCustomerName]
           ,[ARN]
           ,[FinancingAmount]
           ,[AddressLine1]
           ,[BillingAmount]
           ,[SubmittedDate]
           ,[ExtraField1]
           ,[ExtraField2]
           ,[ExtraField3]
           ,[ExtraField4])
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
			  ,[FinalBillingFlag]
			  ,m.[DeveloperCode]
			  ,m.[ProjectCode]
			  ,m.[PhaseCode]
			  ,m.[DeveloperLoginID]			 
			  ,m.[PDFID]
			  ,m.[DraftID]			  
			  ,[PrimaryCustomerName]
			  ,[ARN]
			  ,[FinancingAmount]
			  ,[AddressLine1]
			  ,[BillingAmount]			  		
			  ,m.[UpdatedDate]
			  ,[ExtraField1]
			  ,[ExtraField2]
			  ,[ExtraField3]
			  ,[ExtraField4]
		  FROM [dbo].[ddProjectDisbursementSubmission_draft_Master] m
		  inner join ddProjectDisbursementSubmission_draft d on d.draftid = m.draftid 
			where d.[DraftID] = @DraftID 

		/*
		insert into ddProjectDisbursementSubmission_draft_Master_History
		select *
		FROM [dbo].ddProjectDisbursementSubmission_draft_Master
		where [DraftID] = @DraftID 

		insert into ddProjectDisbursementSubmission_draft_History
		select *
		FROM [dbo].[ddProjectDisbursementSubmission_draft] 
		where [DraftID] = @DraftID 

		delete 
		FROM [dbo].ddProjectDisbursementSubmission_draft_Master 
		where [DraftID] = @DraftID 

		delete
		FROM [dbo].[ddProjectDisbursementSubmission_draft] 
		where [DraftID] = @DraftID 
		*/

		
		insert into ddProjectDisbursementSubmission_draft_Master_Staging
		select * from ddProjectDisbursementSubmission_draft_Master
		where DraftID = @DraftID 

		insert into ddProjectDisbursementSubmission_draft_Staging
		select * 
		from ddProjectDisbursementSubmission_draft
		where DraftID = @DraftID 

		delete from ddProjectDisbursementSubmission_draft_Master
		where [DraftID] = @DraftID

		delete from [ddProjectDisbursementSubmission_draft]
		where [DraftID] = @DraftID
		
			 
		end 
	end 
	
end