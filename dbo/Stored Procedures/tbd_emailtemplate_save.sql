create   procedure [dbo].[tbd_emailtemplate_save]
@header nvarchar(max) = null ,
@body nvarchar(max) = null 
as
begin
	if exists 
	(
		select 1 from tbd_emailtemplate
	)
	begin
		update tbd_emailtemplate
		set 	Header = @header,
			body = @body 

	end 
	else
	begin
		insert into tbd_emailtemplate (Header,Body)
		values (@header,@body)
	end 
end