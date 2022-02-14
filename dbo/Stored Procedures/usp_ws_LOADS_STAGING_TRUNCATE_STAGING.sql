CREATE procedure [dbo].[usp_ws_LOADS_STAGING_TRUNCATE_STAGING]
AS
BEGIN
	truncate table [SQLLOADS_staging]

	truncate table [LOADS_NEW_LI_STAGING]
END