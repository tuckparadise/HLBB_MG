create   procedure [dbo].[ddProject_MortgageCenter_List]
as
begin
	select AttorneyCentre
	from SQLDUMakerDP_AttorneyCentre
	where [status] = 'Active'
end