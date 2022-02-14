CREATE procedure [dbo].[usp_ws_SQLValuerDPSubmission_ListUploadedARN]
as
begin

	select arn 	
	from SQLValuerDPSubmission_Staging 
	where arn not in (select arn from SQLValuerDPSubmission)	
		and OutputPDFID is not null and OutputPDFID <> 0
		and [status] <> 'UpdateInfo' and [status] <> 'LowerOMV' and [status] <> 'Cancelled'
	--group by arn
	
end