CREATE       procedure [dbo].[usp_SQLValuerDPSubmission_GetPaymentTabVisibility]
@arn nvarchar(100),
@result nvarchar(max) = null OUTPUT 
as
begin
	
	set @result = ''
	
	select @result = case when isnull([ValuationFeesFinancedAmount],0.00) <> 0.00 then 1 else 0 end 
	from [SQLLOADS]
	  where arn = @arn
		
end