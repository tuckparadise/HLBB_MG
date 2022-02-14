create   procedure [dbo].[usp_ws_FailedEmail_ErrorLog]
@Receiver nvarchar(max) = null ,
@Header nvarchar(max) = null,
@Content nvarchar(max) = null,
@ExceptionDetail nvarchar(max) = null
--@APIErrorDt datetime  = null
as
begin

	insert into FailedEmailLog (Receiver, EmailHeader, EmailContent, ExceptionDetail, LogDateTime)
	values (@Receiver, @Header, @Content, @ExceptionDetail, getdate())

end