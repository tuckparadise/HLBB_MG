CREATE   procedure [dbo].[usp_InternalUser_CheckClosed]
  @username nvarchar(max) = null 
  as
  begin
	if exists
	(
		select 1
		from InternalUser
		where [Status] = 'Closed'
			and UserName = @username			
	)
	begin
		select '1' as result 
	end 
	else
	begin
		select '0' as result 
	end 
  end