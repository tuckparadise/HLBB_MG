CREATE procedure [dbo].[usp_ws_errorLog]
@APIName nvarchar(max) = null ,
@errorType nvarchar(max) = null,
@errorMessage nvarchar(max) = null,
@errorDetail nvarchar(max) = null,
@APIErrorDt datetime  = null
as
begin

	insert into [errorLog] (APIName, errorType, errorMessage, errorDetail, APIErrorDt, DateInserted)
	values (@APIName, @errorType, @errorMessage, @errorDetail, @APIErrorDt, getdate())

end