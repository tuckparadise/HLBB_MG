create    procedure [dbo].[usp_MRTAAcctNumberSetting_GetHLMT]
@acctnumber nvarchar(max)  = null output
as
begin
	set @acctnumber = (select HLMT from MRTAAcctNumberSetting)
end