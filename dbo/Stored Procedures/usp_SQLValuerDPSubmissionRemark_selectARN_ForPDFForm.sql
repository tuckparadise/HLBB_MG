CREATE       procedure [dbo].[usp_SQLValuerDPSubmissionRemark_selectARN_ForPDFForm]
@arn nvarchar(max) = null 
as
begin

	SELECT [ARN]
      ,[ValuerCode]
      ,[RemarkID]
      ,[Remark]
      ,[CreatedDate]
	FROM [dbo].[SQLValuerDPSubmissionRemark_Staging]
	  where arn = @arn 
end