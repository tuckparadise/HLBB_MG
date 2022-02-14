CREATE      procedure [dbo].[aaSolDisbursementSubmission_BankInfo_GetRentasList]
as
begin
	
	SELECT [Bank]
		,[RentasFlag]
		,[IBGFlag]
		,[HLBFlag]
		  ,[createddate]
      ,[updateddate]
      ,[createduser]
      ,[updateduser]
	FROM [dbo].[aaSolDisbursementSubmission_BankInfo]
	where [RentasFlag] = 1
	  
end