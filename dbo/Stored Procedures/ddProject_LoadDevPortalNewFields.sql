create   procedure [dbo].[ddProject_LoadDevPortalNewFields]
  @arn nvarchar(max) = null ,
  @PhaseCode nvarchar(max) = null ,
  @PhaseName nvarchar(max) = null ,
  @AddressLine1 nvarchar(max) = null ,
  @SPAValue money = null ,
  @Category nvarchar(max) = null 
  as
  begin
	update SQLLOADS
	set PhaseCode = @PhaseCode,
		PhaseName = @PhaseName,
		AddressLine1 = @AddressLine1,
		SPAValue = @SPAValue,
		Category = @Category
	where arn = @arn 

	insert into errorLog_LOADSOneTimeLoad
	values ('LOADSOneTimeLoad','Success',@arn, @PhaseCode, getdate(), getdate() )
  end