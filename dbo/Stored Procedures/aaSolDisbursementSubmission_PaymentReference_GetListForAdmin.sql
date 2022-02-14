create        procedure [dbo].[aaSolDisbursementSubmission_PaymentReference_GetListForAdmin]
as
begin
	
	SELECT id,
		[PaymentReference]
      ,[SolicitorFlag]
      ,[BankFlag]
      ,[createddate]
      ,[updateddate]
      ,[createduser]
      ,[updateduser]
  FROM [dbo].[aaSolDisbursementSubmission_PaymentReference]
	  
end