create   procedure [dbo].[usp_MRTAAcctNumberSetting_GetHLA]
@acctnumber nvarchar(max) = null output 
as
begin
	set @acctnumber = (select HLA from MRTAAcctNumberSetting)
end