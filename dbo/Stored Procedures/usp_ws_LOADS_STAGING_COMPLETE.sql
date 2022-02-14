CREATE procedure [dbo].[usp_ws_LOADS_STAGING_COMPLETE]	
as
begin
		
	delete from SQLLOADS_staging
	where arn in (select arn from sqlloads)

	if exists (
		select * FROM [dbo].SQLLOADS_staging
	)
	begin
		INSERT INTO [dbo].[SQLLOADS]
           ([ARN]
           ,[Status]
           ,[BranchAddr1]
           ,[BranchAddr2]
           ,[BranchAddr3]
           ,[BranchAddrCity]
           ,[BranchAddrCountry]
           ,[BranchAddrPostCode]
           ,[BranchAddrState]
           ,[BranchManagerEmailAddress]
           ,[BranchManagerName]
           ,[ClosingBranch]
           ,[DateOfLOAcceptance]
           ,[FinancingType]
           ,[MortgateCenterCode]
           ,[MortgateCenterEmail]
           ,[PFSalesEmailAddress]
           ,[PFCSalesName]
           ,[SolicitorAccountNbr]
           ,[SolicitorAccountType]
           ,[SolicitorAddr1]
           ,[SolicitorAddr2]
           ,[SolicitorAddr3]
           ,[SolicitorAddrCity]
           ,[SolicitorAddrCountry]
           ,[SolicitorAddrPostCode]
           ,[SolicitorAddrState]
           ,[SolicitorEmail]
           ,[SolInternalStatus]
           ,[SolicitorName]
           ,[SolicitorCode]
           ,[TopUpLoanIndicator]
           ,[ChargorIDNumber]
           ,[ChargorName]
           ,[CustomerAddr1]
           ,[CustomerAddr2]
           ,[CustomerAddr3]
           ,[CustomerAddrCity]
           ,[CustomerAddrCountry]
           ,[CustomerAddrPostCode]
           ,[CustomerAddrState]
           ,[ApplicantEmail]
           ,[CustomerID]
           ,[ApplicantName]
           ,[CustomerName]
           ,[EStatementFlagIndicator]
           ,[GuarantorIDNumber]
           ,[GuarantorName]
           ,[DisbursementManner]
           ,[LoanAmount]
           ,[FacilityAmount1]
           ,[FacilityAmount2]
           ,[FacilityAmount3]
           ,[FacilityAmount4]
           ,[FinancingProductName1]
           ,[FinancingProductName2]
           ,[FinancingProductName3]
           ,[FinancingProductName4]
           ,[GracePeriod]
           ,[LegalFeesFinancedAmount]
           ,[MRTAFinancedAmount]
           ,[PurposeCode]
           ,[TotalFinancingAmount]
           ,[ValuationFeesFinancedAmount]
           ,[BuildUpArea]
           ,[DeveloperCode]
           ,[DeveloperName]
           ,[CollateralPurpose]
           ,[LandArea]
           ,[ProjectCode]
           ,[ProjectName]
           ,[PropertyAddress]
           ,[PropertyType]
           ,[ValuationRequired]
           ,[TitleDetailsLO]
           ,[ValuerAccountNBR]
           ,[ValuerAccountType]
           ,[ValuerAddr1]
           ,[ValuerAddr2]
           ,[ValuerAddr3]
           ,[ValuerAddrCity]
           ,[ValuerAddrCountry]
           ,[ValuerAddrPostCode]
           ,[ValuerAddrState]
           ,[ValuerCode]
           ,[ValuerEmail]
           ,[ValuerName]
           ,[VerbalIndicativeValue]
           ,[RESPONSECODE]
           ,[RESPONSEDESCRIPTION]           
           ,[CreatedDate]
           ,[UpdatedDate]
		     , PrimaryCustomerID
			   , SolTelNbr	   
			   , SolFaxNbr
			   , ValTelNbr
			   , ValFaxNbr
			,PhaseCode 
			,PhaseName 
			,AddressLine1 
			,SPAValue 
			,Category				 
			   )	
		SELECT [ARN]
			,[Status]
			,[BranchAddr1]
			,[BranchAddr2]
			,[BranchAddr3]
			,[BranchAddrCity]
			,[BranchAddrCountry]
			,[BranchAddrPostCode]
			,[BranchAddrState]
			,[BranchManagerEmailAddress]
			,[BranchManagerName]
			,[ClosingBranch]
			,[DateOfLOAcceptance]
			,[FinancingType]
			,[MortgateCenterCode]
			,[MortgateCenterEmail]
			,[PFSalesEmailAddress]
			,[PFCSalesName]
			,[SolicitorAccountNbr]
			,[SolicitorAccountType]
			,[SolicitorAddr1]
			,[SolicitorAddr2]
			,[SolicitorAddr3]
			,[SolicitorAddrCity]
			,[SolicitorAddrCountry]
			,[SolicitorAddrPostCode]
			,[SolicitorAddrState]
			,[SolicitorEmail]
			,[SolInternalStatus]
			,[SolicitorName]
			,[SolicitorCode]
			,[TopUpLoanIndicator]
			,[ChargorIDNumber]
			,[ChargorName]
			,[CustomerAddr1]
			,[CustomerAddr2]
			,[CustomerAddr3]
			,[CustomerAddrCity]
			,[CustomerAddrCountry]
			,[CustomerAddrPostCode]
			,[CustomerAddrState]
			,[ApplicantEmail]
			,[CustomerID]
			,[ApplicantName]
			,[CustomerName]
			,[EStatementFlagIndicator]
			,[GuarantorIDNumber]
			,[GuarantorName]
			,[DisbursementManner]
			,[LoanAmount]
			,[FacilityAmount1]
			,[FacilityAmount2]
			,[FacilityAmount3]
			,[FacilityAmount4]
			,[FinancingProductName1]
			,[FinancingProductName2]
			,[FinancingProductName3]
			,[FinancingProductName4]
			,[GracePeriod]
			,[LegalFeesFinancedAmount]
			,[MRTAFinancedAmount]
			,[PurposeCode]
			,[TotalFinancingAmount]
			,[ValuationFeesFinancedAmount]
			,[BuildUpArea]
			,[DeveloperCode]
			,[DeveloperName]
			,[CollateralPurpose]
			,[LandArea]
			,[ProjectCode]
			,[ProjectName]
			,[PropertyAddress]
			,[PropertyType]
			,[ValuationRequired]
			,[TitleDetailsLO]
			,[ValuerAccountNBR]
			,[ValuerAccountType]
			,[ValuerAddr1]
			,[ValuerAddr2]
			,[ValuerAddr3]
			,[ValuerAddrCity]
			,[ValuerAddrCountry]
			,[ValuerAddrPostCode]
			,[ValuerAddrState]
			,[ValuerCode]
			,[ValuerEmail]
			,[ValuerName]
			,[VerbalIndicativeValue]
			,[RESPONSECODE]
			,[RESPONSEDESCRIPTION]
			,[CreatedDate]
			,[UpdatedDate]
			, PrimaryCustomerID
			, SolTelNbr	   
			, SolFaxNbr
			, ValTelNbr
			, ValFaxNbr
			,PhaseCode  
			,PhaseName 
			,AddressLine1 
			,SPAValue 
			,Category 				 
		FROM [dbo].SQLLOADS_staging		
	end 	
	

	declare @RequiredValuation bit , @arn nvarchar(max), @ValCode nvarchar(max), @SolCode nvarchar(max)

	declare @phasecode nvarchar(max) , @projectcode nvarchar(max), @developercode nvarchar(max)

	DECLARE cursor_LoadsStaging CURSOR
	FOR SELECT arn ,
			ValuationRequired,
			[ValuerCode],
			[SolicitorCode],
			PhaseCode,
			ProjectCode,
			DeveloperCode
		FROM 
			SQLLOADS_staging

	OPEN cursor_LoadsStaging;

	FETCH NEXT FROM cursor_LoadsStaging INTO 
		@arn, 
		@RequiredValuation,
		@valcode,
		@SolCode,
		@PhaseCode,
		@ProjectCode,
		@DeveloperCode
		;

	WHILE @@FETCH_STATUS = 0
	BEGIN
		
		if (@RequiredValuation = 1)
		begin
			insert into WorkflowHistory
			values ('Valuation Report',@arn,'Case Received By Valuer',@valcode,null,getdate())
		end 

		insert into WorkflowHistory
		values ('Documentation',@arn,'Case Received By Solicitor',@SolCode,null,getdate())

		declare @email_header nvarchar(max)
		set @email_header = ( select dbo.ufn_NewPhaseCode_header_generate())

		declare @email_content nvarchar(max)
		set @email_content = ( select dbo.[ufn_NewPhaseCode_body_generate](@DeveloperCode,@ProjectCode,@PhaseCode,@arn))

		declare @email_receiver nvarchar(max)

		set @email_receiver = ( 
			SELECT COALESCE(@email_receiver + ', ', '') + UserEmail 
			FROM internaluser
			inner join 
			(select distinct username 
			from UserRoleMetric where userroleid in (select UserRoleID from [InternalUserRole] where IsMortgageAdmin = 1)
			) tbl on tbl.UserName = internaluser.UserName
			where useremail is not null 
		)

		if not exists 
		(
			select 1
			from ddProjectPhase
			where PhaseCode = @phasecode
		)
		begin			
			INSERT INTO [dbo].[ddProjectNewPhaseCodeEmailToAdminLog]
           ([DeveloperCode]
           ,[ProjectCode]
           ,[PhaseCode]
           ,[NewLIDate]
           ,[ARN]
           ,[EmailHeader]
           ,[EmailContent]
           ,[EmailSender]
           ,[EmailReceiver]
           ,[EmailSentFlag]
           ,[EmailSentDate]
           ,[CreatedUser]
           ,[CreatedDate]
           ,[DeletedUser]
           ,[DeletedDate])
		   values 
		   (
			@developercode,
			@projectcode,
			@phasecode,
			getdate(),
			@arn,
			@email_header,
			@email_content,
			null,
			@email_receiver,
			0,
			null,
			getdate(),
			getdate(),
			getdate(),
			getdate()
		   )
		end 

		FETCH NEXT FROM cursor_LoadsStaging INTO 
			@arn, 
			@RequiredValuation,
			@valcode,
			@SolCode,
			@PhaseCode,
			@ProjectCode,
			@DeveloperCode
			;
	END;

	CLOSE cursor_LoadsStaging;

	DEALLOCATE cursor_LoadsStaging;		

	/*
	declare @newCDC datetime 
	select 	@newCDC = tempLICDC
	from tblCDC

	update tblCDC
	set newLICDC = @newCDC
	*/

end