CREATE      procedure [dbo].[aaSolDisbursementSubmission_BankInfo_GetHLBBList]
as
begin
	
	SELECT [Bank]
		,[RentasFlag]
		,[IBGFlag]
		,[HLBFlag]
	FROM [dbo].[aaSolDisbursementSubmission_BankInfo]
	where [HLBFlag] = 1
	  
end