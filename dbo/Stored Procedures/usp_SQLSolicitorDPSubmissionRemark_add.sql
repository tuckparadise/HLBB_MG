CREATE     procedure [dbo].[usp_SQLSolicitorDPSubmissionRemark_add]
@SolicitorEmail nvarchar(100),
@arn nvarchar(100) ,
@Remark nvarchar(max) = null,
@CreatedDate datetime 
as
begin

	declare @RemarkID int 

	set @Remark = ltrim(rtrim(@Remark))

	if (@Remark <> '')
	begin 
		
		if not exists 
		(
			select 1 
			from dbo.SQLSolicitorDPSubmissionRemark
			where Solicitorcode = @SolicitorEmail 
				and arn = @arn 
				--and remark = @Remark
				--and createddate = @CreatedDate
		)
		begin
			insert into dbo.SQLSolicitorDPSubmissionRemark (arn, SolicitorCode,remark,createddate, remarkid)
			values (@arn,@SolicitorEmail,@Remark,@CreatedDate ,1 )
		end 
		else
		begin 
			if not exists 
			(
				select 1 
				from dbo.SQLSolicitorDPSubmissionRemark
				where Solicitorcode = @SolicitorEmail 
					and arn = @arn 
					and remark = @Remark					
			)
			begin
				select @RemarkID =  max(RemarkID) 
				from SQLSolicitorDPSubmissionRemark
				where solicitorcode = @solicitoremail 
					and arn = @arn 

				set @RemarkID = @RemarkID + 1

				insert into dbo.SQLSolicitorDPSubmissionRemark (arn, SolicitorCode,remark,createddate, remarkid)
				values (@arn,@SolicitorEmail,@Remark,@CreatedDate ,@RemarkID )
			end
		end
	end  





end