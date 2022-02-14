create   procedure [dbo].[aa_DisbursementSubmission_PR_BF_AuditTrailSave]
@arn nvarchar(max) = null ,
@DisbursementMakerEmailAddress  nvarchar(max) = null ,
@PR_DeveloperHDA nvarchar(max) = null ,
@PR_DeveloperHDABank nvarchar(max) = null ,
@PR_RedemptionPaymentAccountNumber nvarchar(max) = null ,
@PR_BridgingFinancierRedemptionSum nvarchar(max) = null ,
@error nvarchar(max) = null output 
as
begin

	set @error = ''

	if (@DisbursementMakerEmailAddress like 'K2:%')
	begin		
		set @DisbursementMakerEmailAddress = Stuff(@DisbursementMakerEmailAddress, 1, 3, '')					
	end 
	
	
	if (@PR_BridgingFinancierRedemptionSum  is not null or ltrim(rtrim(@PR_BridgingFinancierRedemptionSum)) <> '')
	begin
		if (isnumeric(@PR_BridgingFinancierRedemptionSum) = 0)
		begin
			set @error = @error + 'Bridging Financier Redemption Sum in the Bridging Financier / Developer Information tab must be a number<br>'
		end 
	end 

	if (@PR_BridgingFinancierRedemptionSum is null or ltrim(rtrim(@PR_BridgingFinancierRedemptionSum)) = '' )
	begin
		set @error = @error + 'Please fill in Bridging Financier Redemption Sum field<br>'
	end 
						
	if (@PR_RedemptionPaymentAccountNumber is null or ltrim(rtrim(@PR_RedemptionPaymentAccountNumber)) = '')
	begin
		set @error = @error + 'Please fill in Redemption Payment Account Number field<br>'
	end 
			
	if (@error = '')
	begin
		declare @ExistingPR_BridgingFinancierRedemptionSum nvarchar(max)

		set @ExistingPR_BridgingFinancierRedemptionSum = (select top 1 isnull(ConcatenatedNewValue,'') from aaBF_BridgingFinancierRedemptionSumAuditLog where OperationPrimaryKeysValue = @arn order by InsertedDateTime desc )

		if (isnull(@ExistingPR_BridgingFinancierRedemptionSum,'') <> @PR_BridgingFinancierRedemptionSum)
		begin
			insert into aaBF_BridgingFinancierRedemptionSumAuditLog
			values ('Bridging Financier Redemption Sum', 'EDIT','arn',@arn,'Bridging Financier Redemption Sum',@ExistingPR_BridgingFinancierRedemptionSum, @PR_BridgingFinancierRedemptionSum, @DisbursementMakerEmailAddress,getdate(),null,null)
		end 

		declare @ExistingPR_PR_RedemptionPaymentAccountNumber nvarchar(max)

		set @ExistingPR_PR_RedemptionPaymentAccountNumber = (select top 1 isnull(ConcatenatedNewValue,'') from aaBF_RedemptionPaymentAccountNumberAuditLog where OperationPrimaryKeysValue = @arn order by InsertedDateTime desc )

		if (isnull(@ExistingPR_PR_RedemptionPaymentAccountNumber,'') <> @PR_RedemptionPaymentAccountNumber)
		begin
			insert into aaBF_RedemptionPaymentAccountNumberAuditLog
			values ('Redemption Payment Account Number', 'EDIT','arn',@arn,'Redemption Payment Account Number',@ExistingPR_PR_RedemptionPaymentAccountNumber, @PR_RedemptionPaymentAccountNumber, @DisbursementMakerEmailAddress,getdate(),null,null)
		end 
	end 
end