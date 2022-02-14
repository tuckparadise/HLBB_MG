create   procedure [dbo].[tbd_emailtemplate_emailselect]
@header nvarchar(max) = null output,
@body nvarchar(max) = null output
as
begin
	set @header = (select replace(header,'@arn','arn1') from tbd_emailtemplate)

	set @body = (select replace(body,'@dateofacceptance','01/12/2021') from tbd_emailtemplate)
	set @body = (select replace(@body,'@url','https:////kapps2//Runtime//Runtime//Form//SQL+form+solicitor__login//'))

	--set @body = (select body from tbd_emailtemplate)
end