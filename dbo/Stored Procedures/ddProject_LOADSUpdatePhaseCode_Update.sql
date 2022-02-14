create   procedure [dbo].[ddProject_LOADSUpdatePhaseCode_Update]
@arn nvarchar(max) = null,
@PhaseCode nvarchar(max) = null,
@PhaseName nvarchar(max) = null,
@AddressLine1 nvarchar(max) = null,
@SPAValue nvarchar(max) = null,
@Category nvarchar(max) = null
as
begin
	update SQLLOADS
	set PhaseCode = @PhaseCode,
		PhaseName = @PhaseName,
		AddressLine1 = @AddressLine1,
		SPAValue = @SPAValue ,
		Category = @Category
	where arn = @arn 
end