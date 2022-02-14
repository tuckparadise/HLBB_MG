CREATE   procedure [dbo].[usp_AdminOperationAuditTrailReportDetail]
@ColumnNames nvarchar(max) = null,
@OriValues nvarchar(max) = null,
@NewValues nvarchar(max) = null
as
begin
	if (isnull(@ColumnNames,'') <> '')
	begin
		select tbl1.column_id as ColID, 
		tbl1.value as ColumnName,
		tbl2.value as OriginalValue ,
		tbl3.value as NewValue ,
		case when (isnull(tbl2.value,'') <> isnull(tbl3.value,'') )then 'True' else '' end ValueChanged 
	from [fn_split_string_to_column](@ColumnNames, ',') tbl1
		left join (select * from [fn_split_string_to_column](@OriValues, ',')) tbl2 on tbl1.column_id = tbl2.column_id
		left join (select * from [fn_split_string_to_column](@NewValues, ',')) tbl3 on tbl1.column_id = tbl3.column_id
	end 
	else
	begin	
		select 1 as ColID, 
		'' as ColumnName,
		@OriValues as OriginalValue ,
		@NewValues as NewValue ,
		case when (isnull(@OriValues,'') <> isnull(@NewValues,'')) then 'True' else '' end ValueChanged 				
	end 

end