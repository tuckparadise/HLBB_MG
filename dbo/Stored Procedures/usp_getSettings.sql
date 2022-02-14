/****** Script for SelectTopNRows command from SSMS  ******/

CREATE       procedure [dbo].[usp_getSettings]
as
begin
	SELECT 
      [SolicitorLoginTrialsNumberOfLoginAllowed]
      ,[SolicitorLoginTrialsExpiryPeroidInMinutes]
      ,[ValuerLoginTrialsNumberOfLoginAllowed]
      ,[ValuerLoginTrialsExpiryPeroidInMinutes]
      ,[SolicitorDormantIDReportPeriodInDays]
      ,[ValuerDormantIDReportPeriodInDays]
      ,[SolicitorLoginPasswordHistoryCount]
      ,[ValuerLoginPasswordHistoryCount]
      ,[SolicitorLoginPasswordMaxExpiryDays]
      ,[ValuerLoginPasswordMaxExpiryDays]
      ,[SolicitorLoginPasswordMaxExpiryWarningDays]
      ,[ValuerLoginPasswordMaxExpiryWarningDays]
      ,[SolicitorPasswordMinCharacters]
      ,[ValuerPasswordMinCharacters]
      ,[SolicitorSessionInMinutes]
      ,[ValuerSessionInMinutes]
      ,[InternalUserSessionInMinutes]      
      ,[InternalUserDormantIDReportPeriodInDays]   
	  ,InternalUserLoginTrialsExpiryPeroidInMinutes
	  ,InternalUserLoginTrialsNumberOfLoginAllowed
	  ,tbl_solicitor.SolicitorDefaultPassword
	  ,tbl_valuer.ValuerDefaultPassword
	  ,[ProjectLoginTrialsNumberOfLoginAllowed]
      ,[ProjectLoginTrialsExpiryPeroidInMinutes]
      ,[ProjectDormantIDReportPeriodInDays]
      ,[ProjectLoginPasswordHistoryCount]
      ,[ProjectLoginPasswordMaxExpiryDays]
      ,[ProjectLoginPasswordMaxExpiryWarningDays]
      ,[ProjectPasswordMinCharacters]
      ,[ProjectSessionInMinutes]
	  , DeveloperPortalDefaultPassword
  FROM [dbo].[Settings]
	left join (select [password] as SolicitorDefaultPassword 
				from [DefaultPassword_Setting]
				where type = 'SolicitorLogin') tbl_solicitor on 1=1
	left join (select [password] as ValuerDefaultPassword 
				from [DefaultPassword_Setting]
				where type = 'ValuerLogin') tbl_valuer on 1=1
	left join (select [password] as DeveloperPortalDefaultPassword 
				from [DefaultPassword_Setting]
				where type = 'DeveloperLogin') tbl_dev on 1=1
	full join ddSettingsExt on 1 = 1
end