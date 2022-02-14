CREATE   procedure [dbo].[test_usercontexta]
as
begin
	DECLARE @user nvarchar(128);
	SET @user = dbo.GetContextUser();

	insert into test_usercontext
	values (@user)

end