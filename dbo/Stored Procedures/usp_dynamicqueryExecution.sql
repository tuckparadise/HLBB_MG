CREATE  procedure [dbo].[usp_dynamicqueryExecution]
@query nvarchar(max) = null 
as
begin	
	exec(@query)
end