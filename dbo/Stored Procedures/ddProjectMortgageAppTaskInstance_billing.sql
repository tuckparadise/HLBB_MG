create   procedure [dbo].[ddProjectMortgageAppTaskInstance_billing]
@SubmissionFrom nvarchar(max) = null ,
@Role nvarchar(max) = null ,
@RecordCount bigint = null output 
as
begin
	if (@SubmissionFrom  = 'EDMS')
	begin
		set @RecordCount = ( select count(*) 
							from MortgageAppTaskInstance_billing
							where workflow = @Role
							)
	end 
	if (@SubmissionFrom  = 'Developer')
	begin
		set @RecordCount = ( select count(*) 
							from ddProject_MortgageAppTaskInstance
							where workflow = @Role
							)
	end 
end