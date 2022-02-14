create       procedure [dbo].[ddProject_NOP_Email_CheckFlag]
@Flag int= null output
as
begin
	set @Flag = (select Email from ddProjectNotificationOfPayment_Setting )
end