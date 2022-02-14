CREATE       procedure [dbo].[ddProjectDisbursementSubmission_DisMaker_FacilityAccountMaintenance_UpdateOne]
@arn nvarchar(max) = null ,
@billingid bigint = null ,
@Account1 nvarchar(max) = null ,
@Account2 nvarchar(max) = null ,
@Account3 nvarchar(max) = null ,
@Account4 nvarchar(max) = null ,
@DUMakerEmail nvarchar(max) = null,
@error nvarchar(max) = null output 
as
begin
	set @error = ''

	
	if (@DUMakerEmail like 'K2:%')
	begin		
		set @DUMakerEmail = Stuff(@DUMakerEmail, 1, 3, '')			
	end 

	
	if (isnull(@Account1,'') <>'')
	begin
		declare @Account1TypeCheck nvarchar(max)
		set @Account1TypeCheck = dbo.IsInt(@Account1)

		if (@Account1TypeCheck =0)
		begin
			set @error = @error + 'Only digits are allowed for Account 1 field<br>'
		end 

		if (len(@Account1) <> 11)
		begin
			set @error = @error + 'Account 1 must have 11 digits<br>'
		end 
	end 

	if (isnull(@Account2,'') <>'')
	begin
		declare @Account2TypeCheck nvarchar(max)
		set @Account2TypeCheck = dbo.IsInt(@Account2)

		if (@Account2TypeCheck =0)
		begin
			set @error = @error + 'Only digits are allowed for Account 2 field<br>'
		end 

		if (len(@Account2) <> 11)
		begin
			set @error = @error + 'Account 2 must have 11 digits<br>'
		end 
	end 

	if (isnull(@Account3,'') <>'')
	begin
		declare @Account3TypeCheck nvarchar(max)
		set @Account3TypeCheck = dbo.IsInt(@Account3)

		if (@Account3TypeCheck =0)
		begin
			set @error = @error + 'Only digits are allowed for Account 3 field<br>'
		end 

		if (len(@Account3) <> 11)
		begin
			set @error = @error + 'Account 3 must have 11 digits<br>'
		end 
	end 

	if (isnull(@Account4,'') <>'')
	begin
		declare @Account4TypeCheck nvarchar(max)
		set @Account4TypeCheck = dbo.IsInt(@Account4)

		if (@Account4TypeCheck =0)
		begin
			set @error = @error + 'Only digits are allowed for Account 4 field<br>'
		end 

		if (len(@Account4) <> 11)
		begin
			set @error = @error + 'Account 4 must have 11 digits<br>'
		end 
	end 

	if (@error = '')
	begin
		if exists
		(
			select 1
			from [aaFacilityAccountMaintenance]
			where arn = @arn 
		)
		begin
			update [aaFacilityAccountMaintenance]
			set [Account1] = @Account1,
				[Account2] = @Account2,
				[Account3] = @Account3,
				[Account4] = @Account4,			
				[DUMakerEmail] = @DUMakerEmail,
				[UpdatedDate] = getdate()
			where arn = @arn 
		end 
		else
		begin
			insert into [aaFacilityAccountMaintenance]  ([arn]
			   ,[Account1]
			   ,[Account2]
			   ,[Account3]
			   ,[Account4]
			   ,[CreatedDate]
			   ,[UpdatedDate]			
			   ,[DUMakerEmail])
			select @arn, @Account1, @Account2, @Account3, @Account4, getdate(), getdate(), @DUMakerEmail
		end 

		if (ltrim(rtrim(@Account1)) = '')
		begin
			set @Account1 = null 
		end 

		-- set acct1 as default facility account
		--if (isnull(@Account1,'') <> '' )
		--begin
			update [dbo].ddProjectDisbursementSubmission_DisMaker_PaymentDetail
			--update [dbo].[aaSolDisbursementSubmission_DisMakerSubmissionPaymentDetail]
			set accountfrom = @Account1
			where arn = @arn 
				and BillingRunningID= @billingid
		--end 

	end 
	
end