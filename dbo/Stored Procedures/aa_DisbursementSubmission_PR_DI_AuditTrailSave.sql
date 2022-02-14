create   procedure [dbo].[aa_DisbursementSubmission_PR_DI_AuditTrailSave]
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

	if (@PR_DeveloperHDABank  is null or ltrim(rtrim(@PR_DeveloperHDABank)) = '')
	begin
		set @error = @error + 'Please fill in Developer HDA Bank field<br>'
	end 

	if (@PR_DeveloperHDA  is null or ltrim(rtrim(@PR_DeveloperHDA)) = '')
	begin
		set @error = @error + 'Please fill in Developer HDA Account field<br>'
	end 

	if (@error = '')
	begin
		declare @ExistingPR_DeveloperHDABank nvarchar(max)

		set @ExistingPR_DeveloperHDABank = (select top 1 isnull(ConcatenatedNewValue,'') from aaDI_ProjectAccountBankAuditLog where OperationPrimaryKeysValue = @arn order by InsertedDateTime desc )

		if (isnull(@ExistingPR_DeveloperHDABank,'') <> @PR_DeveloperHDABank)
		begin
			insert into aaDI_ProjectAccountBankAuditLog
			values ('HDA / Project Account Bank', 'EDIT','arn',@arn,'HDA / Project Account Bank',@ExistingPR_DeveloperHDABank, @PR_DeveloperHDABank, @DisbursementMakerEmailAddress,getdate(),null,null)
		end 

		declare @ExistingPR_PR_DeveloperHDA nvarchar(max)

		set @ExistingPR_PR_DeveloperHDA = (select top 1 isnull(ConcatenatedNewValue,'') from aaDI_ProjectAccountAuditLog where OperationPrimaryKeysValue = @arn order by InsertedDateTime desc )

		if (isnull(@ExistingPR_PR_DeveloperHDA,'') <> @PR_DeveloperHDA)
		begin
			insert into aaDI_ProjectAccountAuditLog
			values ('Developer’s HDA / Project Account', 'EDIT','arn',@arn,'Developer’s HDA / Project Account',@ExistingPR_PR_DeveloperHDA, @PR_DeveloperHDA, @DisbursementMakerEmailAddress,getdate(),null,null)
		end 
	end 
end