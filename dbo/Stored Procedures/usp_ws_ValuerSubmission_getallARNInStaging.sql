CREATE procedure [dbo].[usp_ws_ValuerSubmission_getallARNInStaging]
as
begin
	select arn from SQLValuerDPSubmission_staging 
	where OutputPDFID is not null and OutputPDFID <> 0
		and [status] <> 'UpdateInfo' and [status] <> 'LowerOMV' and [status] <> 'Cancelled'
end