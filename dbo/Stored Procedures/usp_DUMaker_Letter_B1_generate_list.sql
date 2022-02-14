CREATE procedure [dbo].[usp_DUMaker_Letter_B1_generate_list]
as
begin

		WITH CTE0 ([SenderEmail])
		as
		(
		select [SenderEmail] FROM [dbo].[Settings]
		),
		 CTE (arn, DateOfLOAcceptance, receiveremail,  email_header, email_body)  
	AS  (
	select loads.arn,  loads.DateOfLOAcceptance, loads.ValuerEmail as receiveremail, 
		dbo.[ufn_DUMaker_Letter_B1_header_generate](loads.arn) as email_header,
		dbo.[ufn_DUMaker_Letter_B1_body_generate](loads.arn) as email_body	
	 FROM [dbo].[SQLLOADS] LOADS
	  LEFT OUTER JOIN [DBO].vw_SQLValuerDPSubmission VALUER ON VALUER.ARN = LOADS.ARN and VALUER.Status NOT IN ('Submitted', 'LowerOMV','Cancelled','Resubmitted' )
	  WHERE 
		LOADS.ValuationRequired = 1		
		AND 
		LOADS.ARN NOT IN (SELECT LOADS.ARN FROM [dbo].[SQLLOADS] LOADS INNER JOIN [DBO].vw_SQLValuerDPSubmission VALUER ON VALUER.ARN = LOADS.ARN and VALUER.Status IN ('Submitted', 'LowerOMV','Cancelled','Resubmitted' ) )
		)						
		insert into SQLJOB_DUMaker_Letter_B1_generate_list_aging_staging
		select arn, DateOfLOAcceptance, receiveremail, senderemail, email_header, email_body			
		from cte
			CROSS JOIN		cte0	
		;
		
	
	MERGE INTO SQLJOB_DUMaker_Letter_B1_generate_list_aging AS Target  
		USING (select * from SQLJOB_DUMaker_Letter_B1_generate_list_aging_staging)  
			   AS Source (arn, DateOfLOAcceptance, receiveremail, senderemail, email_header, email_body)  
		ON Target.arn = Source.arn  
		WHEN MATCHED THEN  
		UPDATE SET aging = aging + 1,
			DateOfLOAcceptance = Source.DateOfLOAcceptance,
			receiveremail = Source.receiveremail,
			email_header = Source.email_header,
			email_body = Source.email_body
		WHEN NOT MATCHED BY TARGET THEN  
		INSERT (arn, DateOfLOAcceptance, receiveremail, senderemail, email_header, email_body,aging) 
		VALUES (Source.arn, Source.DateOfLOAcceptance, Source.receiveremail, Source.senderemail, Source.email_header, Source.email_body, 1)  
		WHEN NOT MATCHED BY SOURCE THEN  
			DELETE ;	
	
		truncate table SQLJOB_DUMaker_Letter_B1_generate_list_aging_staging
		truncate table SQLJOB_DUMaker_Letter_B1_generate_list_aging_staging2


		insert into SQLJOB_DUMaker_Letter_B1_generate_list_aging_staging2
		select ROW_NUMBER() OVER(ORDER BY arn ASC) AS RowNumber, arn, DateOfLOAcceptance, receiveremail, senderemail, email_header, email_body
		--into SQLJOB_DUMaker_Letter_B1_generate_list_aging_staging2
		from SQLJOB_DUMaker_Letter_B1_generate_list_aging
		where 
			aging = 21
			--and DateOfLOAcceptance is not null		
			and 
			receiveremail is not null 
			and email_header is not null 
			and email_body is not null 
		
		update SQLJOB_DUMaker_Letter_B1_generate_list_aging
		set aging = 1 
		where aging = 21

		select RowNumber, arn, DateOfLOAcceptance, receiveremail, senderemail, email_header, email_body
		from SQLJOB_DUMaker_Letter_B1_generate_list_aging_staging2
		order by RowNumber asc 
end