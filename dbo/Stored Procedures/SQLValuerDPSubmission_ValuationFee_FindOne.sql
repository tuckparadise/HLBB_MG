CREATE   procedure [dbo].[SQLValuerDPSubmission_ValuationFee_FindOne]
@arn nvarchar(max) = null 
as
begin

	SELECT s.[arn] as [arn]
		  ,[FacilityAccountNumber]
		  ,[PaymentMode]
		  ,[PayeeID]
		  ,[PayeeName]
		  ,[BeneficiaryBank]
		  ,[BeneficiaryBankAccountNumber]
		  ,[AmountDisburse]
		  ,[PaymentReference]
		  ,[PaymentDescription]
		  ,v.[CreatedDate] as [CreatedDate]
		  ,v.[UpdatedDate] as [UpdatedDate]
		  ,isnull(ValuationFeesFinancedAmount,0) as ValuationFeesFinancedAmount
	  --FROM [dbo].[SQLValuerDPSubmission_ValuationFee] v
	  --inner join sqlloads s on s.arn = v.arn 
	   FROM sqlloads s
		left join [dbo].SQLValuerDPSubmission_ValuationFee v on s.arn = v.arn 
	  where s.arn = @arn
end