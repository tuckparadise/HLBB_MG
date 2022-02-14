/*
select * 

delete from [aaFacilityAccountMaintenance]
where arn = 'arn12'

 [aaFacilityAccountMaintenance_FindOne] 'arn12'
 */

CREATE   procedure [dbo].[aaFacilityAccountMaintenance_FindOne]
@arn nvarchar(max) = null 
as
begin
	declare @amt1 money 
	declare @amt2 money 
	declare @amt3 money 
	declare @amt4 money 

	select @amt1= FacilityAmount1 from sqlloads
	where arn =@arn 

	select @amt2= FacilityAmount2 from sqlloads
	where arn =@arn 

	select @amt3= FacilityAmount3 from sqlloads
	where arn =@arn 

	select @amt4= FacilityAmount4 from sqlloads
	where arn =@arn 

	SELECT sqlloads.[arn]
		/*
      ,isnull([Account1],'') as [Account1]
      ,isnull([Account2],'') as [Account2]
      ,isnull([Account3],'') as [Account3]
      ,isnull([Account4],'') as [Account4]
	  */
	  ,[Account1]
      ,[Account2]
      ,[Account3]
      ,[Account4]
      ,aaFacilityAccountMaintenance.[CreatedDate]
      ,aaFacilityAccountMaintenance.[UpdatedDate]
      ,[DUMakerEmail]
	  , @amt1 as [amt1]
	  , @amt2 as [amt2]
	  , @amt3 as [amt3]
	  , @amt4 as [amt4]
  FROM sqlloads 
	left join aaFacilityAccountMaintenance on aaFacilityAccountMaintenance.arn = sqlloads.arn 
  where sqlloads.arn = @arn 

end