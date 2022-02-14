CREATE procedure [dbo].[usp_AttorneyName_list_select]
as
begin
	select an.AttorneyNameID as [AttorneyNameID], 
		an.AttorneyName as [AttorneyName],
		ac.AttorneyCentre as [AttorneyCentre],
		ac.AttorneyCentreID as [AttorneyCentreID],
		an.[status] as [AttorneyStatus],
		an.updateddate as updateddate
	from SQLDUMakerDP_AttorneyName an
		inner join SQLDUMakerDP_AttorneyCentre ac on ac.AttorneyCentreID = an.AttorneyCentreID
	where ac.[status] = 'Active'
end