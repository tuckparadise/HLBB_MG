create   procedure [dbo].[ddProjectDisbursementSubmission_NotificationOfPayment_Regenerate_GetMain]
@DevCode nvarchar(max) = null,
@ProjCode nvarchar(max) = null,
@PhaseCode nvarchar(max) = null,
@CheckerApprovalDate datetime = null 
as
begin
	
	
	SELECT 
		np.[arn]
      ,[RunningIDForCurrentSubmission]
      ,[FacilityAccountNumber]
      ,[PaymentMode]
      ,[PayeeID]
      ,[PayeeName]
      ,[BeneficiaryBank]
      ,[BeneficiaryBankAccountNumber]
      ,[AmountDisburse]
      ,[PaymentReference]
      ,[PaymentDescription]
      ,[PaymentCreatedDate]
      ,[PaymentUpdatedDate]
      ,[DisMakerEmail]
      ,[DisMakerSubmissionDate]
      ,[DisCheckerEmail]
      ,[DisCheckerApprovedDate]
      ,[RCOMakerEmail]
      ,[RCOMakerApprovedDate]
      ,[RCOCheckerEmail]
      ,[RCOCheckerApprovedDate]
      ,[AccountFrom]
	  ,DevCode
      ,[DevName]      
      ,convert(nvarchar(max),np.[CreatedDate],103) as [CreatedDate]
	  ,convert(nvarchar(max),np.[UpdatedDate],103) as [UpdatedDate]         
      ,[RunningID]	 
	  ,np.ProjectCode
	  ,np.ProjectName
	  ,np.PhaseCode
	  ,np.PhaseName
	  ,ExtraField1 as [NotificationDate]	  	
	FROM [dbo].ddProjectDisbursementSubmission_vw_NotificationOfPayment_Regenerate np
		left join sqlloads on sqlloads.arn = np.arn 	
	where 
		--DevCode = @DevCode
		--and np.ProjectCode = @ProjCode
		--and 
		np.PhaseCode = @PhaseCode
		and year([DisCheckerApprovedDate]) = year(@CheckerApprovalDate)
		and month([DisCheckerApprovedDate]) = month(@CheckerApprovalDate)
		and day([DisCheckerApprovedDate]) = day(@CheckerApprovalDate) 		
		
end