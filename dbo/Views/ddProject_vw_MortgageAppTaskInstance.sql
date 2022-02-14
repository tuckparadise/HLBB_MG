CREATE      view [dbo].[ddProject_vw_MortgageAppTaskInstance]
as
	SELECT 		
			[workflow]
		  ,[arn]
		  ,[TaskOwner]
		  ,[CreatedDate]
		  ,[UpdatedDate]
		  ,[CreatedUser]
		  ,[UpdatedUser]
		  , BillingRunningID
		  ,'EDMS' as SubmissionFrom
	  FROM [dbo].[MortgageAppTaskInstance_billing]
	  union
	  		SELECT 		
			[workflow]
		  ,[arn]
		  ,[TaskOwner]
		  ,[CreatedDate]
		  ,[UpdatedDate]
		  ,[CreatedUser]
		  ,[UpdatedUser]
		  , BillingRunningID
		  ,'Developer' as SubmissionFrom
	  FROM [dbo].ddProject_MortgageAppTaskInstance