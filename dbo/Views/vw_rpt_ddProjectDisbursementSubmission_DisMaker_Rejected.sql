CREATE                           VIEW [dbo].[vw_rpt_ddProjectDisbursementSubmission_DisMaker_Rejected] AS

	select 'Main' as 'Stage', * from ddProjectDisbursementSubmission_DisMaker_Rejected
	union 
	select 'Staging' as 'Stage', * from ddProjectDisbursementSubmission_DisMaker_Rejected_Staging