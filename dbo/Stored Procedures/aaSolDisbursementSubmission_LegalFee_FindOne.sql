CREATE   procedure [dbo].[aaSolDisbursementSubmission_LegalFee_FindOne]
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
		  ,l.[CreatedDate] as [CreatedDate]
		  ,l.[UpdatedDate] as [UpdatedDate]
		  ,isnull(LegalFeesFinancedAmount,0) as LegalFeesFinancedAmount
	  FROM sqlloads s
		left join [dbo].[aaSolDisbursementSubmission_LegalFee] l on s.arn = l.arn 
		--inner join sqlloads s on s.arn = l.arn 
	  where s.arn = @arn
  end