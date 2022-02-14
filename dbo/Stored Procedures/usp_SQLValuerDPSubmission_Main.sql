CREATE     procedure [dbo].[usp_SQLValuerDPSubmission_Main]
@arn nvarchar(100),
@valueremail nvarchar(100),
@ValuerReportAttachmentURL nvarchar(max) = null, 
@ValuerReportAttachment nvarchar(max) = null, 
@ValuerReportAttachmentDate date = null, 
@VRInstructionDate date = null, 
@ValuerReference nvarchar(max) = null, 
@PersonInChargeName nvarchar(max) = null,
@VUpdateInfoStatus nvarchar(max) = null,
@VLowerOMVStatus nvarchar(max) = null,
@VUpdateInfoStatusOthers nvarchar(max) = null,
@VLowerOMVReasons nvarchar(max) = null,
@DateOfValuation date = null, 
@MarketValue money = null, 
@FireInsuranceValue money = null, 
@InvoiceNumber nvarchar(max) = null,
@ShortfallAmount decimal = null, 
@Declaration bit = null, 
@status nvarchar(max) = null,
@ValuationFeeFinancedByBankFlag bit = null,
@LF_PayeeName nvarchar(max) = null,
@LF_BilledAmount money = null, 
@LF_AccountNumber nvarchar(max) = null,
@LF_Bank nvarchar(max) = null,
@LF_PaymentDescription nvarchar(max) = null,
@LF_PaymentMode nvarchar(max) = null,
@Completed bit = null,
@result nvarchar(max) = null OUTPUT 
as
begin

	set @result = ''

	if (@ValuerReportAttachment = '<file><name>scnull</name><content>scnull</content></file>' )
	begin
		set @ValuerReportAttachment = null 
	end 

	if not exists 
	(
		select 1
		from vw_SQLValuerDPSubmission valuer 
		where valuer.arn = @arn
			--and valuer.Status in ('Submitted', 'Cancelled', 'LowerOMV', 'Resubmitted')
			and valuer.Completed = 1
	)
	begin
	
		if (@status = 'Submitted')
		begin
			if (
					@DateOfValuation is null 
					or CONVERT(nvarchar(max),@MarketValue) is null 			
					-- start 20191128 disable attachment for documentation deployment purposes
					or @ValuerReportAttachment is null 
					or @ValuerReportAttachment = '<file><name>scnull</name><content>scnull</content></file>'
					-- end 20191128 disable attachment for documentation deployment purposes
					or @ValuerReference is null 
					or rtrim(ltrim(@ValuerReference)) = ''
					or @PersonInChargeName is null 
					or rtrim(ltrim(@PersonInChargeName)) = '' 
				)								
			begin
				set @result = @result + 'Please fill in all compulsory fields <br>'
			end 		
		
			declare @when datetime = GETUTCDATE()
			--select @when -- date + time
			declare @day datetime = CAST(FLOOR(CAST(@when as float)) as datetime)
			--select @day -- date only

			if 
			(
				@DateOfValuation >@day
			)
			begin
				set @result = @result + 'Valuation date must not be a future date <br>'
			end  

			declare @valuationfeeamt money 

			--select @valuationfeeamt= valuationFeesFinancedAmount
			 select @valuationfeeamt= isnull([ValuationFeesFinancedAmount],0.00)
			from sqlloads 
			where arn = @arn

			if (@valuationfeeamt <> 0.00)
			begin
				if (@LF_PayeeName is null or ltrim(rtrim(@LF_PayeeName)) = '')
				begin
					set @result = @result + 'Please fill in Payee Name field in the Payment Info tab<br>'
				end 

				if (@LF_AccountNumber is null or ltrim(rtrim(@LF_AccountNumber)) = '')
				begin
					set @result = @result + 'Please fill in Account Number field in the Payment Info tab<br>'
				end 

				if (@LF_BilledAmount is null or ltrim(rtrim(@LF_BilledAmount)) = '' or @LF_BilledAmount =0)
				begin
					set @result = @result + 'Please fill in Billed Amount field in the Payment Info tab<br>'
				end 

				if (@LF_Bank is null or ltrim(rtrim(@LF_Bank)) = '')
				begin
					set @result = @result + 'Please fill in Bank field in the Payment Info tab<br>'
				end 
			end 

			if (@ValuationFeeFinancedByBankFlag = 1)
			begin
				if (@InvoiceNumber is null or  rtrim(ltrim(@InvoiceNumber)) = '' )				
				begin
					set @result = @result + 'Please fill in Invoice Number <br>'
				end 		
			
				
				if 
				(
					@Declaration = 0 or @Declaration is null				
				)
				begin
					set @result = @result + 'Please tick the shortfall amount declaration box <br>'
				end  
					
				
			end 		
		
		end
	
		if (@status = 'UpdateInfo' )
		begin
			/*
			if (@VUpdateInfoStatus is null )
			begin
				set @result = 0
			end 
			*/
			if (@VUpdateInfoStatus ='Others' )
			begin
				if (@VUpdateInfoStatusOthers is null or rtrim(ltrim(@VUpdateInfoStatusOthers)) ='')
				begin
					set @result = @result + 'Please fill in Others Field <br>'
				end 
			end 
		end 

		if (@status = 'LowerOMV' and @Completed = 1)
		begin
			/*
			if (
				@VLowerOMVReasons is null  
				or rtrim(ltrim(@VLowerOMVReasons)) ='' 
				or @VLowerOMVStatus is null
				)
			begin
				set @result = 0
			end 
			*/
			if (@status = 'LowerOMV' and @VLowerOMVStatus = 'Lower OMV')
			begin
				if (@VLowerOMVReasons is null
					or rtrim(ltrim(@VLowerOMVReasons)) ='')
				begin
					set @result = @result + 'Please fill in Reasons for Lower OMV <br>'
				end 
			end 
		end 
	
		if (@result  = '')
		begin
			-- validate valuation billed amount 
			declare @ValuationFeesFinancedAmount decimal 
			select @ValuationFeesFinancedAmount = ValuationFeesFinancedAmount 
			from sqlloads 
			where arn = @arn 

			if (@status = 'Submitted')
			begin
				if (@valuationfeeamt is not null or @valuationfeeamt <> 0)
				begin
					if ( @LF_BilledAmount > @ValuationFeesFinancedAmount)
					begin
						set @result = @result + 'Billed Amount cannot be more than Valuation Fees Financed Amount <br>'
					end 
				end 
			end 			
		end 

		if (@result  = '')
		begin

			if (@Status = 'Submitted') 
			begin
				if exists 
				(
					select 1
					from SQLDUMakerDP_ValuerSubmission_LoweredOMV
					where arn = @arn
				)
				begin
					set @Status = 'Resubmitted'
				end 
			end 
		
			if (@Status = 'New') 
			begin
				if exists 
				(
					select 1
					from SQLDUMakerDP_ValuerSubmission_LoweredOMV
					where arn = @arn
				)
				begin
					set @Status = 'Resubmit-New'
				end 
			end 		

			if (@Completed = 1 and @status = 'UpdateInfo')
			begin
				
				if exists 
				(
					select 1
					from SQLValuerDPSubmission_UpdateInfo
					where arn = @arn 
				)
				begin
					update dbo.SQLValuerDPSubmission_UpdateInfo
					set 				
						VUpdateInfoStatus = @VUpdateInfoStatus,
						VUpdateInfoStatusOthers = @VUpdateInfoStatusOthers,
						[Status] = @Status,						
						UpdatedDate = getdate()
					where arn =@arn 				
				end 
				else
				begin
					INSERT INTO [dbo].[SQLValuerDPSubmission_UpdateInfo]
						   ([ARN]
						   ,[VUpdateInfoStatus]
						   ,[VUpdateInfoStatusOthers]
						   ,[Status]
						   ,[CreatedDate]
						   ,[UpdatedDate])
					 VALUES
						   (@arn, 
						   @VUpdateInfoStatus,
						   @VUpdateInfoStatusOthers, 
						   @Status,
						   getdate(),
						   getdate())
				end 
				set @Completed = 0
			end 

			if exists 
			(
				select 1 
				from dbo.SQLValuerDPSubmission
				where valuercode = @valueremail 
					and arn = @arn 
			)
			begin
				update dbo.SQLValuerDPSubmission
				set 
					ValuerReportAttachmentURL = @ValuerReportAttachmentURL,
					--ValuerReportAttachment = @ValuerReportAttachment,
					ValuerReportAttachmentDate = @ValuerReportAttachmentDate,
					VRInstructionDate = @VRInstructionDate,
					ValuerReference = @ValuerReference, 
					PersonInChargeName = @PersonInChargeName,
					DateOfValuation = @DateOfValuation, 
					MarketValue = @MarketValue, 
					FireInsuranceValue = @FireInsuranceValue,
					--ValuationFeeFinancedByBank = @ValuationFeeFinancedByBank,
					InvoiceNumber = @InvoiceNumber,
					ShortfallAmount = @ShortfallAmount,
					Declaration = @Declaration,
					[Status] = @Status,
					ValuationFeeFinancedByBankFlag = @ValuationFeeFinancedByBankFlag,
					VUpdateInfoStatus = @VUpdateInfoStatus,
					VUpdateInfoStatusOthers = @VUpdateInfoStatusOthers,
					VLowerOMVStatus = @VLowerOMVStatus,
					VLowerOMVReasons = @VLowerOMVReasons ,
					LF_PayeeName = @LF_PayeeName ,
					LF_BilledAmount = @LF_BilledAmount , 
					LF_AccountNumber = @LF_AccountNumber ,
					LF_Bank = @LF_Bank ,
					LF_PaymentDescription = @LF_PaymentDescription ,
					LF_PaymentMode = @LF_PaymentMode ,
					UpdatedDate = getdate(),
					completed= @Completed,
					OutputPDFID = null
				where valuercode = @valueremail 
					and arn = @arn  		
			end 
			else
			begin				
				insert into dbo.SQLValuerDPSubmission (arn, valuercode, ValuerReportAttachmentURL,ValuerReportAttachmentDate,
					VRInstructionDate, ValuerReference, PersonInChargeName, VUpdateInfoStatus , VUpdateInfoStatusOthers, VLowerOMVStatus, VLowerOMVReasons, DateOfValuation, MarketValue, FireInsuranceValue, 					
					InvoiceNumber, ShortfallAmount, Declaration, [status], ValuationFeeFinancedByBankFlag,CreatedDate, UpdatedDate, LF_PayeeName, LF_BilledAmount, LF_AccountNumber, LF_Bank, LF_PaymentDescription, LF_PaymentMode,completed, OutputPDFID
					--,ValuerReportAttachment
					)
				values (@arn,@valueremail,@ValuerReportAttachmentURL, @ValuerReportAttachmentDate, @VRInstructionDate, 
					@ValuerReference, @PersonInChargeName, @VUpdateInfoStatus, @VUpdateInfoStatusOthers, @VLowerOMVStatus, @VLowerOMVReasons, @DateOfValuation, @MarketValue, 
					@FireInsuranceValue, @InvoiceNumber, @ShortfallAmount, @Declaration, @status, @ValuationFeeFinancedByBankFlag, getdate(),getdate(), @LF_PayeeName, @LF_BilledAmount, @LF_AccountNumber, @LF_Bank, @LF_PaymentDescription, @LF_PaymentMode,@Completed, null
					--,@ValuerReportAttachment
					)
			end 
		end 		 
	end 
	else
	begin
		set @result = 'Record was submitted previously'
	end
	 
	 -- remove updateinfo record after record submitted
	if ( @result = '' and @Completed = 1)
	begin 
		if exists
		(
			select 1
			from SQLValuerDPSubmission
			where 
				completed = 1
				and arn = @arn 
		)
		begin
			delete from SQLValuerDPSubmission_updateinfo
			where arn = @arn 	
		end 
	end 
	
end