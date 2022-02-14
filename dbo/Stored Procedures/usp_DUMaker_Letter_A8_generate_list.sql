CREATE procedure [dbo].[usp_DUMaker_Letter_A8_generate_list]
as
begin

	WITH CTE0 ([SenderEmail])
		as
		(
		select [SenderEmail] FROM [dbo].[Settings]
		),
	 CTE (arn, DUMakerRejectDate, receiveremail, email_header, email_body)  
	AS  (
		select sol.arn,  rejected.updateddate as DUMakerRejectDate, loads.SolicitorEmail as receiveremail, 
			dbo.[ufn_DUMaker_Letter_A8_header_generate](loads.arn) as email_header,
			dbo.[ufn_DUMaker_Letter_A8_body_generate](loads.arn) as email_body
		from vw_SQLSolicitorDPSubmission sol
		inner join sqlloads loads on loads.arn = sol.arn 
		inner join SQLDUMakerDP_SolicitorSubmission_Rejected rejected on rejected.arn = sol.arn 
		where 
			sol.status in ('Resubmit-New')
			--and sol.arn not in (select arn from SQLDUMakerDP_SolicitorSubmission_Rejected)
			--and 
			--and sol.updateddate <= DATEADD(day,-7,CONVERT(date, getdate()))
			--and loads.SolicitorEmail = 'jasonang@b-excelle.com'
		
		union 
		select sol.arn,  rejected.updateddate as DUMakerRejectDate, loads.SolicitorEmail as receiveremail,  
			dbo.[ufn_DUMaker_Letter_A8_header_generate](loads.arn) as email_header,
			dbo.[ufn_DUMaker_Letter_A8_body_generate](loads.arn) as email_body
		from vw_SQLSolicitorDPSubmission sol
		inner join sqlloads loads on loads.arn = sol.arn 
		inner join SQLDUMakerDP_SolicitorSubmission_Rejected rejected on rejected.arn = sol.arn 
		where 
			sol.status in ('UpdateInfo')
			--and sol.arn in (select arn from SQLDUMakerDP_SolicitorSubmission_Rejected)
			--and 
			--and rejected.updateddate <= DATEADD(day,-7,CONVERT(date, getdate()))
			--and loads.SolicitorEmail = 'jasonang@b-excelle.com'
		
		/*
			select loads.arn,  loads.updateddate, loads.SolicitorEmail as receiveremail, @senderEmail, 
			dbo.[ufn_DUMaker_Letter_A8_header_generate](loads.arn) as email_header,
			dbo.[ufn_DUMaker_Letter_A8_body_generate](loads.arn) as email_body
		from sqlloads loads 
		where loads.updateddate <= DATEADD(day,-@days,CONVERT(date, getdate()))
			and loads.arn not in (select arn from SQLSolicitorDPSubmission)
			and loads.SolicitorEmail = 'jasonang@b-excelle.com'
			*/
	)
	--select ROW_NUMBER() OVER(ORDER BY arn ASC) AS RowNumber, arn, updateddate, receiveremail, cte0.senderemail, email_header, email_body		
	insert into SQLJOB_DUMaker_Letter_A8_generate_list_aging_staging
	select arn, DUMakerRejectDate, receiveremail, cte0.senderemail, email_header, email_body			
	from cte 
	CROSS JOIN cte0	

	
	MERGE INTO SQLJOB_DUMaker_Letter_A8_generate_list_aging AS Target  
		USING (select * from SQLJOB_DUMaker_Letter_A8_generate_list_aging_staging)  
			   AS Source (arn, DUMakerRejectDate, receiveremail, senderemail, email_header, email_body)  
		ON Target.arn = Source.arn  
		WHEN MATCHED THEN  
		UPDATE SET aging = aging + 1,
			DUMakerRejectDate = Source.DUMakerRejectDate,
			receiveremail = Source.receiveremail,
			email_header = Source.email_header,
			email_body = Source.email_body
		WHEN NOT MATCHED BY TARGET THEN  
		INSERT (arn, DUMakerRejectDate, receiveremail, senderemail, email_header, email_body,aging) VALUES (Source.arn, Source.DUMakerRejectDate, Source.receiveremail, Source.senderemail, Source.email_header, Source.email_body, 1)  
		WHEN NOT MATCHED BY SOURCE THEN  
			DELETE ;
		
		truncate table SQLJOB_DUMaker_Letter_A8_generate_list_aging_staging
		truncate table SQLJOB_DUMaker_Letter_A8_generate_list_aging_staging2		

		insert into SQLJOB_DUMaker_Letter_A8_generate_list_aging_staging2
		select ROW_NUMBER() OVER(ORDER BY arn ASC) AS RowNumber, arn, DUMakerRejectDate, receiveremail, senderemail, email_header, email_body
		--into SQLJOB_DUMaker_Letter_A8_generate_list_aging_staging2
		from SQLJOB_DUMaker_Letter_A8_generate_list_aging
		where 
			aging = 7
			--and DUMakerRejectDate is not null		
			and 
			receiveremail is not null 
			and email_header is not null 
			and email_body is not null 

		update SQLJOB_DUMaker_Letter_A8_generate_list_aging
		set aging = 1 
		where aging = 7

		select RowNumber, arn, DUMakerRejectDate, receiveremail, senderemail, email_header, email_body
		from SQLJOB_DUMaker_Letter_A8_generate_list_aging_staging2
		order by RowNumber asc 
end