create   procedure [dbo].[usp_SolPDFPasswordSetting_SaveSetting]
@sol_op1_firstXchar int = null ,
@sol_op1_static int = null  ,
@sol_op1_static_text nvarchar(max) = null ,
@sol_op1_fieldname nvarchar(max) = null ,
@sol_op1_enabled  int = null  ,
@sol_op2_firstXchar int = null ,
@sol_op2_static int = null  ,
@sol_op2_static_text nvarchar(max) = null ,
@sol_op2_fieldname nvarchar(max) = null ,
@sol_op2_enabled int = null  ,
@sol_op3_firstXchar int = null ,
@sol_op3_static int = null  ,
@sol_op3_static_text nvarchar(max) = null ,
@sol_op3_fieldname nvarchar(max) = null ,
@sol_op3_enabled int = null ,
@error nvarchar(max) = null output 
as
begin
	set @error= ''
	
	if (@sol_op1_enabled=1)
	begin
		if (@sol_op1_static=1 and isnull(@sol_op1_static_text,'') = '')
		begin
			set @error= 'Please Fill In Static Password Field 1'	
		end 
		if (@sol_op1_static=0 and isnull(@sol_op1_firstXchar,0) = 0)
		begin
			set @error= 'Please Select The Number Of Characters For Field 1'	
		end 
		if (@sol_op1_static=0 and isnull(@sol_op1_fieldname,'') = '')
		begin
			set @error= 'Please Select Password Field 1'	
		end 
		
	end 

	if (@sol_op2_enabled=1)
	begin
		if (@sol_op2_static=1 and isnull(@sol_op2_static_text,'') = '')
		begin
			set @error= 'Please fill in Static Password Field 2'	
		end 
		if (@sol_op2_static=0 and isnull(@sol_op2_firstXchar,0) = 0)
		begin
			set @error= 'Please Select The Number Of Characters For Field 2'	
		end 
		if (@sol_op2_static=0 and isnull(@sol_op2_fieldname,'') = '')
		begin
			set @error= 'Please select Password Field 2'	
		end 
	end 

	if (@sol_op3_enabled=1)
	begin
		if (@sol_op3_static=1 and isnull(@sol_op3_static_text,'') = '')
		begin
			set @error= 'Please fill in Static Password Field 3'	
		end 
		if (@sol_op3_static=0 and isnull(@sol_op3_firstXchar,0) = 0)
		begin
			set @error= 'Please Select The Number Of Characters For Field 3'	
		end 
		if (@sol_op3_static=0 and isnull(@sol_op3_fieldname,'') = '')
		begin
			set @error= 'Please select Password Field 3'	
		end 
	end 

	if (@error = '')
	begin
		declare @passwordhint nvarchar(max) 
		
		set @passwordhint = 'The password is '

		if (@sol_op1_static = 1)
			set @passwordhint = @passwordhint + @sol_op1_static_text
		else 
			set @passwordhint = @passwordhint + 'the first ' + cast(@sol_op1_firstXchar as varchar(max)) + ' characters of ' + @sol_op1_fieldname
		
		if (@sol_op2_enabled = 1)
		begin
			set @passwordhint = @passwordhint + ' followed by '

			if (@sol_op2_enabled = 1 and @sol_op2_static = 1)
				set @passwordhint = @passwordhint + @sol_op2_static_text
			else 
				set @passwordhint = @passwordhint + 'the first ' + cast(@sol_op2_firstXchar as varchar(max)) + ' characters of ' + @sol_op2_fieldname

		end 
			

		
		if (@sol_op3_enabled = 1)
		begin
			set @passwordhint = @passwordhint + ' followed by '

			if (@sol_op3_static = 1)
				set @passwordhint = @passwordhint + @sol_op3_static_text
			else 
				set @passwordhint = @passwordhint + 'the first ' + cast(@sol_op3_firstXchar as varchar(max)) + ' characters of ' + @sol_op3_fieldname

		end 
			
			update [SolPDFPasswordSetting]
			set 			
           [sol_op1_firstXchar] = @sol_op1_firstXchar
           ,[sol_op1_static] = @sol_op1_static
           ,[sol_op1_static_text] = @sol_op1_static_text
           ,[sol_op1_fieldname] = @sol_op1_fieldname
           ,[sol_op1_enabled] = @sol_op1_enabled
           ,[sol_op2_firstXchar] = @sol_op2_firstXchar
           ,[sol_op2_static] = @sol_op2_static
           ,[sol_op2_static_text] = @sol_op2_static_text
           ,[sol_op2_fieldname] = @sol_op2_fieldname
           ,[sol_op2_enabled] = @sol_op2_enabled
           ,[sol_op3_firstXchar] = @sol_op3_firstXchar
           ,[sol_op3_static] = @sol_op3_static
           ,[sol_op3_static_text] = @sol_op3_static_text
           ,[sol_op3_fieldname] = @sol_op3_fieldname
           ,[sol_op3_enabled] = @sol_op3_enabled
           ,[passwordhint] = @passwordhint
	
		    
	end 
	

end