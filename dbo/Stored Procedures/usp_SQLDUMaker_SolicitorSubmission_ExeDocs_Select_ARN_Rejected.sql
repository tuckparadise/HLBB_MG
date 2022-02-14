CREATE procedure [dbo].[usp_SQLDUMaker_SolicitorSubmission_ExeDocs_Select_ARN_Rejected]
@arn nvarchar(max)
as
begin

SELECT [ARN]
      ,[SolicitorCode]
      ,[ExeDocNameID]
      ,[ExeDocNameDesc]
      ,[CreatedDate]
      ,[UpdatedDate]
  FROM [dbo].[SQLDUMakerDP_SolicitorSubmission_ExeDocs_Rejected]
  where arn = @arn 

end