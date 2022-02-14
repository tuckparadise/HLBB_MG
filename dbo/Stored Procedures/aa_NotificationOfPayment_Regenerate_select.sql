CREATE   procedure [dbo].[aa_NotificationOfPayment_Regenerate_select] 
@arn nvarchar(max) = null ,
@error nvarchar(max) = null output 
as
begin
	set @error = ''

	select 
			ROW_NUMBER() OVER(ORDER BY [NotificationUpdatedDate] desc) AS RowID,
		* 
		from 
		(
		SELECT l.[arn]  as arn 
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
			,[DevName]
			,[SolName]
			,[NotificationCreatedDate]
			,[NotificationUpdatedDate]
			,l.[CreatedDate] as [CreatedDate]
			,l.[UpdatedDate] as [UpdatedDate]
			,[Locked]
			,[DevCode]
			,[SolCode]
			,[DevEmail]
			,[SolEmail]
			,[RunningID]
			,case when SQLLOADS.disbursementmanner = 'PR' then [DevEmail] else [SolEmail] end as [Receiver]
			, SQLLOADS.disbursementmanner 
			,dbo.ufn_NotificationOfPayment_header_generate(l.arn) as EmailHeader 
			,dbo.ufn_NotificationOfPayment_body_generate(l.arn) as EmailBody
		FROM [dbo].[aaNotificationOfPayment_log]  l
			inner join SQLLOADS on SQLLOADS.arn = l.arn 
		union 
	
	SELECT l.[arn]  as arn 
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
			,[DevName]
			,[SolName]
			,[NotificationCreatedDate]
			,[NotificationUpdatedDate]
			,l.[CreatedDate] as [CreatedDate]
			,l.[UpdatedDate] as [UpdatedDate]
			,[Locked]
			,[DevCode]
			,[SolCode]
			,[DevEmail]
			,[SolEmail]
			,[RunningID]
			,case when SQLLOADS.disbursementmanner = 'PR' then [DevEmail] else [SolEmail] end as [Receiver]
			, SQLLOADS.disbursementmanner 
			,dbo.ufn_NotificationOfPayment_header_generate(l.arn) as EmailHeader 
			,dbo.ufn_NotificationOfPayment_body_generate(l.arn) as EmailBody
		FROM [dbo].[aaNotificationOfPayment_failedlog]  l
		inner join SQLLOADS on SQLLOADS.arn = l.arn 
		) tbl1 
		where arn = @arn 		
	
	
end