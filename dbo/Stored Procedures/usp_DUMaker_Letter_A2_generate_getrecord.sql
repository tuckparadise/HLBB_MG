--[usp_DUMaker_Letter_A1_generate_getrecord] 1

CREATE procedure [dbo].[usp_DUMaker_Letter_A2_generate_getrecord]
@index int ,
@RowNumber nvarchar(max) = null output ,
@arn nvarchar(max) = null output ,
@Date nvarchar(max) = null output ,
@receiveremail nvarchar(max) = null output ,
@senderemail nvarchar(max) = null output ,
@email_header nvarchar(max) = null output ,
@email_body nvarchar(max) = null output 
as
begin		
			
		select 
			@RowNumber = RowNumber, 
			@arn = arn, 
			@Date = DateOfLOAcceptance, 
			@receiveremail = receiveremail, 
			@senderemail = senderemail, 
			@email_header = email_header, 
			@email_body = email_body
		from SQLJOB_DUMaker_Letter_A2_generate_list_aging_staging2
		where 
			RowNumber = @index

		
end