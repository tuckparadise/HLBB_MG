create         procedure [dbo].[ddProjectPhase_DetectPhaseInfo]
@PhaseCode nvarchar(max) = null ,
@PhaseName nvarchar(max) = null output,
@ProjectCode nvarchar(max) = null output,
@ProjectName nvarchar(max) = null output,
@DeveveloperCode nvarchar(max) = null output
as
begin
	set @PhaseName = 
	(
		select top 1 PhaseName from SQLLOADS where PhaseCode = @PhaseCode order by CreatedDate desc
	)

	set @ProjectCode = 
	(
		select top 1 ProjectCode from SQLLOADS where PhaseCode = @PhaseCode order by CreatedDate desc
	)

	set @ProjectName = +
	(
		select top 1 ProjectName from SQLLOADS where PhaseCode = @PhaseCode order by CreatedDate desc
	)

	set @DeveveloperCode = 
	(
		select top 1 DeveloperCode from SQLLOADS where PhaseCode = @PhaseCode order by CreatedDate desc
	)
end