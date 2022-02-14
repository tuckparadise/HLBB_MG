CREATE      procedure [dbo].[aaSolDisbursementSubmission_BankInfo_GetIBGList]
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
	where [IBGFlag] = 1
	  
end