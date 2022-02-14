create   procedure [dbo].[TBD_TestDataSave]
  @id nvarchar(max),
  @name nvarchar(max),
  @password nvarchar(max)
  as
  begin
	insert into [SQLSolicitor] values (@id,@password,'Active',@name,getdate(),getdate(),'system2','system2',NULL,'Yes',getdate(),getdate(),NULL)
  end