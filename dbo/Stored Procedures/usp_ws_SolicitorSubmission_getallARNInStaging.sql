CREATE procedure [dbo].[usp_ws_SolicitorSubmission_getallARNInStaging]
as
begin
	select arn from SQLSolicitorDPSubmission_staging 
	where OutputPDFID is not null and OutputPDFID <> 0
		and [status] <> 'UpdateInfo'
end