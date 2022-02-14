CREATE procedure [dbo].[usp_SQLDUMakerDPSubmission_ValuerInput_Submission_select]
@ARN varchar(100)
as
begin

	SELECT [ARN]
		  ,[ValuerCode]
		  ,[ValuerReportAttachmentURL]
		  ,[ValuerReportAttachment]
		  ,[ValuerReportAttachmentDate]
		  ,[VRInstructionDate]
		  ,[ValuerReference]
		  ,[PersonInChargeName]
		  ,[VUpdateInfoStatus]
		  ,[VLowerOMVStatus]
		  ,[VUpdateInfoStatusOthers]
		  ,[VLowerOMVReasons]
		  ,[DateOfValuation]
		  ,[MarketValue]
		  ,[FireInsuranceValue]
		  ,[InvoiceNumber]
		  ,[ShortfallAmount]
		  ,[Declaration]
		  ,[Status]
		  ,[CreatedDate]
		  ,[UpdatedDate]
		  ,[ValuationFeeFinancedByBankFlag]
		  ,[LF_PayeeName]
		  ,[LF_BilledAmount]
		  ,[LF_AccountNumber]
		  ,[LF_Bank]
		  ,[LF_PaymentDescription]
		  ,[LF_PaymentMode]
	from SQLValuerDPSubmission
	where arn = @arn

end