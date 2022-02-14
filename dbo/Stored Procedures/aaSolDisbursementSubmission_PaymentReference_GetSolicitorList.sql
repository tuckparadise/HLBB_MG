CREATE      procedure [dbo].[aaSolDisbursementSubmission_PaymentReference_GetSolicitorList]
as
begin	
	SELECT [PaymentReference]
      ,[SolicitorFlag]
      ,[BankFlag]
      ,[createddate]
      ,[updateddate]
      ,[createduser]
      ,[updateduser]
  FROM [dbo].[aaSolDisbursementSubmission_PaymentReference]
	where [SolicitorFlag] = 1	
end