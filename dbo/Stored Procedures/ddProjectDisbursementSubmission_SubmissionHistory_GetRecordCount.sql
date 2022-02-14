/*
declare @phasecode nvarchar(max) 
set @phasecode = 'B050500201'
declare @devcode nvarchar(max) 
set @devcode = 'B0505'

declare @ProjectCode nvarchar(max) 
set @ProjectCode = ''

declare @count bigint 

exec [ddProjectDisbursementSubmission_SubmissionHistory_GetRecordCount] @devcode,@ProjectCode,@phasecode,null,null,null,null, @count output 

select @count

*/

CREATE   procedure [dbo].[ddProjectDisbursementSubmission_SubmissionHistory_GetRecordCount]
  @DeveloperCode nvarchar(max) = null, 
  @ProjectCode nvarchar(max) = null ,
  @PhaseCode nvarchar(max) = null ,
  @arn nvarchar(max) = null ,
@DateFrom datetime = null,
@DateTo datetime = null,
  @AddressLine1 nvarchar(max) = null ,
@count bigint = null output
as
begin
	set @count = (
		 select count(*)
		 FROM [dbo].[ddProjectDisbursementSubmission_SubmissionHistory2] h  
	where DeveloperCode = @DeveloperCode
		--and projectcode like case when @ProjectCode is null then '%' else @ProjectCode end 
		and phasecode like case when @phasecode is null then '%' else @phasecode end 
		and arn like case when @arn is null then '%' else @arn end 
		--and AddressLine1 like case when @AddressLine1 is null then '%' else @AddressLine1 end 
		and isnull(AddressLine1,'') like case when @AddressLine1 is null then '%' else @AddressLine1 end 
		--and 	[SubmittedDate] between @DateFrom and @DateTo	
		and str(year(SubmittedDate))  like case when @DateFrom is null then '%' else str(year(@DateFrom)) end
		and str(month(SubmittedDate))  like case when @DateFrom is null then '%' else str(month(@DateFrom)) end
		and str(day(SubmittedDate))  like case when @DateFrom is null then '%' else str(day(@DateFrom)) end
	) 

end