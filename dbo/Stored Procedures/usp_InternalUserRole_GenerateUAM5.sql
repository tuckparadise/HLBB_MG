CREATE     procedure [dbo].[usp_InternalUserRole_GenerateUAM5]
as
begin 
DECLARE @cols AS NVARCHAR(MAX),
    @query  AS NVARCHAR(MAX)

select @cols = STUFF((SELECT distinct ',' + QUOTENAME(UserRoleName) 
                    from [InternalUserRole]
            FOR XML PATH(''), TYPE
            ).value('.', 'NVARCHAR(MAX)') 
        ,1,1,'')

set @query = 'SELECT 1 as [order], ''Case Inquiry (Complete)'' as [Access Rights], ' + @cols + ' from 
             (
                SELECT   UserRoleName,					
				  case when [IsDUMakerDocumentation] = 1 then ''True'' 
					when [IsDUMakerValuation] = 1 then ''True'' 
					when [IsMortgageAdmin] = 1 then ''True''  
					when [IsDisbMaker] = 1 then ''True''  
					when [IsDisbChecker] = 1 then ''True'' 
					when [IsRCOMaker] = 1 then ''True''  
					when [IsRCOChecker] = 1 then ''True'' 
					when [IsTBOMaker] = 1 then ''True''  
					when [IsTBOChecker] = 1 then ''True'' 
					else '''' 
					end as [Case Inquiry (Complete)]					
			  FROM [dbo].[InternalUserRole]			  
            )  AS SourceTable 
            pivot 
            (
                min([Case Inquiry (Complete)])
                for UserRoleName in (' + @cols + ')
            ) AS PivotTable
			union 
			SELECT  2 as [order], ''Document Unit'' as [Access Rights], ' + @cols + ' from 
             (
                SELECT   UserRoleName,					
				  case when [IsDUMakerDocumentation] = 1 then ''True'' 		
					when [IsMortgageAdmin] = 1 then ''True''  
					else '''' 
					end as [Document Unit]					
			  FROM [dbo].[InternalUserRole]			  
            )  AS SourceTable 
            pivot 
            (
                min([Document Unit])
                for UserRoleName in (' + @cols + ')
            ) AS PivotTable
			union 
			SELECT 3 as [order], ''Valuation Unit'' as [Access Rights], ' + @cols + ' from 
             (
                SELECT   UserRoleName,					
				  case when [IsDUMakerDocumentation] = 1 then ''True'' 		
					when [IsMortgageAdmin] = 1 then ''True''  
					else '''' 
					end as [Valuation Unit]					
			  FROM [dbo].[InternalUserRole]			  
            )  AS SourceTable 
            pivot 
            (
                min([Valuation Unit])
                for UserRoleName in (' + @cols + ')
            ) AS PivotTable

			union 
			SELECT 4 as [order], ''Update LOADS data'' as [Access Rights], ' + @cols + ' from 
             (
                SELECT   UserRoleName,					
				  case when [IsDUMakerDocumentation] = 1 then ''True'' 
					when [IsDUMakerValuation] = 1 then ''True'' 
					when [IsMortgageAdmin] = 1 then ''True''  
					when [IsDisbMaker] = 1 then ''True''  
					when [IsDisbChecker] = 1 then ''True'' 
					when [IsRCOMaker] = 1 then ''True''  
					when [IsRCOChecker] = 1 then ''True'' 
					when [IsTBOMaker] = 1 then ''True''  
					when [IsTBOChecker] = 1 then ''True'' 
					else '''' 
					end as [Update LOADS data]					
			  FROM [dbo].[InternalUserRole]			  
            )  AS SourceTable 
            pivot 
            (
                min([Update LOADS data])
                for UserRoleName in (' + @cols + ')
            ) AS PivotTable
			union 
			SELECT 5 as [order], ''Parameter Maintenance'' as [Access Rights], ' + @cols + ' from 
             (
                SELECT   UserRoleName,					
				   case when [IsMortgageAdmin] = 1 then ''True'' 				
					else '''' 
					end as [Parameter Maintenance]					
			  FROM [dbo].[InternalUserRole]			  
            )  AS SourceTable 
            pivot 
            (
                min([Parameter Maintenance])
                for UserRoleName in (' + @cols + ')
            ) AS PivotTable
			union 
			SELECT 6 as [order], ''Manual Form Generator'' as [Access Rights], ' + @cols + ' from 
             (
                SELECT   UserRoleName,					
				 case when [IsDUMakerDocumentation] = 1 then ''True'' 
					when [IsDUMakerValuation] = 1 then ''True'' 
					when [IsMortgageAdmin] = 1 then ''True''  
					when [IsDisbMaker] = 1 then ''True''  
					when [IsDisbChecker] = 1 then ''True'' 
					when [IsRCOMaker] = 1 then ''True''  
					when [IsRCOChecker] = 1 then ''True'' 
					when [IsTBOMaker] = 1 then ''True''  
					when [IsTBOChecker] = 1 then ''True'' 
					else '''' 
					end as [Manual Form Generator]					
			  FROM [dbo].[InternalUserRole]			  
            )  AS SourceTable 
            pivot 
            (
                min([Manual Form Generator])
                for UserRoleName in (' + @cols + ')
            ) AS PivotTable
			union 
			SELECT 7 as [order], ''Security Report'' as [Access Rights], ' + @cols + ' from 
             (
                SELECT   UserRoleName,					
				  case when [IsMortgageAdmin] = 1 then ''True'' 		
					when [IsITAdminApplication] = 1 then ''True''  
					when [IsITAdminSecurity] = 1 then ''True''  
					else '''' 
					end as [Security Report]				
			  FROM [dbo].[InternalUserRole]			  
            )  AS SourceTable 
            pivot 
            (
                min([Security Report])
                for UserRoleName in (' + @cols + ')
            ) AS PivotTable
			union 
			SELECT 8 as [order], ''Dynamic Query Execution'' as [Access Rights], ' + @cols + ' from 
             (
                SELECT   UserRoleName,					
				 case when [IsMortgageAdmin] = 1 then ''True'' 		
					when [IsITAdminApplication] = 1 then ''True''  		
					else '''' 
					end as [Dynamic Query Execution]				
			  FROM [dbo].[InternalUserRole]			  
            )  AS SourceTable 
            pivot 
            (
                min([Dynamic Query Execution])
                for UserRoleName in (' + @cols + ')
            ) AS PivotTable
			union 
			SELECT 9 as [order], ''Application Settings'' as [Access Rights], ' + @cols + ' from 
             (
                SELECT   UserRoleName,					
				 case when [IsITAdminApplication] = 1 then ''True'' 					
					else '''' 
					end as [Application Settings]		
			  FROM [dbo].[InternalUserRole]			  
            )  AS SourceTable 
            pivot 
            (
                min([Application Settings])
                for UserRoleName in (' + @cols + ')
            ) AS PivotTable
			union 
			SELECT 10 as [order], ''User Management'' as [Access Rights], ' + @cols + ' from 
             (
                SELECT   UserRoleName,					
				 case when [IsITAdminSecurity] = 1 then ''True'' 					
					else '''' 
					end as [User Management]		
			  FROM [dbo].[InternalUserRole]			  
            )  AS SourceTable 
            pivot 
            (
                min([User Management])
                for UserRoleName in (' + @cols + ')
            ) AS PivotTable
				union 
			SELECT 11 as [order], ''Activate Inactive Users'' as [Access Rights], ' + @cols + ' from 
             (
                SELECT   UserRoleName,					
				 case when [IsITAdminSecurity] = 1 then ''True'' 					
					else '''' 
					end as [Activate Inactive Users]		
			  FROM [dbo].[InternalUserRole]			  
            )  AS SourceTable 
            pivot 
            (
                min([Activate Inactive Users])
                for UserRoleName in (' + @cols + ')
            ) AS PivotTable
			union 
			SELECT 12 as [order], ''Security Feature Setting'' as [Access Rights], ' + @cols + ' from 
             (
                SELECT   UserRoleName,					
				case when [IsITAdminSecurity] = 1 then ''True'' 					
				else '''' 
				end as [Security Feature Setting]		
			  FROM [dbo].[InternalUserRole]			  
            )  AS SourceTable 
            pivot 
            (
                min([Security Feature Setting])
                for UserRoleName in (' + @cols + ')
            ) AS PivotTable
			'

execute(@query)

end