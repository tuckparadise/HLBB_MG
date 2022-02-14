CREATE   procedure [dbo].[usp_ws_SQLSolicitorDPSubmissionAttachment_add_withattachment]
@solicitoremail nvarchar(100),
@arn nvarchar(100) ,
@Attachment nvarchar(max) = null
as
begin

	declare @AttachmentID int , @proceed int 
	set @proceed = 1
	--set @AttachmentID = REPLACE(@ExeDocName, ' ', '')

	/*
	delete from dbo.SQLSolicitorDPSubmissionAttachment
	where arn = @arn 
		and solicitoremail = @solicitoremail
	*/
	if (@Attachment = '' or @Attachment = '<file><name>scnull</name><content>scnull</content></file>' or @Attachment = null)
	begin
		set @proceed = 0
	end 

	set @proceed = 0

	if (@proceed = 1)
	begin 
		
		if not exists 
		(
			select 1 
			from dbo.SQLSolicitorDPSubmissionAttachment2
			where solicitorcode = @solicitoremail 
				and arn = @arn 
				--and Attachment = @Attachment				
		)
		begin
			set @AttachmentID = 1
			/*
			insert into dbo.SQLSolicitorDPSubmissionAttachment2 
				(arn, solicitorcode,AttachmentID, createddate , Attachment)
			values (@arn,@solicitoremail,@AttachmentID, @CreatedDate  , @Attachment)
			*/
			insert into dbo.SQLSolicitorDPSubmissionAttachment2 
				(arn, solicitorcode,AttachmentID, createddate, Attachment ) 			
			values (@arn,@solicitoremail,@AttachmentID, getdate() , @Attachment)
		end 
		else
		begin 
			select @AttachmentID =  max(AttachmentID) 
			from SQLSolicitorDPSubmissionAttachment2
			where solicitorcode = @solicitoremail 
				and arn = @arn 

			set @AttachmentID = @AttachmentID + 1

			/*
			insert into dbo.SQLSolicitorDPSubmissionAttachment2 
				(arn, solicitorcode,AttachmentID, createddate,  Attachment)
			values (@arn,@solicitoremail,@AttachmentID, @CreatedDate,  @Attachment  )
			*/

			insert into dbo.SQLSolicitorDPSubmissionAttachment2 
				(arn, solicitorcode,AttachmentID, createddate,  Attachment)
			values (@arn,@solicitoremail,@AttachmentID, getdate() ,  @Attachment  )

		end 

		select @AttachmentID as AttachmentID
	end  
end