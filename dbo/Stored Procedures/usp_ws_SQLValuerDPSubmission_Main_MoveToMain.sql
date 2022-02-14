CREATE procedure [dbo].[usp_ws_SQLValuerDPSubmission_Main_MoveToMain]
@arn nvarchar(100) = null ,
@error nvarchar(max) = null output 
as
begin

	insert into SQLValuerDPSubmissionRemark
	select * from SQLValuerDPSubmissionRemark_Staging
	where arn = @arn

	insert into SQLValuerDPSubmission
	select * from SQLValuerDPSubmission_Staging
	where arn = @arn


	delete from SQLValuerDPSubmission_Staging
	where arn = @arn 

	delete from SQLValuerDPSubmissionRemark_Staging
	where arn = @arn 

	declare @valuerstatus nvarchar(max), @valcode nvarchar(max) 
	select @valuerstatus = [status], @valcode = ValuerCode
	from SQLValuerDPSubmission
	where arn = @arn 

	if (@valuerstatus = 'Submitted') 
	begin
		insert into WorkflowHistory
		values ('Valuation Report',@arn,'VR Submitted',@valcode,null,getdate())
	end 	

	if (@valuerstatus = 'Submitted') 
	begin
		insert into WorkflowHistory
		values ('Valuation Report',@arn,'VR Resubmitted',@valcode,null,getdate())
	end 	

	if (@valuerstatus = 'UpdateInfo') 
	begin
		insert into WorkflowHistory
		values ('Valuation Report',@arn,'Update Info Submitted',@valcode,null,getdate())
	end 	

	if (@valuerstatus = 'Cancelled') 
	begin
		insert into WorkflowHistory
		values ('Valuation Report',@arn,'Cancellation Submitted',@valcode,null,getdate())
	end 	

	if (@valuerstatus = 'LowerOMV') 
	begin
		insert into WorkflowHistory
		values ('Valuation Report',@arn,'LowerOMV Submitted',@valcode,null,getdate())
	end 
	
end