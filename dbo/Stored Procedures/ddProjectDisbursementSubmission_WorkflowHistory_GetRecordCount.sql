CREATE     procedure [dbo].[ddProjectDisbursementSubmission_WorkflowHistory_GetRecordCount]
  @DeveloperCode nvarchar(max) = null, 
  @ProjectCode nvarchar(max) = null ,
  @PhaseCode nvarchar(max) = null ,
  @arn nvarchar(max) = null ,
@DateFrom datetime = null,
@DateTo datetime = null,
  @AddressLine1 nvarchar(max) = null ,
@count bigint = null output
as
begin
	set @count = (
		 select count(*)
			FROM [dbo].vw_aaDisbursementPaymentHistory h
			inner join sqlloads l on l.arn = h.arn 
	  where 
		PaymentReference <> 'Legal Fee' 
		and PaymentReference <> 'Valuation Fee'
		and PaymentReference <> 'Legal Fee - Principal Pymt'
		and PaymentReference <> 'Valuation Fee - Principal Pymt'
		and PaymentReference <> 'MDTA/ MRTT'
		and PaymentReference <> 'MDTA/ MRTT - Principal Pymt'		
		and DeveloperCode = @DeveloperCode
		--and projectcode like case when @ProjectCode is null then '%' else @ProjectCode end 
		and phasecode like case when @phasecode is null then '%' else @phasecode end 
		and h.arn like case when @arn is null then '%' else @arn end 
		and isnull(AddressLine1,'') like case when @AddressLine1 is null then '%' else @AddressLine1 end 
		--and 	h.DisCheckerApprovedDate between (case cast(@DateFrom as nvarchar(max)) when null then '2000-01-01' else @DateFrom end) and 	(case cast(@DateTo as nvarchar(max)) when null then '2222-12-31' else @DateTo end)
		--and 	h.DisCheckerApprovedDate between case isnull(@DateFrom,'') when '' then '2000-01-01' else @DateFrom end and case isnull(@DateTo,'')  when '' then '2222-12-31' else DATEADD(day, 1, @DateTo) end
		and 	h.DisCheckerApprovedDate between case isnull(@DateFrom,'') when '' then '2000-01-01' else @DateFrom end and case isnull(@DateTo,'')  when '' then '2222-12-31' else @DateTo end
		--and str(year(h.DisCheckerApprovedDate))  like case when @DateFrom is null then '%' else str(year(@DateFrom)) end
		--and str(month(h.DisCheckerApprovedDate))  like case when @DateFrom is null then '%' else str(month(@DateFrom)) end
		--and str(day(h.DisCheckerApprovedDate))  like case when @DateFrom is null then '%' else str(day(@DateFrom)) end
	) 

end