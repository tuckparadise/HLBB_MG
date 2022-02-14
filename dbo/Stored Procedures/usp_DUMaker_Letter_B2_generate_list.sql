CREATE procedure [dbo].[usp_DUMaker_Letter_B2_generate_list]
as
begin

		WITH CTE0 ([SenderEmail])
		as
		(
		select [SenderEmail] FROM [dbo].[Settings]
		),
		 CTE (arn, DateOfValuerSubmission, receiveremail,  email_header, email_body)  
	AS  (
	select loads.arn,  dumaker.UpdatedDate as DateOfValuerSubmission, loads.ValuerEmail as receiveremail, 
		dbo.[ufn_DUMaker_Letter_B2_header_generate](loads.arn) as email_header,
		dbo.[ufn_DUMaker_Letter_B2_body_generate](loads.arn) as email_body	
	FROM [dbo].[SQLLOADS] LOADS
	  INNER JOIN [dbo].vw_SQLValuerDPSubmission valuer on valuer.arn = LOADS.arn
	  left join SQLDUMakerDP_ValuerSubmission dumaker on dumaker.arn = valuer.arn 
	  left join SQLDUMakerDP_ValuerSubmission_LoweredOMV dumaker_lowerOMV on dumaker_lowerOMV.arn = valuer.arn 
	  where 
		--valuer.Status in ('Submitted', 'Cancelled', 'LowerOMV', 'Resubmitted')
		valuer.Status in ('Submitted', 'Resubmitted')
		and LOADS.ARN not in (select arn from MortgageAppTaskInstance where Workflow = 'DPDUMakerValuerApproval') 
		and LOADS.ARN not in (select arn from [dbo].SQLDUMakerDP_ValuerSubmission where Status in ('Completed'))
		
		)						
		insert into SQLJOB_DUMaker_Letter_B2_generate_list_aging_staging
		select arn, DateOfValuerSubmission, receiveremail, senderemail, email_header, email_body			
		from cte
			CROSS JOIN		cte0	
		;
		
	
	MERGE INTO SQLJOB_DUMaker_Letter_B2_generate_list_aging AS Target  
		USING (select * from SQLJOB_DUMaker_Letter_B2_generate_list_aging_staging)  
			   AS Source (arn, DateOfValuerSubmission, receiveremail, senderemail, email_header, email_body)  
		ON Target.arn = Source.arn  
		WHEN MATCHED THEN  
		UPDATE SET aging = aging + 1,
			DateOfValuerSubmission = Source.DateOfValuerSubmission,
			receiveremail = Source.receiveremail,
			email_header = Source.email_header,
			email_body = Source.email_body
		WHEN NOT MATCHED BY TARGET THEN  
		INSERT (arn, DateOfValuerSubmission, receiveremail, senderemail, email_header, email_body,aging) 
		VALUES (Source.arn, Source.DateOfValuerSubmission, Source.receiveremail, Source.senderemail, Source.email_header, Source.email_body, 1)  
		WHEN NOT MATCHED BY SOURCE THEN  
			DELETE ;	
	
		truncate table SQLJOB_DUMaker_Letter_B2_generate_list_aging_staging
		truncate table SQLJOB_DUMaker_Letter_B2_generate_list_aging_staging2

		insert into SQLJOB_DUMaker_Letter_B2_generate_list_aging_staging2
		select ROW_NUMBER() OVER(ORDER BY arn ASC) AS RowNumber, arn, DateOfValuerSubmission, receiveremail, senderemail, email_header, email_body
		--into SQLJOB_DUMaker_Letter_B2_generate_list_aging_staging2
		from SQLJOB_DUMaker_Letter_B2_generate_list_aging
		where 
			aging = 15
			--and DateOfValuerSubmission is not null		
			and 
			receiveremail is not null 
			and email_header is not null 
			and email_body is not null 
		
		
		update SQLJOB_DUMaker_Letter_B2_generate_list_aging
		set aging = 1 
		where aging = 15
		
		select  RowNumber, arn, DateOfValuerSubmission, receiveremail, senderemail, email_header, email_body
		from SQLJOB_DUMaker_Letter_B2_generate_list_aging_staging2
		order by RowNumber asc 
end