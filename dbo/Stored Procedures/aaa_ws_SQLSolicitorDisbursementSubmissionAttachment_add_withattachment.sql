CREATE   procedure [dbo].[aaa_ws_SQLSolicitorDisbursementSubmissionAttachment_add_withattachment]
@solicitoremail nvarchar(100) = null,
@arn nvarchar(100) = null ,
@Attachment nvarchar(max) = null,
@CreatedDate date = null
as
begin

	declare @AttachmentID int , @proceed int 
	set @proceed = 1	
		
	if (@Attachment = '' or @Attachment = '<file><name>scnull</name><content>scnull</content></file>' or @Attachment is null)
	begin
		set @proceed = 0
	end 
	
	if (@proceed = 1)
	begin 
		
		if not exists 
		(
			select 1 
			from dbo.aaSolicitorDisbursementSubmissionAttachment
			where solicitorcode = @solicitoremail 
				and arn = @arn 						
		)
		begin
			set @AttachmentID = 1
			
			insert into dbo.aaSolicitorDisbursementSubmissionAttachment 
				(arn, solicitorcode,AttachmentID, createddate ) 			
			values (@arn,@solicitoremail,@AttachmentID, @CreatedDate )
		end 
		else
		begin 
			select @AttachmentID =  max(AttachmentID) 
			from aaSolicitorDisbursementSubmissionAttachment
			where solicitorcode = @solicitoremail 
				and arn = @arn 

			set @AttachmentID = @AttachmentID + 1			

			insert into dbo.aaSolicitorDisbursementSubmissionAttachment 
				(arn, solicitorcode,AttachmentID, createddate)
			values (@arn,@solicitoremail,@AttachmentID, @CreatedDate  )

		end 

		select @AttachmentID as AttachmentID
	end  
end