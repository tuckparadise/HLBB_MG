CREATE     procedure [dbo].[usp_InternalUserRole_SelectAll]
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
	  , CreatedDate
	  , UpdatedDate
	  , CreatedUser
	  , UpdatedUser
	  ,IsValuerEditer 
	  ,IsSolicitorEditer 
	  ,IsDeveloperEditer 
	  ,IsManager
	  , IsDeveloperStatusEditor
  FROM [dbo].[InternalUserRole]
end