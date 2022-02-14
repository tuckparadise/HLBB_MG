CREATE   procedure [dbo].[ddProjectDisbursementSubmission_NotificationOfPayment_MoveToCompleted]
@DevCode nvarchar(max) = null ,
@ProjectCode nvarchar(max) = null ,
@PhaseCode nvarchar(max) = null ,
@ARN nvarchar(max) = null ,
@ProcessingDate datetime = null ,
@pdfid bigint = null 
as
begin
	
	update ddProjectDisbursementSubmission_NotificationOfPayment
	set pdfid = @pdfid
	where DevCode = @DevCode
		and ProjectCode = @ProjectCode
		and PhaseCode = @PhaseCode
		and ARN = @ARN		
		and year(DisCheckerApprovedDate) = year(@ProcessingDate)
		and month(DisCheckerApprovedDate) = month(@ProcessingDate)
		and day(DisCheckerApprovedDate) = day(@ProcessingDate)
	
	insert into ddProjectDisbursementSubmission_NotificationOfPayment_Completed
	select * from ddProjectDisbursementSubmission_NotificationOfPayment
	where DevCode = @DevCode
		and ProjectCode = @ProjectCode
		and PhaseCode = @PhaseCode
		and ARN = @ARN		
		and year(DisCheckerApprovedDate) = year(@ProcessingDate)
		and month(DisCheckerApprovedDate) = month(@ProcessingDate)
		and day(DisCheckerApprovedDate) = day(@ProcessingDate)

	delete from ddProjectDisbursementSubmission_NotificationOfPayment
	where DevCode = @DevCode
		and ProjectCode = @ProjectCode
		and PhaseCode = @PhaseCode
		and ARN = @ARN		
		and year(DisCheckerApprovedDate) = year(@ProcessingDate)
		and month(DisCheckerApprovedDate) = month(@ProcessingDate)
		and day(DisCheckerApprovedDate) = day(@ProcessingDate)
	
end