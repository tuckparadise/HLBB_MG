CREATE      procedure [dbo].[aaSolDisbursementSubmission_PaymentReference_GetList]
as
begin
	
	SELECT null as id,
		[PaymentReference]
      ,[SolicitorFlag]
      ,[BankFlag]
      ,[createddate]
      ,[updateddate]
      ,[createduser]
      ,[updateduser]
  FROM [dbo].[aaSolDisbursementSubmission_PaymentReference]
	  union 
	select null as id,
	'Others' as [PaymentReference],
	1,
	1,
	null as [createddate],
	null as [createddate],
	null as [createddate],
	null as [createddate]	
end