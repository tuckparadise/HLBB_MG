CREATE     procedure [dbo].[usp_SQLSolicitorDPSubmissionExeDocs_selectARN_ForPDFForm]
@arn nvarchar(max) = null 
as
begin

	SELECT [ARN]
		  ,[SolicitorCode]
		  ,[ExeDocNameID]
		  ,[ExeDocNameDesc]
		  ,[CreatedDate]
		  ,[UpdatedDate]
	FROM [dbo].[SQLSolicitorDPSubmissionExeDocs_Staging]
	  where arn = @arn 
end