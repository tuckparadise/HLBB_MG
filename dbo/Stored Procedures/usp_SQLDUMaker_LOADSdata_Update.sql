CREATE procedure [dbo].[usp_SQLDUMaker_LOADSdata_Update]
@ARN nvarchar(100),
@DisbursementManner nvarchar(max) =NULL,
@LandArea decimal = null,
@BuildUpArea decimal = null 
as
begin

	update SQLLOADS
	set DisbursementManner = @DisbursementManner,
		LandArea = @LandArea,
		BuildUpArea = @BuildUpArea		
	where arn = @arn 
	
end