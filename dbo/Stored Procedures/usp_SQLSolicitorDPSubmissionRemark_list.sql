CREATE   procedure [dbo].[usp_SQLSolicitorDPSubmissionRemark_list] 
  @arn nvarchar(max) = null    
  as
  begin
	SELECT [ARN]
		,[SolicitorCode]
		,[RemarkID]
		,[Remark]
		,[CreatedDate]
	FROM [dbo].[SQLSolicitorDPSubmissionRemark]
	where arn = @arn 
		--and [SolicitorCode] = @solcode 
  end