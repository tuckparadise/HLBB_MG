CREATE procedure [dbo].[usp_SQLSolicitorDPSubmission_Main]
@ARN nvarchar(100),
@SolicitorEmail nvarchar(100),
@SolicitorCancellationReportAttachmentURL nvarchar(max) = null,
@SolicitorCancellationReportAttachment nvarchar(max) = null,
@SolicitorCancellationReportAttachmentDate date = null, 
@SolicitorReferenceNumber nvarchar(max) = null,
@PersonInChargeName nvarchar(max) = null,
@DocAdminFeePaid bigint = null,
@Remarks nvarchar(max) = null,
@SolicitorCIFNumber  nvarchar(max) = null, 
@ExecutionDateByCustomer date = null, 
@SNPCompletionDateCommence bit = null, 
@SNPCompletionDate date = null, 
@SNPExtendedCompletionDate date = null, 
@DeveloperBillingDueForPayment bit = null, 
@DeveloperBillingDueDate date = null, 
@AttendingSolicitor nvarchar(max) = null,
@SolicitorDeclaration  bit  = null, 
@RefCoverLetter  bit  = null, 
@RefCustNRIC  bit  = null, 
@RefBoardResolution  bit  = null, 
@RefLandSearch  bit  = null, 
@RefPrincipalSPA  bit  = null, 
@RefLUToDev  bit  = null, 
@RefSpecimenOfCaveator  bit  = null, 
@RefDocAdminFeeForm  bit  = null, 
@ExeFacilitiesAgreement  bit  = null, 
@ExeChargeAnnexure  bit  = null, 
@ExeDeedOfAssignment  bit  = null, 
@ExePowerOfAttorney  bit  = null, 
@ExeLetterOfGuarantee  bit  = null, 
@ExeChargeOverCashDeposit  bit  = null, 
@ExeForm34  bit  = null, 
@ExeEntryOfPrivateCaveat  bit  = null, 
@ExeF16ANLC bit = null,
@Status nvarchar(max) = null,
@SStatus nvarchar(max) = null,
@SStatusOthers nvarchar(max) = null,
@SolicitorRefReportAttachmentURL nvarchar(max) = null,
@SolicitorRefReportAttachment nvarchar(max) = null,
@SolicitorRefReportAttachmentDate date = null,
--@RefOtherDoc nvarchar(max) = null,
@RefOtherDocRemark nvarchar(max) = null,
--@CIFNew nvarchar(max) = null,
@Completed bit = null
,@error nvarchar(max)  = null output
as
begin
	
	if (@Status = 'UpdateInfo' and @Completed = 1)
	begin
		set @SolicitorCancellationReportAttachmentURL = null 
		set @SolicitorCancellationReportAttachment ='<file><name>scnull</name><content>scnull</content></file>'
		set @SolicitorCancellationReportAttachmentDate =null
		set @SolicitorReferenceNumber  = null
		set @PersonInChargeName  = null
		set @DocAdminFeePaid  = null
		set @Remarks  = null
		--set @SolicitorCIFNumber   = null 
		set @ExecutionDateByCustomer  = null 
		set @SNPCompletionDateCommence  = null 
		set @SNPCompletionDate  = null 
		set @SNPExtendedCompletionDate  = null 
		set @DeveloperBillingDueForPayment  = null 
		set @DeveloperBillingDueDate  = null 
		set @AttendingSolicitor = null
		set @SolicitorDeclaration    = null 
		set @RefCoverLetter    = null 
		set @RefCustNRIC    = null 
		set @RefBoardResolution    = null
		set @RefLandSearch    = null
		set @RefPrincipalSPA    = null
		set @RefLUToDev    = null
		set @RefSpecimenOfCaveator    = null
		set @RefDocAdminFeeForm    = null
		set @ExeFacilitiesAgreement    = null
		set @ExeChargeAnnexure    = null
		set @ExeDeedOfAssignment    = null
		set @ExePowerOfAttorney    = null
		set @ExeLetterOfGuarantee    = null
		set @ExeChargeOverCashDeposit    = null
		set @ExeForm34    = null
		set @ExeEntryOfPrivateCaveat    = null
		set @ExeF16ANLC  = null						
		set @SolicitorRefReportAttachmentURL = null
		set @SolicitorRefReportAttachment  = '<file><name>scnull</name><content>scnull</content></file>'
		set @SolicitorRefReportAttachmentDate  = null	
		set @RefOtherDocRemark  = null
	end 

	if (@Status = 'Cancelled' and @Completed = 1)
	begin
		set @SolicitorCancellationReportAttachmentURL = null 
		--set @SolicitorCancellationReportAttachment ='<file><name>scnull</name><content>scnull</content></file>'
		set @SolicitorCancellationReportAttachmentDate =null
		set @SolicitorReferenceNumber  = null
		set @PersonInChargeName  = null
		set @DocAdminFeePaid  = null
		set @Remarks  = null
		--set @SolicitorCIFNumber   = null 
		set @ExecutionDateByCustomer  = null 
		set @SNPCompletionDateCommence  = null 
		set @SNPCompletionDate  = null 
		set @SNPExtendedCompletionDate  = null 
		set @DeveloperBillingDueForPayment  = null 
		set @DeveloperBillingDueDate  = null 
		set @AttendingSolicitor = null
		set @SolicitorDeclaration    = null 
		set @RefCoverLetter    = null 
		set @RefCustNRIC    = null 
		set @RefBoardResolution    = null
		set @RefLandSearch    = null
		set @RefPrincipalSPA    = null
		set @RefLUToDev    = null
		set @RefSpecimenOfCaveator    = null
		set @RefDocAdminFeeForm    = null
		set @ExeFacilitiesAgreement    = null
		set @ExeChargeAnnexure    = null
		set @ExeDeedOfAssignment    = null
		set @ExePowerOfAttorney    = null
		set @ExeLetterOfGuarantee    = null
		set @ExeChargeOverCashDeposit    = null
		set @ExeForm34    = null
		set @ExeEntryOfPrivateCaveat    = null
		set @ExeF16ANLC  = null						
		set @SolicitorRefReportAttachmentURL = null
		set @SolicitorRefReportAttachment  = '<file><name>scnull</name><content>scnull</content></file>'
		set @SolicitorRefReportAttachmentDate  = null	
		set @RefOtherDocRemark  = null

		set @SStatus  = null
		set @SStatusOthers = null
	end 
	
	 --@disbursement_manner nvarchar(max),
	declare	@CollateralPurpose nvarchar(max)
	--declare	@error nvarchar(max)

	set @error = ''

	if (@SolicitorRefReportAttachment = '<file><name>scnull</name><content>scnull</content></file>' )
	begin
		set @SolicitorRefReportAttachment = null 
	end 

	if (@SolicitorCancellationReportAttachment = '<file><name>scnull</name><content>scnull</content></file>' )
	begin
		set @SolicitorCancellationReportAttachment = null 
	end 

	--if (@SolicitorCIFNumber is not null or ltrim(rtrim(@SolicitorCIFNumber)) <> '' or ltrim(rtrim(@SolicitorCIFNumber)) <> '0' or ltrim(rtrim(@SolicitorCIFNumber)) <> 0)
	if (ltrim(rtrim(@SolicitorCIFNumber)) <> '0' )
	begin
		/*
		declare @flag as int 
		set @flag = 0
		--if TRY_CAST(@CIFNew AS int) is null
		if (ISNUMERIC(@CIFNew + '.e0') <> 1)
		begin
			set @flag = 1						
		end 
		else
		begin
			if (cast (@CIFNew as int)) <1
			begin
				set @flag = 1
			
			end 
		end 
		 
		if (@flag = 1)
		begin 
			set @error = @error + 'Only Numeric values are allowed for CIF field <br>'
		end 
		*/
		declare @b nvarchar(max)
		set @b = dbo.IsInt(@SolicitorCIFNumber)

		if (@b =0)
		begin
			set @error = @error + 'Only Numeric values are allowed for CIF field<br>'
		end 
	end 
	else
	begin
		set @SolicitorCIFNumber = null 
	end 

	if not exists 
	(
		select 1
		from vw_SQLSolicitorDPSubmission solicitor
		where solicitor.arn = @arn 
			and solicitor.Status in ('Submitted', 'Cancelled', 'Resubmitted') 
	
	)
	begin
		if (@Status = 'Submitted') 
		begin 
			if (@SolicitorReferenceNumber is null or ltrim(rtrim(@SolicitorReferenceNumber)) = '' 
				or @PersonInChargeName is null or ltrim(rtrim(@PersonInChargeName)) = ''  
				--or @DocAdminFeePaid is null or ltrim(rtrim(@DocAdminFeePaid)) = ''  
				or @ExecutionDateByCustomer is null 
				or @AttendingSolicitor is null or ltrim(rtrim(@AttendingSolicitor)) = ''			
				--or @SolicitorCIFNumber is null or ltrim(rtrim(@SolicitorCIFNumber)) = ''
				-- start 20191128 disable attachment for documentation deployment purposes
				
				or @SolicitorRefReportAttachment is null 
				or @SolicitorRefReportAttachment = '<file><name>scnull</name><content>scnull</content></file>'
				
				-- end 20191128 disable attachment for documentation deployment purposes
				)
			begin
				set @error = @error + 'Please fill in All Compulsory Fields <br>'
			end  
		
			declare @when datetime = GETUTCDATE()
			--select @when -- date + time
			declare @day datetime = CAST(FLOOR(CAST(@when as float)) as datetime)
			--select @day -- date only

			if 
			(
				@ExecutionDateByCustomer >@day
			)
			begin
				set @error = @error + 'Execution date by customer must not be a future date <br>'
			end  

			if 
			(
				@SolicitorDeclaration = 0 or @SolicitorDeclaration is null
			)
			begin
				set @error = @error + 'Please check the Declaration Box <br>'
			end  
		
			/*	
			select @disbursement_manner = [DisbursementManner]
			from SQLLOADS
			where arn = @arn
			*/
			select @CollateralPurpose = CollateralPurpose
			from SQLLOADS
			where arn = @arn

			if (@CollateralPurpose = 'Purchase From Developer')
			begin
				/*
				if (@DeveloperBillingDueForPayment is null)
				begin
					set @result = 0
				end 
				*/
				if (@DeveloperBillingDueForPayment = 1 and @DeveloperBillingDueDate is null)
				begin 
					set @error =  @error + 'Please fill in Developer Billing Due Date <br>'
				end 
			end 
			else 
			begin
			
				if (@CollateralPurpose = 'Sub-sale' or @CollateralPurpose = 'Purchase From Auction')
				begin
					if (@SNPCompletionDateCommence = 1 and @SNPCompletionDate is null )
					begin
						set @error =  @error + 'Please fill in SNP Completion Date <br>'
					end 
			
					if (@SNPCompletionDateCommence = 1 and @SNPExtendedCompletionDate is null )
					begin
						set @error =  @error + 'Please fill in SNP Extended Completion Date <br>'
					end 
				end 
				
				
			end 
		
			if (@DocAdminFeePaid = 1 and (@Remarks is null or ltrim(rtrim(@Remarks)) =''))
			begin
				set @error =  @error + 'Please fill in Remarks under Submit Document for Execution section<br>'
			end 
			
			declare @attachment_count int 
			select @attachment_count = count(*)
			from SQLSolicitorDPSubmissionAttachment2
			where arn = @ARN 

			if (@attachment_count > 10)
			begin
				set @error =  @error + 'Only 10 attachement files are allowed for other attachments <br>'
			end 
		end 

		if (@Status = 'UpdateInfo') 
		begin
			/*
			if (@SStatus is null )
			begin 
				set @error = 'Please fill in Remarks field'
			end  
			*/

			if (@SStatus = 'Others' and (@SStatusOthers is null or ltrim(rtrim(@SStatusOthers)) ='' ))
			begin 
				set @error = 'Please fill in Others <br>'
			end  
		end 

		-- start 20191128 disable attachment for documentation deployment purposes
		
		if (@Status = 'Cancelled') 
		begin
			if (@SolicitorCancellationReportAttachment is null 
				or @SolicitorCancellationReportAttachment = '<file><name>scnull</name><content>scnull</content></file>') 
			begin
				set @error = 'Please Attached cancellation document <br>'
			end 
		end 
		
		-- end 20191128 disable attachment for documentation deployment purposes

		if ( @error = '')
		begin			
			if (@Status = 'Submitted') 
			begin
				if exists 
				(
					select 1
					from SQLDUMakerDP_SolicitorSubmission_Rejected
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
					from SQLDUMakerDP_SolicitorSubmission_Rejected
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
					from SQLSolicitorDPSubmission_UpdateInfo
					where arn = @arn 
				)
				begin
					update dbo.SQLSolicitorDPSubmission_UpdateInfo
					set 				
						SStatus = @SStatus,
						SStatusOthers = @SStatusOthers,
						[Status] = @Status,						
						UpdatedDate = getdate()
					where arn =@arn 				
				end 
				else
				begin
					INSERT INTO [dbo].SQLSolicitorDPSubmission_UpdateInfo
						   ([ARN]
						   ,SStatus
						   ,SStatusOthers
						   ,[Status]
						   ,[CreatedDate]
						   ,[UpdatedDate])
					 VALUES
						   (@arn, 
						   @SStatus,
						   @SStatusOthers, 
						   @Status,
						   getdate(),
						   getdate())
				end 
				set @Completed = 0
			end 

			if exists 
			(
				select 1 
				from dbo.SQLSolicitorDPSubmission
				where solicitorcode = @solicitoremail 
					and arn = @arn 
			)
			begin
				/*
				if (@Status = 'Cancelled') 
				begin
					update SQLSolicitorDPSubmission
					set SolicitorRefReportAttachment = null 
					where arn = @arn 
				end 

				if (@Status in ('Submitted','Resubmitted')) 
				begin
					update SQLSolicitorDPSubmission
					set SolicitorCancellationReportAttachment = null 
					where arn = @arn 
				end 
				*/
				update dbo.SQLSolicitorDPSubmission
				set 
					--SolicitorReportAttachmentURL = @SolicitorReportAttachmentURL ,
					--SolicitorReportAttachment = @SolicitorReportAttachment ,
					--SolicitorReportAttachmentDate = @SolicitorReportAttachmentDate ,
					SolicitorCancellationReportAttachmentURL = @SolicitorCancellationReportAttachmentURL ,
					--SolicitorCancellationReportAttachment = @SolicitorCancellationReportAttachment ,					
					SolicitorCancellationReportAttachmentDate = @SolicitorCancellationReportAttachmentDate ,
					--FormSubmissionDate = @FormSubmissionDate ,
					SolicitorReferenceNumber = @SolicitorReferenceNumber ,
					PersonInChargeName = @PersonInChargeName ,
					DocumentAdminFeeCreditedToOptionID = @DocAdminFeePaid ,
					Remarks = @Remarks ,
					SolicitorCIFNumber = ltrim(rtrim(@SolicitorCIFNumber)) ,
					ExecutionDateByCustomer = @ExecutionDateByCustomer ,
					SNPCompletionDateCommence = @SNPCompletionDateCommence ,
					SNPCompletionDate = @SNPCompletionDate ,
					SNPExtendedCompletionDate = @SNPExtendedCompletionDate ,
					DeveloperBillingDueForPayment = @DeveloperBillingDueForPayment ,
					DeveloperBillingDueDate = @DeveloperBillingDueDate ,
					AttendingSolicitor = @AttendingSolicitor ,
					SolicitorDeclaration = @SolicitorDeclaration ,
					RefCoverLetter = @RefCoverLetter ,
					RefCustNRIC = @RefCustNRIC ,
					RefBoardResolution = @RefBoardResolution ,
					RefLandSearch = @RefLandSearch ,
					RefPrincipalSPA = @RefPrincipalSPA ,
					RefLUToDev = @RefLUToDev ,
					RefSpecimenOfCaveator = @RefSpecimenOfCaveator ,
					RefDocAdminFeeForm = @RefDocAdminFeeForm ,
					ExeFacilitiesAgreement = @ExeFacilitiesAgreement ,
					ExeChargeAnnexure = @ExeChargeAnnexure ,
					ExeDeedOfAssignment = @ExeDeedOfAssignment ,
					ExePowerOfAttorney = @ExePowerOfAttorney ,
					ExeLetterOfGuarantee = @ExeLetterOfGuarantee,
					ExeChargeOverCashDeposit = @ExeChargeOverCashDeposit  ,
					ExeForm34 = @ExeForm34 ,
					ExeEntryOfPrivateCaveat = @ExeEntryOfPrivateCaveat ,
					[Status] = @Status ,
					SStatus =  @SStatus  ,
					SStatusOthers = @SStatusOthers ,
					SolicitorRefReportAttachmentURL = @SolicitorRefReportAttachmentURL ,
					--SolicitorRefReportAttachment = @SolicitorRefReportAttachment ,
					SolicitorRefReportAttachmentDate = @SolicitorRefReportAttachmentDate ,
					--RefOtherDoc = @RefOtherDoc ,
					RefOtherDocRemark = @RefOtherDocRemark ,
					exeF16ANLC = @exeF16ANLC ,
					Completed = @Completed,
					UpdatedDate = GETDATE(),
					OutputPDFID = null 
				where Solicitorcode = @solicitoremail 
					and arn = @arn  		
			end 
			else
			begin
				insert into dbo.SQLSolicitorDPSubmission 
					(		 
					[ARN]
					,[SolicitorCode]
					--,[SolicitorReportAttachmentURL]
					--,[SolicitorReportAttachment]
					--,[SolicitorReportAttachmentDate]
					,[SolicitorCancellationReportAttachmentURL]
					--,[SolicitorCancellationReportAttachment]
					,[SolicitorCancellationReportAttachmentDate]
					--,[FormSubmissionDate]
					,[SolicitorReferenceNumber]
					,[PersonInChargeName]
					,DocumentAdminFeeCreditedToOptionID
					,[Remarks]
					,[SolicitorCIFNumber]
					,[ExecutionDateByCustomer]
					,[SNPCompletionDateCommence]
					,[SNPCompletionDate]
					,[SNPExtendedCompletionDate]
					,[DeveloperBillingDueForPayment]
					,[DeveloperBillingDueDate]
					,[AttendingSolicitor]
					,[SolicitorDeclaration]
					,[RefCoverLetter]
					,[RefCustNRIC]
					,[RefBoardResolution]
					,[RefLandSearch]
					,[RefPrincipalSPA]
					,[RefLUToDev]
					,[RefSpecimenOfCaveator]
					,[RefDocAdminFeeForm]
					,[ExeFacilitiesAgreement]
					,[ExeChargeAnnexure]
					,[ExeDeedOfAssignment]
					,[ExePowerOfAttorney]
					,[ExeLetterOfGuarantee]
					,[ExeChargeOverCashDeposit]
					,[ExeForm34]
					,[ExeEntryOfPrivateCaveat]
					,[Status]
					,[SStatus]
					,[SStatusOthers],
					SolicitorRefReportAttachmentURL ,
					--SolicitorRefReportAttachment ,
					SolicitorRefReportAttachmentDate ,
					--RefOtherDoc  ,
					RefOtherDocRemark  ,
					exeF16ANLC  ,
					Completed,
					CreatedDate, 
					UpdatedDate,
					OutputPDFID
					)
				values 
				(
					@ARN
					,@SolicitorEmail
					--,@SolicitorReportAttachmentURL
					--,@SolicitorReportAttachment
					--,@SolicitorReportAttachmentDate
					,@SolicitorCancellationReportAttachmentURL
					--,@SolicitorCancellationReportAttachment
					,@SolicitorCancellationReportAttachmentDate
					--,@FormSubmissionDate
					,@SolicitorReferenceNumber
					,@PersonInChargeName
					,@DocAdminFeePaid
					,@Remarks
					,ltrim(rtrim(@SolicitorCIFNumber))
					,@ExecutionDateByCustomer
					,@SNPCompletionDateCommence
					,@SNPCompletionDate
					,@SNPExtendedCompletionDate
					,@DeveloperBillingDueForPayment
					,@DeveloperBillingDueDate
					,@AttendingSolicitor
					,@SolicitorDeclaration
					,@RefCoverLetter
					,@RefCustNRIC
					,@RefBoardResolution
					,@RefLandSearch
					,@RefPrincipalSPA
					,@RefLUToDev
					,@RefSpecimenOfCaveator
					,@RefDocAdminFeeForm
					,@ExeFacilitiesAgreement
					,@ExeChargeAnnexure
					,@ExeDeedOfAssignment
					,@ExePowerOfAttorney
					,@ExeLetterOfGuarantee
					,@ExeChargeOverCashDeposit
					,@ExeForm34
					,@ExeEntryOfPrivateCaveat
					,@Status
					,@SStatus
					,@SStatusOthers,
					@SolicitorRefReportAttachmentURL ,
					--@SolicitorRefReportAttachment ,
					@SolicitorRefReportAttachmentDate ,
					--@RefOtherDoc ,
					@RefOtherDocRemark ,
					@exeF16ANLC ,
					@Completed,
					getdate(),
					getdate(),
					null
				)
				/*
				if (@Status = 'Cancelled') 
				begin
					update SQLSolicitorDPSubmission
					set SolicitorRefReportAttachment = null 
					where arn = @arn 
				end 

				if (@Status in ('Submitted','Resubmitted')) 
				begin
					update SQLSolicitorDPSubmission
					set SolicitorCancellationReportAttachment = null 
					where arn = @arn 
				end 
				*/
			end 
		
		
		end 
	end 
	else
	begin
		set @error = 'Record was submitted previously'
	end

	 -- remove updateinfo record after record submitted
	if ( @error = '' and @Completed = 1)
	begin 
		if exists
		(
			select 1
			from SQLSolicitorDPSubmission
			where Completed = 1					
				and arn = @arn 
		)
		begin
			delete from SQLSolicitorDPSubmission_updateinfo
			where arn = @arn 	
		end 
	end 
	

end