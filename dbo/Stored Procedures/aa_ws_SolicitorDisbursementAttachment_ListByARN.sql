CREATE   procedure [dbo].[aa_ws_SolicitorDisbursementAttachment_ListByARN]
@arn nvarchar(max) = null ,
@SolicitorCode nvarchar(max) = null ,
@error nvarchar(max) = null output 
as
begin
	select [Attachment] as Attachment
	from [aaSolicitorDisbursementSubmissionAttachment]
	where ([Attachment] is not null or ltrim(rtrim([Attachment])) <> '' or [Attachment] = '<file><name>scnull</name><content>scnull</content></file>')
		and arn = @arn 
		and [SolicitorCode] = @SolicitorCode
	union 
	select CancelLoan_File as Attachment
	from aaSolDisbursementSubmission	
	where (CancelLoan_File is not null or ltrim(rtrim(CancelLoan_File)) <> '' or CancelLoan_File = '<file><name>scnull</name><content>scnull</content></file>')
		and arn = @arn 
		and [SolicitorCode] = @SolicitorCode 
end