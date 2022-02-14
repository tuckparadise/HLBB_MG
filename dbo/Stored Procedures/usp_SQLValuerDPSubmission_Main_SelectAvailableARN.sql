CREATE     procedure [dbo].[usp_SQLValuerDPSubmission_Main_SelectAvailableARN]
@arn nvarchar(max) = null output ,
@ARNstatus nvarchar(max) = null output ,
@Output nvarchar(max) = null output 
as
begin	

	set @Output = 'No Record'

	select top 1 @arn = arn, @ARNstatus = [status] 
	from SQLValuerDPSubmission_Staging
	where OutputPDFID is null 
	order by UpdatedDate asc 

	if (@arn is not null )
	begin
		update SQLValuerDPSubmission_Staging
		set OutputPDFID = 0
		where arn = @arn 

		set @Output = ''
	end 	
	
end