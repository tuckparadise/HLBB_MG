CREATE procedure [dbo].[usp_SQLSolicitorDPSubmissionREFDoc_add]
@solicitoremail nvarchar(100),
@arn nvarchar(100) ,
@RefDocNameDesc nvarchar(max),
@CreatedDate date = null
as
begin

	declare @RefDocName varchar(1000)
	set @RefDocName = REPLACE(@RefDocNameDesc, ' ', '')

	/*
	delete from dbo.SQLSolicitorDPSubmissionRefDocs
	where arn = @arn 
		and solicitoremail = @solicitoremail
	*/

	if (@RefDocName <> '')
	begin 
		
		if not exists 
		(
			select 1 
			from dbo.SQLSolicitorDPSubmissionRefDocs
			where solicitorcode = @solicitoremail 
				and arn = @arn 
				and RefDocNameID = @RefDocName				
		)
		begin
			insert into dbo.SQLSolicitorDPSubmissionRefDocs (arn, solicitorcode,RefDocNameID,RefDocNameDesc, createddate)
			values (@arn,@solicitoremail,@RefDocName,@RefDocNameDesc, @CreatedDate  )
		end 
	end  
end