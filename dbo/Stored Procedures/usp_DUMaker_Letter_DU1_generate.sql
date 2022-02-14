--[usp_DUMaker_Letter_DU1_generate] 'TAI/RB/2019/Z0002024'

CREATE procedure [dbo].[usp_DUMaker_Letter_DU1_generate]
@arn nvarchar(100)
as
begin
	
	declare 
		@reasons nvarchar(max),
		@reason_a1 nvarchar(max),
		@reason_a2 nvarchar(max),
		@reason_a3 nvarchar(max),
		@reason_a4 nvarchar(max),
		@reason_a5 nvarchar(max),
		@reason_a6 nvarchar(max),
		@reason_a7 nvarchar(max),			
		@reason_a8remark nvarchar(max),
		@reason_a9 nvarchar(max),
		@reason_others nvarchar(max)		

	select 
		@reason_a1 = case when a1 = 1 then '- To amend the description / bank details as per attached.' + CHAR(13)+CHAR(10) else '' end ,
		@reason_a2 = case when a2 = 1 then '- To annex full set of E-cert in all FA.' + CHAR(13)+CHAR(10) else '' end, 
		@reason_a3 = case when a3 = 1 then '- Customer''s correspondences address is to follow as per Letter of Offer. To provide customer''s confirmation letter when advising for release if there are changes.' + CHAR(13)+CHAR(10) else '' end,
		@reason_a4 = case when a4 = 1 then '- To insert the Jurat Page in all documents.' + CHAR(13)+CHAR(10) else '' end,
		@reason_a5 = case when a5 = 1 then '- To provide F19B & Caveator’s consent format.' + CHAR(13)+CHAR(10) else '' end,
		@reason_a6 = case when a6 = 1 then '- Vendor company - To enclose relevant documents, eg SSM Search, Form 34 (where applicable), Form 24, Form 49, M&A, Board Resolution for disposal.' + CHAR(13)+CHAR(10) else '' end,
		@reason_a7 = case when a7 = 1 then '- Low cost property - To enclose Consent for transfer when advising for release' + CHAR(13)+CHAR(10) else '' end	,								
		@reason_a8remark = case when a8_remarks is null then '' 		
			else '- To follow up with Sales / branch for SLO / Notification Letter for ' + a8_remarks + CHAR(13)+CHAR(10) end, 		
		@reason_a9 = case when a9 = 1 then '- Ensure customer signatue is witnessed by Solicitor.' + CHAR(13)+CHAR(10) else '' end	,
		@reason_others = case when AOthers is not null then '- ' + isnull(AOthers,'') +  CHAR(13)+CHAR(10) else '' end 	
	from SQLDUMakerDP_SolicitorSubmission
	where  arn = @arn

	set @reasons = @reason_a1 + @reason_a2 + @reason_a3 + @reason_a4 + @reason_a5 + @reason_a6 + @reason_a7 + @reason_a8remark + @reason_a9 + @reason_others 
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
		AttorneyName,
		AttorneyCentre,
		DUmaker.HardCopyReceivedDate,		
		DUmaker.[Decision],
		@reasons as [Reasons],
		loads.SolicitorAddrCity ,
		loads.SolicitorAddrCountry,
		loads.SolicitorAddrPostCode,
		loads.SolicitorAddrState,
		loads.SolFaxNbr,
		loads.PrimaryCustomerID,
		loads.SolTelNbr
	from SQLLOADS loads
		inner join SQLSolicitorDPSubmission solicitor on solicitor.arn = loads.ARN
		inner join SQLDUMakerDP_SolicitorSubmission DUmaker on DUmaker.arn = solicitor.arn
		--inner join SQLDUMakerDP_AttorneyName an on an.AttorneyNameID = DUmaker.AttorneyNameID
		--inner join SQLDUMakerDP_AttorneyCentre ac on ac.AttorneyCentreID = an.AttorneyCentreID		
	where loads.arn = @arn 

end