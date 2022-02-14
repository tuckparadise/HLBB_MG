CREATE procedure [dbo].[usp_DUMaker_Letter_AV_Valuer_generate_list]
as
begin		
			
	truncate table SQLJOB_DUMaker_Letter_AV_valuer_generate_list_aging_staging2 		

	insert into SQLJOB_DUMaker_Letter_AV_valuer_generate_list_aging_staging2
	select ROW_NUMBER() OVER(ORDER BY arn ASC) AS RowNumber, arn, receiveremail, senderemail, email_header, email_body
	from SQLJOB_DUMaker_Letter_AV_valuer_generate_list_aging_staging
	where 		
		receiveremail is not null 
		and email_header is not null 
		and email_body is not null 			
		
	select RowNumber, arn, receiveremail, senderemail, email_header, email_body
	from SQLJOB_DUMaker_Letter_AV_valuer_generate_list_aging_staging2
	order by RowNumber asc 	
		
end