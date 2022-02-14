CREATE procedure [dbo].[usp_errorlog_view]
as
begin
	select APIName, errorType, errorMessage, errorDetail, APIErrorDt, DateInserted 
	from [errorLog]
end