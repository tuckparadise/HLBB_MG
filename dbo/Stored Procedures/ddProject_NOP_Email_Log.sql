create       procedure [dbo].[ddProject_NOP_Email_Log]
@DevCode nvarchar(max) = null ,
@ProjectCode nvarchar(max) = null ,
@PhaseCode nvarchar(max) = null ,
@ProcessingDate datetime = null 
as
begin
	insert into ddProjectDisbursementSubmission_NotificationOfPayment_EmailLog
	select 
		 [arn]
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
      ,getdate()
      ,getdate()
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
		,case when DevEmail = '' then 0 else 1 end 
	from ddProjectDisbursementSubmission_NotificationOfPayment_staging_master_EDMS	
	where DevCode = @DevCode
	and ProjectCode = @ProjectCode
	and PhaseCode = @PhaseCode
	and year(DisCheckerApprovedDate) = year(@ProcessingDate)
	and month(DisCheckerApprovedDate) = month(@ProcessingDate)
	and day(DisCheckerApprovedDate) = day(@ProcessingDate)
end