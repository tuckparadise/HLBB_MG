create procedure [dbo].[aaSolDisbursementSubmission_BankInfo_SelectByID]
@id bigint =null 
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
	where id = @id 
end