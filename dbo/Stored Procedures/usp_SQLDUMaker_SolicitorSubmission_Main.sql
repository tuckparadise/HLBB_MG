CREATE procedure [dbo].[usp_SQLDUMaker_SolicitorSubmission_Main]
@ARN nvarchar(100),
@Status nvarchar(100),
@a1 bit = NULL,
@a2 bit = NULL,
@a3 bit = NULL,
@a4 bit = NULL,
@a5 bit = NULL,
@a6 bit = NULL,
@a7 bit = NULL,
@a8_Remarks nvarchar(max)= NULL,
@a9 bit =NULL,
@aOthers nvarchar(max) =NULL,
@AttorneyCentreID bigint =NULL,
@AttorneyNameID bigint =NULL,
@b1 bit =NULL,
@b2 bit =NULL,
@b3 bit =NULL,
@b4 bit =NULL,
@b5 bit =NULL,
@b6 bit =NULL,
@bOthers nvarchar(max) =NULL,
@FacilityCancelledDate date =NULL,
@DUMakerEmail nvarchar(100) =NULL,
@HardCopyReceivedDate date =NULL,
@Decision nvarchar(max) =NULL,
@DisbursementManner nvarchar(max) =NULL,
@LandArea decimal = null,
@BuildUpArea decimal = null , 
@result nvarchar(max) = null OUTPUT 
as
begin	

	set @result = ''	

	if (@DUMakerEmail like 'K2:%')
	begin		
		set @DUMakerEmail = Stuff(@DUMakerEmail, 1, 3, '')
			
		--select @index = CHARINDEX('\', @UserName)

		--set @UserName = Stuff(@UserName, 1,@index, '')

	end 

	declare @currentowner nvarchar(max)
	select @currentowner = TaskOwner
	from MortgageAppTaskInstance
	where workflow = 'DPDUMakerSolicitorApproval'
		and arn = @arn 

	if (@currentowner <> @DUMakerEmail)
	begin
		set @result = 'You are not the current owner of this case. The current owner of the task is ' +@currentowner+ ''
	end

	if (@result = '')
	begin
		if (ltrim(rtrim(@LandArea)) = '')
		begin
			set @LandArea = 0
		end 

		if (ltrim(rtrim(@BuildUpArea)) = '')
		begin
			set @BuildUpArea = 0
		end 

		if (isnumeric(@LandArea) = 0)
		begin
			set @result = @result + 'Land Area must be a number <br>'
		end 

		if (isnumeric(@BuildUpArea) = 0)
		begin
			set @result = @result + 'Build Up Area must be a number <br>'
		end 

		if (@result = '')
		begin
			update SQLLOADS
			set DisbursementManner = @DisbursementManner,
				LandArea = @LandArea,
				BuildUpArea = @BuildUpArea		
			where arn = @arn 
		end 
	
		if (@result = '')
		begin
			declare @solicitorstatus nvarchar(max)

			select @solicitorstatus = [status]	
			from SQLSolicitorDPSubmission	
			where arn = @ARN

			if (@solicitorstatus = 'Submitted' or @solicitorstatus = 'Resubmitted')
			begin
				if 
				(				
					@HardCopyReceivedDate is null 
					or @HardCopyReceivedDate = ''		
				)								
				begin
					set @result = @result + 'Please Fill in Hardcopy Received Date <br>'
				end 
			end 
	
			if (@solicitorstatus = 'Cancelled' )
			begin
				if (
						@FacilityCancelledDate is null 
						or @FacilityCancelledDate = ''			
					)								
				begin
					set @result = @result + 'Please Fill in Facility Cancelled Date <br>'
				end 
			end 

			if (@Status= 'Resubmit-New')
			begin
				if (
					(@b1 is null or @b1 = 0) and 
					(@b2 is null or @b2 = 0) and 
					(@b3 is null or @b3 = 0) and 
					(@b4 is null or @b4 = 0) and 
					(@b5 is null or @b5 = 0) and 
					(@b6 is null or @b6 = 0) and 
					(@bOthers is null or ltrim(rtrim(@bOthers)) = '') 
					) 
				begin
					set @result = @result + 'Please state at least 1 reason for rejection <br>'
				end 
			end 

			if (@result = '')
			begin
		
				declare @AttorneyCentre nvarchar(max)			
				select @AttorneyCentre = AttorneyCentre
				from SQLDUMakerDP_AttorneyCentre
				where AttorneyCentreID = @AttorneyCentreID

				declare @Attorney nvarchar(max)
				select @Attorney = AttorneyName
				from SQLDUMakerDP_AttorneyName
				where AttorneyNameID = @AttorneyNameID

				if (@Status= 'Resubmit-New' or @Status='Completed') 
				begin
					delete from [SQLDUMakerDP_SolicitorSubmission_Rejected]
					where arn = @arn 

					delete from SQLDUMakerDP_SolicitorSubmission_ExeDocs_Rejected
					where arn = @arn 
				end 

				if (@Status= 'Resubmit-New')
				begin
		
					INSERT INTO [dbo].[SQLDUMakerDP_SolicitorSubmission_Rejected]
					   ([ARN]
					   ,[a1]
					   ,[a2]
					   ,[a3]
					   ,[a4]
					   ,[a5]
					   ,[a6]
					   ,[a7]
					   ,[a8_Remarks]
					   ,[a9]
					   ,[aOthers]
					   ,[AttorneyCentreID]
					   ,[AttorneyNameID]
					   ,[b1]
					   ,[b2]
					   ,[b3]
					   ,[b4]
					   ,[b5]
					   ,[b6]
					   ,[bOthers]
					   ,[FacilityCancelledDate]
					   ,[DUMakerEmail]
					   ,[HardCopyReceivedDate]
					   ,[Decision]
					   ,[AttorneyCentre]
					   ,[AttorneyName]
					   ,[CreatedDate]
					   ,[UpdatedDate])
					 values 
					(
						@ARN
						,@a1
						,@a2
						,@a3
						,@a4
						,@a5
						,@a6
						,@a7
						,@a8_Remarks
						,@a9
						,@aOthers
						,@AttorneyCentreID
						,@AttorneyNameID
						,@b1
						,@b2
						,@b3
						,@b4
						,@b5
						,@b6
						,@bOthers
						,@FacilityCancelledDate
						,@DUMakerEmail
						,@HardCopyReceivedDate
						,@Decision		
						,@AttorneyCentre
						,@Attorney
						,getdate() 
						,getdate() 			
					)

					update  r
					set 			
						r.[SolicitorCode] = s.[SolicitorCode]
						,r.[SolicitorCancellationReportAttachmentURL] = s.[SolicitorCancellationReportAttachmentURL]
						,r.[SolicitorCancellationReportAttachment] = s.[SolicitorCancellationReportAttachment]
						,r.[SolicitorCancellationReportAttachmentDate] = s.[SolicitorCancellationReportAttachmentDate]
						,r.[SolicitorRefReportAttachmentURL] = s.[SolicitorRefReportAttachmentURL]
						,r.[SolicitorRefReportAttachmentDate] = s.[SolicitorRefReportAttachmentDate]
						,r.[SolicitorRefReportAttachment] = s.[SolicitorRefReportAttachment]
						,r.[SolicitorReferenceNumber] = s.[SolicitorReferenceNumber]
						,r.[PersonInChargeName] = s.[PersonInChargeName]
						,r.[DocumentAdminFeeCreditedToOptionID] = s.[DocumentAdminFeeCreditedToOptionID]
						,r.[Remarks] = s.[Remarks]
						,r.[SolicitorCIFNumber] = s.[SolicitorCIFNumber]
						,r.[ExecutionDateByCustomer] = s.[ExecutionDateByCustomer]
						,r.[SNPCompletionDateCommence] = s.[SNPCompletionDateCommence]
						,r.[SNPCompletionDate] = s.[SNPCompletionDate]
						,r.[SNPExtendedCompletionDate] = s.[SNPExtendedCompletionDate]
						,r.[DeveloperBillingDueForPayment] = s.[DeveloperBillingDueForPayment]
						,r.[DeveloperBillingDueDate] = s.[DeveloperBillingDueDate]
						,r.[AttendingSolicitor] = s.[AttendingSolicitor]
						,r.[SolicitorDeclaration] = s.[SolicitorDeclaration]
						,r.[RefCoverLetter] = s.[RefCoverLetter]
						,r.[RefCustNRIC] = s.[RefCustNRIC]
						,r.[RefBoardResolution] = s.[RefBoardResolution]
						,r.[RefLandSearch] = s.[RefLandSearch]
						,r.[RefPrincipalSPA] = s.[RefPrincipalSPA]
						,r.[RefLUToDev] = s.[RefLUToDev]
						,r.[RefSpecimenOfCaveator] = s.[RefSpecimenOfCaveator]
						,r.[RefDocAdminFeeForm] = s.[RefDocAdminFeeForm]
						,r.[RefOtherDocRemark] = s.[RefOtherDocRemark]
						,r.[ExeFacilitiesAgreement] = s.[ExeFacilitiesAgreement]
						,r.[ExeChargeAnnexure] = s.[ExeChargeAnnexure]
						,r.[ExeDeedOfAssignment] = s.[ExeDeedOfAssignment]
						,r.[ExePowerOfAttorney] = s.[ExePowerOfAttorney]
						,r.[ExeLetterOfGuarantee] = s.[ExeLetterOfGuarantee]
						,r.[ExeChargeOverCashDeposit] = s.[ExeChargeOverCashDeposit]
						,r.[ExeForm34] = s.[ExeForm34]
						,r.[ExeEntryOfPrivateCaveat] = s.[ExeEntryOfPrivateCaveat]
						,r.[ExeF16ANLC] = s.[ExeF16ANLC]
						,r.[Status] = s.[Status]
						--,r.[AttorneyCentre] = s.[AttorneyCentre]
						--,r.[AttorneyName] = s.[AttorneyName]
						,r.[SStatus] = s.[SStatus]
						,r.[SStatusOthers] = s.[SStatusOthers]
						,r.[OutputPDFID] = s.[OutputPDFID]
						,r.[SolicitorCreatedDate] = s.[CreatedDate]
						,r.[SolicitorUpdatedDate] = s.[UpdatedDate]
					from [dbo].[SQLDUMakerDP_SolicitorSubmission_Rejected] r
					inner join SQLSolicitorDPSubmission s on r.arn = s.ARN
					where r.ARN = @arn 

					insert into SQLDUMakerDP_SolicitorSubmission_ExeDocs_Rejected
					select * from SQLSolicitorDPSubmissionExeDocs
					where arn = @arn 

					delete from SQLDUMakerDP_SolicitorSubmission
					where arn = @arn 

					insert into MortgageAppTaskInstance_logs 
					select [workflow]
					  ,[arn]
					  ,[TaskOwner]
					  ,[CreatedDate]
					  ,getdate()
					  ,[CreatedUser]
					  ,[UpdatedUser]
					  , 0
					  , 1
					from MortgageAppTaskInstance
					where workflow = 'DPDUMakerSolicitorApproval'
					and arn = @arn 

					delete from MortgageAppTaskInstance
					where workflow = 'DPDUMakerSolicitorApproval'
					and arn = @arn 

					update SQLSolicitorDPSubmission
					set status = 'Resubmit-New'
						, completed = 0
					--,UpdatedDate = getdate()
					where arn = @arn  

					--if ((@solicitorstatus = 'Submitted' or @solicitorstatus = 'Resubmitted') and @Decision = 'Document NOT in order for execution')
					--begin
					insert into WorkflowHistory
					values ('Documentation',@arn,'Documentation Rejected',@DUMakerEmail,null,getdate())
					--end 
				end 
				else
				begin 
					declare @solcode nvarchar(max)

					if not exists 
					(
						select 1
						from dbo.SQLDUMakerDP_SolicitorSubmission
						where arn = @arn 
					)
					begin
						insert into dbo.SQLDUMakerDP_SolicitorSubmission 
						([ARN]
						   ,[a1]
						   ,[a2]
						   ,[a3]
						   ,[a4]
						   ,[a5]
						   ,[a6]
						   ,[a7]
						   ,[a8_Remarks]
						   ,[a9]
						   ,[aOthers]
						   ,[AttorneyCentreID]
						   ,[AttorneyNameID]
						   ,[b1]
						   ,[b2]
						   ,[b3]
						   ,[b4]
						   ,[b5]
						   ,[b6]
						   ,[bOthers]
						   ,[FacilityCancelledDate]
						   ,[DUMakerEmail]
						   ,[HardCopyReceivedDate]
						   ,[Decision]
						   ,[Status]
							,[AttorneyCentre]
							,[AttorneyName]
						   ,[CreatedDate]
						   ,[UpdatedDate]
						   )
						   values 
						   (
							  @ARN
								,@a1
								,@a2
								,@a3
								,@a4
								,@a5
								,@a6
								,@a7
								,@a8_Remarks
								,@a9
								,@aOthers
								,@AttorneyCentreID
								,@AttorneyNameID
								,@b1
								,@b2
								,@b3
								,@b4
								,@b5
								,@b6
								,@bOthers
								,@FacilityCancelledDate
								,@DUMakerEmail
								,@HardCopyReceivedDate
								,@Decision
								,@Status
								,@AttorneyCentre
								,@Attorney
								,getdate() 
								,getdate() 					
							)
							
							-- 20210921- start move the completed sequence to the next branch
							/*
							if (@Status='Completed')
							begin
								insert into MortgageAppTaskInstance_logs 
								select [workflow]
								  ,[arn]
								  ,[TaskOwner]
								  ,[CreatedDate]
								  ,getdate()
								  ,[CreatedUser]
								  ,[UpdatedUser]
								  , 0
								  , 1
								from MortgageAppTaskInstance
								where workflow = 'DPDUMakerSolicitorApproval'
								and arn = @arn 

								delete from MortgageAppTaskInstance
								where workflow = 'DPDUMakerSolicitorApproval'
								and arn = @arn 

								if ((@solicitorstatus = 'Submitted' or @solicitorstatus = 'Resubmitted') and @Decision = 'Document in order for execution')
								begin
									insert into WorkflowHistory
									values ('Documentation',@arn,'Documentation Approved',@DUMakerEmail,null,getdate())
								end 								
								
								-- 20210331- add sol acceptance record to WF history 

								

								select @solcode = solicitorcode
								from SQLLOADS
								where arn = @arn

								insert into WorkflowHistory
								values ('Disbursement By Solicitor',@arn,'Case Received By Solicitor',@solcode,null,getdate())
								-- end 

								if (@solicitorstatus = 'Cancelled')
								begin
									insert into WorkflowHistory
									values ('Documentation',@arn,'Cancellation Approved',@DUMakerEmail,null,getdate())
								end 
							end 
							*/
							-- 20210921- endd move the completed sequence to the next branch
					end 
					else
					begin
						update dbo.SQLDUMakerDP_SolicitorSubmission 
						set  
							a1 = @a1
							,a2 = @a2
							,a3 = @a3
							,a4 = @a4
							,a5 = @a5
							,a6 = @a6
							,a7 = @a7
							,a8_Remarks= @a8_Remarks
							,a9 = @a9
							,aOthers = @aOthers
							,AttorneyCentreID = @AttorneyCentreID
							,AttorneyNameID = @AttorneyNameID
							,b1 = @b1
							,b2 = @b2
							,b3 = @b3
							,b4 = @b4
							,b5 = @b5
							,b6 = @b6
							,bOthers = @bOthers
							,FacilityCancelledDate = @FacilityCancelledDate
							,DUMakerEmail = @DUMakerEmail
							,HardCopyReceivedDate = @HardCopyReceivedDate
							,Decision = @Decision
							,Status = @Status				
							,AttorneyCentre = @AttorneyCentre		
							,AttorneyName = @Attorney		
							,UpdatedDate = getdate() 	
						where arn = @arn 
						-- 20210921- start move the completed sequence to the next branch
						/*
						if (@Status='Completed')
						begin
							insert into MortgageAppTaskInstance_logs 
							select [workflow]
							  ,[arn]
							  ,[TaskOwner]
							  ,[CreatedDate]
							  ,getdate()
							  ,[CreatedUser]
							  ,[UpdatedUser]
							  , 0
							  , 1
							from MortgageAppTaskInstance
							where workflow = 'DPDUMakerSolicitorApproval'
							and arn = @arn 

							delete from MortgageAppTaskInstance
							where workflow = 'DPDUMakerSolicitorApproval'
							and arn = @arn 

							if ((@solicitorstatus = 'Submitted' or @solicitorstatus = 'Resubmitted') and @Decision = 'Document in order for execution')
							begin
								insert into WorkflowHistory
								values ('Documentation',@arn,'Documentation Approved',@DUMakerEmail,null,getdate())

								-- 20210331- add sol acceptance record to WF history 

								--declare @solcode nvarchar(max)

								select @solcode = solicitorcode
								from SQLLOADS
								where arn = @arn

								insert into WorkflowHistory
								values ('Disbursement By Solicitor',@arn,'Case Received By Solicitor',@solcode,null,getdate())
								-- end 
							end 							

							if (@solicitorstatus = 'Cancelled')
							begin
								insert into WorkflowHistory
								values ('Documentation',@arn,'Cancellation Approved',@DUMakerEmail,null,getdate())
							end 
						end 
						*/
						-- 20210921- end move the completed sequence to the next branch
					end 	
					
					-- 20210921- start move the completed sequence to the next branch
					if (@Status='Completed')
					begin
						insert into MortgageAppTaskInstance_logs 
						select [workflow]
							,[arn]
							,[TaskOwner]
							,[CreatedDate]
							,getdate()
							,[CreatedUser]
							,[UpdatedUser]
							, 0
							, 1
						from MortgageAppTaskInstance
						where workflow = 'DPDUMakerSolicitorApproval'
						and arn = @arn 

						delete from MortgageAppTaskInstance
						where workflow = 'DPDUMakerSolicitorApproval'
						and arn = @arn 

						if ((@solicitorstatus = 'Submitted' or @solicitorstatus = 'Resubmitted') and @Decision = 'Document in order for execution')
						begin
							insert into WorkflowHistory
							values ('Documentation',@arn,'Documentation Approved',@DUMakerEmail,null,getdate())

							-- 20210331- add sol acceptance record to WF history 

							--declare @solcode nvarchar(max)

							select @solcode = solicitorcode
							from SQLLOADS
							where arn = @arn

							insert into WorkflowHistory
							values ('Disbursement By Solicitor',@arn,'Case Received By Solicitor',@solcode,null,getdate())
							-- end 

							-- 20210921- start add record to send email to developer log  
							declare @PhaseCode nvarchar(max)
							declare @ProjectCode nvarchar(max)
							declare @DeveloperCode nvarchar(max)
							declare @SQLLOADS_DisbursementManner nvarchar(max)

							set @SQLLOADS_DisbursementManner = (select disbursementmanner from sqlloads where arn = @arn )

							set @PhaseCode = 
							(	
								select phasecode 
								from SQLDUMakerDP_SolicitorSubmission doc 
								inner join SQLLOADS on  SQLLOADS.arn = doc.arn
								where doc.arn = @arn 
							)

							set @ProjectCode = 
							(	
								select ProjectCode 
								from SQLDUMakerDP_SolicitorSubmission doc 
								inner join SQLLOADS on  SQLLOADS.arn = doc.arn
								where doc.arn = @arn 
							)

							set @DeveloperCode = 
							(	
								select DeveloperCode 
								from SQLDUMakerDP_SolicitorSubmission doc 
								inner join SQLLOADS on  SQLLOADS.arn = doc.arn
								where doc.arn = @arn 
							)
							declare @phaseemail nvarchar(max) 
							set @phaseemail = 
							(	
								select isnull(phaseemail,'')
								from ddProjectPhase
								where developercode = @developercode
									and projectcode = @projectcode
									and phasecode = @phasecode
							)

							if (@SQLLOADS_DisbursementManner = 'PR' )
							begin
								if not exists
								(
									select 1
									from ddProjectEmailToDeveloperLog
									where DeveloperCode = @DeveloperCode
										and ProjectCode = @ProjectCode
										and PhaseCode = @PhaseCode
								)
								begin			
									if (isnull(@phaseemail,'') <> '')
									begin
										INSERT INTO [dbo].[ddProjectEmailToDeveloperLog]
										   ([DeveloperCode]
										   ,[ProjectCode]
										   ,[PhaseCode]
										   ,DocumentationApprovedDate
										   ,[EmailARN]
										   ,[EmailHeader]
										   ,[EmailContent]
										   ,[EmailSender]
										   ,[EmailReceiver]
										   ,[EmailSentFlag]
										   ,[EmailSentDate]
										   ,[CreatedUser]
										   ,[CreatedDate]
										   ,[DeletedUser]
										   ,[DeletedDate])
										   values 
										   (
												@DeveloperCode,
												@ProjectCode,
												@PhaseCode,
												getdate(),
												@ARN,
												null,
												null,
												null,
												@phaseemail,
												0,
												null,
												null,
												getdate(),
												null,
												getdate()
										   )
									end 
									
								end 
							end 

							
							-- 20210921- end add record to send email to developer log  
						end 							

						if (@solicitorstatus = 'Cancelled')
						begin
							insert into WorkflowHistory
							values ('Documentation',@arn,'Cancellation Approved',@DUMakerEmail,null,getdate())
						end 
					end 
					-- 20210921- end move the completed sequence to the next branch
				end 
			end 
		end 
	end 

	
	


	


end