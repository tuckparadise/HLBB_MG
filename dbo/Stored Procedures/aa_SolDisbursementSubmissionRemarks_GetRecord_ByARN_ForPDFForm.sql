create       procedure [dbo].[aa_SolDisbursementSubmissionRemarks_GetRecord_ByARN_ForPDFForm]
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
end