CREATE     procedure [dbo].[usp_SQLSolicitorDPSubmissionRemark_selectARN_ForPDFForm]
@arn nvarchar(max) = null 
as
begin

	SELECT [ARN]
      ,[SolicitorCode]
      ,[RemarkID]
      ,[Remark]
      ,[CreatedDate]
	FROM [dbo].[SQLSolicitorDPSubmissionRemark_Staging]
	  where arn = @arn 
end