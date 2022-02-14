CREATE   procedure [dbo].[usp_SQLValuerDPSubmissionRemark_list] 
  @arn nvarchar(max) = null
  as
  begin
	SELECT [ARN]
		,[ValuerCode]
		,[RemarkID]
		,[Remark]
		,[CreatedDate]
	FROM [dbo].[SQLValuerDPSubmissionRemark]
	where arn = @arn 
		--and valuercode = @valuercode 
  end