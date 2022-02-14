CREATE     procedure [dbo].[usp_SQLDUMaker_ValuerSubmission_SelectPendingVRList]
as
begin
	with DisbursementHistory (arn, firstRunningIDForCompletedSubmission,maxRunningIDForCompletedSubmission) as
	(
		select arn,  min(RunningIDForCompletedSubmission) as firstRunningIDForCompletedSubmission, max(RunningIDForCompletedSubmission) as maxRunningIDForCompletedSubmission
		from aaSolDisbursementSubmission_DisMakerSubmission_History
		group by arn 
	),
	DisbursementHistory_FirstAdvice_Detail (arn, firstRunningIDForCompletedSubmission, maxRunningIDForCompletedSubmission, FirstAdviceSubmissionDate, DueDate) as 
	(
		select cte1.arn, cte1.firstRunningIDForCompletedSubmission, cte1.maxRunningIDForCompletedSubmission,FORMAT (h.SolicitorSubmissionDate, 'dd/MM/yyyy') as FirstAdviceSubmissionDate,
			case when sqlloads.DisbursementManner = 'PR' then  FORMAT (h.PR_EarliestBillingDueDate, 'dd/MM/yyyy')
			when sqlloads.DisbursementManner = 'LS' then FORMAT (h.LS_CompletionDate, 'dd/MM/yyyy')
			end as 'DueDate'			
		from DisbursementHistory cte1
			inner join aaSolDisbursementSubmission_DisMakerSubmission_History h on h.arn = cte1.arn and h.RunningIDForCompletedSubmission= cte1.firstRunningIDForCompletedSubmission
			inner join sqlloads on sqlloads.arn = cte1.arn 
	)	
	SELECT 
			LOADS.[ARN] as [ARN]		  
		  ,[MortgateCenterCode]	as [MortgageCenterCode]	  
		  ,[ApplicantName]				 
		  ,[TotalFinancingAmount]		  
		  ,[CollateralPurpose]		  
		  ,LOADS.[ValuerCode]		  	  
		  ,case 
			when updateinfo.arn is not null then 'UpdateInfo' 						
			when loweredOMV.arn is not null then 'LowerOMV-Approved' 						
			else isnull(VALUER.[Status],'New') 
			end as ValuerStatus		  	 
			, DisHis.DueDate
			,DisHis.FirstAdviceSubmissionDate
			--FORMAT (h.LS_CompletionDate, 'dd/MM/yyyy')
			,FORMAT (DocumentMaker.UpdatedDate, 'dd/MM/yyyy') as [DocumentationExecutedDate]
	  FROM [dbo].[SQLLOADS] LOADS	  
		LEFT OUTER JOIN [DBO].SQLValuerDPSubmission VALUER ON VALUER.ARN = LOADS.ARN 
		LEFT OUTER JOIN [DBO].SQLDUMakerDP_ValuerSubmission_LoweredOMV loweredOMV ON loweredOMV.ARN = LOADS.ARN 
		LEFT OUTER JOIN [DBO].SQLValuerDPSubmission_UpdateInfo updateinfo ON updateinfo.ARN = LOADS.ARN 	  
		LEFT OUTER JOIN [DBO].SQLDUMakerDP_SolicitorSubmission DocumentMaker ON DocumentMaker.ARN = LOADS.ARN 	  
		left join DisbursementHistory_FirstAdvice_Detail DisHis on DisHis.arn = LOADS.arn 
	  WHERE 
		LOADS.ValuationRequired = 1								
		and 
			( 
				isnull(VALUER.Completed,0)<> 1  
				or (VALUER.Status in ('LowerOMV') and VALUER.Completed = 1)
			)		
		and LOADS.arn in 
		(
			select arn 
			from SQLDUMakerDP_SolicitorSubmission dumaker 
			where dumaker.[Status] = 'Completed' and dumaker.Decision in ('Document in order for execution')
		) 		
		--and DisHis.arn is not null 		

end