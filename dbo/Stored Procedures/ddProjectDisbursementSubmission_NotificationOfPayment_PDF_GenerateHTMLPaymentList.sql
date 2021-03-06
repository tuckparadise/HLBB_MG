/*

declare @developercode nvarchar(max) = null,
  @projectcode nvarchar(max) = null,
  @phasecode nvarchar(max) = null,
  @notificationdate datetime = null 

declare @output nvarchar(max) 

exec ddProjectDisbursementSubmission_NotificationOfPayment_PDF_GenerateHTMLPaymentList '1111','111','111','2021-10-23',@output output
select @output

go


select * from ddProjectDisbursementSubmission_NotificationOfPayment

*/

CREATE   procedure [dbo].[ddProjectDisbursementSubmission_NotificationOfPayment_PDF_GenerateHTMLPaymentList]
  @developercode nvarchar(max) = null,
  @projectcode nvarchar(max) = null,
  @phasecode nvarchar(max) = null,
  @notificationdate datetime = null ,
@dynamicHTML nvarchar(max)  output
as
begin
	
	set @dynamicHTML = ''

	declare @dynamichtml_line1 nvarchar(max)
	declare @dynamichtml_line2 nvarchar(max)
	declare @dynamichtml_line3 nvarchar(max)
	declare @dynamichtml_lineSum nvarchar(max)
	--DECLARE @condition nvarchar(max)
	declare @dynamicSQL nvarchar(max)

	set @dynamichtml_line1 =
	'	
	<table id="HTMLTable">
	<tr>
		<th id="headerTD" >Bank Reference No.</th>
		<th id="headerTD" >Unit/ Parcel No.</th>		
		<th id="headerTD" >Stage</th>		
		<th id="headerTD" >Beneficiary Bank</th>
		<th id="headerTD" >Beneficiary Bank <br>Account Number</th>
		<th id="headerTD" >Amount (RM)</th>
		<th id="headerTD" >Payment Reference</th>
	</tr>
	' 

	--SET @condition = '1'
	

	SET @dynamicSQL = 'Declare @val Varchar(MAX); 
		--Select @val = COALESCE(@val + '', '' + [MergedColumn], [MergedColumn]) 
		Select @val = COALESCE(@val + [MergedColumn], [MergedColumn]) 
		From  (select ''<tr>'' + tablebody + ''</tr>'' as [MergedColumn]
		from (
			select 
				''<td id="bodyTD" style="width:80px;word-wrap: break-word;word-break:break-all;">'' + cast([ARN] as nvarchar(max)) + ''</td>'' +
				--''<td id="bodyTD" style="width:110px;word-wrap: break-word;word-break:break-all;">'' + cast([AddressLine1] as nvarchar(max)) + ''</td>'' + 				
				''<td id="bodyTD" style="width:110px;word-wrap: break-word;word-break:break-all;">'' + isnull([AddressLine1],'''') + ''</td>'' + 		
				--''<td id="bodyTD" style="width:130px;word-wrap: break-word;word-break:break-all;">'' + cast([BillingStage] as nvarchar(max)) + ''</td>'' +				
				''<td id="bodyTD" style="width:130px;word-wrap: break-word;word-break:break-all;">'' + isnull([BillingStage],'''') + ''</td>'' +				
				''<td id="bodyTD" style="width:80px;word-wrap: break-word;word-break:break-all;">'' + cast([BeneficiaryBank] as nvarchar(max)) + ''</td>'' +
				--''<td id="bodyTD" style="width:80px;word-wrap: break-word;word-break:break-all;">'' + cast([BeneficiaryBankAccountNumber] as nvarchar(max)) + ''</td>'' +
				--''<td id="bodyTD" style="width:80px;word-wrap: break-word;word-break:break-all;">'' + STUFF(cast([BeneficiaryBankAccountNumber] as nvarchar(max)), 1, len(cast([BeneficiaryBankAccountNumber] as nvarchar(max))) - 4, REPLICATE(''*'', len(cast([BeneficiaryBankAccountNumber] as nvarchar(max))) - 4))  + ''</td>'' +
				''<td id="bodyTD" style="width:80px;word-wrap: break-word;word-break:break-all;">'' + case when len([BeneficiaryBankAccountNumber]) > 4 then STUFF(cast([BeneficiaryBankAccountNumber] as nvarchar(max)), 1, len(cast([BeneficiaryBankAccountNumber] as nvarchar(max))) - 4, REPLICATE(''*'', len(cast([BeneficiaryBankAccountNumber] as nvarchar(max))) - 4)) else ''****'' end   + ''</td>'' +
				''<td id="bodyTD" style="width:80px;word-wrap: break-word;word-break:break-all;">'' + cast([AmountDisburse] as nvarchar(max)) + ''</td>'' +				
				''<td id="bodyTD" style="width:80px;word-wrap: break-word;word-break:break-all;">'' + cast([PaymentReference] as nvarchar(max)) + ''</td>'' 
				as tablebody
			from ddProjectDisbursementSubmission_NotificationOfPayment
			
			where [DevCode]= @developercode
				and projectcode = @projectcode 
				and [PhaseCode] = @phasecode
				and year([DisCheckerApprovedDate]) = year(@notificationdate)
				and month([DisCheckerApprovedDate]) = month(@notificationdate)
				and day([DisCheckerApprovedDate]) = day(@notificationdate)
			
		)
		tbl_mergedColumn) tbl
		SELECT @InnerResult= @val;'

	EXECUTE sp_executesql @dynamicSQL, N'@developercode nvarchar(max),@projectcode nvarchar(max),@phasecode nvarchar(max),@notificationdate datetime, @InnerResult nvarchar(max) OUTPUT', @developercode = @developercode,  @projectcode = @projectcode,@phasecode = @phasecode , @notificationdate = @notificationdate , @InnerResult=@dynamichtml_line2 OUTPUT
	
	declare @TotalAmt money 

	set @TotalAmt = (select sum(AmountDisburse)
		from ddProjectDisbursementSubmission_NotificationOfPayment
		
		where [DevCode]= @developercode
				and projectcode = @projectcode 
				and [PhaseCode] = @phasecode
				and year([DisCheckerApprovedDate]) = year(@notificationdate)
				and month([DisCheckerApprovedDate]) = month(@notificationdate)
				and day([DisCheckerApprovedDate]) = day(@notificationdate) 		
		
		)
		

	set @dynamichtml_lineSum = '<tr><td id="bodyTD" style="width:80px;word-wrap: break-word;word-break:break-all;"></td><td id="bodyTD" style="width:80px;word-wrap: break-word;word-break:break-all;"></td><td id="bodyTD" style="width:80px;word-wrap: break-word;word-break:break-all";></td><td id="bodyTD" style="width:80px;word-wrap: break-word;word-break:break-all";></td><td id="bodyTD" style="width:80px;word-wrap: break-word;word-break:break-all;align:center;">Total:</td><td>'+cast(@TotalAmt as nvarchar(max))+'</td><td id="bodyTD" style="width:80px;word-wrap: break-word;word-break:break-all;"></td></tr>'

	set @dynamichtml_line3 = '</table>'

	set @dynamicHTML = @dynamichtml_line1 + @dynamichtml_line2 + @dynamichtml_lineSum + @dynamichtml_line3
	
end