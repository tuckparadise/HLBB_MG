create   procedure [dbo].[SQLValuerDPSubmission_ValuationFee_CountByARN]
  @arn nvarchar(max) =null,
  @count int = null output 
  as
  begin
	 select @count = count(*) from [SQLValuerDPSubmission_ValuationFee] where arn = @arn
  end