CREATE      procedure [dbo].[aaSolDisbursementSubmission_BankInfo_GetList]
as
begin
	
	SELECT id,
		[Bank]
		,[RentasFlag]
		,[IBGFlag]
		,[HLBFlag]
		  ,[createddate]
      ,[updateddate]
      ,[createduser]
      ,[updateduser]
	FROM [dbo].[aaSolDisbursementSubmission_BankInfo]
	  
end