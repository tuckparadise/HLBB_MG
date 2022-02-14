CREATE procedure [dbo].[usp_SQLDUMaker_ValuerSubmission_Select_ARN_LoweredOMV]
@arn nvarchar(max)
as
begin

	SELECT [ARN]			
		  --,[FormSubmissionDate]
		  ,FORMAT (FormSubmissionDate, 'dd/MM/yyyy') as FormSubmissionDate
		  --,[DocumentExecutionSubmissionDate]
		  ,FORMAT (DocumentExecutionSubmissionDate, 'dd/MM/yyyy') as DocumentExecutionSubmissionDate
		  ,[Decision]
		  ,[DUMakerEmail]		  
		  ,[CreatedDate]
		  ,[UpdatedDate]
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
		  ,[ValuationFeeFinancedByBankFlag]
		  ,[OutputPDFID]
		  --,[ValuerCreatedDate]
		  ,FORMAT (ValuerCreatedDate, 'dd/MM/yyyy') as ValuerCreatedDate
		  --,[ValuerUpdatedDate]
		  ,FORMAT (ValuerUpdatedDate, 'dd/MM/yyyy') as ValuerUpdatedDate
	  FROM [dbo].[SQLDUMakerDP_ValuerSubmission_LoweredOMV]
	  where arn = @arn 
end