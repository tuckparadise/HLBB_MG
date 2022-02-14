CREATE procedure [dbo].[usp_DUMaker_Letter_A9_generate_list]
as
begin

	
	/*select ROW_NUMBER() OVER(ORDER BY sol.arn ASC) AS RowNumber,sol.arn,  sol.updateddate as solsubmissiondate, loads.SolicitorEmail as receiveremail, tblSettings.SenderEmail as senderemail
		dbo.[ufn_DUMaker_Letter_A9_header_generate](loads.arn) as email_header,
		dbo.[ufn_DUMaker_Letter_A9_body_generate](loads.arn) as email_body
		*/
	
	insert into SQLJOB_DUMaker_Letter_A9_generate_list_aging_staging
	select sol.arn,  sol.updateddate as solsubmissiondate, loads.SolicitorEmail as receiveremail, tblSettings.SenderEmail as senderemail,
		dbo.[ufn_DUMaker_Letter_A9_header_generate](loads.arn) as email_header,
		dbo.[ufn_DUMaker_Letter_A9_body_generate](loads.arn) as email_body	
	from vw_SQLSolicitorDPSubmission sol
	inner join sqlloads loads on loads.arn = sol.arn 	
	cross join (		
		select [SenderEmail] FROM [dbo].[Settings]
		) tblSettings
	where 
		sol.status in ('Submitted','Resubmitted')		
		--and sol.updateddate <= DATEADD(day,-7,CONVERT(date, getdate()))
		and sol.arn not in (select arn from SQLDUMakerDP_SolicitorSubmission where status = 'Completed')
		and sol.arn not in (select arn from MortgageAppTaskInstance where Workflow = 'DPDUMakerSolicitorApproval')
		--and loads.SolicitorEmail = 'jasonang@b-excelle.com'
		
	
	MERGE INTO SQLJOB_DUMaker_Letter_A9_generate_list_aging AS Target  
		USING (select * from SQLJOB_DUMaker_Letter_A9_generate_list_aging_staging)  
			   AS Source (arn, solsubmissiondate, receiveremail, senderemail, email_header, email_body)  
		ON Target.arn = Source.arn  
		WHEN MATCHED THEN  
		UPDATE SET aging = aging + 1,	
			solsubmissiondate = Source.solsubmissiondate,
			receiveremail = Source.receiveremail,
			email_header = Source.email_header,
			email_body = Source.email_body
		WHEN NOT MATCHED BY TARGET THEN  
		INSERT (arn, solsubmissiondate, receiveremail, senderemail, email_header, email_body,aging) VALUES (Source.arn, Source.solsubmissiondate, Source.receiveremail, Source.senderemail, Source.email_header, Source.email_body, 1)  
		WHEN NOT MATCHED BY SOURCE THEN  
			DELETE ;	
	
		truncate table SQLJOB_DUMaker_Letter_A9_generate_list_aging_staging
		truncate table SQLJOB_DUMaker_Letter_A9_generate_list_aging_staging2		

		insert into SQLJOB_DUMaker_Letter_A9_generate_list_aging_staging2
		select ROW_NUMBER() OVER(ORDER BY arn ASC) AS RowNumber, arn, solsubmissiondate, receiveremail, senderemail, email_header, email_body
		--into SQLJOB_DUMaker_Letter_A9_generate_list_aging_staging2
		from SQLJOB_DUMaker_Letter_A9_generate_list_aging
		where 
			aging = 7				
			--and solsubmissiondate is not null		
			and 
			receiveremail is not null 
			and email_header is not null 
			and email_body is not null 
		
		update SQLJOB_DUMaker_Letter_A9_generate_list_aging
		set aging = 1 
		where aging = 7

		select RowNumber, arn, solsubmissiondate, receiveremail, senderemail, email_header, email_body
		from SQLJOB_DUMaker_Letter_A9_generate_list_aging_staging2
		order by RowNumber asc 
end