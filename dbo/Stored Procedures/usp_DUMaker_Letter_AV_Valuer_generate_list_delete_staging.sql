CREATE procedure [dbo].[usp_DUMaker_Letter_AV_Valuer_generate_list_delete_staging]
as
begin		
			
	delete from SQLJOB_DUMaker_Letter_AV_valuer_generate_list_aging_staging
	where arn in (select arn from SQLJOB_DUMaker_Letter_AV_valuer_generate_list_aging_staging2)		

end