CREATE     procedure [dbo].[aa_SQLSolicitorDisbursementSubmission_Main_SelectAvailableARN]
@arn nvarchar(max) = null output ,
@DisbursementManner nvarchar(max) = null output ,
@ARNstatus nvarchar(max) = null output ,
@Output nvarchar(max) = null output 
as
begin	

	set @Output = 'No Record'

	select top 1 @arn = s.arn , @ARNstatus = SolicitorSubmissionOption , @DisbursementManner = DisbursementManner 
	from aaSolDisbursementSubmission_staging s 
	left join sqlloads on sqlloads.arn = s.arn 
	where s.SolicitorSubmissionPDFID is null 
	order by s.UpdatedDate asc 

	if (@arn is not null )
	begin
		update aaSolDisbursementSubmission_staging
		set SolicitorSubmissionPDFID = 0
		where arn = @arn 

		set @Output = ''
	end 	
	
end