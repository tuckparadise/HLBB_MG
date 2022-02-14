create   procedure [dbo].[usp_ws_getNewLI]

as

begin
		
      -- declare @CDC nvarchar(max), @sql nvarchar(max), @NewCDC datetime  

	   with UniqueARN (arn) as 
		(
			select distinct Field3 as arn
			from [EDMSDBSERVER].[HLBB_DMS].[dbo].Tbl_NewLI NewLI 
			where isnull(Completed,0) = 0 
		)
		insert into LOADS_NEW_LI_STAGING (RowNumber,ARN)
		select ROW_NUMBER() OVER(ORDER BY UniqueARN.arn ASC) AS RowNumber, UniqueARN.arn
		from UniqueARN

		select RowNumber,ARN from LOADS_NEW_LI_STAGING


	   /*
       declare @VersionTblName nvarchar(max)

 
		
       select @VersionTblName= [VersionTblName]	   	   
       FROM [EDMSDBSERVER].[HLBB_DMS].[dbo].[TblDocProfile]
       where ProfileName = 'MG-Mortgage'
	   */
	   
	
	/*
	set @sql = '
	select top 1 @NewCDC = DateModified
		from [EDMSDBSERVER].[HLBB_DMS].[dbo].' + @VersionTblName + ' tbl
		inner join (
					select RecID, max(version) as version
					from [EDMSDBSERVER].[HLBB_DMS].[dbo].'+ @VersionTblName +'
					where field6=  ''CRA01 Lttr of Instruction''
					group by RecID
					) temp on temp.RecID = tbl.RecID and tbl.Version = temp.version
		where tbl.DateCreated > @CDC 			
				
		order by DateModified desc'
		*/

	--and tbl.field3 COLLATE Latin1_General_CI_AS not in (select arn COLLATE Latin1_General_CI_AS from SQLLOADS) 
    --EXECUTE sp_executesql @SQL, N'@CDC NVARCHAR(max),@NewCDC datetime OUTPUT' , @CDC  , @NewCDC OUTPUT
 
	/*
	TRUNCATE TABLE LOADS_NEW_LI_STAGING

       set @sql = '
	   insert into LOADS_NEW_LI_STAGING (RowNumber,ARN)
	   select ROW_NUMBER() OVER(ORDER BY tbl100.arn ASC) AS RowNumber,tbl100.arn
       from (
		   select distinct tbl.field3 as [ARN]
		   from [EDMSDBSERVER].[HLBB_DMS].[dbo].' + @VersionTblName + ' tbl
		   inner join (
					 select RecID, max(version) as version
					 from [EDMSDBSERVER].[HLBB_DMS].[dbo].'+ @VersionTblName +'
					 where field6=  ''CRA01 Lttr of Instruction''
					 group by RecID
					 ) temp on temp.RecID = tbl.RecID and tbl.Version = temp.version
		   where tbl.DateCreated > @CDC 
				  
			) tbl100' 
	--and tbl.field3 COLLATE Latin1_General_CI_AS not in (select arn COLLATE Latin1_General_CI_AS from SQLLOADS) 
       EXECUTE sp_executesql @SQL, N'@CDC NVARCHAR(max)', @CDC  
		
		if (@NewCDC	<> '' or @NewCDC is not null)
		begin
			update tblCDC
			set tempLICDC = @NewCDC	
		end 

		/*
		if exists 
		(
			select 1 
			from LOADS_NEW_LI_STAGING
		)
		begin
			
			select top 1 @NewCDC = edms_lastmodifieddate			
			from LOADS_NEW_LI_STAGING
			order by edms_lastmodifieddate desc 
			

			update tblCDC
			set tempLICDC = @NewCDC		
		end 
		*/
		*/
		
end