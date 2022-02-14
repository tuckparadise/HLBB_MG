CREATE       procedure [dbo].[aa_ws_SolicitorDisbursementSubmission_ListUploadedARN]
as
begin

	/*
	IF OBJECT_ID('tempdb..#tbl1') IS NOT NULL DROP TABLE #tbl1
	IF OBJECT_ID('tempdb..#tbl2') IS NOT NULL DROP TABLE #tbl2

	--declare @status nvarchar(100)
	
	select arn 
	into #tbl1
	from SQLSolicitorDPSubmission_Staging 
	where arn not in (select arn from SQLSolicitorDPSubmission)
		and arn not in (select arn from SQLSolicitorDPSubmissionAttachment2)
	group by arn

	select arn 
	into #tbl2
	from SQLSolicitorDPSubmissionAttachment2_Staging 
	where arn not in (select arn from SQLSolicitorDPSubmission)
		and arn not in (select arn from SQLSolicitorDPSubmissionAttachment2)
	group by arn
	
	select arn from #tbl1 where arn in (select arn from #tbl2)
	*/

	select arn 	
	from aaSolDisbursementSubmission_staging 	
	where arn not in (select arn from aaSolDisbursementSubmission)
		and SolicitorSubmissionPDFID is not null and SolicitorSubmissionPDFID <> 0

end