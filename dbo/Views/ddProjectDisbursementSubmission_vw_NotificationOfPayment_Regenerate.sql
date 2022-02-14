CREATE     view [dbo].[ddProjectDisbursementSubmission_vw_NotificationOfPayment_Regenerate]
as

select * from [ddProjectDisbursementSubmission_NotificationOfPayment_Completed]
union 
select * from [ddProjectDisbursementSubmission_NotificationOfPayment]