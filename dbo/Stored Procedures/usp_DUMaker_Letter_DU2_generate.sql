--[usp_DUMaker_Letter_DU2_generate] 'arn2'

CREATE procedure [dbo].[usp_DUMaker_Letter_DU2_generate]
@arn nvarchar(100)
as
begin
	
	declare 
		@reasons nvarchar(max),
		@reason_b1 nvarchar(max),
		@reason_b2 nvarchar(max),
		@reason_b3 nvarchar(max),
		@reason_b4 nvarchar(max),
		@reason_b5 nvarchar(max),
		@reason_b6 nvarchar(max),
		--@reason_b7 nvarchar(max),	
		--@reason_b8remark nvarchar(max),
		@reason_others nvarchar(max)

	select 
		--@reason_b1 = case when b1 = 1 then 'Solicitor''s firm letterhead is to be from the appointed firm as per our Letter of Instruction.' + CHAR(13)+CHAR(10) else '' end ,
		@reason_b1 = case when b1 = 1 then '- Any letter from your legal firm should be issued using your branches / office letterhead as per our letter of instruction. ' + CHAR(13)+CHAR(10) else '' end ,
		--@reason_b2 = case when b2 = 1 then 'Documents not witnessed by solicitor.' + CHAR(13)+CHAR(10) else '' end, 
		@reason_b2 = case when b2 = 1 then '- Wrong format / version of documents used.' + CHAR(13)+CHAR(10) else '' end,
		@reason_b3 = case when b3 = 1 then '- Refer to Guidelines / Specimens in the Web Portal / attached for the correct format to be inserted in Clause (c) of Form 16A / Deed of Assignment.' + CHAR(13)+CHAR(10) else '' end,
		@reason_b4 = case when b4 = 1 then '- Individual title / strata title issued. To proceed by way of legal charge.' + CHAR(13)+CHAR(10) else '' end,
		@reason_b5 = case when b5 = 1 then '- To provide confirmation letter from developer on individual title details.' + CHAR(13)+CHAR(10) else '' end,
		@reason_b6 = case when b6 = 1 then '- Pending the completed Document Admin Fee Form and / or to enclose original bank-in-slip.' + CHAR(13)+CHAR(10) else '' end,
		
		--@reason_b7 = '' +  CHAR(13)+CHAR(10) 	,
		@reason_others = case when [BOthers] is not null then '- ' + isnull([BOthers],'') +  CHAR(13)+CHAR(10) else '' end 
		--@reason_b8remark = [BOthersRemark]
	from SQLDUMakerDP_SolicitorSubmission_Rejected
	--where arn = 'arn2'
	where  arn = @arn

	set @reasons = @reason_b1 + @reason_b2 + @reason_b3 + @reason_b4 + @reason_b5 + @reason_b6  + @reason_others 
	--select @reasons 

	select loads.[ARN],
		solicitor.[SolicitorReferenceNumber],
		loads.SolicitorName,
		loads.[SolicitorAddr1],
		loads.[SolicitorAddr2],
		loads.[SolicitorAddr3],
		--loads.[SolicitorPhoneNumber],
		loads.ApplicantName,
		loads.[FinancingType],
		loads.[LoanAmount],
		DUmaker.HardCopyReceivedDate,		
		DUmaker.[Decision],
		@reasons as [Reasons],
		loads.SolicitorAddrCity ,
		loads.SolicitorAddrCountry,
		loads.SolicitorAddrPostCode,
		loads.SolicitorAddrState,
		DUmaker.UpdatedDate as [RejectedDate],
		loads.SolFaxNbr,
		loads.PrimaryCustomerID,
		loads.SolTelNbr
	from SQLLOADS loads
		inner join SQLSolicitorDPSubmission solicitor on solicitor.arn = loads.ARN
		inner join SQLDUMakerDP_SolicitorSubmission_Rejected DUmaker on DUmaker.arn = solicitor.arn
	where loads.arn = @arn 

end