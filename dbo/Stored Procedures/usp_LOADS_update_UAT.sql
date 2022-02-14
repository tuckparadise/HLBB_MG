CREATE   procedure [dbo].[usp_LOADS_update_UAT]
@ARN nvarchar(max) ,
@Status nvarchar(max) = NULL,
@BranchAddr1 nvarchar(max) = NULL,
@BranchAddr2 nvarchar(max) = NULL,
@BranchAddr3 nvarchar(max) = NULL,
@BranchAddrCity nvarchar(max) = NULL,
@BranchAddrCountry nvarchar(max) = NULL,
@BranchAddrPostCode nvarchar(max) = NULL,
@BranchAddrState nvarchar(max) = NULL,
@BranchManagerEmailAddress nvarchar(max) = NULL,
@BranchManagerName nvarchar(max) = NULL,
@ClosingBranch nvarchar(max) = NULL,
@DateOfLOAcceptance date = NULL,
@FinancingType nvarchar(max) = NULL,
@MortgateCenterCode nvarchar(max) = NULL,
@MortgateCenterEmail nvarchar(max) = NULL,
@PFSalesEmailAddress nvarchar(max) = NULL,
@PFCSalesName nvarchar(max) = NULL,
@SolicitorAccountNbr nvarchar(max) = NULL,
@SolicitorAccountType nvarchar(max) = NULL,
@SolicitorAddr1 nvarchar(max) = NULL,
@SolicitorAddr2 nvarchar(max) = NULL,
@SolicitorAddr3 nvarchar(max) = NULL,
@SolicitorAddrCity nvarchar(max) = NULL,
@SolicitorAddrCountry nvarchar(max) = NULL,
@SolicitorAddrPostCode nvarchar(max) = NULL,
@SolicitorAddrState nvarchar(max) = NULL,
@SolicitorEmail nvarchar(max) = NULL,
@SolInternalStatus nvarchar(max) = NULL,
@SolicitorName nvarchar(max) = NULL,
@SolicitorCode nvarchar(max) = NULL,
@TopUpLoanIndicator nvarchar(max) = NULL,
@ChargorIDNumber nvarchar(max) = NULL,
@ChargorName nvarchar(max) = NULL,
@CustomerAddr1 nvarchar(max) = NULL,
@CustomerAddr2 nvarchar(max) = NULL,
@CustomerAddr3 nvarchar(max) = NULL,
@CustomerAddrCity nvarchar(max) = NULL,
@CustomerAddrCountry nvarchar(max) = NULL,
@CustomerAddrPostCode nvarchar(max) = NULL,
@CustomerAddrState nvarchar(max) = NULL,
@ApplicantEmail nvarchar(max) = NULL,
@CustomerID nvarchar(max) = NULL,
@ApplicantName nvarchar(max) = NULL,
@CustomerName nvarchar(max) = NULL,
@EStatementFlagIndicator nvarchar(max) = NULL,
@GuarantorIDNumber nvarchar(max) = NULL,
@GuarantorName nvarchar(max) = NULL,
@DisbursementManner nvarchar(max) = NULL,
@LoanAmount money = NULL,
@FacilityAmount1 money = NULL,
@FacilityAmount2 money = NULL,
@FacilityAmount3 money = NULL,
@FacilityAmount4 money = NULL,
@FinancingProductName1 nvarchar(max) = NULL,
@FinancingProductName2 nvarchar(max) = NULL,
@FinancingProductName3 nvarchar(max) = NULL,
@FinancingProductName4 nvarchar(max) = NULL,
@GracePeriod int = NULL,
@LegalFeesFinancedAmount money = NULL,
@MRTAFinancedAmount money = NULL,
@PurposeCode nvarchar(max) = NULL,
@TotalFinancingAmount money = NULL,
@ValuationFeesFinancedAmount money = NULL,
@BuildUpArea decimal(19, 2) = NULL,
@DeveloperCode nvarchar(max) = NULL,
@DeveloperName nvarchar(max) = NULL,
@CollateralPurpose nvarchar(max) = NULL,
@LandArea decimal(19, 2) = NULL,
@ProjectCode nvarchar(max) = NULL,
@ProjectName nvarchar(max) = NULL,
@PropertyAddress nvarchar(max) = NULL,
@PropertyType nvarchar(max) = NULL,
@ValuationRequired nvarchar(max) = NULL,
@TitleDetailsLO nvarchar(max) = NULL,
@ValuerAccountNBR nvarchar(max) = NULL,
@ValuerAccountType nvarchar(max) = NULL,
@ValuerAddr1 nvarchar(max) = NULL,
@ValuerAddr2 nvarchar(max) = NULL,
@ValuerAddr3 nvarchar(max) = NULL,
@ValuerAddrCity nvarchar(max) = NULL,
@ValuerAddrCountry nvarchar(max) = NULL,
@ValuerAddrPostCode nvarchar(max) = NULL,
@ValuerAddrState nvarchar(max) = NULL,
@ValuerCode nvarchar(max) = NULL,
@ValuerEmail nvarchar(max) = NULL,
@ValuerName nvarchar(max) = NULL,
@VerbalIndicativeValue money = NULL,
@RESPONSECODE nvarchar(max) = NULL,
@RESPONSEDESCRIPTION nvarchar(max) = NULL,
@priApplicantId [nvarchar](max) = NULL,
@valuerFaxNbr [nvarchar](max) = NULL,
@valuerTelNbr [nvarchar](max) = NULL,
@solicitorFaxNbr [nvarchar](max) = NULL,
@solicitorTelNbr [nvarchar](max) = NULL,	
@PhaseCode [nvarchar](max) = NULL,
@PhaseName [nvarchar](max) = NULL,
@AddressLine1 [nvarchar](max) = NULL,
@SPAValue [nvarchar](max) = NULL,
@Category [nvarchar](max) = NULL
as
begin    
	    
	declare @ValuationRequiredbit bit 

	-- 20210813 - start fixed checking which will return true/false instead of Yes/No
	--if (@ValuationRequired is null or @ValuationRequired = 'No')
	if (@ValuationRequired is null or @ValuationRequired = 'No' or @ValuationRequired = 'False')
	begin
		set @ValuationRequiredbit = 0
	end 
	else
	begin
		set @ValuationRequiredbit = 1		
	end 
	-- 20210813 - start fixed checking which will return true/false instead of Yes/No

	if exists 
	(
		select 1
		from [SQLLOADS]
		where arn = @arn 
	)
	begin
		
		UPDATE [dbo].[SQLLOADS]
       SET 
            [ARN] = @ARN
          ,[Status] = @Status
          ,[BranchAddr1] = @BranchAddr1
          ,[BranchAddr2] = @BranchAddr2
          ,[BranchAddr3] = @BranchAddr3
          ,[BranchAddrCity] = @BranchAddrCity
          ,[BranchAddrCountry] = @BranchAddrCountry
          ,[BranchAddrPostCode] = @BranchAddrPostCode
          ,[BranchAddrState] = @BranchAddrState
          ,[BranchManagerEmailAddress] = @BranchManagerEmailAddress
          ,[BranchManagerName] = @BranchManagerName
          ,[ClosingBranch] = @ClosingBranch
          ,[DateOfLOAcceptance] = @DateOfLOAcceptance
          ,[FinancingType] = @FinancingType
          ,[MortgateCenterCode] = @MortgateCenterCode
          ,[MortgateCenterEmail] = @MortgateCenterEmail
          ,[PFSalesEmailAddress] = @PFSalesEmailAddress
          ,[PFCSalesName] = @PFCSalesName
          ,[SolicitorAccountNbr] = @SolicitorAccountNbr
          ,[SolicitorAccountType] = @SolicitorAccountType
          ,[SolicitorAddr1] = @SolicitorAddr1
          ,[SolicitorAddr2] = @SolicitorAddr2
          ,[SolicitorAddr3] = @SolicitorAddr3
          ,[SolicitorAddrCity] = @SolicitorAddrCity
          ,[SolicitorAddrCountry] = @SolicitorAddrCountry
          ,[SolicitorAddrPostCode] = @SolicitorAddrPostCode
          ,[SolicitorAddrState] = @SolicitorAddrState
          ,[SolicitorEmail] = @SolicitorEmail
          ,[SolInternalStatus] = @SolInternalStatus
          ,[SolicitorName] = @SolicitorName
          ,[SolicitorCode] = @SolicitorCode
          ,[TopUpLoanIndicator] = @TopUpLoanIndicator
          ,[ChargorIDNumber] = @ChargorIDNumber
          ,[ChargorName] = @ChargorName
          ,[CustomerAddr1] = @CustomerAddr1
          ,[CustomerAddr2] = @CustomerAddr2
          ,[CustomerAddr3] = @CustomerAddr3
          ,[CustomerAddrCity] = @CustomerAddrCity
          ,[CustomerAddrCountry] = @CustomerAddrCountry
          ,[CustomerAddrPostCode] = @CustomerAddrPostCode
          ,[CustomerAddrState] = @CustomerAddrState
          ,[ApplicantEmail] = @ApplicantEmail
          ,[CustomerID] = @CustomerID
          ,[ApplicantName] = @ApplicantName
          ,[CustomerName] = @CustomerName
          ,[EStatementFlagIndicator] = @EStatementFlagIndicator
          ,[GuarantorIDNumber] = @GuarantorIDNumber
          ,[GuarantorName] = @GuarantorName
          ,[DisbursementManner] = @DisbursementManner
          ,[LoanAmount] = @LoanAmount
          ,[FacilityAmount1] = @FacilityAmount1
          ,[FacilityAmount2] = @FacilityAmount2
          ,[FacilityAmount3] = @FacilityAmount3
          ,[FacilityAmount4] = @FacilityAmount4
          ,[FinancingProductName1] = @FinancingProductName1
          ,[FinancingProductName2] = @FinancingProductName2
          ,[FinancingProductName3] = @FinancingProductName3
          ,[FinancingProductName4] = @FinancingProductName4
          ,[GracePeriod] = @GracePeriod
          ,[LegalFeesFinancedAmount] = @LegalFeesFinancedAmount
          ,[MRTAFinancedAmount] = @MRTAFinancedAmount
          ,[PurposeCode] = @PurposeCode
          ,[TotalFinancingAmount] = @TotalFinancingAmount
          ,[ValuationFeesFinancedAmount] = @ValuationFeesFinancedAmount
          ,[BuildUpArea] = @BuildUpArea
          ,[DeveloperCode] = @DeveloperCode
          ,[DeveloperName] = @DeveloperName
          ,[CollateralPurpose] = @CollateralPurpose
          ,[LandArea] = @LandArea
          ,[ProjectCode] = @ProjectCode
          ,[ProjectName] = @ProjectName
          ,[PropertyAddress] = @PropertyAddress
          ,[PropertyType] = @PropertyType
          ,[ValuationRequired] = @ValuationRequiredbit
          ,[TitleDetailsLO] = @TitleDetailsLO
          ,[ValuerAccountNBR] = @ValuerAccountNBR
          ,[ValuerAccountType] = @ValuerAccountType
          ,[ValuerAddr1] = @ValuerAddr1
          ,[ValuerAddr2] = @ValuerAddr2
          ,[ValuerAddr3] = @ValuerAddr3
          ,[ValuerAddrCity] = @ValuerAddrCity
          ,[ValuerAddrCountry] = @ValuerAddrCountry
          ,[ValuerAddrPostCode] = @ValuerAddrPostCode
          ,[ValuerAddrState] = @ValuerAddrState
          ,[ValuerCode] = @ValuerCode
          ,[ValuerEmail] = @ValuerEmail
          ,[ValuerName] = @ValuerName
          ,[VerbalIndicativeValue] = @VerbalIndicativeValue
          ,[RESPONSECODE] = @RESPONSECODE
          ,[RESPONSEDESCRIPTION] = @RESPONSEDESCRIPTION
         -- ,[CreatedDate] = @CreatedDate
          ,[UpdatedDate] = getdate()
		  ,PrimaryCustomerID = @priApplicantId 
		,ValFaxNbr = @valuerFaxNbr 
		,ValTelNbr = @valuerTelNbr 
		,SolFaxNbr = @solicitorFaxNbr 
		,SolTelNbr = @solicitorTelNbr 
		,PhaseCode  = @PhaseCode 
		,PhaseName = @PhaseName 
		,AddressLine1 = @AddressLine1 
		,SPAValue = @SPAValue 
		,Category = @Category 
		where arn = @arn 
 
	end 
	else
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
           ,[PrimaryCustomerID]
           ,[SolTelNbr]
           ,[SolFaxNbr]
           ,[ValTelNbr]
           ,[ValFaxNbr]
           ,[PhaseCode]
           ,[PhaseName]
           ,[AddressLine1]
           ,[SPAValue]
           ,[Category])
     VALUES
           (
		   @ARN
			,@Status
			,@BranchAddr1
			,@BranchAddr2
			,@BranchAddr3
			,@BranchAddrCity
			,@BranchAddrCountry
			,@BranchAddrPostCode
			,@BranchAddrState
			,@BranchManagerEmailAddress
			,@BranchManagerName
			,@ClosingBranch
			,@DateOfLOAcceptance
			,@FinancingType
			,@MortgateCenterCode
			,@MortgateCenterEmail
			,@PFSalesEmailAddress
			,@PFCSalesName
			,@SolicitorAccountNbr
			,@SolicitorAccountType
			,@SolicitorAddr1
			,@SolicitorAddr2
			,@SolicitorAddr3
			,@SolicitorAddrCity
			,@SolicitorAddrCountry
			,@SolicitorAddrPostCode
			,@SolicitorAddrState
			,@SolicitorEmail
			,@SolInternalStatus
			,@SolicitorName
			,@SolicitorCode
			,@TopUpLoanIndicator
			,@ChargorIDNumber
			,@ChargorName
			,@CustomerAddr1
			,@CustomerAddr2
			,@CustomerAddr3
			,@CustomerAddrCity
			,@CustomerAddrCountry
			,@CustomerAddrPostCode
			,@CustomerAddrState
			,@ApplicantEmail
			,@CustomerID
			,@ApplicantName
			,@CustomerName
			,@EStatementFlagIndicator
			,@GuarantorIDNumber
			,@GuarantorName
			,@DisbursementManner
			,@LoanAmount
			,@FacilityAmount1
			,@FacilityAmount2
			,@FacilityAmount3
			,@FacilityAmount4
			,@FinancingProductName1
			,@FinancingProductName2
			,@FinancingProductName3
			,@FinancingProductName4
			,@GracePeriod
			,@LegalFeesFinancedAmount
			,@MRTAFinancedAmount
			,@PurposeCode
			,@TotalFinancingAmount
			,@ValuationFeesFinancedAmount
			,@BuildUpArea
			,@DeveloperCode
			,@DeveloperName
			,@CollateralPurpose
			,@LandArea
			,@ProjectCode
			,@ProjectName
			,@PropertyAddress
			,@PropertyType
			,@ValuationRequired
			,@TitleDetailsLO
			,@ValuerAccountNBR
			,@ValuerAccountType
			,@ValuerAddr1
			,@ValuerAddr2
			,@ValuerAddr3
			,@ValuerAddrCity
			,@ValuerAddrCountry
			,@ValuerAddrPostCode
			,@ValuerAddrState
			,@ValuerCode
			,@ValuerEmail
			,@ValuerName
			,@VerbalIndicativeValue
			,@RESPONSECODE
			,@RESPONSEDESCRIPTION
			,getdate()
			,getdate()
			,@priApplicantId
			,@solicitorTelNbr
			,@solicitorFaxNbr
			, @valuerTelNbr
			, @valuerFaxNbr
			,@PhaseCode
			,@PhaseName
			,@AddressLine1
			,@SPAValue
			,@Category)
	end 
	/*
	declare @documentationstatus nvarchar(max)

	select @documentationstatus = [Status]
	from SQLDUMakerDP_SolicitorSubmission
	where arn = @arn
	
	if (@documentationstatus <> 'Completed')
	begin	
		 UPDATE [dbo].[SQLLOADS]
		 set SolicitorCode = @SolicitorCode,
			ValuerCode = @ValuerCode
		where arn = @arn 
	end 
	*/
 end