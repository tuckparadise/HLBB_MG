CREATE   procedure [dbo].[usp_InternalUserRole_SelectByID]
@UserRoleID int =null ,
@Output nvarchar(max) =null output 
as
begin

	SELECT [UserRoleID]
      ,[UserRoleName]
      ,[UserRoleDescription]
      ,[IsDUMakerDocumentation]
      ,[IsDUMakerValuation]
      ,[IsMortgageAdmin]
      ,[IsITAdminApplication]
      ,[IsITAdminSecurity]
      ,[IsDisbMaker]
      ,[IsDisbChecker]
      ,[IsRCOMaker]
      ,[IsRCOChecker]
      ,[IsTBOMaker]
      ,[IsTBOChecker]
	  ,IsValuerEditer 
	,IsSolicitorEditer 
	,IsDeveloperEditer
	,IsManager
	,IsDeveloperStatusEditor
  FROM [dbo].[InternalUserRole]
  where [UserRoleID] = @UserRoleID
end