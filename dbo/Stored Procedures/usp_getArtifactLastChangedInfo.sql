CREATE procedure [dbo].[usp_getArtifactLastChangedInfo]
as
begin
with cte (type, name, [modify_date],create_date )as (
sELECT 'TABLE' as type, name,  [modify_date],create_date FROM sys.tables
--order by modify_date desc 
union 
SELECT 'SP' as type,name,  modify_date ,create_date
FROM sys.objects
WHERE type = 'P'
--ORDER BY modify_date DESC
union 
SELECT 'FN' as type,name, modify_date ,create_date
FROM sys.objects
WHERE type = 'FN'
)
select * from cte order by modify_date desc 
end