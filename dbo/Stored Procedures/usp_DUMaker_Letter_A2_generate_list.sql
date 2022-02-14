CREATE procedure [dbo].[usp_DUMaker_Letter_A2_generate_list]
as
begin

		WITH CTE0 ([SenderEmail])
		as
		(
		select [SenderEmail] FROM [dbo].[Settings]
		),
	 CTE (arn, DateOfLOAcceptance, receiveremail,  email_header, email_body)  
	AS  (
		select sol.arn,  loads.DateOfLOAcceptance, loads.ApplicantEmail as receiveremail, 
			dbo.[ufn_DUMaker_Letter_A2_header_generate](loads.arn) as email_header,
			dbo.[ufn_DUMaker_Letter_A2_body_generate](loads.arn) as email_body
		from vw_SQLSolicitorDPSubmission sol
		inner join sqlloads loads on loads.arn = sol.arn 
		where sol.status in ('New','UpdateInfo')
			and sol.arn not in (select arn from SQLDUMakerDP_SolicitorSubmission_Rejected)
			--and loads.CreatedDate <= DATEADD(day,-7,CONVERT(date, getdate()))
			--and loads.SolicitorEmail = 'jasonang@b-excelle.com'
		union 
			select loads.arn,  loads.DateOfLOAcceptance, loads.ApplicantEmail as receiveremail, 
			dbo.[ufn_DUMaker_Letter_A2_header_generate](loads.arn) as email_header,
			dbo.[ufn_DUMaker_Letter_A2_body_generate](loads.arn) as email_body
		from sqlloads loads 
		where loads.arn not in (select arn from vw_SQLSolicitorDPSubmission)
			--loads.CreatedDate <= DATEADD(day,-7,CONVERT(date, getdate()))							
			--and loads.SolicitorEmail = 'jasonang@b-excelle.com'
		)
		--select ROW_NUMBER() OVER(ORDER BY arn ASC) AS RowNumber, arn, updateddate, receiveremail, cte0.senderemail, email_header, email_body		
		insert into SQLJOB_DUMaker_Letter_A2_generate_list_aging_staging
		select arn, DateOfLOAcceptance, receiveremail, cte0.senderemail, email_header, email_body				
		from cte 		
		CROSS JOIN		cte0	
		
		
		MERGE INTO SQLJOB_DUMaker_Letter_A2_generate_list_aging AS Target  
		USING (select * from SQLJOB_DUMaker_Letter_A2_generate_list_aging_staging)  
			   AS Source (arn, DateOfLOAcceptance, receiveremail, senderemail, email_header, email_body)  
		ON Target.arn = Source.arn  
		WHEN MATCHED THEN  
		UPDATE SET aging = aging + 1,
			DateOfLOAcceptance = Source.DateOfLOAcceptance,
			receiveremail = Source.receiveremail,
			email_header = Source.email_header,
			email_body = Source.email_body
		WHEN NOT MATCHED BY TARGET THEN  
		INSERT (arn, DateOfLOAcceptance, receiveremail, senderemail, email_header, email_body,aging) VALUES (Source.arn, Source.DateOfLOAcceptance, Source.receiveremail, Source.senderemail, Source.email_header, Source.email_body, 1)  
		WHEN NOT MATCHED BY SOURCE THEN  
			DELETE ;

		truncate table SQLJOB_DUMaker_Letter_A2_generate_list_aging_staging
		truncate table SQLJOB_DUMaker_Letter_A2_generate_list_aging_staging2		

		insert into SQLJOB_DUMaker_Letter_A2_generate_list_aging_staging2
		select ROW_NUMBER() OVER(ORDER BY arn ASC) AS RowNumber, arn, DateOfLOAcceptance, receiveremail, senderemail, email_header, email_body
		--into SQLJOB_DUMaker_Letter_A2_generate_list_aging_staging2
		from SQLJOB_DUMaker_Letter_A2_generate_list_aging
		where 
			aging = 30
			--and DateOfLOAcceptance is not null		
			and 
			receiveremail is not null 
			and email_header is not null 
			and email_body is not null 

		update SQLJOB_DUMaker_Letter_A2_generate_list_aging
		set aging = 1 
		where aging = 30

		select RowNumber, arn, DateOfLOAcceptance, receiveremail, senderemail, email_header, email_body
		from SQLJOB_DUMaker_Letter_A2_generate_list_aging_staging2
		order by RowNumber asc 
end