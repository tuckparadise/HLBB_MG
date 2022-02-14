/*

declare @developercode nvarchar(max) = null,
  @projectcode nvarchar(max) = null,
  @phasecode nvarchar(max) = null,
  @notificationdate datetime = null 

declare @output nvarchar(max) 

exec ddProjectDisbursementSubmission_NotificationOfPayment_PDF_GenerateHTMLPaymentList2 '1111','111','111','2021-10-23',@output output
select @output

go

insert into ddProjectDisbursementSubmission_NotificationOfPayment
select * from ddProjectDisbursementSubmission_NotificationOfPayment

*/

CREATE     procedure [dbo].[ddProjectDisbursementSubmission_NotificationOfPayment_PDF_GenerateHTMLPaymentList2]
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
	<div><b><u>Appendix 1</u></b></div>
	<table id="HTMLTable">
	<tr>
		<!--<th id="headerTD" style="word-wrap: break-word;">Bank Reference No.</th>-->
		<th id="headerTD" style="word-wrap: break-word;text-align: center">Unit/ Parcel No.</th>		
		<th id="headerTD" style="word-wrap: break-word;text-align: center">Stage</th>		
		<th id="headerTD" style="word-wrap: break-word;text-align: center">Beneficiary Bank</th>
		<th id="headerTD" style="word-wrap: break-word;text-align: center">Beneficiary Bank Account Number</th>
		<th id="headerTD" style="word-wrap: break-word;text-align: center">Amount (RM)</th>
		<th id="headerTD" style="word-wrap: break-word;text-align: center">Payment Reference</th>
	</tr>
	' 

	--SET @condition = '1'
	

	SET @dynamicSQL = 'Declare @val Varchar(MAX); 
		--Select @val = COALESCE(@val + '', '' + [MergedColumn], [MergedColumn]) 
		Select @val = COALESCE(@val + [MergedColumn], [MergedColumn]) 
		From  (select ''<tr>'' + tablebody + ''</tr>'' as [MergedColumn]
		from (
			select 
				--''<td id="bodyTD" style="width:80px;word-wrap: break-word;word-break:break-all;">'' + cast([ARN] as nvarchar(max)) + ''</td>'' +				
				''<td id="bodyTD" style="width:15%;word-wrap: break-word;word-break:break-all;">'' + isnull([AddressLine1],'''') + ''</td>'' + 						
				''<td id="bodyTD" style="width:10%;word-wrap: break-word;word-break:break-all;">'' + isnull([BillingStage],'''') + ''</td>'' +				
				''<td id="bodyTD" style="width:20%;word-wrap: break-word;word-break:break-all;">'' + cast([BeneficiaryBank] as nvarchar(max)) + ''</td>'' +				
				''<td id="bodyTD" style="width:20%;word-wrap: break-word;word-break:break-all;text-align: right">'' + case when len(isnull([BeneficiaryBankAccountNumber],0)) > 4 then STUFF(cast(isnull([BeneficiaryBankAccountNumber],'''') as nvarchar(max)), 1, len(cast(isnull([BeneficiaryBankAccountNumber],'''') as nvarchar(max))) - 4, REPLICATE(''*'', len(cast(isnull([BeneficiaryBankAccountNumber],'''') as nvarchar(max))) - 4)) else ''****'' end   + ''</td>'' +
				''<td id="bodyTD" style="width:15%;word-wrap: break-word;word-break:break-all;text-align: right">'' + cast(isnull([AmountDisburse],'''') as nvarchar(max)) + ''</td>'' +				
				''<td id="bodyTD" style="width:20%;word-wrap: break-word;word-break:break-all;">'' + cast(isnull([PaymentReference],'''') as nvarchar(max)) + ''</td>'' 
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
		

	--set @dynamichtml_lineSum = '<tr><td id="bodyTD" style="width:80px;word-wrap: break-word;word-break:break-all;"></td><td id="bodyTD" style="width:80px;word-wrap: break-word;word-break:break-all;"></td><td id="bodyTD" style="width:80px;word-wrap: break-word;word-break:break-all";></td><td id="bodyTD" style="width:80px;word-wrap: break-word;word-break:break-all";></td><td id="bodyTD" style="width:80px;word-wrap: break-word;word-break:break-all;align:center;text-align: right">Total:</td><td style="width:80px;word-wrap: break-word;word-break:break-all;align:center;text-align: right">'+cast(@TotalAmt as nvarchar(max))+'</td><td id="bodyTD" style="width:80px;word-wrap: break-word;word-break:break-all;"></td></tr>'
	--set @dynamichtml_lineSum = '<tr><td id="bodyTD" style="width:80px;word-wrap: break-word;word-break:break-all;"></td><td id="bodyTD" style="width:80px;word-wrap: break-word;word-break:break-all;"></td><td id="bodyTD" style="width:80px;word-wrap: break-word;word-break:break-all";></td><td id="bodyTD" style="width:80px;word-wrap: break-word;word-break:break-all";></td><td id="bodyTD" style="width:80px;word-wrap: break-word;word-break:break-all;align:center;text-align: right">Total:</td><td style="width:80px;word-wrap: break-word;word-break:break-all;align:center;text-align: right">'+cast(@TotalAmt as nvarchar(max))+'</td></tr>'
	--set @dynamichtml_lineSum = '<tr><td id="bodyTD" style="width:80px;word-wrap: break-word;word-break:break-all;"></td><td id="bodyTD" style="width:80px;word-wrap: break-word;word-break:break-all";></td><td id="bodyTD" style="width:80px;word-wrap: break-word;word-break:break-all";></td><td id="bodyTD" style="width:80px;word-wrap: break-word;word-break:break-all;align:center;text-align: center"><b>Total:</b></td><td style="width:80px;word-wrap: break-word;word-break:break-all;align:center;text-align: right"><b>'+cast(@TotalAmt as nvarchar(max))+'</b></td><td id="bodyTD" style="width:80px;word-wrap: break-word;word-break:break-all;"></td></tr>'
	 set @dynamichtml_lineSum = '<tr><td id="bodyTD" style="word-wrap: break-word;word-break:break-all;"></td><td id="bodyTD" style="word-wrap: break-word;word-break:break-all";></td><td id="bodyTD" style="word-wrap: break-word;word-break:break-all";></td><td id="bodyTD" style="word-wrap: break-word;word-break:break-all;align:center;text-align: right"><b>Total:</b></td><td style="word-wrap: break-word;word-break:break-all;align:center;text-align: right"><b>'+cast(@TotalAmt as nvarchar(max))+'</b></td><td id="bodyTD" style="word-wrap: break-word;word-break:break-all;"></td></tr>'
	set @dynamichtml_line3 = '</table>'

	set @dynamicHTML = @dynamichtml_line1 + @dynamichtml_line2 + @dynamichtml_lineSum + @dynamichtml_line3
	
end