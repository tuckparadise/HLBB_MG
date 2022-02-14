CREATE   procedure [dbo].[usp_ws_LOADS_STAGING_INSERT2]
	@ARN [nvarchar](100) ,
	@Status [nvarchar](15) NULL,
	@BranchAddr1 [nvarchar](100) NULL,
	@BranchAddr2 [nvarchar](100) NULL,
	@BranchAddr3 [nvarchar](100) NULL,
	@BranchAddrCity [nvarchar](100) NULL,
	@BranchAddrCountry [nvarchar](100) NULL,
	@BranchAddrPostCode [nvarchar](10) NULL,
	@BranchAddrState [nvarchar](100) NULL,
	@BranchManagerEmailAddress [nvarchar](60) NULL,
	@BranchManagerName [nvarchar](50) NULL,
	@ClosingBranch [nvarchar](10) NULL,
	@DateOfLOAcceptance [nvarchar](max) NULL,
	@FinancingType [nvarchar](15) NULL,
	@MortgateCenterCode [nvarchar](16) NULL,
	@MortgateCenterEmail [nvarchar](60) NULL,
	@PFSalesEmailAddress [nvarchar](60) NULL,
	@PFCSalesName [nvarchar](100) NULL,
	@SolicitorAccountNbr [nvarchar](20) NULL,
	@SolicitorAccountType [nvarchar](20) NULL,
	@SolicitorAddr1 [nvarchar](100) NULL,
	@SolicitorAddr2 [nvarchar](100) NULL,
	@SolicitorAddr3 [nvarchar](100) NULL,
	@SolicitorAddrCity [nvarchar](100) NULL,
	@SolicitorAddrCountry [nvarchar](100) NULL,
	@SolicitorAddrPostCode [nvarchar](10) NULL,
	@SolicitorAddrState [nvarchar](100) NULL,
	@SolicitorEmail [nvarchar](150) NULL,
	@SolInternalStatus [nvarchar](20) NULL,
	@SolicitorName [nvarchar](50) NULL,
	@SolicitorCode [nvarchar](100) NULL,
	@TopUpLoanIndicator [nvarchar](5) NULL,
	@ChargorIDNumber [nvarchar](100) NULL,
	@ChargorName [nvarchar](500) NULL,
	@CustomerAddr1 [nvarchar](100) NULL,
	@CustomerAddr2 [nvarchar](100) NULL,
	@CustomerAddr3 [nvarchar](100) NULL,
	@CustomerAddrCity [nvarchar](50) NULL,
	@CustomerAddrCountry [nvarchar](100) NULL,
	@CustomerAddrPostCode [nvarchar](10) NULL,
	@CustomerAddrState [nvarchar](100) NULL,
	@ApplicantEmail [nvarchar](255) NULL,
	@CustomerID [nvarchar](100) NULL,
	@ApplicantName [nvarchar](250) NULL,
	@CustomerName [nvarchar](500) NULL,
	@EStatementFlagIndicator [nvarchar](20) NULL,
	@GuarantorIDNumber [nvarchar](100) NULL,
	@GuarantorName [nvarchar](500) NULL,
	@DisbursementManner [nvarchar](50) NULL,
	@LoanAmount [money] NULL,
	@FacilityAmount1 [money] NULL,
	@FacilityAmount2 [money] NULL,
	@FacilityAmount3 [money] NULL,
	@FacilityAmount4 [money] NULL,
	@FinancingProductName1 [nvarchar](100) NULL,
	@FinancingProductName2 [nvarchar](100) NULL,
	@FinancingProductName3 [nvarchar](100) NULL,
	@FinancingProductName4 [nvarchar](100) NULL,
	@GracePeriod [int] NULL,
	@LegalFeesFinancedAmount [money] NULL,
	@MRTAFinancedAmount [money] NULL,
	@PurposeCode [nvarchar](50) NULL,
	@TotalFinancingAmount [money] NULL,
	@ValuationFeesFinancedAmount [money] NULL,
	@BuildUpArea [decimal](19, 2) NULL,
	@DeveloperCode [nvarchar](20) NULL,
	@DeveloperName [nvarchar](100) NULL,
	@CollateralPurpose [nvarchar](30) NULL,
	@LandArea [decimal](19, 2) NULL,
	@ProjectCode [nvarchar](20) NULL,
	@ProjectName [nvarchar](100) NULL,
	@PropertyAddress [nvarchar](200) NULL,
	@PropertyType [nvarchar](100) NULL,
	@ValuationRequired [bit] NULL,
	@TitleDetailsLO [nvarchar](1000) NULL,
	@ValuerAccountNBR [nvarchar](20) NULL,
	@ValuerAccountType [nvarchar](20) NULL,
	@ValuerAddr1 [nvarchar](100) NULL,
	@ValuerAddr2 [nvarchar](100) NULL,
	@ValuerAddr3 [nvarchar](100) NULL,
	@ValuerAddrCity [nvarchar](100) NULL,
	@ValuerAddrCountry [nvarchar](100) NULL,
	@ValuerAddrPostCode [nvarchar](10) NULL,
	@ValuerAddrState [nvarchar](100) NULL,
	@ValuerCode [nvarchar](100) NULL,
	@ValuerEmail [nvarchar](150) NULL,
	@ValuerName [nvarchar](50) NULL,
	@VerbalIndicativeValue [money] NULL,
	@RESPONSECODE [nvarchar](1000) NULL,
	@RESPONSEDESCRIPTION [nvarchar](1000) NULL,
	@priApplicantId [nvarchar](100) NULL,
	@valuerFaxNbr [nvarchar](100) NULL,
	@valuerTelNbr [nvarchar](100) NULL,
	@solicitorFaxNbr [nvarchar](100) NULL,
	@solicitorTelNbr [nvarchar](100) NULL	,
	@phaseCode [nvarchar](max) NULL,
	@phaseName [nvarchar](max) NULL,
	@unitParcelNo [nvarchar](max) NULL,
	@spaValue [money] NULL,
	@category [nvarchar](max) NULL
as
begin
		
		
	declare @text nvarchar(max), @text2 nvarchar(max),
		@day nvarchar(max), @month nvarchar(max), @year nvarchar(max), @fulldate nvarchar(max)

	--set @text = '1/3/2019 12:00:00 AM'

	Select @text2 = items
	From dbo.split(@DateOfLOAcceptance,' ')
	Where nameindex=1


	Select @day = items
	From dbo.split(@text2,'/')
	Where nameindex=1

	Select @month = items
	From dbo.split(@text2,'/')
	Where nameindex=2

	Select @year = items
	From dbo.split(@text2,'/')
	Where nameindex=3

	select @fulldate = @year + '-'+ @month +'-'+ @day  

	declare @DtDateOfLOAcceptance datetime 
	--select @date1 = convert(varchar,@date1,1) 
	set @DtDateOfLOAcceptance = Cast(@fulldate as datetime)

	--select @date1

	if (@CustomerID is null or ltrim(rtrim(@CustomerID)) = '')
	begin
		set @CustomerID = 'N/A'
	end 

	if (@ApplicantName is null or ltrim(rtrim(@ApplicantName)) = '')
	begin
		set @ApplicantName = 'N/A'
	end 

	if (@CustomerName is null or ltrim(rtrim(@CustomerName)) = '')
	begin
		set @CustomerName = 'N/A'
	end 

	INSERT INTO [dbo].[SQLLOADS_staging2]
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
			   ,[batchDateTime]	
			   , PrimaryCustomerID
			   , SolTelNbr	   
			   , SolFaxNbr
			   , ValTelNbr
			   , ValFaxNbr
			    , 	phaseCode 
				,phaseName 
				,AddressLine1
				,SPAValue 
				,Category 
			   )
	values (
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
           --,@DateOfLOAcceptance
		   ,@DtDateOfLOAcceptance
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
           ,getdate()
			,@priApplicantId 
			,@solicitorTelNbr
			,@solicitorFaxNbr 
			,@valuerTelNbr 
			,@valuerFaxNbr 
			,@phaseCode
			,@phaseName 
			,@unitParcelNo 
			,@spaValue
			,@category 
		   )
end