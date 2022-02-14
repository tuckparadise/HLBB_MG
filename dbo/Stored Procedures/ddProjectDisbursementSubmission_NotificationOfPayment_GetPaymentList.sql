CREATE   procedure [dbo].[ddProjectDisbursementSubmission_NotificationOfPayment_GetPaymentList]
  @developercode nvarchar(max) = null,
  @projectcode nvarchar(max) = null,
  @phasecode nvarchar(max) = null,
  @notificationdate datetime = null 
  as
  begin
  
SELECT [arn]
      ,[RunningIDForCurrentSubmission]
      ,[FacilityAccountNumber]
      ,[PaymentMode]
      ,[PayeeID]
      ,[PayeeName]
      ,[BeneficiaryBank]
      ,[BeneficiaryBankAccountNumber]
      ,[AmountDisburse]
      ,[PaymentReference]
      ,[PaymentDescription]
      ,[PaymentCreatedDate]
      ,[PaymentUpdatedDate]
      ,[DisMakerEmail]
      ,[DisMakerSubmissionDate]
      ,[DisCheckerEmail]
      ,[DisCheckerApprovedDate]
      ,[RCOMakerEmail]
      ,[RCOMakerApprovedDate]
      ,[RCOCheckerEmail]
      ,[RCOCheckerApprovedDate]
      ,[AccountFrom]
      ,[DevName]
      ,[SolName]
      ,[CreatedDate]
      ,[UpdatedDate]
      ,[Locked]
      ,[DevCode]
      ,[SolCode]
      ,[DevEmail]
      ,[SolEmail]
      ,[ProjectCode]
      ,[ProjectName]
      ,[PhaseCode]
      ,[PhaseName]
      ,[AddressLine1]
      ,[PrimaryCustomerName]
      ,[BillingAmount]
      ,[FinalBillingFlag]
      ,[DeveloperLoginID]
      ,[BillingStage]
      ,[pdfid]
      ,[ExtraField1]
      ,[ExtraField2]
      ,[ExtraField3]
      ,[ExtraField4]
      ,[RunningID]
	FROM [dbo].ddProjectDisbursementSubmission_NotificationOfPayment
  where [DevCode] = @developercode 
	and projectcode = @projectcode 
	and [PhaseCode] = @phasecode
	and year([DisCheckerApprovedDate]) = year(@notificationdate)
	and month([DisCheckerApprovedDate]) = month(@notificationdate)
	and day([DisCheckerApprovedDate]) = day(@notificationdate)
  end