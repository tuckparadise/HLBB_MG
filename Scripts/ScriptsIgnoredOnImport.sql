﻿
/****** Object:  StoredProcedure [dbo].[aaa_SQLDUMakerDP_AttorneyCentre_SelectAll]    Script Date: 2/14/2022 5:44:14 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aaa_SQLDUMakerDP_AttorneyCentre_SelectAll]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[aaa_SQLDUMakerDP_AttorneyCentre_SelectAll]
GO

/****** Object:  StoredProcedure [dbo].[aaa_SQLDUMakerDP_AttorneyCentre_SelectAll]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[aaa_SQLDUMakerDP_AttorneyName_SelectAll]    Script Date: 2/14/2022 5:44:14 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aaa_SQLDUMakerDP_AttorneyName_SelectAll]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[aaa_SQLDUMakerDP_AttorneyName_SelectAll]
GO

/****** Object:  StoredProcedure [dbo].[aaa_SQLDUMakerDP_AttorneyName_SelectAll]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[aaa_SQLSolicitorDisbursementSubmissionAttachment2_delete]    Script Date: 2/14/2022 5:44:14 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aaa_SQLSolicitorDisbursementSubmissionAttachment2_delete]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[aaa_SQLSolicitorDisbursementSubmissionAttachment2_delete]
GO

/****** Object:  StoredProcedure [dbo].[aaa_SQLSolicitorDisbursementSubmissionAttachment2_delete]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[aaa_SQLSolicitorDisbursementSubmissionAttachment2_DeleteSolicitorAttachments]    Script Date: 2/14/2022 5:44:14 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aaa_SQLSolicitorDisbursementSubmissionAttachment2_DeleteSolicitorAttachments]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[aaa_SQLSolicitorDisbursementSubmissionAttachment2_DeleteSolicitorAttachments]
GO

/****** Object:  StoredProcedure [dbo].[aaa_SQLSolicitorDisbursementSubmissionAttachment2_DeleteSolicitorAttachments]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[aaa_SQLSolicitorDisbursementSubmissionAttachment2_SelectAll]    Script Date: 2/14/2022 5:44:14 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aaa_SQLSolicitorDisbursementSubmissionAttachment2_SelectAll]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[aaa_SQLSolicitorDisbursementSubmissionAttachment2_SelectAll]
GO

/****** Object:  StoredProcedure [dbo].[aaa_SQLSolicitorDisbursementSubmissionAttachment2_SelectAll]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[aaa_SQLSolicitorDPSubmissionAttachment2_SelectAll]    Script Date: 2/14/2022 5:44:14 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aaa_SQLSolicitorDPSubmissionAttachment2_SelectAll]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[aaa_SQLSolicitorDPSubmissionAttachment2_SelectAll]
GO

/****** Object:  StoredProcedure [dbo].[aaa_SQLSolicitorDPSubmissionAttachment2_SelectAll]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[aaa_SQLSolicitorDPSubmissionExeDocs_SelectAll]    Script Date: 2/14/2022 5:44:14 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aaa_SQLSolicitorDPSubmissionExeDocs_SelectAll]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[aaa_SQLSolicitorDPSubmissionExeDocs_SelectAll]
GO

/****** Object:  StoredProcedure [dbo].[aaa_SQLSolicitorDPSubmissionExeDocs_SelectAll]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[aaa_SQLSolicitorDPSubmission_SelectAll]    Script Date: 2/14/2022 5:44:14 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aaa_SQLSolicitorDPSubmission_SelectAll]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[aaa_SQLSolicitorDPSubmission_SelectAll]
GO

/****** Object:  StoredProcedure [dbo].[aaa_SQLSolicitorDPSubmission_SelectAll]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[aaa_SQLSolicitor_DocumentAdminFeeCreditedToOption_SelectAll]    Script Date: 2/14/2022 5:44:14 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aaa_SQLSolicitor_DocumentAdminFeeCreditedToOption_SelectAll]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[aaa_SQLSolicitor_DocumentAdminFeeCreditedToOption_SelectAll]
GO

/****** Object:  StoredProcedure [dbo].[aaa_SQLSolicitor_DocumentAdminFeeCreditedToOption_SelectAll]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[aaa_ws_SQLSolicitorDisbursementSubmissionAttachment_add_withattachment]    Script Date: 2/14/2022 5:44:14 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aaa_ws_SQLSolicitorDisbursementSubmissionAttachment_add_withattachment]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[aaa_ws_SQLSolicitorDisbursementSubmissionAttachment_add_withattachment]
GO

/****** Object:  StoredProcedure [dbo].[aaa_ws_SQLSolicitorDisbursementSubmissionAttachment_add_withattachment]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[aaFacilityAccountMaintenance_FindOne]    Script Date: 2/14/2022 5:44:14 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aaFacilityAccountMaintenance_FindOne]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[aaFacilityAccountMaintenance_FindOne]
GO

/****** Object:  StoredProcedure [dbo].[aaFacilityAccountMaintenance_FindOne]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[aaFacilityAccountMaintenance_UpdateOne]    Script Date: 2/14/2022 5:44:14 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aaFacilityAccountMaintenance_UpdateOne]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[aaFacilityAccountMaintenance_UpdateOne]
GO

/****** Object:  StoredProcedure [dbo].[aaFacilityAccountMaintenance_UpdateOne]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[aaGetNewBilling]    Script Date: 2/14/2022 5:44:14 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aaGetNewBilling]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[aaGetNewBilling]
GO

/****** Object:  StoredProcedure [dbo].[aaGetNewBilling]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[aaIntDisbursementSubmission_LegalFee_AddToCurrentPayment]    Script Date: 2/14/2022 5:44:14 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aaIntDisbursementSubmission_LegalFee_AddToCurrentPayment]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[aaIntDisbursementSubmission_LegalFee_AddToCurrentPayment]
GO

/****** Object:  StoredProcedure [dbo].[aaIntDisbursementSubmission_LegalFee_AddToCurrentPayment]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[aaIntDisbursementSubmission_MRTA_add]    Script Date: 2/14/2022 5:44:14 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aaIntDisbursementSubmission_MRTA_add]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[aaIntDisbursementSubmission_MRTA_add]
GO

/****** Object:  StoredProcedure [dbo].[aaIntDisbursementSubmission_MRTA_add]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[aaIntDisbursementSubmission_MRTA_delete]    Script Date: 2/14/2022 5:44:14 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aaIntDisbursementSubmission_MRTA_delete]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[aaIntDisbursementSubmission_MRTA_delete]
GO

/****** Object:  StoredProcedure [dbo].[aaIntDisbursementSubmission_MRTA_delete]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[aaIntDisbursementSubmission_MRTA_ExportToCurrentPayment]    Script Date: 2/14/2022 5:44:14 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aaIntDisbursementSubmission_MRTA_ExportToCurrentPayment]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[aaIntDisbursementSubmission_MRTA_ExportToCurrentPayment]
GO

/****** Object:  StoredProcedure [dbo].[aaIntDisbursementSubmission_MRTA_ExportToCurrentPayment]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[aaIntDisbursementSubmission_MRTA_GetSummary]    Script Date: 2/14/2022 5:44:14 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aaIntDisbursementSubmission_MRTA_GetSummary]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[aaIntDisbursementSubmission_MRTA_GetSummary]
GO

/****** Object:  StoredProcedure [dbo].[aaIntDisbursementSubmission_MRTA_GetSummary]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[aaIntDisbursementSubmission_MRTA_ListByARN]    Script Date: 2/14/2022 5:44:14 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aaIntDisbursementSubmission_MRTA_ListByARN]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[aaIntDisbursementSubmission_MRTA_ListByARN]
GO

/****** Object:  StoredProcedure [dbo].[aaIntDisbursementSubmission_MRTA_ListByARN]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[aaIntFacilityAccountMaintenance_UpdateOne]    Script Date: 2/14/2022 5:44:14 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aaIntFacilityAccountMaintenance_UpdateOne]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[aaIntFacilityAccountMaintenance_UpdateOne]
GO

/****** Object:  StoredProcedure [dbo].[aaIntFacilityAccountMaintenance_UpdateOne]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[aaNotificationOfPayment_GetList]    Script Date: 2/14/2022 5:44:14 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aaNotificationOfPayment_GetList]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[aaNotificationOfPayment_GetList]
GO

/****** Object:  StoredProcedure [dbo].[aaNotificationOfPayment_GetList]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[aaNotificationOfPayment_GetRecord]    Script Date: 2/14/2022 5:44:14 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aaNotificationOfPayment_GetRecord]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[aaNotificationOfPayment_GetRecord]
GO

/****** Object:  StoredProcedure [dbo].[aaNotificationOfPayment_GetRecord]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[aaNotificationOfPayment_GetRecordByARN]    Script Date: 2/14/2022 5:44:14 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aaNotificationOfPayment_GetRecordByARN]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[aaNotificationOfPayment_GetRecordByARN]
GO

/****** Object:  StoredProcedure [dbo].[aaNotificationOfPayment_GetRecordByARN]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[aaNotificationOfPayment_LockRecord]    Script Date: 2/14/2022 5:44:14 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aaNotificationOfPayment_LockRecord]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[aaNotificationOfPayment_LockRecord]
GO

/****** Object:  StoredProcedure [dbo].[aaNotificationOfPayment_LockRecord]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[aaNotificationOfPayment_MoveToLog]    Script Date: 2/14/2022 5:44:14 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aaNotificationOfPayment_MoveToLog]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[aaNotificationOfPayment_MoveToLog]
GO

/****** Object:  StoredProcedure [dbo].[aaNotificationOfPayment_MoveToLog]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[aaNotificationOfPayment_Setting_Select]    Script Date: 2/14/2022 5:44:14 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aaNotificationOfPayment_Setting_Select]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[aaNotificationOfPayment_Setting_Select]
GO

/****** Object:  StoredProcedure [dbo].[aaNotificationOfPayment_Setting_Select]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[aaNotificationOfPayment_Setting_Update]    Script Date: 2/14/2022 5:44:14 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aaNotificationOfPayment_Setting_Update]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[aaNotificationOfPayment_Setting_Update]
GO

/****** Object:  StoredProcedure [dbo].[aaNotificationOfPayment_Setting_Update]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[aaSolDisbursementSubmission_BankInfo_Add]    Script Date: 2/14/2022 5:44:14 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aaSolDisbursementSubmission_BankInfo_Add]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[aaSolDisbursementSubmission_BankInfo_Add]
GO

/****** Object:  StoredProcedure [dbo].[aaSolDisbursementSubmission_BankInfo_Add]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[aaSolDisbursementSubmission_BankInfo_Delete]    Script Date: 2/14/2022 5:44:14 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aaSolDisbursementSubmission_BankInfo_Delete]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[aaSolDisbursementSubmission_BankInfo_Delete]
GO

/****** Object:  StoredProcedure [dbo].[aaSolDisbursementSubmission_BankInfo_Delete]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[aaSolDisbursementSubmission_BankInfo_Edit]    Script Date: 2/14/2022 5:44:14 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aaSolDisbursementSubmission_BankInfo_Edit]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[aaSolDisbursementSubmission_BankInfo_Edit]
GO

/****** Object:  StoredProcedure [dbo].[aaSolDisbursementSubmission_BankInfo_Edit]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[aaSolDisbursementSubmission_BankInfo_GetHLBBList]    Script Date: 2/14/2022 5:44:14 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aaSolDisbursementSubmission_BankInfo_GetHLBBList]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[aaSolDisbursementSubmission_BankInfo_GetHLBBList]
GO

/****** Object:  StoredProcedure [dbo].[aaSolDisbursementSubmission_BankInfo_GetHLBBList]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[aaSolDisbursementSubmission_BankInfo_GetIBGList]    Script Date: 2/14/2022 5:44:14 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aaSolDisbursementSubmission_BankInfo_GetIBGList]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[aaSolDisbursementSubmission_BankInfo_GetIBGList]
GO

/****** Object:  StoredProcedure [dbo].[aaSolDisbursementSubmission_BankInfo_GetIBGList]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[aaSolDisbursementSubmission_BankInfo_GetList]    Script Date: 2/14/2022 5:44:14 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aaSolDisbursementSubmission_BankInfo_GetList]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[aaSolDisbursementSubmission_BankInfo_GetList]
GO

/****** Object:  StoredProcedure [dbo].[aaSolDisbursementSubmission_BankInfo_GetList]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[aaSolDisbursementSubmission_BankInfo_GetRentasList]    Script Date: 2/14/2022 5:44:14 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aaSolDisbursementSubmission_BankInfo_GetRentasList]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[aaSolDisbursementSubmission_BankInfo_GetRentasList]
GO

/****** Object:  StoredProcedure [dbo].[aaSolDisbursementSubmission_BankInfo_GetRentasList]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[aaSolDisbursementSubmission_BankInfo_SelectByID]    Script Date: 2/14/2022 5:44:14 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aaSolDisbursementSubmission_BankInfo_SelectByID]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[aaSolDisbursementSubmission_BankInfo_SelectByID]
GO

/****** Object:  StoredProcedure [dbo].[aaSolDisbursementSubmission_BankInfo_SelectByID]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[aaSolDisbursementSubmission_LegalFee_AddToCurrentPayment]    Script Date: 2/14/2022 5:44:14 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aaSolDisbursementSubmission_LegalFee_AddToCurrentPayment]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[aaSolDisbursementSubmission_LegalFee_AddToCurrentPayment]
GO

/****** Object:  StoredProcedure [dbo].[aaSolDisbursementSubmission_LegalFee_AddToCurrentPayment]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[aaSolDisbursementSubmission_LegalFee_FindOne]    Script Date: 2/14/2022 5:44:14 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aaSolDisbursementSubmission_LegalFee_FindOne]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[aaSolDisbursementSubmission_LegalFee_FindOne]
GO

/****** Object:  StoredProcedure [dbo].[aaSolDisbursementSubmission_LegalFee_FindOne]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[aaSolDisbursementSubmission_MRTA_add]    Script Date: 2/14/2022 5:44:14 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aaSolDisbursementSubmission_MRTA_add]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[aaSolDisbursementSubmission_MRTA_add]
GO

/****** Object:  StoredProcedure [dbo].[aaSolDisbursementSubmission_MRTA_add]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[aaSolDisbursementSubmission_MRTA_delete]    Script Date: 2/14/2022 5:44:14 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aaSolDisbursementSubmission_MRTA_delete]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[aaSolDisbursementSubmission_MRTA_delete]
GO

/****** Object:  StoredProcedure [dbo].[aaSolDisbursementSubmission_MRTA_delete]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[aaSolDisbursementSubmission_MRTA_ExportToCurrentPayment]    Script Date: 2/14/2022 5:44:14 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aaSolDisbursementSubmission_MRTA_ExportToCurrentPayment]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[aaSolDisbursementSubmission_MRTA_ExportToCurrentPayment]
GO

/****** Object:  StoredProcedure [dbo].[aaSolDisbursementSubmission_MRTA_ExportToCurrentPayment]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[aaSolDisbursementSubmission_MRTA_GetSummary]    Script Date: 2/14/2022 5:44:14 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aaSolDisbursementSubmission_MRTA_GetSummary]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[aaSolDisbursementSubmission_MRTA_GetSummary]
GO

/****** Object:  StoredProcedure [dbo].[aaSolDisbursementSubmission_MRTA_GetSummary]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[aaSolDisbursementSubmission_MRTA_ListByARN]    Script Date: 2/14/2022 5:44:14 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aaSolDisbursementSubmission_MRTA_ListByARN]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[aaSolDisbursementSubmission_MRTA_ListByARN]
GO

/****** Object:  StoredProcedure [dbo].[aaSolDisbursementSubmission_MRTA_ListByARN]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[aaSolDisbursementSubmission_PaymentReference_Add]    Script Date: 2/14/2022 5:44:14 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aaSolDisbursementSubmission_PaymentReference_Add]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[aaSolDisbursementSubmission_PaymentReference_Add]
GO

/****** Object:  StoredProcedure [dbo].[aaSolDisbursementSubmission_PaymentReference_Add]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[aaSolDisbursementSubmission_PaymentReference_Delete]    Script Date: 2/14/2022 5:44:14 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aaSolDisbursementSubmission_PaymentReference_Delete]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[aaSolDisbursementSubmission_PaymentReference_Delete]
GO

/****** Object:  StoredProcedure [dbo].[aaSolDisbursementSubmission_PaymentReference_Delete]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[aaSolDisbursementSubmission_PaymentReference_Edit]    Script Date: 2/14/2022 5:44:14 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aaSolDisbursementSubmission_PaymentReference_Edit]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[aaSolDisbursementSubmission_PaymentReference_Edit]
GO

/****** Object:  StoredProcedure [dbo].[aaSolDisbursementSubmission_PaymentReference_Edit]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[aaSolDisbursementSubmission_PaymentReference_GetBankList]    Script Date: 2/14/2022 5:44:14 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aaSolDisbursementSubmission_PaymentReference_GetBankList]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[aaSolDisbursementSubmission_PaymentReference_GetBankList]
GO

/****** Object:  StoredProcedure [dbo].[aaSolDisbursementSubmission_PaymentReference_GetBankList]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[aaSolDisbursementSubmission_PaymentReference_GetBankList2]    Script Date: 2/14/2022 5:44:14 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aaSolDisbursementSubmission_PaymentReference_GetBankList2]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[aaSolDisbursementSubmission_PaymentReference_GetBankList2]
GO

/****** Object:  StoredProcedure [dbo].[aaSolDisbursementSubmission_PaymentReference_GetBankList2]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[aaSolDisbursementSubmission_PaymentReference_GetList]    Script Date: 2/14/2022 5:44:14 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aaSolDisbursementSubmission_PaymentReference_GetList]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[aaSolDisbursementSubmission_PaymentReference_GetList]
GO

/****** Object:  StoredProcedure [dbo].[aaSolDisbursementSubmission_PaymentReference_GetList]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[aaSolDisbursementSubmission_PaymentReference_GetListForAdmin]    Script Date: 2/14/2022 5:44:14 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aaSolDisbursementSubmission_PaymentReference_GetListForAdmin]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[aaSolDisbursementSubmission_PaymentReference_GetListForAdmin]
GO

/****** Object:  StoredProcedure [dbo].[aaSolDisbursementSubmission_PaymentReference_GetListForAdmin]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[aaSolDisbursementSubmission_PaymentReference_GetSolicitorList]    Script Date: 2/14/2022 5:44:14 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aaSolDisbursementSubmission_PaymentReference_GetSolicitorList]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[aaSolDisbursementSubmission_PaymentReference_GetSolicitorList]
GO

/****** Object:  StoredProcedure [dbo].[aaSolDisbursementSubmission_PaymentReference_GetSolicitorList]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[aaSolDisbursementSubmission_PaymentReference_SelectByID]    Script Date: 2/14/2022 5:44:14 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aaSolDisbursementSubmission_PaymentReference_SelectByID]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[aaSolDisbursementSubmission_PaymentReference_SelectByID]
GO

/****** Object:  StoredProcedure [dbo].[aaSolDisbursementSubmission_PaymentReference_SelectByID]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[aa_aaIntDisbursementSubmission_RCOMakerSubmission_GetDisChecker]    Script Date: 2/14/2022 5:44:14 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aa_aaIntDisbursementSubmission_RCOMakerSubmission_GetDisChecker]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[aa_aaIntDisbursementSubmission_RCOMakerSubmission_GetDisChecker]
GO

/****** Object:  StoredProcedure [dbo].[aa_aaIntDisbursementSubmission_RCOMakerSubmission_GetDisChecker]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[aa_aaSolDisbursementSubmission_RCOMakerSubmission_GetDisChecker]    Script Date: 2/14/2022 5:44:14 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aa_aaSolDisbursementSubmission_RCOMakerSubmission_GetDisChecker]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[aa_aaSolDisbursementSubmission_RCOMakerSubmission_GetDisChecker]
GO

/****** Object:  StoredProcedure [dbo].[aa_aaSolDisbursementSubmission_RCOMakerSubmission_GetDisChecker]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[aa_DisbursementCheckerRejectedLetter_generate]    Script Date: 2/14/2022 5:44:14 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aa_DisbursementCheckerRejectedLetter_generate]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[aa_DisbursementCheckerRejectedLetter_generate]
GO

/****** Object:  StoredProcedure [dbo].[aa_DisbursementCheckerRejectedLetter_generate]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[aa_DisbursementFinalApprovedLetter_generate]    Script Date: 2/14/2022 5:44:14 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aa_DisbursementFinalApprovedLetter_generate]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[aa_DisbursementFinalApprovedLetter_generate]
GO

/****** Object:  StoredProcedure [dbo].[aa_DisbursementFinalApprovedLetter_generate]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[aa_DisbursementMakerRejectedLetter_generate]    Script Date: 2/14/2022 5:44:14 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aa_DisbursementMakerRejectedLetter_generate]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[aa_DisbursementMakerRejectedLetter_generate]
GO

/****** Object:  StoredProcedure [dbo].[aa_DisbursementMakerRejectedLetter_generate]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[aa_DisbursementSubmission_PR_BF_AuditTrailSave]    Script Date: 2/14/2022 5:44:14 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aa_DisbursementSubmission_PR_BF_AuditTrailSave]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[aa_DisbursementSubmission_PR_BF_AuditTrailSave]
GO

/****** Object:  StoredProcedure [dbo].[aa_DisbursementSubmission_PR_BF_AuditTrailSave]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[aa_DisbursementSubmission_PR_DI_AuditTrailList]    Script Date: 2/14/2022 5:44:14 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aa_DisbursementSubmission_PR_DI_AuditTrailList]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[aa_DisbursementSubmission_PR_DI_AuditTrailList]
GO

/****** Object:  StoredProcedure [dbo].[aa_DisbursementSubmission_PR_DI_AuditTrailList]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[aa_DisbursementSubmission_PR_DI_AuditTrailSave]    Script Date: 2/14/2022 5:44:14 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aa_DisbursementSubmission_PR_DI_AuditTrailSave]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[aa_DisbursementSubmission_PR_DI_AuditTrailSave]
GO

/****** Object:  StoredProcedure [dbo].[aa_DisbursementSubmission_PR_DI_AuditTrailSave]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[aa_GetAcceptanceButtonVisibilityByUser]    Script Date: 2/14/2022 5:44:14 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aa_GetAcceptanceButtonVisibilityByUser]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[aa_GetAcceptanceButtonVisibilityByUser]
GO

/****** Object:  StoredProcedure [dbo].[aa_GetAcceptanceButtonVisibilityByUser]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[aa_GetActivateInactiveUserButtonVisibilityByUser]    Script Date: 2/14/2022 5:44:14 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aa_GetActivateInactiveUserButtonVisibilityByUser]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[aa_GetActivateInactiveUserButtonVisibilityByUser]
GO

/****** Object:  StoredProcedure [dbo].[aa_GetActivateInactiveUserButtonVisibilityByUser]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[aa_GetAdminButtonVisibilityByUser]    Script Date: 2/14/2022 5:44:14 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aa_GetAdminButtonVisibilityByUser]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[aa_GetAdminButtonVisibilityByUser]
GO

/****** Object:  StoredProcedure [dbo].[aa_GetAdminButtonVisibilityByUser]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[aa_GetApplicationSettingButtonVisibilityByUser]    Script Date: 2/14/2022 5:44:14 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aa_GetApplicationSettingButtonVisibilityByUser]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[aa_GetApplicationSettingButtonVisibilityByUser]
GO

/****** Object:  StoredProcedure [dbo].[aa_GetApplicationSettingButtonVisibilityByUser]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[aa_GetBankInfoViewButtonVisibilityByUser]    Script Date: 2/14/2022 5:44:14 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aa_GetBankInfoViewButtonVisibilityByUser]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[aa_GetBankInfoViewButtonVisibilityByUser]
GO

/****** Object:  StoredProcedure [dbo].[aa_GetBankInfoViewButtonVisibilityByUser]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[aa_GetCaseEnquiryButtonVisibilityByUser]    Script Date: 2/14/2022 5:44:14 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aa_GetCaseEnquiryButtonVisibilityByUser]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[aa_GetCaseEnquiryButtonVisibilityByUser]
GO

/****** Object:  StoredProcedure [dbo].[aa_GetCaseEnquiryButtonVisibilityByUser]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[aa_GetDeveloperViewButtonVisibilityByUser]    Script Date: 2/14/2022 5:44:14 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aa_GetDeveloperViewButtonVisibilityByUser]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[aa_GetDeveloperViewButtonVisibilityByUser]
GO

/****** Object:  StoredProcedure [dbo].[aa_GetDeveloperViewButtonVisibilityByUser]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[aa_GetDisbCheckerButtonVisibilityByUser]    Script Date: 2/14/2022 5:44:14 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aa_GetDisbCheckerButtonVisibilityByUser]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[aa_GetDisbCheckerButtonVisibilityByUser]
GO

/****** Object:  StoredProcedure [dbo].[aa_GetDisbCheckerButtonVisibilityByUser]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[aa_GetDisbMakerButtonVisibilityByUser]    Script Date: 2/14/2022 5:44:14 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aa_GetDisbMakerButtonVisibilityByUser]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[aa_GetDisbMakerButtonVisibilityByUser]
GO

/****** Object:  StoredProcedure [dbo].[aa_GetDisbMakerButtonVisibilityByUser]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[aa_GetDisbursementButtonVisibilityByUser]    Script Date: 2/14/2022 5:44:14 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aa_GetDisbursementButtonVisibilityByUser]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[aa_GetDisbursementButtonVisibilityByUser]
GO

/****** Object:  StoredProcedure [dbo].[aa_GetDisbursementButtonVisibilityByUser]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[aa_GetDocumentaionReportButtonVisibilityByUser]    Script Date: 2/14/2022 5:44:14 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aa_GetDocumentaionReportButtonVisibilityByUser]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[aa_GetDocumentaionReportButtonVisibilityByUser]
GO

/****** Object:  StoredProcedure [dbo].[aa_GetDocumentaionReportButtonVisibilityByUser]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[aa_GetDocumentUnitButtonVisibilityByUser]    Script Date: 2/14/2022 5:44:14 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aa_GetDocumentUnitButtonVisibilityByUser]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[aa_GetDocumentUnitButtonVisibilityByUser]
GO

/****** Object:  StoredProcedure [dbo].[aa_GetDocumentUnitButtonVisibilityByUser]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[aa_GetDynamicQueryExecutionButtonVisibilityByUser]    Script Date: 2/14/2022 5:44:14 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aa_GetDynamicQueryExecutionButtonVisibilityByUser]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[aa_GetDynamicQueryExecutionButtonVisibilityByUser]
GO

/****** Object:  StoredProcedure [dbo].[aa_GetDynamicQueryExecutionButtonVisibilityByUser]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[aa_GetManualFormGeneratorButtonVisibilityByUser]    Script Date: 2/14/2022 5:44:14 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aa_GetManualFormGeneratorButtonVisibilityByUser]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[aa_GetManualFormGeneratorButtonVisibilityByUser]
GO

/****** Object:  StoredProcedure [dbo].[aa_GetManualFormGeneratorButtonVisibilityByUser]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[aa_GetMortgageCenterViewButtonVisibilityByUser]    Script Date: 2/14/2022 5:44:14 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aa_GetMortgageCenterViewButtonVisibilityByUser]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[aa_GetMortgageCenterViewButtonVisibilityByUser]
GO

/****** Object:  StoredProcedure [dbo].[aa_GetMortgageCenterViewButtonVisibilityByUser]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[aa_GetMortgageReportButtonVisibilityByUser]    Script Date: 2/14/2022 5:44:14 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aa_GetMortgageReportButtonVisibilityByUser]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[aa_GetMortgageReportButtonVisibilityByUser]
GO

/****** Object:  StoredProcedure [dbo].[aa_GetMortgageReportButtonVisibilityByUser]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[aa_GetMortgageReportMainButtonVisibilityByUser]    Script Date: 2/14/2022 5:44:14 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aa_GetMortgageReportMainButtonVisibilityByUser]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[aa_GetMortgageReportMainButtonVisibilityByUser]
GO

/****** Object:  StoredProcedure [dbo].[aa_GetMortgageReportMainButtonVisibilityByUser]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[aa_GetNotificationOfPaymentButtonVisibilityByUser]    Script Date: 2/14/2022 5:44:14 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aa_GetNotificationOfPaymentButtonVisibilityByUser]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[aa_GetNotificationOfPaymentButtonVisibilityByUser]
GO

/****** Object:  StoredProcedure [dbo].[aa_GetNotificationOfPaymentButtonVisibilityByUser]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[aa_GetNotificationOfPaymentSettingButtonVisibilityByUser]    Script Date: 2/14/2022 5:44:14 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aa_GetNotificationOfPaymentSettingButtonVisibilityByUser]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[aa_GetNotificationOfPaymentSettingButtonVisibilityByUser]
GO

/****** Object:  StoredProcedure [dbo].[aa_GetNotificationOfPaymentSettingButtonVisibilityByUser]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[aa_GetPADetailViewButtonVisibilityByUser]    Script Date: 2/14/2022 5:44:14 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aa_GetPADetailViewButtonVisibilityByUser]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[aa_GetPADetailViewButtonVisibilityByUser]
GO

/****** Object:  StoredProcedure [dbo].[aa_GetPADetailViewButtonVisibilityByUser]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[aa_GetParameterMaintenanceButtonVisibilityByUser]    Script Date: 2/14/2022 5:44:14 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aa_GetParameterMaintenanceButtonVisibilityByUser]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[aa_GetParameterMaintenanceButtonVisibilityByUser]
GO

/****** Object:  StoredProcedure [dbo].[aa_GetParameterMaintenanceButtonVisibilityByUser]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[aa_GetPaymentRefViewButtonVisibilityByUser]    Script Date: 2/14/2022 5:44:14 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aa_GetPaymentRefViewButtonVisibilityByUser]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[aa_GetPaymentRefViewButtonVisibilityByUser]
GO

/****** Object:  StoredProcedure [dbo].[aa_GetPaymentRefViewButtonVisibilityByUser]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[aa_GetPendingProcessingButtonVisibilityByUser]    Script Date: 2/14/2022 5:44:14 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aa_GetPendingProcessingButtonVisibilityByUser]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[aa_GetPendingProcessingButtonVisibilityByUser]
GO

/****** Object:  StoredProcedure [dbo].[aa_GetPendingProcessingButtonVisibilityByUser]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[aa_GetPendingVRButtonVisibilityByUser]    Script Date: 2/14/2022 5:44:14 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aa_GetPendingVRButtonVisibilityByUser]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[aa_GetPendingVRButtonVisibilityByUser]
GO

/****** Object:  StoredProcedure [dbo].[aa_GetPendingVRButtonVisibilityByUser]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[aa_GetRCOCheckerButtonVisibilityByUser]    Script Date: 2/14/2022 5:44:14 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aa_GetRCOCheckerButtonVisibilityByUser]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[aa_GetRCOCheckerButtonVisibilityByUser]
GO

/****** Object:  StoredProcedure [dbo].[aa_GetRCOCheckerButtonVisibilityByUser]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[aa_GetRCOMakerButtonVisibilityByUser]    Script Date: 2/14/2022 5:44:14 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aa_GetRCOMakerButtonVisibilityByUser]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[aa_GetRCOMakerButtonVisibilityByUser]
GO

/****** Object:  StoredProcedure [dbo].[aa_GetRCOMakerButtonVisibilityByUser]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[aa_GetRealUserManagementButtonVisibilityByUser]    Script Date: 2/14/2022 5:44:14 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aa_GetRealUserManagementButtonVisibilityByUser]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[aa_GetRealUserManagementButtonVisibilityByUser]
GO

/****** Object:  StoredProcedure [dbo].[aa_GetRealUserManagementButtonVisibilityByUser]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[aa_GetRevertedButtonVisibilityByUser]    Script Date: 2/14/2022 5:44:14 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aa_GetRevertedButtonVisibilityByUser]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[aa_GetRevertedButtonVisibilityByUser]
GO

/****** Object:  StoredProcedure [dbo].[aa_GetRevertedButtonVisibilityByUser]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[aa_GetRevertedByValuerButtonVisibilityByUser]    Script Date: 2/14/2022 5:44:14 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aa_GetRevertedByValuerButtonVisibilityByUser]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[aa_GetRevertedByValuerButtonVisibilityByUser]
GO

/****** Object:  StoredProcedure [dbo].[aa_GetRevertedByValuerButtonVisibilityByUser]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[aa_GetSecurityFeatureSettingButtonVisibilityByUser]    Script Date: 2/14/2022 5:44:14 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aa_GetSecurityFeatureSettingButtonVisibilityByUser]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[aa_GetSecurityFeatureSettingButtonVisibilityByUser]
GO

/****** Object:  StoredProcedure [dbo].[aa_GetSecurityFeatureSettingButtonVisibilityByUser]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[aa_GetSecurityReportButtonVisibilityByUser]    Script Date: 2/14/2022 5:44:14 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aa_GetSecurityReportButtonVisibilityByUser]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[aa_GetSecurityReportButtonVisibilityByUser]
GO

/****** Object:  StoredProcedure [dbo].[aa_GetSecurityReportButtonVisibilityByUser]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[aa_GetSecurityReportMortgageAdminButtonVisibilityByUser]    Script Date: 2/14/2022 5:44:14 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aa_GetSecurityReportMortgageAdminButtonVisibilityByUser]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[aa_GetSecurityReportMortgageAdminButtonVisibilityByUser]
GO

/****** Object:  StoredProcedure [dbo].[aa_GetSecurityReportMortgageAdminButtonVisibilityByUser]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[aa_GetSolicitorViewButtonVisibilityByUser]    Script Date: 2/14/2022 5:44:14 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aa_GetSolicitorViewButtonVisibilityByUser]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[aa_GetSolicitorViewButtonVisibilityByUser]
GO

/****** Object:  StoredProcedure [dbo].[aa_GetSolicitorViewButtonVisibilityByUser]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[aa_GetTaskReassignmentButtonVisibilityByUser]    Script Date: 2/14/2022 5:44:14 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aa_GetTaskReassignmentButtonVisibilityByUser]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[aa_GetTaskReassignmentButtonVisibilityByUser]
GO

/****** Object:  StoredProcedure [dbo].[aa_GetTaskReassignmentButtonVisibilityByUser]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[aa_GetUpdateLOADSDataButtonVisibilityByUser]    Script Date: 2/14/2022 5:44:14 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aa_GetUpdateLOADSDataButtonVisibilityByUser]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[aa_GetUpdateLOADSDataButtonVisibilityByUser]
GO

/****** Object:  StoredProcedure [dbo].[aa_GetUpdateLOADSDataButtonVisibilityByUser]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[aa_GetUpdateStatusButtonVisibilityByUser]    Script Date: 2/14/2022 5:44:14 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aa_GetUpdateStatusButtonVisibilityByUser]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[aa_GetUpdateStatusButtonVisibilityByUser]
GO

/****** Object:  StoredProcedure [dbo].[aa_GetUpdateStatusButtonVisibilityByUser]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[aa_GetUserManagementButtonVisibilityByUser]    Script Date: 2/14/2022 5:44:14 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aa_GetUserManagementButtonVisibilityByUser]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[aa_GetUserManagementButtonVisibilityByUser]
GO

/****** Object:  StoredProcedure [dbo].[aa_GetUserManagementButtonVisibilityByUser]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[aa_GetValuationUnitButtonVisibilityByUser]    Script Date: 2/14/2022 5:44:14 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aa_GetValuationUnitButtonVisibilityByUser]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[aa_GetValuationUnitButtonVisibilityByUser]
GO

/****** Object:  StoredProcedure [dbo].[aa_GetValuationUnitButtonVisibilityByUser]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[aa_GetValuerViewButtonVisibilityByUser]    Script Date: 2/14/2022 5:44:14 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aa_GetValuerViewButtonVisibilityByUser]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[aa_GetValuerViewButtonVisibilityByUser]
GO

/****** Object:  StoredProcedure [dbo].[aa_GetValuerViewButtonVisibilityByUser]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[aa_GetVRReportButtonVisibilityByUser]    Script Date: 2/14/2022 5:44:14 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aa_GetVRReportButtonVisibilityByUser]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[aa_GetVRReportButtonVisibilityByUser]
GO

/****** Object:  StoredProcedure [dbo].[aa_GetVRReportButtonVisibilityByUser]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[aa_GetWorkflowHistoryButtonVisibilityByUser]    Script Date: 2/14/2022 5:44:14 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aa_GetWorkflowHistoryButtonVisibilityByUser]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[aa_GetWorkflowHistoryButtonVisibilityByUser]
GO

/****** Object:  StoredProcedure [dbo].[aa_GetWorkflowHistoryButtonVisibilityByUser]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[aa_IntDisbursementCheckerRejectedLetter_generate]    Script Date: 2/14/2022 5:44:14 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aa_IntDisbursementCheckerRejectedLetter_generate]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[aa_IntDisbursementCheckerRejectedLetter_generate]
GO

/****** Object:  StoredProcedure [dbo].[aa_IntDisbursementCheckerRejectedLetter_generate]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[aa_IntDisbursementFinalApprovedLetter_generate]    Script Date: 2/14/2022 5:44:14 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aa_IntDisbursementFinalApprovedLetter_generate]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[aa_IntDisbursementFinalApprovedLetter_generate]
GO

/****** Object:  StoredProcedure [dbo].[aa_IntDisbursementFinalApprovedLetter_generate]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[aa_IntDisbursementSubmission_DisCheckerRejected_GetPaymentForCurrentSubmission]    Script Date: 2/14/2022 5:44:14 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aa_IntDisbursementSubmission_DisCheckerRejected_GetPaymentForCurrentSubmission]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[aa_IntDisbursementSubmission_DisCheckerRejected_GetPaymentForCurrentSubmission]
GO

/****** Object:  StoredProcedure [dbo].[aa_IntDisbursementSubmission_DisCheckerRejected_GetPaymentForCurrentSubmission]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[aa_IntDisbursementSubmission_DisChecker_GetAssignedList_step3_GetFinalList]    Script Date: 2/14/2022 5:44:14 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aa_IntDisbursementSubmission_DisChecker_GetAssignedList_step3_GetFinalList]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[aa_IntDisbursementSubmission_DisChecker_GetAssignedList_step3_GetFinalList]
GO

/****** Object:  StoredProcedure [dbo].[aa_IntDisbursementSubmission_DisChecker_GetAssignedList_step3_GetFinalList]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[aa_IntDisbursementSubmission_DisChecker_GetPendingLAList]    Script Date: 2/14/2022 5:44:14 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aa_IntDisbursementSubmission_DisChecker_GetPendingLAList]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[aa_IntDisbursementSubmission_DisChecker_GetPendingLAList]
GO

/****** Object:  StoredProcedure [dbo].[aa_IntDisbursementSubmission_DisChecker_GetPendingLAList]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[aa_IntDisbursementSubmission_DisChecker_GetPublicList]    Script Date: 2/14/2022 5:44:14 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aa_IntDisbursementSubmission_DisChecker_GetPublicList]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[aa_IntDisbursementSubmission_DisChecker_GetPublicList]
GO

/****** Object:  StoredProcedure [dbo].[aa_IntDisbursementSubmission_DisChecker_GetPublicList]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[aa_IntDisbursementSubmission_DisChecker_GetRecordByARN]    Script Date: 2/14/2022 5:44:14 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aa_IntDisbursementSubmission_DisChecker_GetRecordByARN]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[aa_IntDisbursementSubmission_DisChecker_GetRecordByARN]
GO

/****** Object:  StoredProcedure [dbo].[aa_IntDisbursementSubmission_DisChecker_GetRecordByARN]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[aa_IntDisbursementSubmission_DisChecker_GetRejectedByARN]    Script Date: 2/14/2022 5:44:14 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aa_IntDisbursementSubmission_DisChecker_GetRejectedByARN]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[aa_IntDisbursementSubmission_DisChecker_GetRejectedByARN]
GO

/****** Object:  StoredProcedure [dbo].[aa_IntDisbursementSubmission_DisChecker_GetRejectedByARN]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[aa_IntDisbursementSubmission_DisChecker_GetRejectedList]    Script Date: 2/14/2022 5:44:14 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aa_IntDisbursementSubmission_DisChecker_GetRejectedList]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[aa_IntDisbursementSubmission_DisChecker_GetRejectedList]
GO

/****** Object:  StoredProcedure [dbo].[aa_IntDisbursementSubmission_DisChecker_GetRejectedList]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[aa_IntDisbursementSubmission_DisChecker_Main]    Script Date: 2/14/2022 5:44:14 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aa_IntDisbursementSubmission_DisChecker_Main]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[aa_IntDisbursementSubmission_DisChecker_Main]
GO

/****** Object:  StoredProcedure [dbo].[aa_IntDisbursementSubmission_DisChecker_Main]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[aa_IntDisbursementSubmission_DisChecker_Main_delete]    Script Date: 2/14/2022 5:44:14 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aa_IntDisbursementSubmission_DisChecker_Main_delete]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[aa_IntDisbursementSubmission_DisChecker_Main_delete]
GO

/****** Object:  StoredProcedure [dbo].[aa_IntDisbursementSubmission_DisChecker_Main_delete]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[aa_IntDisbursementSubmission_DisChecker_Main_PendingLA_DeleteWF]    Script Date: 2/14/2022 5:44:14 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aa_IntDisbursementSubmission_DisChecker_Main_PendingLA_DeleteWF]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[aa_IntDisbursementSubmission_DisChecker_Main_PendingLA_DeleteWF]
GO

/****** Object:  StoredProcedure [dbo].[aa_IntDisbursementSubmission_DisChecker_Main_PendingLA_DeleteWF]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[aa_IntDisbursementSubmission_DisMaker_AddPaymentForCurrentSubmission]    Script Date: 2/14/2022 5:44:14 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aa_IntDisbursementSubmission_DisMaker_AddPaymentForCurrentSubmission]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[aa_IntDisbursementSubmission_DisMaker_AddPaymentForCurrentSubmission]
GO

/****** Object:  StoredProcedure [dbo].[aa_IntDisbursementSubmission_DisMaker_AddPaymentForCurrentSubmission]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[aa_IntDisbursementSubmission_DisMaker_DeletePaymentForCurrentSubmission]    Script Date: 2/14/2022 5:44:14 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aa_IntDisbursementSubmission_DisMaker_DeletePaymentForCurrentSubmission]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[aa_IntDisbursementSubmission_DisMaker_DeletePaymentForCurrentSubmission]
GO

/****** Object:  StoredProcedure [dbo].[aa_IntDisbursementSubmission_DisMaker_DeletePaymentForCurrentSubmission]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[aa_IntDisbursementSubmission_DisMaker_EditPaymentForCurrentSubmission]    Script Date: 2/14/2022 5:44:14 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aa_IntDisbursementSubmission_DisMaker_EditPaymentForCurrentSubmission]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[aa_IntDisbursementSubmission_DisMaker_EditPaymentForCurrentSubmission]
GO

/****** Object:  StoredProcedure [dbo].[aa_IntDisbursementSubmission_DisMaker_EditPaymentForCurrentSubmission]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[aa_IntDisbursementSubmission_DisMaker_GetAssignedList_step3_GetFinalList]    Script Date: 2/14/2022 5:44:14 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aa_IntDisbursementSubmission_DisMaker_GetAssignedList_step3_GetFinalList]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[aa_IntDisbursementSubmission_DisMaker_GetAssignedList_step3_GetFinalList]
GO

/****** Object:  StoredProcedure [dbo].[aa_IntDisbursementSubmission_DisMaker_GetAssignedList_step3_GetFinalList]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[aa_IntDisbursementSubmission_DisMaker_GetPaymentByRunningID]    Script Date: 2/14/2022 5:44:14 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aa_IntDisbursementSubmission_DisMaker_GetPaymentByRunningID]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[aa_IntDisbursementSubmission_DisMaker_GetPaymentByRunningID]
GO

/****** Object:  StoredProcedure [dbo].[aa_IntDisbursementSubmission_DisMaker_GetPaymentByRunningID]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[aa_IntDisbursementSubmission_DisMaker_GetPaymentForCurrentSubmission]    Script Date: 2/14/2022 5:44:14 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aa_IntDisbursementSubmission_DisMaker_GetPaymentForCurrentSubmission]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[aa_IntDisbursementSubmission_DisMaker_GetPaymentForCurrentSubmission]
GO

/****** Object:  StoredProcedure [dbo].[aa_IntDisbursementSubmission_DisMaker_GetPaymentForCurrentSubmission]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[aa_IntDisbursementSubmission_DisMaker_GetPendingLAList]    Script Date: 2/14/2022 5:44:14 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aa_IntDisbursementSubmission_DisMaker_GetPendingLAList]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[aa_IntDisbursementSubmission_DisMaker_GetPendingLAList]
GO

/****** Object:  StoredProcedure [dbo].[aa_IntDisbursementSubmission_DisMaker_GetPendingLAList]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[aa_IntDisbursementSubmission_DisMaker_GetPublicList]    Script Date: 2/14/2022 5:44:14 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aa_IntDisbursementSubmission_DisMaker_GetPublicList]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[aa_IntDisbursementSubmission_DisMaker_GetPublicList]
GO

/****** Object:  StoredProcedure [dbo].[aa_IntDisbursementSubmission_DisMaker_GetPublicList]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[aa_IntDisbursementSubmission_DisMaker_GetRecordByARN]    Script Date: 2/14/2022 5:44:14 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aa_IntDisbursementSubmission_DisMaker_GetRecordByARN]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[aa_IntDisbursementSubmission_DisMaker_GetRecordByARN]
GO

/****** Object:  StoredProcedure [dbo].[aa_IntDisbursementSubmission_DisMaker_GetRecordByARN]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[aa_IntDisbursementSubmission_DisMaker_Main]    Script Date: 2/14/2022 5:44:14 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aa_IntDisbursementSubmission_DisMaker_Main]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[aa_IntDisbursementSubmission_DisMaker_Main]
GO

/****** Object:  StoredProcedure [dbo].[aa_IntDisbursementSubmission_DisMaker_Main]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[aa_IntDisbursementSubmission_DisMaker_Main_delete]    Script Date: 2/14/2022 5:44:14 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aa_IntDisbursementSubmission_DisMaker_Main_delete]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[aa_IntDisbursementSubmission_DisMaker_Main_delete]
GO

/****** Object:  StoredProcedure [dbo].[aa_IntDisbursementSubmission_DisMaker_Main_delete]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[aa_IntDisbursementSubmission_DisMaker_Main_PendingLA_DeleteWF]    Script Date: 2/14/2022 5:44:14 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aa_IntDisbursementSubmission_DisMaker_Main_PendingLA_DeleteWF]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[aa_IntDisbursementSubmission_DisMaker_Main_PendingLA_DeleteWF]
GO

/****** Object:  StoredProcedure [dbo].[aa_IntDisbursementSubmission_DisMaker_Main_PendingLA_DeleteWF]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[aa_IntDisbursementSubmission_DisMaker_PaymentSummary_List]    Script Date: 2/14/2022 5:44:14 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aa_IntDisbursementSubmission_DisMaker_PaymentSummary_List]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[aa_IntDisbursementSubmission_DisMaker_PaymentSummary_List]
GO

/****** Object:  StoredProcedure [dbo].[aa_IntDisbursementSubmission_DisMaker_PaymentSummary_List]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[aa_IntDisbursementSubmission_RCOChecker_GetAssignedList_step3_GetFinalList]    Script Date: 2/14/2022 5:44:14 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aa_IntDisbursementSubmission_RCOChecker_GetAssignedList_step3_GetFinalList]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[aa_IntDisbursementSubmission_RCOChecker_GetAssignedList_step3_GetFinalList]
GO

/****** Object:  StoredProcedure [dbo].[aa_IntDisbursementSubmission_RCOChecker_GetAssignedList_step3_GetFinalList]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[aa_IntDisbursementSubmission_RCOChecker_GetPublicList]    Script Date: 2/14/2022 5:44:14 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aa_IntDisbursementSubmission_RCOChecker_GetPublicList]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[aa_IntDisbursementSubmission_RCOChecker_GetPublicList]
GO

/****** Object:  StoredProcedure [dbo].[aa_IntDisbursementSubmission_RCOChecker_GetPublicList]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[aa_IntDisbursementSubmission_RCOChecker_GetRecordByARN]    Script Date: 2/14/2022 5:44:14 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aa_IntDisbursementSubmission_RCOChecker_GetRecordByARN]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[aa_IntDisbursementSubmission_RCOChecker_GetRecordByARN]
GO

/****** Object:  StoredProcedure [dbo].[aa_IntDisbursementSubmission_RCOChecker_GetRecordByARN]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[aa_IntDisbursementSubmission_RCOChecker_GetRejectedList]    Script Date: 2/14/2022 5:44:14 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aa_IntDisbursementSubmission_RCOChecker_GetRejectedList]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[aa_IntDisbursementSubmission_RCOChecker_GetRejectedList]
GO

/****** Object:  StoredProcedure [dbo].[aa_IntDisbursementSubmission_RCOChecker_GetRejectedList]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[aa_IntDisbursementSubmission_RCOChecker_Main]    Script Date: 2/14/2022 5:44:14 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aa_IntDisbursementSubmission_RCOChecker_Main]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[aa_IntDisbursementSubmission_RCOChecker_Main]
GO

/****** Object:  StoredProcedure [dbo].[aa_IntDisbursementSubmission_RCOChecker_Main]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[aa_IntDisbursementSubmission_RCOChecker_Main_delete]    Script Date: 2/14/2022 5:44:14 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aa_IntDisbursementSubmission_RCOChecker_Main_delete]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[aa_IntDisbursementSubmission_RCOChecker_Main_delete]
GO

/****** Object:  StoredProcedure [dbo].[aa_IntDisbursementSubmission_RCOChecker_Main_delete]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[aa_IntDisbursementSubmission_RCOMaker_GetAssignedList_step3_GetFinalList]    Script Date: 2/14/2022 5:44:14 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aa_IntDisbursementSubmission_RCOMaker_GetAssignedList_step3_GetFinalList]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[aa_IntDisbursementSubmission_RCOMaker_GetAssignedList_step3_GetFinalList]
GO

/****** Object:  StoredProcedure [dbo].[aa_IntDisbursementSubmission_RCOMaker_GetAssignedList_step3_GetFinalList]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[aa_IntDisbursementSubmission_RCOMaker_GetPaymentForCurrentSubmission]    Script Date: 2/14/2022 5:44:14 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aa_IntDisbursementSubmission_RCOMaker_GetPaymentForCurrentSubmission]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[aa_IntDisbursementSubmission_RCOMaker_GetPaymentForCurrentSubmission]
GO

/****** Object:  StoredProcedure [dbo].[aa_IntDisbursementSubmission_RCOMaker_GetPaymentForCurrentSubmission]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[aa_IntDisbursementSubmission_RCOMaker_GetPublicList]    Script Date: 2/14/2022 5:44:14 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aa_IntDisbursementSubmission_RCOMaker_GetPublicList]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[aa_IntDisbursementSubmission_RCOMaker_GetPublicList]
GO

/****** Object:  StoredProcedure [dbo].[aa_IntDisbursementSubmission_RCOMaker_GetPublicList]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[aa_IntDisbursementSubmission_RCOMaker_GetRecordByARN]    Script Date: 2/14/2022 5:44:14 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aa_IntDisbursementSubmission_RCOMaker_GetRecordByARN]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[aa_IntDisbursementSubmission_RCOMaker_GetRecordByARN]
GO

/****** Object:  StoredProcedure [dbo].[aa_IntDisbursementSubmission_RCOMaker_GetRecordByARN]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[aa_IntDisbursementSubmission_RCOMaker_GetRejectedList]    Script Date: 2/14/2022 5:44:14 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aa_IntDisbursementSubmission_RCOMaker_GetRejectedList]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[aa_IntDisbursementSubmission_RCOMaker_GetRejectedList]
GO

/****** Object:  StoredProcedure [dbo].[aa_IntDisbursementSubmission_RCOMaker_GetRejectedList]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[aa_IntDisbursementSubmission_RCOmaker_Main]    Script Date: 2/14/2022 5:44:14 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aa_IntDisbursementSubmission_RCOmaker_Main]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[aa_IntDisbursementSubmission_RCOmaker_Main]
GO

/****** Object:  StoredProcedure [dbo].[aa_IntDisbursementSubmission_RCOmaker_Main]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[aa_IntDisbursementSubmission_RCOMaker_Main_delete]    Script Date: 2/14/2022 5:44:14 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aa_IntDisbursementSubmission_RCOMaker_Main_delete]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[aa_IntDisbursementSubmission_RCOMaker_Main_delete]
GO

/****** Object:  StoredProcedure [dbo].[aa_IntDisbursementSubmission_RCOMaker_Main_delete]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[aa_IntRCOCheckerRejectedLetter_generate]    Script Date: 2/14/2022 5:44:14 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aa_IntRCOCheckerRejectedLetter_generate]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[aa_IntRCOCheckerRejectedLetter_generate]
GO

/****** Object:  StoredProcedure [dbo].[aa_IntRCOCheckerRejectedLetter_generate]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[aa_IntRCOMakerRejectedLetter_generate]    Script Date: 2/14/2022 5:44:14 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aa_IntRCOMakerRejectedLetter_generate]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[aa_IntRCOMakerRejectedLetter_generate]
GO

/****** Object:  StoredProcedure [dbo].[aa_IntRCOMakerRejectedLetter_generate]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[aa_NotificationOfPayment_Regenerate_select]    Script Date: 2/14/2022 5:44:14 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aa_NotificationOfPayment_Regenerate_select]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[aa_NotificationOfPayment_Regenerate_select]
GO

/****** Object:  StoredProcedure [dbo].[aa_NotificationOfPayment_Regenerate_select]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[aa_NotificationOfPayment_Regenerate_validate]    Script Date: 2/14/2022 5:44:14 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aa_NotificationOfPayment_Regenerate_validate]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[aa_NotificationOfPayment_Regenerate_validate]
GO

/****** Object:  StoredProcedure [dbo].[aa_NotificationOfPayment_Regenerate_validate]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[aa_PDFPasswordDev_getPassword]    Script Date: 2/14/2022 5:44:14 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aa_PDFPasswordDev_getPassword]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[aa_PDFPasswordDev_getPassword]
GO

/****** Object:  StoredProcedure [dbo].[aa_PDFPasswordDev_getPassword]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[aa_RCOCheckerRejectedLetter_generate]    Script Date: 2/14/2022 5:44:14 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aa_RCOCheckerRejectedLetter_generate]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[aa_RCOCheckerRejectedLetter_generate]
GO

/****** Object:  StoredProcedure [dbo].[aa_RCOCheckerRejectedLetter_generate]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[aa_RCOMakerRejectedLetter_generate]    Script Date: 2/14/2022 5:44:14 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aa_RCOMakerRejectedLetter_generate]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[aa_RCOMakerRejectedLetter_generate]
GO

/****** Object:  StoredProcedure [dbo].[aa_RCOMakerRejectedLetter_generate]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[aa_Report_A_CaseAccepted]    Script Date: 2/14/2022 5:44:14 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aa_Report_A_CaseAccepted]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[aa_Report_A_CaseAccepted]
GO

/****** Object:  StoredProcedure [dbo].[aa_Report_A_CaseAccepted]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[aa_Report_A_CaseAccepted_GetResultCount]    Script Date: 2/14/2022 5:44:14 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aa_Report_A_CaseAccepted_GetResultCount]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[aa_Report_A_CaseAccepted_GetResultCount]
GO

/****** Object:  StoredProcedure [dbo].[aa_Report_A_CaseAccepted_GetResultCount]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[aa_Report_A_CaseAccepted_Validate]    Script Date: 2/14/2022 5:44:14 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aa_Report_A_CaseAccepted_Validate]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[aa_Report_A_CaseAccepted_Validate]
GO

/****** Object:  StoredProcedure [dbo].[aa_Report_A_CaseAccepted_Validate]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[aa_Report_B_PendingVR]    Script Date: 2/14/2022 5:44:14 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aa_Report_B_PendingVR]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[aa_Report_B_PendingVR]
GO

/****** Object:  StoredProcedure [dbo].[aa_Report_B_PendingVR]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[aa_Report_B_PendingVR_Validate]    Script Date: 2/14/2022 5:44:14 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aa_Report_B_PendingVR_Validate]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[aa_Report_B_PendingVR_Validate]
GO

/****** Object:  StoredProcedure [dbo].[aa_Report_B_PendingVR_Validate]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[aa_Report_C_PendingProcessing]    Script Date: 2/14/2022 5:44:14 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aa_Report_C_PendingProcessing]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[aa_Report_C_PendingProcessing]
GO

/****** Object:  StoredProcedure [dbo].[aa_Report_C_PendingProcessing]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[aa_Report_C_PendingProcessing_Disb]    Script Date: 2/14/2022 5:44:14 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aa_Report_C_PendingProcessing_Disb]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[aa_Report_C_PendingProcessing_Disb]
GO

/****** Object:  StoredProcedure [dbo].[aa_Report_C_PendingProcessing_Disb]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[aa_Report_C_PendingProcessing_Doc]    Script Date: 2/14/2022 5:44:14 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aa_Report_C_PendingProcessing_Doc]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[aa_Report_C_PendingProcessing_Doc]
GO

/****** Object:  StoredProcedure [dbo].[aa_Report_C_PendingProcessing_Doc]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[aa_Report_C_PendingProcessing_GetResultCount]    Script Date: 2/14/2022 5:44:14 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aa_Report_C_PendingProcessing_GetResultCount]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[aa_Report_C_PendingProcessing_GetResultCount]
GO

/****** Object:  StoredProcedure [dbo].[aa_Report_C_PendingProcessing_GetResultCount]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[aa_Report_C_PendingProcessing_Validate]    Script Date: 2/14/2022 5:44:14 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aa_Report_C_PendingProcessing_Validate]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[aa_Report_C_PendingProcessing_Validate]
GO

/****** Object:  StoredProcedure [dbo].[aa_Report_C_PendingProcessing_Validate]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[aa_Report_D_RevertedBySolicitor]    Script Date: 2/14/2022 5:44:14 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aa_Report_D_RevertedBySolicitor]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[aa_Report_D_RevertedBySolicitor]
GO

/****** Object:  StoredProcedure [dbo].[aa_Report_D_RevertedBySolicitor]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[aa_Report_D_RevertedBySolicitor2]    Script Date: 2/14/2022 5:44:14 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aa_Report_D_RevertedBySolicitor2]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[aa_Report_D_RevertedBySolicitor2]
GO

/****** Object:  StoredProcedure [dbo].[aa_Report_D_RevertedBySolicitor2]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[aa_Report_D_RevertedBySolicitor_GetResultCount]    Script Date: 2/14/2022 5:44:14 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aa_Report_D_RevertedBySolicitor_GetResultCount]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[aa_Report_D_RevertedBySolicitor_GetResultCount]
GO

/****** Object:  StoredProcedure [dbo].[aa_Report_D_RevertedBySolicitor_GetResultCount]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[aa_Report_D_RevertedBySolicitor_Validate]    Script Date: 2/14/2022 5:44:14 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aa_Report_D_RevertedBySolicitor_Validate]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[aa_Report_D_RevertedBySolicitor_Validate]
GO

/****** Object:  StoredProcedure [dbo].[aa_Report_D_RevertedBySolicitor_Validate]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[aa_Report_E_RevertedByValuer]    Script Date: 2/14/2022 5:44:14 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aa_Report_E_RevertedByValuer]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[aa_Report_E_RevertedByValuer]
GO

/****** Object:  StoredProcedure [dbo].[aa_Report_E_RevertedByValuer]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[aa_Report_E_RevertedByValuer2]    Script Date: 2/14/2022 5:44:14 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aa_Report_E_RevertedByValuer2]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[aa_Report_E_RevertedByValuer2]
GO

/****** Object:  StoredProcedure [dbo].[aa_Report_E_RevertedByValuer2]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[aa_Report_E_RevertedByValuer_GetResultCount]    Script Date: 2/14/2022 5:44:14 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aa_Report_E_RevertedByValuer_GetResultCount]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[aa_Report_E_RevertedByValuer_GetResultCount]
GO

/****** Object:  StoredProcedure [dbo].[aa_Report_E_RevertedByValuer_GetResultCount]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[aa_Report_E_RevertedByValuer_Validate]    Script Date: 2/14/2022 5:44:14 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aa_Report_E_RevertedByValuer_Validate]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[aa_Report_E_RevertedByValuer_Validate]
GO

/****** Object:  StoredProcedure [dbo].[aa_Report_E_RevertedByValuer_Validate]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[aa_Report_GetMortgageCentre]    Script Date: 2/14/2022 5:44:14 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aa_Report_GetMortgageCentre]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[aa_Report_GetMortgageCentre]
GO

/****** Object:  StoredProcedure [dbo].[aa_Report_GetMortgageCentre]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[aa_Report_Report_B_PendingVR_GetResultCount]    Script Date: 2/14/2022 5:44:14 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aa_Report_Report_B_PendingVR_GetResultCount]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[aa_Report_Report_B_PendingVR_GetResultCount]
GO

/****** Object:  StoredProcedure [dbo].[aa_Report_Report_B_PendingVR_GetResultCount]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[aa_SolDisbursementSubmissionRemarks_GetRecord_ByARN_ForPDFForm]    Script Date: 2/14/2022 5:44:14 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aa_SolDisbursementSubmissionRemarks_GetRecord_ByARN_ForPDFForm]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[aa_SolDisbursementSubmissionRemarks_GetRecord_ByARN_ForPDFForm]
GO

/****** Object:  StoredProcedure [dbo].[aa_SolDisbursementSubmissionRemarks_GetRecord_ByARN_ForPDFForm]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[aa_SolDisbursementSubmissionSubmittedView_GetPaymentForCurrentSubmission]    Script Date: 2/14/2022 5:44:14 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aa_SolDisbursementSubmissionSubmittedView_GetPaymentForCurrentSubmission]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[aa_SolDisbursementSubmissionSubmittedView_GetPaymentForCurrentSubmission]
GO

/****** Object:  StoredProcedure [dbo].[aa_SolDisbursementSubmissionSubmittedView_GetPaymentForCurrentSubmission]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[aa_SolDisbursementSubmissionSubmittedView_GetRecord_ByARN]    Script Date: 2/14/2022 5:44:14 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aa_SolDisbursementSubmissionSubmittedView_GetRecord_ByARN]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[aa_SolDisbursementSubmissionSubmittedView_GetRecord_ByARN]
GO

/****** Object:  StoredProcedure [dbo].[aa_SolDisbursementSubmissionSubmittedView_GetRecord_ByARN]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[aa_SolDisbursementSubmission_AddPaymentForCurrentSubmission]    Script Date: 2/14/2022 5:44:14 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aa_SolDisbursementSubmission_AddPaymentForCurrentSubmission]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[aa_SolDisbursementSubmission_AddPaymentForCurrentSubmission]
GO

/****** Object:  StoredProcedure [dbo].[aa_SolDisbursementSubmission_AddPaymentForCurrentSubmission]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[aa_SolDisbursementSubmission_DeletePaymentForCurrentSubmission]    Script Date: 2/14/2022 5:44:14 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aa_SolDisbursementSubmission_DeletePaymentForCurrentSubmission]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[aa_SolDisbursementSubmission_DeletePaymentForCurrentSubmission]
GO

/****** Object:  StoredProcedure [dbo].[aa_SolDisbursementSubmission_DeletePaymentForCurrentSubmission]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[aa_SolDisbursementSubmission_DisCheckerRejected_GetPaymentForCurrentSubmission]    Script Date: 2/14/2022 5:44:14 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aa_SolDisbursementSubmission_DisCheckerRejected_GetPaymentForCurrentSubmission]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[aa_SolDisbursementSubmission_DisCheckerRejected_GetPaymentForCurrentSubmission]
GO

/****** Object:  StoredProcedure [dbo].[aa_SolDisbursementSubmission_DisCheckerRejected_GetPaymentForCurrentSubmission]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[aa_SolDisbursementSubmission_DisChecker_GetAssignedList_step3_GetFinalList]    Script Date: 2/14/2022 5:44:14 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aa_SolDisbursementSubmission_DisChecker_GetAssignedList_step3_GetFinalList]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[aa_SolDisbursementSubmission_DisChecker_GetAssignedList_step3_GetFinalList]
GO

/****** Object:  StoredProcedure [dbo].[aa_SolDisbursementSubmission_DisChecker_GetAssignedList_step3_GetFinalList]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[aa_SolDisbursementSubmission_DisChecker_GetCurrentPaymentCount]    Script Date: 2/14/2022 5:44:14 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aa_SolDisbursementSubmission_DisChecker_GetCurrentPaymentCount]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[aa_SolDisbursementSubmission_DisChecker_GetCurrentPaymentCount]
GO

/****** Object:  StoredProcedure [dbo].[aa_SolDisbursementSubmission_DisChecker_GetCurrentPaymentCount]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[aa_SolDisbursementSubmission_DisChecker_GetNoBillingList]    Script Date: 2/14/2022 5:44:14 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aa_SolDisbursementSubmission_DisChecker_GetNoBillingList]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[aa_SolDisbursementSubmission_DisChecker_GetNoBillingList]
GO

/****** Object:  StoredProcedure [dbo].[aa_SolDisbursementSubmission_DisChecker_GetNoBillingList]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[aa_SolDisbursementSubmission_DisChecker_GetPublicList]    Script Date: 2/14/2022 5:44:14 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aa_SolDisbursementSubmission_DisChecker_GetPublicList]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[aa_SolDisbursementSubmission_DisChecker_GetPublicList]
GO

/****** Object:  StoredProcedure [dbo].[aa_SolDisbursementSubmission_DisChecker_GetPublicList]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[aa_SolDisbursementSubmission_DisChecker_GetRecordByARN]    Script Date: 2/14/2022 5:44:14 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aa_SolDisbursementSubmission_DisChecker_GetRecordByARN]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[aa_SolDisbursementSubmission_DisChecker_GetRecordByARN]
GO

/****** Object:  StoredProcedure [dbo].[aa_SolDisbursementSubmission_DisChecker_GetRecordByARN]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[aa_SolDisbursementSubmission_DisChecker_GetRejectedList]    Script Date: 2/14/2022 5:44:14 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aa_SolDisbursementSubmission_DisChecker_GetRejectedList]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[aa_SolDisbursementSubmission_DisChecker_GetRejectedList]
GO

/****** Object:  StoredProcedure [dbo].[aa_SolDisbursementSubmission_DisChecker_GetRejectedList]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[aa_SolDisbursementSubmission_DisChecker_GetRejected_ByARN]    Script Date: 2/14/2022 5:44:14 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aa_SolDisbursementSubmission_DisChecker_GetRejected_ByARN]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[aa_SolDisbursementSubmission_DisChecker_GetRejected_ByARN]
GO

/****** Object:  StoredProcedure [dbo].[aa_SolDisbursementSubmission_DisChecker_GetRejected_ByARN]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[aa_SolDisbursementSubmission_DisChecker_Main]    Script Date: 2/14/2022 5:44:14 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aa_SolDisbursementSubmission_DisChecker_Main]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[aa_SolDisbursementSubmission_DisChecker_Main]
GO

/****** Object:  StoredProcedure [dbo].[aa_SolDisbursementSubmission_DisChecker_Main]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[aa_SolDisbursementSubmission_DisChecker_Main_delete]    Script Date: 2/14/2022 5:44:14 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aa_SolDisbursementSubmission_DisChecker_Main_delete]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[aa_SolDisbursementSubmission_DisChecker_Main_delete]
GO

/****** Object:  StoredProcedure [dbo].[aa_SolDisbursementSubmission_DisChecker_Main_delete]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[aa_SolDisbursementSubmission_DisMaker_AddPaymentForCurrentSubmission]    Script Date: 2/14/2022 5:44:14 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aa_SolDisbursementSubmission_DisMaker_AddPaymentForCurrentSubmission]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[aa_SolDisbursementSubmission_DisMaker_AddPaymentForCurrentSubmission]
GO

/****** Object:  StoredProcedure [dbo].[aa_SolDisbursementSubmission_DisMaker_AddPaymentForCurrentSubmission]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[aa_SolDisbursementSubmission_DisMaker_DeletePaymentForCurrentSubmission]    Script Date: 2/14/2022 5:44:14 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aa_SolDisbursementSubmission_DisMaker_DeletePaymentForCurrentSubmission]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[aa_SolDisbursementSubmission_DisMaker_DeletePaymentForCurrentSubmission]
GO

/****** Object:  StoredProcedure [dbo].[aa_SolDisbursementSubmission_DisMaker_DeletePaymentForCurrentSubmission]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[aa_SolDisbursementSubmission_DisMaker_EditPaymentForCurrentSubmission]    Script Date: 2/14/2022 5:44:14 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aa_SolDisbursementSubmission_DisMaker_EditPaymentForCurrentSubmission]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[aa_SolDisbursementSubmission_DisMaker_EditPaymentForCurrentSubmission]
GO

/****** Object:  StoredProcedure [dbo].[aa_SolDisbursementSubmission_DisMaker_EditPaymentForCurrentSubmission]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[aa_SolDisbursementSubmission_DisMaker_GetAssignedList_step3_GetFinalList]    Script Date: 2/14/2022 5:44:14 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aa_SolDisbursementSubmission_DisMaker_GetAssignedList_step3_GetFinalList]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[aa_SolDisbursementSubmission_DisMaker_GetAssignedList_step3_GetFinalList]
GO

/****** Object:  StoredProcedure [dbo].[aa_SolDisbursementSubmission_DisMaker_GetAssignedList_step3_GetFinalList]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[aa_SolDisbursementSubmission_DisMaker_GetNoBillingList]    Script Date: 2/14/2022 5:44:14 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aa_SolDisbursementSubmission_DisMaker_GetNoBillingList]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[aa_SolDisbursementSubmission_DisMaker_GetNoBillingList]
GO

/****** Object:  StoredProcedure [dbo].[aa_SolDisbursementSubmission_DisMaker_GetNoBillingList]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[aa_SolDisbursementSubmission_DisMaker_GetPaymentByRunningID]    Script Date: 2/14/2022 5:44:14 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aa_SolDisbursementSubmission_DisMaker_GetPaymentByRunningID]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[aa_SolDisbursementSubmission_DisMaker_GetPaymentByRunningID]
GO

/****** Object:  StoredProcedure [dbo].[aa_SolDisbursementSubmission_DisMaker_GetPaymentByRunningID]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[aa_SolDisbursementSubmission_DisMaker_GetPaymentForCurrentSubmission]    Script Date: 2/14/2022 5:44:14 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aa_SolDisbursementSubmission_DisMaker_GetPaymentForCurrentSubmission]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[aa_SolDisbursementSubmission_DisMaker_GetPaymentForCurrentSubmission]
GO

/****** Object:  StoredProcedure [dbo].[aa_SolDisbursementSubmission_DisMaker_GetPaymentForCurrentSubmission]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[aa_SolDisbursementSubmission_DisMaker_GetPaymentHistory]    Script Date: 2/14/2022 5:44:14 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aa_SolDisbursementSubmission_DisMaker_GetPaymentHistory]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[aa_SolDisbursementSubmission_DisMaker_GetPaymentHistory]
GO

/****** Object:  StoredProcedure [dbo].[aa_SolDisbursementSubmission_DisMaker_GetPaymentHistory]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[aa_SolDisbursementSubmission_DisMaker_GetPaymentInProgress_ForBilling]    Script Date: 2/14/2022 5:44:14 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aa_SolDisbursementSubmission_DisMaker_GetPaymentInProgress_ForBilling]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[aa_SolDisbursementSubmission_DisMaker_GetPaymentInProgress_ForBilling]
GO

/****** Object:  StoredProcedure [dbo].[aa_SolDisbursementSubmission_DisMaker_GetPaymentInProgress_ForBilling]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[aa_SolDisbursementSubmission_DisMaker_GetPaymentSummary]    Script Date: 2/14/2022 5:44:14 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aa_SolDisbursementSubmission_DisMaker_GetPaymentSummary]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[aa_SolDisbursementSubmission_DisMaker_GetPaymentSummary]
GO

/****** Object:  StoredProcedure [dbo].[aa_SolDisbursementSubmission_DisMaker_GetPaymentSummary]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[aa_SolDisbursementSubmission_DisMaker_GetPaymentWithNoAccountFromSet]    Script Date: 2/14/2022 5:44:14 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aa_SolDisbursementSubmission_DisMaker_GetPaymentWithNoAccountFromSet]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[aa_SolDisbursementSubmission_DisMaker_GetPaymentWithNoAccountFromSet]
GO

/****** Object:  StoredProcedure [dbo].[aa_SolDisbursementSubmission_DisMaker_GetPaymentWithNoAccountFromSet]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[aa_SolDisbursementSubmission_DisMaker_GetPendingVRList]    Script Date: 2/14/2022 5:44:14 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aa_SolDisbursementSubmission_DisMaker_GetPendingVRList]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[aa_SolDisbursementSubmission_DisMaker_GetPendingVRList]
GO

/****** Object:  StoredProcedure [dbo].[aa_SolDisbursementSubmission_DisMaker_GetPendingVRList]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[aa_SolDisbursementSubmission_DisMaker_GetPublicList]    Script Date: 2/14/2022 5:44:14 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aa_SolDisbursementSubmission_DisMaker_GetPublicList]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[aa_SolDisbursementSubmission_DisMaker_GetPublicList]
GO

/****** Object:  StoredProcedure [dbo].[aa_SolDisbursementSubmission_DisMaker_GetPublicList]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[aa_SolDisbursementSubmission_DisMaker_GetRecordByARN]    Script Date: 2/14/2022 5:44:14 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aa_SolDisbursementSubmission_DisMaker_GetRecordByARN]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[aa_SolDisbursementSubmission_DisMaker_GetRecordByARN]
GO

/****** Object:  StoredProcedure [dbo].[aa_SolDisbursementSubmission_DisMaker_GetRecordByARN]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[aa_SolDisbursementSubmission_DisMaker_GetRejectedList]    Script Date: 2/14/2022 5:44:14 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aa_SolDisbursementSubmission_DisMaker_GetRejectedList]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[aa_SolDisbursementSubmission_DisMaker_GetRejectedList]
GO

/****** Object:  StoredProcedure [dbo].[aa_SolDisbursementSubmission_DisMaker_GetRejectedList]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[aa_SolDisbursementSubmission_DisMaker_GetRejected_ByARN]    Script Date: 2/14/2022 5:44:14 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aa_SolDisbursementSubmission_DisMaker_GetRejected_ByARN]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[aa_SolDisbursementSubmission_DisMaker_GetRejected_ByARN]
GO

/****** Object:  StoredProcedure [dbo].[aa_SolDisbursementSubmission_DisMaker_GetRejected_ByARN]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[aa_SolDisbursementSubmission_DisMaker_GetUpdateInfoList]    Script Date: 2/14/2022 5:44:14 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aa_SolDisbursementSubmission_DisMaker_GetUpdateInfoList]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[aa_SolDisbursementSubmission_DisMaker_GetUpdateInfoList]
GO

/****** Object:  StoredProcedure [dbo].[aa_SolDisbursementSubmission_DisMaker_GetUpdateInfoList]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[aa_SolDisbursementSubmission_DisMaker_Main]    Script Date: 2/14/2022 5:44:14 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aa_SolDisbursementSubmission_DisMaker_Main]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[aa_SolDisbursementSubmission_DisMaker_Main]
GO

/****** Object:  StoredProcedure [dbo].[aa_SolDisbursementSubmission_DisMaker_Main]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[aa_SolDisbursementSubmission_DisMaker_Main_delete]    Script Date: 2/14/2022 5:44:14 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aa_SolDisbursementSubmission_DisMaker_Main_delete]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[aa_SolDisbursementSubmission_DisMaker_Main_delete]
GO

/****** Object:  StoredProcedure [dbo].[aa_SolDisbursementSubmission_DisMaker_Main_delete]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[aa_SolDisbursementSubmission_DisMaker_PaymentSummary_List]    Script Date: 2/14/2022 5:44:14 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aa_SolDisbursementSubmission_DisMaker_PaymentSummary_List]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[aa_SolDisbursementSubmission_DisMaker_PaymentSummary_List]
GO

/****** Object:  StoredProcedure [dbo].[aa_SolDisbursementSubmission_DisMaker_PaymentSummary_List]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[aa_SolDisbursementSubmission_EditPaymentForCurrentSubmission]    Script Date: 2/14/2022 5:44:14 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aa_SolDisbursementSubmission_EditPaymentForCurrentSubmission]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[aa_SolDisbursementSubmission_EditPaymentForCurrentSubmission]
GO

/****** Object:  StoredProcedure [dbo].[aa_SolDisbursementSubmission_EditPaymentForCurrentSubmission]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[aa_SolDisbursementSubmission_GetLegalPaymentTabVisibility]    Script Date: 2/14/2022 5:44:14 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aa_SolDisbursementSubmission_GetLegalPaymentTabVisibility]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[aa_SolDisbursementSubmission_GetLegalPaymentTabVisibility]
GO

/****** Object:  StoredProcedure [dbo].[aa_SolDisbursementSubmission_GetLegalPaymentTabVisibility]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[aa_SolDisbursementSubmission_GetList]    Script Date: 2/14/2022 5:44:14 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aa_SolDisbursementSubmission_GetList]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[aa_SolDisbursementSubmission_GetList]
GO

/****** Object:  StoredProcedure [dbo].[aa_SolDisbursementSubmission_GetList]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[aa_SolDisbursementSubmission_GetList_BalanceAdvice]    Script Date: 2/14/2022 5:44:14 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aa_SolDisbursementSubmission_GetList_BalanceAdvice]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[aa_SolDisbursementSubmission_GetList_BalanceAdvice]
GO

/****** Object:  StoredProcedure [dbo].[aa_SolDisbursementSubmission_GetList_BalanceAdvice]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[aa_SolDisbursementSubmission_GetList_FirstRelease]    Script Date: 2/14/2022 5:44:14 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aa_SolDisbursementSubmission_GetList_FirstRelease]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[aa_SolDisbursementSubmission_GetList_FirstRelease]
GO

/****** Object:  StoredProcedure [dbo].[aa_SolDisbursementSubmission_GetList_FirstRelease]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[aa_SolDisbursementSubmission_GetList_Rejected]    Script Date: 2/14/2022 5:44:14 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aa_SolDisbursementSubmission_GetList_Rejected]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[aa_SolDisbursementSubmission_GetList_Rejected]
GO

/****** Object:  StoredProcedure [dbo].[aa_SolDisbursementSubmission_GetList_Rejected]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[aa_SolDisbursementSubmission_GetPaymentByRunningID]    Script Date: 2/14/2022 5:44:14 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aa_SolDisbursementSubmission_GetPaymentByRunningID]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[aa_SolDisbursementSubmission_GetPaymentByRunningID]
GO

/****** Object:  StoredProcedure [dbo].[aa_SolDisbursementSubmission_GetPaymentByRunningID]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[aa_SolDisbursementSubmission_GetPaymentForCurrentSubmission]    Script Date: 2/14/2022 5:44:14 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aa_SolDisbursementSubmission_GetPaymentForCurrentSubmission]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[aa_SolDisbursementSubmission_GetPaymentForCurrentSubmission]
GO

/****** Object:  StoredProcedure [dbo].[aa_SolDisbursementSubmission_GetPaymentForCurrentSubmission]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[aa_SolDisbursementSubmission_GetPaymentForCurrentSubmissionPDFForm]    Script Date: 2/14/2022 5:44:14 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aa_SolDisbursementSubmission_GetPaymentForCurrentSubmissionPDFForm]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[aa_SolDisbursementSubmission_GetPaymentForCurrentSubmissionPDFForm]
GO

/****** Object:  StoredProcedure [dbo].[aa_SolDisbursementSubmission_GetPaymentForCurrentSubmissionPDFForm]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[aa_SolDisbursementSubmission_GetPaymentHistory]    Script Date: 2/14/2022 5:44:14 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aa_SolDisbursementSubmission_GetPaymentHistory]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[aa_SolDisbursementSubmission_GetPaymentHistory]
GO

/****** Object:  StoredProcedure [dbo].[aa_SolDisbursementSubmission_GetPaymentHistory]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[aa_SolDisbursementSubmission_GetPaymentHistoryByRunningID]    Script Date: 2/14/2022 5:44:14 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aa_SolDisbursementSubmission_GetPaymentHistoryByRunningID]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[aa_SolDisbursementSubmission_GetPaymentHistoryByRunningID]
GO

/****** Object:  StoredProcedure [dbo].[aa_SolDisbursementSubmission_GetPaymentHistoryByRunningID]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[aa_SolDisbursementSubmission_GetRecord_ByARN]    Script Date: 2/14/2022 5:44:14 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aa_SolDisbursementSubmission_GetRecord_ByARN]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[aa_SolDisbursementSubmission_GetRecord_ByARN]
GO

/****** Object:  StoredProcedure [dbo].[aa_SolDisbursementSubmission_GetRecord_ByARN]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[aa_SolDisbursementSubmission_GetRecord_ByARN_ForPDFForm]    Script Date: 2/14/2022 5:44:14 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aa_SolDisbursementSubmission_GetRecord_ByARN_ForPDFForm]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[aa_SolDisbursementSubmission_GetRecord_ByARN_ForPDFForm]
GO

/****** Object:  StoredProcedure [dbo].[aa_SolDisbursementSubmission_GetRecord_ByARN_ForPDFForm]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[aa_SolDisbursementSubmission_GetRejectionReason]    Script Date: 2/14/2022 5:44:14 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aa_SolDisbursementSubmission_GetRejectionReason]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[aa_SolDisbursementSubmission_GetRejectionReason]
GO

/****** Object:  StoredProcedure [dbo].[aa_SolDisbursementSubmission_GetRejectionReason]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[aa_SolDisbursementSubmission_GetUpdateInfo_ByARN]    Script Date: 2/14/2022 5:44:14 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aa_SolDisbursementSubmission_GetUpdateInfo_ByARN]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[aa_SolDisbursementSubmission_GetUpdateInfo_ByARN]
GO

/****** Object:  StoredProcedure [dbo].[aa_SolDisbursementSubmission_GetUpdateInfo_ByARN]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[aa_SolDisbursementSubmission_Main]    Script Date: 2/14/2022 5:44:14 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aa_SolDisbursementSubmission_Main]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[aa_SolDisbursementSubmission_Main]
GO

/****** Object:  StoredProcedure [dbo].[aa_SolDisbursementSubmission_Main]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[aa_SolDisbursementSubmission_MoveToStaging]    Script Date: 2/14/2022 5:44:14 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aa_SolDisbursementSubmission_MoveToStaging]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[aa_SolDisbursementSubmission_MoveToStaging]
GO

/****** Object:  StoredProcedure [dbo].[aa_SolDisbursementSubmission_MoveToStaging]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[aa_SolDisbursementSubmission_RCOChecker_GetAssignedList_step3_GetFinalList]    Script Date: 2/14/2022 5:44:14 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aa_SolDisbursementSubmission_RCOChecker_GetAssignedList_step3_GetFinalList]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[aa_SolDisbursementSubmission_RCOChecker_GetAssignedList_step3_GetFinalList]
GO

/****** Object:  StoredProcedure [dbo].[aa_SolDisbursementSubmission_RCOChecker_GetAssignedList_step3_GetFinalList]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[aa_SolDisbursementSubmission_RCOChecker_GetNoBillingList]    Script Date: 2/14/2022 5:44:14 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aa_SolDisbursementSubmission_RCOChecker_GetNoBillingList]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[aa_SolDisbursementSubmission_RCOChecker_GetNoBillingList]
GO

/****** Object:  StoredProcedure [dbo].[aa_SolDisbursementSubmission_RCOChecker_GetNoBillingList]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[aa_SolDisbursementSubmission_RCOChecker_GetPublicList]    Script Date: 2/14/2022 5:44:14 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aa_SolDisbursementSubmission_RCOChecker_GetPublicList]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[aa_SolDisbursementSubmission_RCOChecker_GetPublicList]
GO

/****** Object:  StoredProcedure [dbo].[aa_SolDisbursementSubmission_RCOChecker_GetPublicList]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[aa_SolDisbursementSubmission_RCOChecker_GetRecordByARN]    Script Date: 2/14/2022 5:44:14 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aa_SolDisbursementSubmission_RCOChecker_GetRecordByARN]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[aa_SolDisbursementSubmission_RCOChecker_GetRecordByARN]
GO

/****** Object:  StoredProcedure [dbo].[aa_SolDisbursementSubmission_RCOChecker_GetRecordByARN]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[aa_SolDisbursementSubmission_RCOChecker_GetRejectedList]    Script Date: 2/14/2022 5:44:14 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aa_SolDisbursementSubmission_RCOChecker_GetRejectedList]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[aa_SolDisbursementSubmission_RCOChecker_GetRejectedList]
GO

/****** Object:  StoredProcedure [dbo].[aa_SolDisbursementSubmission_RCOChecker_GetRejectedList]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[aa_SolDisbursementSubmission_RCOChecker_GetRejected_ByARN]    Script Date: 2/14/2022 5:44:14 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aa_SolDisbursementSubmission_RCOChecker_GetRejected_ByARN]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[aa_SolDisbursementSubmission_RCOChecker_GetRejected_ByARN]
GO

/****** Object:  StoredProcedure [dbo].[aa_SolDisbursementSubmission_RCOChecker_GetRejected_ByARN]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[aa_SolDisbursementSubmission_RCOChecker_Main]    Script Date: 2/14/2022 5:44:14 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aa_SolDisbursementSubmission_RCOChecker_Main]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[aa_SolDisbursementSubmission_RCOChecker_Main]
GO

/****** Object:  StoredProcedure [dbo].[aa_SolDisbursementSubmission_RCOChecker_Main]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[aa_SolDisbursementSubmission_RCOChecker_Main_delete]    Script Date: 2/14/2022 5:44:14 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aa_SolDisbursementSubmission_RCOChecker_Main_delete]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[aa_SolDisbursementSubmission_RCOChecker_Main_delete]
GO

/****** Object:  StoredProcedure [dbo].[aa_SolDisbursementSubmission_RCOChecker_Main_delete]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[aa_SolDisbursementSubmission_RCOMaker_GetAssignedList_step3_GetFinalList]    Script Date: 2/14/2022 5:44:14 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aa_SolDisbursementSubmission_RCOMaker_GetAssignedList_step3_GetFinalList]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[aa_SolDisbursementSubmission_RCOMaker_GetAssignedList_step3_GetFinalList]
GO

/****** Object:  StoredProcedure [dbo].[aa_SolDisbursementSubmission_RCOMaker_GetAssignedList_step3_GetFinalList]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[aa_SolDisbursementSubmission_RCOMaker_GetPaymentForCurrentSubmission]    Script Date: 2/14/2022 5:44:14 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aa_SolDisbursementSubmission_RCOMaker_GetPaymentForCurrentSubmission]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[aa_SolDisbursementSubmission_RCOMaker_GetPaymentForCurrentSubmission]
GO

/****** Object:  StoredProcedure [dbo].[aa_SolDisbursementSubmission_RCOMaker_GetPaymentForCurrentSubmission]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[aa_SolDisbursementSubmission_RCOMaker_GetPublicList]    Script Date: 2/14/2022 5:44:14 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aa_SolDisbursementSubmission_RCOMaker_GetPublicList]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[aa_SolDisbursementSubmission_RCOMaker_GetPublicList]
GO

/****** Object:  StoredProcedure [dbo].[aa_SolDisbursementSubmission_RCOMaker_GetPublicList]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[aa_SolDisbursementSubmission_RCOMaker_GetRecordByARN]    Script Date: 2/14/2022 5:44:14 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aa_SolDisbursementSubmission_RCOMaker_GetRecordByARN]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[aa_SolDisbursementSubmission_RCOMaker_GetRecordByARN]
GO

/****** Object:  StoredProcedure [dbo].[aa_SolDisbursementSubmission_RCOMaker_GetRecordByARN]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[aa_SolDisbursementSubmission_RCOMaker_GetRejectedList]    Script Date: 2/14/2022 5:44:14 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aa_SolDisbursementSubmission_RCOMaker_GetRejectedList]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[aa_SolDisbursementSubmission_RCOMaker_GetRejectedList]
GO

/****** Object:  StoredProcedure [dbo].[aa_SolDisbursementSubmission_RCOMaker_GetRejectedList]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[aa_SolDisbursementSubmission_RCOMaker_GetRejected_ByARN]    Script Date: 2/14/2022 5:44:14 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aa_SolDisbursementSubmission_RCOMaker_GetRejected_ByARN]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[aa_SolDisbursementSubmission_RCOMaker_GetRejected_ByARN]
GO

/****** Object:  StoredProcedure [dbo].[aa_SolDisbursementSubmission_RCOMaker_GetRejected_ByARN]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[aa_SolDisbursementSubmission_RCOMaker_Main]    Script Date: 2/14/2022 5:44:14 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aa_SolDisbursementSubmission_RCOMaker_Main]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[aa_SolDisbursementSubmission_RCOMaker_Main]
GO

/****** Object:  StoredProcedure [dbo].[aa_SolDisbursementSubmission_RCOMaker_Main]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[aa_SolDisbursementSubmission_RCOMaker_Main_delete]    Script Date: 2/14/2022 5:44:14 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aa_SolDisbursementSubmission_RCOMaker_Main_delete]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[aa_SolDisbursementSubmission_RCOMaker_Main_delete]
GO

/****** Object:  StoredProcedure [dbo].[aa_SolDisbursementSubmission_RCOMaker_Main_delete]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[aa_SQLSolicitorDisbursementSubmission_Main_SelectAvailableARN]    Script Date: 2/14/2022 5:44:14 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aa_SQLSolicitorDisbursementSubmission_Main_SelectAvailableARN]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[aa_SQLSolicitorDisbursementSubmission_Main_SelectAvailableARN]
GO

/****** Object:  StoredProcedure [dbo].[aa_SQLSolicitorDisbursementSubmission_Main_SelectAvailableARN]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[aa_updatePDFID_billing]    Script Date: 2/14/2022 5:44:14 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aa_updatePDFID_billing]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[aa_updatePDFID_billing]
GO

/****** Object:  StoredProcedure [dbo].[aa_updatePDFID_billing]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[aa_vw_aaDisbursementPaymentInProgress_SelectByARN]    Script Date: 2/14/2022 5:44:14 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aa_vw_aaDisbursementPaymentInProgress_SelectByARN]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[aa_vw_aaDisbursementPaymentInProgress_SelectByARN]
GO

/****** Object:  StoredProcedure [dbo].[aa_vw_aaDisbursementPaymentInProgress_SelectByARN]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[aa_vw_aaDisbursementPaymentInProgress_SelectByRecord]    Script Date: 2/14/2022 5:44:14 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aa_vw_aaDisbursementPaymentInProgress_SelectByRecord]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[aa_vw_aaDisbursementPaymentInProgress_SelectByRecord]
GO

/****** Object:  StoredProcedure [dbo].[aa_vw_aaDisbursementPaymentInProgress_SelectByRecord]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[aa_ws_Check_ProjectDisbursementSubmissionAttachment_CheckCaseInMaster]    Script Date: 2/14/2022 5:44:14 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aa_ws_Check_ProjectDisbursementSubmissionAttachment_CheckCaseInMaster]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[aa_ws_Check_ProjectDisbursementSubmissionAttachment_CheckCaseInMaster]
GO

/****** Object:  StoredProcedure [dbo].[aa_ws_Check_ProjectDisbursementSubmissionAttachment_CheckCaseInMaster]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[aa_ws_check_SolicitorDisbursementSubmissionStillInStaging]    Script Date: 2/14/2022 5:44:14 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aa_ws_check_SolicitorDisbursementSubmissionStillInStaging]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[aa_ws_check_SolicitorDisbursementSubmissionStillInStaging]
GO

/****** Object:  StoredProcedure [dbo].[aa_ws_check_SolicitorDisbursementSubmissionStillInStaging]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[aa_ws_getEDMS_CRA06_DevPortalDisbursement_Setting]    Script Date: 2/14/2022 5:44:14 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aa_ws_getEDMS_CRA06_DevPortalDisbursement_Setting]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[aa_ws_getEDMS_CRA06_DevPortalDisbursement_Setting]
GO

/****** Object:  StoredProcedure [dbo].[aa_ws_getEDMS_CRA06_DevPortalDisbursement_Setting]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[aa_ws_getEDMS_ProjectDisbursement_Setting]    Script Date: 2/14/2022 5:44:14 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aa_ws_getEDMS_ProjectDisbursement_Setting]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[aa_ws_getEDMS_ProjectDisbursement_Setting]
GO

/****** Object:  StoredProcedure [dbo].[aa_ws_getEDMS_ProjectDisbursement_Setting]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[aa_ws_getEDMS_SolicitorDisbursement_Setting]    Script Date: 2/14/2022 5:44:14 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aa_ws_getEDMS_SolicitorDisbursement_Setting]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[aa_ws_getEDMS_SolicitorDisbursement_Setting]
GO

/****** Object:  StoredProcedure [dbo].[aa_ws_getEDMS_SolicitorDisbursement_Setting]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[aa_ws_list_SolicitorDisbursementSubmissionAttachmentInStaging]    Script Date: 2/14/2022 5:44:14 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aa_ws_list_SolicitorDisbursementSubmissionAttachmentInStaging]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[aa_ws_list_SolicitorDisbursementSubmissionAttachmentInStaging]
GO

/****** Object:  StoredProcedure [dbo].[aa_ws_list_SolicitorDisbursementSubmissionAttachmentInStaging]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[aa_ws_ProjectDisbursementResubmission_MoveFailedToMain]    Script Date: 2/14/2022 5:44:14 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aa_ws_ProjectDisbursementResubmission_MoveFailedToMain]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[aa_ws_ProjectDisbursementResubmission_MoveFailedToMain]
GO

/****** Object:  StoredProcedure [dbo].[aa_ws_ProjectDisbursementResubmission_MoveFailedToMain]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[aa_ws_ProjectDisbursementSubmission_MoveFailedToMain]    Script Date: 2/14/2022 5:44:14 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aa_ws_ProjectDisbursementSubmission_MoveFailedToMain]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[aa_ws_ProjectDisbursementSubmission_MoveFailedToMain]
GO

/****** Object:  StoredProcedure [dbo].[aa_ws_ProjectDisbursementSubmission_MoveFailedToMain]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[aa_ws_SolDisbursementSubmission_GetPreviousDUMaker]    Script Date: 2/14/2022 5:44:14 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aa_ws_SolDisbursementSubmission_GetPreviousDUMaker]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[aa_ws_SolDisbursementSubmission_GetPreviousDUMaker]
GO

/****** Object:  StoredProcedure [dbo].[aa_ws_SolDisbursementSubmission_GetPreviousDUMaker]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[aa_ws_SolDisbursementSubmission_MoveToMain]    Script Date: 2/14/2022 5:44:14 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aa_ws_SolDisbursementSubmission_MoveToMain]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[aa_ws_SolDisbursementSubmission_MoveToMain]
GO

/****** Object:  StoredProcedure [dbo].[aa_ws_SolDisbursementSubmission_MoveToMain]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[aa_ws_SolicitorDisbursementAttachment_ListByARN]    Script Date: 2/14/2022 5:44:14 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aa_ws_SolicitorDisbursementAttachment_ListByARN]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[aa_ws_SolicitorDisbursementAttachment_ListByARN]
GO

/****** Object:  StoredProcedure [dbo].[aa_ws_SolicitorDisbursementAttachment_ListByARN]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[aa_ws_solicitordisbursementattachment_preupload]    Script Date: 2/14/2022 5:44:14 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aa_ws_solicitordisbursementattachment_preupload]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[aa_ws_solicitordisbursementattachment_preupload]
GO

/****** Object:  StoredProcedure [dbo].[aa_ws_solicitordisbursementattachment_preupload]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[aa_ws_SolicitorDisbursementSubmission_getallARNInStaging]    Script Date: 2/14/2022 5:44:14 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aa_ws_SolicitorDisbursementSubmission_getallARNInStaging]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[aa_ws_SolicitorDisbursementSubmission_getallARNInStaging]
GO

/****** Object:  StoredProcedure [dbo].[aa_ws_SolicitorDisbursementSubmission_getallARNInStaging]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[aa_ws_SolicitorDisbursementSubmission_ListUploadedARN]    Script Date: 2/14/2022 5:44:14 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aa_ws_SolicitorDisbursementSubmission_ListUploadedARN]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[aa_ws_SolicitorDisbursementSubmission_ListUploadedARN]
GO

/****** Object:  StoredProcedure [dbo].[aa_ws_SolicitorDisbursementSubmission_ListUploadedARN]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[aa_ws_SolicitorDisbursementSubmission_MoveFailedToMain]    Script Date: 2/14/2022 5:44:14 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aa_ws_SolicitorDisbursementSubmission_MoveFailedToMain]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[aa_ws_SolicitorDisbursementSubmission_MoveFailedToMain]
GO

/****** Object:  StoredProcedure [dbo].[aa_ws_SolicitorDisbursementSubmission_MoveFailedToMain]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[ddAdmin_Project_Create]    Script Date: 2/14/2022 5:44:14 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ddAdmin_Project_Create]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[ddAdmin_Project_Create]
GO

/****** Object:  StoredProcedure [dbo].[ddAdmin_Project_Create]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[ddAdmin_Project_Create_Final]    Script Date: 2/14/2022 5:44:14 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ddAdmin_Project_Create_Final]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[ddAdmin_Project_Create_Final]
GO

/****** Object:  StoredProcedure [dbo].[ddAdmin_Project_Create_Final]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[ddAdmin_Project_Delete]    Script Date: 2/14/2022 5:44:13 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ddAdmin_Project_Delete]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[ddAdmin_Project_Delete]
GO

/****** Object:  StoredProcedure [dbo].[ddAdmin_Project_Delete]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[ddAdmin_Project_PasswordReset]    Script Date: 2/14/2022 5:44:13 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ddAdmin_Project_PasswordReset]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[ddAdmin_Project_PasswordReset]
GO

/****** Object:  StoredProcedure [dbo].[ddAdmin_Project_PasswordReset]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[ddAdmin_Project_PasswordReset_Final]    Script Date: 2/14/2022 5:44:13 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ddAdmin_Project_PasswordReset_Final]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[ddAdmin_Project_PasswordReset_Final]
GO

/****** Object:  StoredProcedure [dbo].[ddAdmin_Project_PasswordReset_Final]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[ddAdmin_Project_PasswordReset_GenerateEmail]    Script Date: 2/14/2022 5:44:13 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ddAdmin_Project_PasswordReset_GenerateEmail]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[ddAdmin_Project_PasswordReset_GenerateEmail]
GO

/****** Object:  StoredProcedure [dbo].[ddAdmin_Project_PasswordReset_GenerateEmail]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[ddAdmin_Project_UpdateProjectList]    Script Date: 2/14/2022 5:44:13 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ddAdmin_Project_UpdateProjectList]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[ddAdmin_Project_UpdateProjectList]
GO

/****** Object:  StoredProcedure [dbo].[ddAdmin_Project_UpdateProjectList]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[ddAdmin_Project_Update_Info]    Script Date: 2/14/2022 5:44:13 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ddAdmin_Project_Update_Info]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[ddAdmin_Project_Update_Info]
GO

/****** Object:  StoredProcedure [dbo].[ddAdmin_Project_Update_Info]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[ddAdmin_Project_Update_Password]    Script Date: 2/14/2022 5:44:13 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ddAdmin_Project_Update_Password]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[ddAdmin_Project_Update_Password]
GO

/****** Object:  StoredProcedure [dbo].[ddAdmin_Project_Update_Password]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[ddAdmin_Project_Update_Password_Final]    Script Date: 2/14/2022 5:44:13 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ddAdmin_Project_Update_Password_Final]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[ddAdmin_Project_Update_Password_Final]
GO

/****** Object:  StoredProcedure [dbo].[ddAdmin_Project_Update_Password_Final]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[ddAdmin_Project_Update_Status]    Script Date: 2/14/2022 5:44:13 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ddAdmin_Project_Update_Status]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[ddAdmin_Project_Update_Status]
GO

/****** Object:  StoredProcedure [dbo].[ddAdmin_Project_Update_Status]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[ddAdmin_Project_ValidateDeveloperCode]    Script Date: 2/14/2022 5:44:13 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ddAdmin_Project_ValidateDeveloperCode]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[ddAdmin_Project_ValidateDeveloperCode]
GO

/****** Object:  StoredProcedure [dbo].[ddAdmin_Project_ValidateDeveloperCode]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[ddAdmin_Project_ValidateProjectList]    Script Date: 2/14/2022 5:44:13 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ddAdmin_Project_ValidateProjectList]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[ddAdmin_Project_ValidateProjectList]
GO

/****** Object:  StoredProcedure [dbo].[ddAdmin_Project_ValidateProjectList]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[ddAdmin_Valuer_Update_Status]    Script Date: 2/14/2022 5:44:13 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ddAdmin_Valuer_Update_Status]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[ddAdmin_Valuer_Update_Status]
GO

/****** Object:  StoredProcedure [dbo].[ddAdmin_Valuer_Update_Status]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[ddMaintenance_SQLDeveloper_Login_Check]    Script Date: 2/14/2022 5:44:13 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ddMaintenance_SQLDeveloper_Login_Check]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[ddMaintenance_SQLDeveloper_Login_Check]
GO

/****** Object:  StoredProcedure [dbo].[ddMaintenance_SQLDeveloper_Login_Check]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[ddMaintenance_SQLDeveloper_PasswordReset_GenerateEmail]    Script Date: 2/14/2022 5:44:13 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ddMaintenance_SQLDeveloper_PasswordReset_GenerateEmail]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[ddMaintenance_SQLDeveloper_PasswordReset_GenerateEmail]
GO

/****** Object:  StoredProcedure [dbo].[ddMaintenance_SQLDeveloper_PasswordReset_GenerateEmail]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[ddMaintenance_SQLDeveloper_PasswordReset_updatePassword]    Script Date: 2/14/2022 5:44:13 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ddMaintenance_SQLDeveloper_PasswordReset_updatePassword]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[ddMaintenance_SQLDeveloper_PasswordReset_updatePassword]
GO

/****** Object:  StoredProcedure [dbo].[ddMaintenance_SQLDeveloper_PasswordReset_updatePassword]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[ddMaintenance_SQLDeveloper_PasswordReset_updatePassword_Final]    Script Date: 2/14/2022 5:44:13 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ddMaintenance_SQLDeveloper_PasswordReset_updatePassword_Final]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[ddMaintenance_SQLDeveloper_PasswordReset_updatePassword_Final]
GO

/****** Object:  StoredProcedure [dbo].[ddMaintenance_SQLDeveloper_PasswordReset_updatePassword_Final]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[ddMaintenance_SQLProject_GetCurrentPassword]    Script Date: 2/14/2022 5:44:13 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ddMaintenance_SQLProject_GetCurrentPassword]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[ddMaintenance_SQLProject_GetCurrentPassword]
GO

/****** Object:  StoredProcedure [dbo].[ddMaintenance_SQLProject_GetCurrentPassword]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[ddMaintenance_SQLProject_PasswordReset_Check]    Script Date: 2/14/2022 5:44:13 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ddMaintenance_SQLProject_PasswordReset_Check]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[ddMaintenance_SQLProject_PasswordReset_Check]
GO

/****** Object:  StoredProcedure [dbo].[ddMaintenance_SQLProject_PasswordReset_Check]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[ddMaintenance_SQLProject_PasswordUpdate]    Script Date: 2/14/2022 5:44:13 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ddMaintenance_SQLProject_PasswordUpdate]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[ddMaintenance_SQLProject_PasswordUpdate]
GO

/****** Object:  StoredProcedure [dbo].[ddMaintenance_SQLProject_PasswordUpdate]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[ddMaintenance_SQLProject_PasswordUpdate_Final]    Script Date: 2/14/2022 5:44:13 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ddMaintenance_SQLProject_PasswordUpdate_Final]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[ddMaintenance_SQLProject_PasswordUpdate_Final]
GO

/****** Object:  StoredProcedure [dbo].[ddMaintenance_SQLProject_PasswordUpdate_Final]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[ddProjectAnnouncementSettings_GetSetting]    Script Date: 2/14/2022 5:44:13 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ddProjectAnnouncementSettings_GetSetting]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[ddProjectAnnouncementSettings_GetSetting]
GO

/****** Object:  StoredProcedure [dbo].[ddProjectAnnouncementSettings_GetSetting]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[ddProjectAnnouncementSettings_SaveSetting]    Script Date: 2/14/2022 5:44:13 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ddProjectAnnouncementSettings_SaveSetting]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[ddProjectAnnouncementSettings_SaveSetting]
GO

/****** Object:  StoredProcedure [dbo].[ddProjectAnnouncementSettings_SaveSetting]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[ddProjectAnnouncement_Add]    Script Date: 2/14/2022 5:44:13 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ddProjectAnnouncement_Add]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[ddProjectAnnouncement_Add]
GO

/****** Object:  StoredProcedure [dbo].[ddProjectAnnouncement_Add]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[ddProjectAnnouncement_delete]    Script Date: 2/14/2022 5:44:13 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ddProjectAnnouncement_delete]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[ddProjectAnnouncement_delete]
GO

/****** Object:  StoredProcedure [dbo].[ddProjectAnnouncement_delete]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[ddProjectAnnouncement_Edit]    Script Date: 2/14/2022 5:44:13 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ddProjectAnnouncement_Edit]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[ddProjectAnnouncement_Edit]
GO

/****** Object:  StoredProcedure [dbo].[ddProjectAnnouncement_Edit]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[ddProjectAnnouncement_GetLatest]    Script Date: 2/14/2022 5:44:13 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ddProjectAnnouncement_GetLatest]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[ddProjectAnnouncement_GetLatest]
GO

/****** Object:  StoredProcedure [dbo].[ddProjectAnnouncement_GetLatest]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[ddProjectAnnouncement_GetLatestAttachment]    Script Date: 2/14/2022 5:44:13 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ddProjectAnnouncement_GetLatestAttachment]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[ddProjectAnnouncement_GetLatestAttachment]
GO

/****** Object:  StoredProcedure [dbo].[ddProjectAnnouncement_GetLatestAttachment]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[ddProjectAnnouncement_LatestAnnouncementReadCheck]    Script Date: 2/14/2022 5:44:13 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ddProjectAnnouncement_LatestAnnouncementReadCheck]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[ddProjectAnnouncement_LatestAnnouncementReadCheck]
GO

/****** Object:  StoredProcedure [dbo].[ddProjectAnnouncement_LatestAnnouncementReadCheck]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[ddProjectAnnouncement_List]    Script Date: 2/14/2022 5:44:13 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ddProjectAnnouncement_List]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[ddProjectAnnouncement_List]
GO

/****** Object:  StoredProcedure [dbo].[ddProjectAnnouncement_List]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[ddProjectAnnouncement_List2]    Script Date: 2/14/2022 5:44:13 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ddProjectAnnouncement_List2]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[ddProjectAnnouncement_List2]
GO

/****** Object:  StoredProcedure [dbo].[ddProjectAnnouncement_List2]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[ddProjectAnnouncement_SelectByID]    Script Date: 2/14/2022 5:44:13 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ddProjectAnnouncement_SelectByID]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[ddProjectAnnouncement_SelectByID]
GO

/****** Object:  StoredProcedure [dbo].[ddProjectAnnouncement_SelectByID]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[ddProjectDeveloperPortalSetting_GetCaseSelectionLimit]    Script Date: 2/14/2022 5:44:13 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ddProjectDeveloperPortalSetting_GetCaseSelectionLimit]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[ddProjectDeveloperPortalSetting_GetCaseSelectionLimit]
GO

/****** Object:  StoredProcedure [dbo].[ddProjectDeveloperPortalSetting_GetCaseSelectionLimit]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[ddProjectDeveloperProjectMapping_Add]    Script Date: 2/14/2022 5:44:13 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ddProjectDeveloperProjectMapping_Add]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[ddProjectDeveloperProjectMapping_Add]
GO

/****** Object:  StoredProcedure [dbo].[ddProjectDeveloperProjectMapping_Add]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[ddProjectDeveloperProjectMapping_Delete]    Script Date: 2/14/2022 5:44:13 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ddProjectDeveloperProjectMapping_Delete]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[ddProjectDeveloperProjectMapping_Delete]
GO

/****** Object:  StoredProcedure [dbo].[ddProjectDeveloperProjectMapping_Delete]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[ddProjectDeveloperProjectMapping_DeleteDraftByDeveloperCode]    Script Date: 2/14/2022 5:44:13 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ddProjectDeveloperProjectMapping_DeleteDraftByDeveloperCode]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[ddProjectDeveloperProjectMapping_DeleteDraftByDeveloperCode]
GO

/****** Object:  StoredProcedure [dbo].[ddProjectDeveloperProjectMapping_DeleteDraftByDeveloperCode]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[ddProjectDeveloperProjectMapping_List]    Script Date: 2/14/2022 5:44:13 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ddProjectDeveloperProjectMapping_List]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[ddProjectDeveloperProjectMapping_List]
GO

/****** Object:  StoredProcedure [dbo].[ddProjectDeveloperProjectMapping_List]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[ddProjectDeveloperSubUser_Create]    Script Date: 2/14/2022 5:44:13 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ddProjectDeveloperSubUser_Create]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[ddProjectDeveloperSubUser_Create]
GO

/****** Object:  StoredProcedure [dbo].[ddProjectDeveloperSubUser_Create]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[ddProjectDeveloperSubUser_Create_Final]    Script Date: 2/14/2022 5:44:13 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ddProjectDeveloperSubUser_Create_Final]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[ddProjectDeveloperSubUser_Create_Final]
GO

/****** Object:  StoredProcedure [dbo].[ddProjectDeveloperSubUser_Create_Final]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[ddProjectDeveloperSubUser_Delete]    Script Date: 2/14/2022 5:44:13 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ddProjectDeveloperSubUser_Delete]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[ddProjectDeveloperSubUser_Delete]
GO

/****** Object:  StoredProcedure [dbo].[ddProjectDeveloperSubUser_Delete]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[ddProjectDeveloperSubUser_DeveloperList]    Script Date: 2/14/2022 5:44:13 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ddProjectDeveloperSubUser_DeveloperList]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[ddProjectDeveloperSubUser_DeveloperList]
GO

/****** Object:  StoredProcedure [dbo].[ddProjectDeveloperSubUser_DeveloperList]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[ddProjectDeveloperSubUser_GetList]    Script Date: 2/14/2022 5:44:13 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ddProjectDeveloperSubUser_GetList]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[ddProjectDeveloperSubUser_GetList]
GO

/****** Object:  StoredProcedure [dbo].[ddProjectDeveloperSubUser_GetList]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[ddProjectDeveloperSubUser_GetMasterRecord]    Script Date: 2/14/2022 5:44:13 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ddProjectDeveloperSubUser_GetMasterRecord]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[ddProjectDeveloperSubUser_GetMasterRecord]
GO

/****** Object:  StoredProcedure [dbo].[ddProjectDeveloperSubUser_GetMasterRecord]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[ddProjectDeveloperSubUser_PasswordReset]    Script Date: 2/14/2022 5:44:13 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ddProjectDeveloperSubUser_PasswordReset]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[ddProjectDeveloperSubUser_PasswordReset]
GO

/****** Object:  StoredProcedure [dbo].[ddProjectDeveloperSubUser_PasswordReset]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[ddProjectDeveloperSubUser_PasswordReset_Final]    Script Date: 2/14/2022 5:44:13 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ddProjectDeveloperSubUser_PasswordReset_Final]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[ddProjectDeveloperSubUser_PasswordReset_Final]
GO

/****** Object:  StoredProcedure [dbo].[ddProjectDeveloperSubUser_PasswordReset_Final]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[ddProjectDeveloperSubUser_PasswordReset_GenerateEmail]    Script Date: 2/14/2022 5:44:13 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ddProjectDeveloperSubUser_PasswordReset_GenerateEmail]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[ddProjectDeveloperSubUser_PasswordReset_GenerateEmail]
GO

/****** Object:  StoredProcedure [dbo].[ddProjectDeveloperSubUser_PasswordReset_GenerateEmail]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[ddProjectDeveloperSubUser_Project_Update_Status]    Script Date: 2/14/2022 5:44:13 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ddProjectDeveloperSubUser_Project_Update_Status]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[ddProjectDeveloperSubUser_Project_Update_Status]
GO

/****** Object:  StoredProcedure [dbo].[ddProjectDeveloperSubUser_Project_Update_Status]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[ddProjectDeveloperSubUser_Update_Info]    Script Date: 2/14/2022 5:44:13 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ddProjectDeveloperSubUser_Update_Info]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[ddProjectDeveloperSubUser_Update_Info]
GO

/****** Object:  StoredProcedure [dbo].[ddProjectDeveloperSubUser_Update_Info]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[ddProjectDeveloperSubUser_Update_Password]    Script Date: 2/14/2022 5:44:13 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ddProjectDeveloperSubUser_Update_Password]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[ddProjectDeveloperSubUser_Update_Password]
GO

/****** Object:  StoredProcedure [dbo].[ddProjectDeveloperSubUser_Update_Password]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[ddProjectDeveloperSubUser_Update_Password_Final]    Script Date: 2/14/2022 5:44:13 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ddProjectDeveloperSubUser_Update_Password_Final]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[ddProjectDeveloperSubUser_Update_Password_Final]
GO

/****** Object:  StoredProcedure [dbo].[ddProjectDeveloperSubUser_Update_Password_Final]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[ddProjectDisbursementSubmission_AcknowledgementUpload_GetRecord]    Script Date: 2/14/2022 5:44:13 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ddProjectDisbursementSubmission_AcknowledgementUpload_GetRecord]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[ddProjectDisbursementSubmission_AcknowledgementUpload_GetRecord]
GO

/****** Object:  StoredProcedure [dbo].[ddProjectDisbursementSubmission_AcknowledgementUpload_GetRecord]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[ddProjectDisbursementSubmission_AcknowledgementUpload_SaveRecord]    Script Date: 2/14/2022 5:44:13 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ddProjectDisbursementSubmission_AcknowledgementUpload_SaveRecord]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[ddProjectDisbursementSubmission_AcknowledgementUpload_SaveRecord]
GO

/****** Object:  StoredProcedure [dbo].[ddProjectDisbursementSubmission_AcknowledgementUpload_SaveRecord]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[ddProjectDisbursementSubmission_AV_GetList]    Script Date: 2/14/2022 5:44:13 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ddProjectDisbursementSubmission_AV_GetList]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[ddProjectDisbursementSubmission_AV_GetList]
GO

/****** Object:  StoredProcedure [dbo].[ddProjectDisbursementSubmission_AV_GetList]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[ddProjectDisbursementSubmission_DisCheckerRejected_GetPaymentForCurrentSubmission]    Script Date: 2/14/2022 5:44:13 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ddProjectDisbursementSubmission_DisCheckerRejected_GetPaymentForCurrentSubmission]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[ddProjectDisbursementSubmission_DisCheckerRejected_GetPaymentForCurrentSubmission]
GO

/****** Object:  StoredProcedure [dbo].[ddProjectDisbursementSubmission_DisCheckerRejected_GetPaymentForCurrentSubmission]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[ddProjectDisbursementSubmission_DisChecker_GetRecordByARN]    Script Date: 2/14/2022 5:44:13 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ddProjectDisbursementSubmission_DisChecker_GetRecordByARN]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[ddProjectDisbursementSubmission_DisChecker_GetRecordByARN]
GO

/****** Object:  StoredProcedure [dbo].[ddProjectDisbursementSubmission_DisChecker_GetRecordByARN]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[ddProjectDisbursementSubmission_DisChecker_GetRejectedByARN]    Script Date: 2/14/2022 5:44:13 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ddProjectDisbursementSubmission_DisChecker_GetRejectedByARN]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[ddProjectDisbursementSubmission_DisChecker_GetRejectedByARN]
GO

/****** Object:  StoredProcedure [dbo].[ddProjectDisbursementSubmission_DisChecker_GetRejectedByARN]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[ddProjectDisbursementSubmission_DisChecker_Main]    Script Date: 2/14/2022 5:44:13 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ddProjectDisbursementSubmission_DisChecker_Main]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[ddProjectDisbursementSubmission_DisChecker_Main]
GO

/****** Object:  StoredProcedure [dbo].[ddProjectDisbursementSubmission_DisChecker_Main]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[ddProjectDisbursementSubmission_DisChecker_Main_PendingLA_DeleteWF]    Script Date: 2/14/2022 5:44:13 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ddProjectDisbursementSubmission_DisChecker_Main_PendingLA_DeleteWF]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[ddProjectDisbursementSubmission_DisChecker_Main_PendingLA_DeleteWF]
GO

/****** Object:  StoredProcedure [dbo].[ddProjectDisbursementSubmission_DisChecker_Main_PendingLA_DeleteWF]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[ddProjectDisbursementSubmission_DisMaker_AddPaymentForCurrentSubmission]    Script Date: 2/14/2022 5:44:13 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ddProjectDisbursementSubmission_DisMaker_AddPaymentForCurrentSubmission]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[ddProjectDisbursementSubmission_DisMaker_AddPaymentForCurrentSubmission]
GO

/****** Object:  StoredProcedure [dbo].[ddProjectDisbursementSubmission_DisMaker_AddPaymentForCurrentSubmission]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[ddProjectDisbursementSubmission_DisMaker_DeletePaymentForCurrentSubmission]    Script Date: 2/14/2022 5:44:13 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ddProjectDisbursementSubmission_DisMaker_DeletePaymentForCurrentSubmission]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[ddProjectDisbursementSubmission_DisMaker_DeletePaymentForCurrentSubmission]
GO

/****** Object:  StoredProcedure [dbo].[ddProjectDisbursementSubmission_DisMaker_DeletePaymentForCurrentSubmission]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[ddProjectDisbursementSubmission_DisMaker_EditPaymentForCurrentSubmission]    Script Date: 2/14/2022 5:44:13 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ddProjectDisbursementSubmission_DisMaker_EditPaymentForCurrentSubmission]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[ddProjectDisbursementSubmission_DisMaker_EditPaymentForCurrentSubmission]
GO

/****** Object:  StoredProcedure [dbo].[ddProjectDisbursementSubmission_DisMaker_EditPaymentForCurrentSubmission]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[ddProjectDisbursementSubmission_DisMaker_FacilityAccountMaintenance_UpdateOne]    Script Date: 2/14/2022 5:44:13 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ddProjectDisbursementSubmission_DisMaker_FacilityAccountMaintenance_UpdateOne]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[ddProjectDisbursementSubmission_DisMaker_FacilityAccountMaintenance_UpdateOne]
GO

/****** Object:  StoredProcedure [dbo].[ddProjectDisbursementSubmission_DisMaker_FacilityAccountMaintenance_UpdateOne]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[ddProjectDisbursementSubmission_DisMaker_GetDeveloperInput_ByBillingID]    Script Date: 2/14/2022 5:44:13 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ddProjectDisbursementSubmission_DisMaker_GetDeveloperInput_ByBillingID]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[ddProjectDisbursementSubmission_DisMaker_GetDeveloperInput_ByBillingID]
GO

/****** Object:  StoredProcedure [dbo].[ddProjectDisbursementSubmission_DisMaker_GetDeveloperInput_ByBillingID]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[ddProjectDisbursementSubmission_DisMaker_GetPaymentByRunningID]    Script Date: 2/14/2022 5:44:13 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ddProjectDisbursementSubmission_DisMaker_GetPaymentByRunningID]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[ddProjectDisbursementSubmission_DisMaker_GetPaymentByRunningID]
GO

/****** Object:  StoredProcedure [dbo].[ddProjectDisbursementSubmission_DisMaker_GetPaymentByRunningID]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[ddProjectDisbursementSubmission_DisMaker_GetPaymentForCurrentSubmission]    Script Date: 2/14/2022 5:44:13 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ddProjectDisbursementSubmission_DisMaker_GetPaymentForCurrentSubmission]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[ddProjectDisbursementSubmission_DisMaker_GetPaymentForCurrentSubmission]
GO

/****** Object:  StoredProcedure [dbo].[ddProjectDisbursementSubmission_DisMaker_GetPaymentForCurrentSubmission]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[ddProjectDisbursementSubmission_DisMaker_GetPendingLAList]    Script Date: 2/14/2022 5:44:13 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ddProjectDisbursementSubmission_DisMaker_GetPendingLAList]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[ddProjectDisbursementSubmission_DisMaker_GetPendingLAList]
GO

/****** Object:  StoredProcedure [dbo].[ddProjectDisbursementSubmission_DisMaker_GetPendingLAList]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[ddProjectDisbursementSubmission_DisMaker_GetRecordByARN]    Script Date: 2/14/2022 5:44:13 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ddProjectDisbursementSubmission_DisMaker_GetRecordByARN]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[ddProjectDisbursementSubmission_DisMaker_GetRecordByARN]
GO

/****** Object:  StoredProcedure [dbo].[ddProjectDisbursementSubmission_DisMaker_GetRecordByARN]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[ddProjectDisbursementSubmission_DisMaker_GetRejectedList]    Script Date: 2/14/2022 5:44:13 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ddProjectDisbursementSubmission_DisMaker_GetRejectedList]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[ddProjectDisbursementSubmission_DisMaker_GetRejectedList]
GO

/****** Object:  StoredProcedure [dbo].[ddProjectDisbursementSubmission_DisMaker_GetRejectedList]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[ddProjectDisbursementSubmission_DisMaker_GetRejected_ByARN]    Script Date: 2/14/2022 5:44:13 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ddProjectDisbursementSubmission_DisMaker_GetRejected_ByARN]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[ddProjectDisbursementSubmission_DisMaker_GetRejected_ByARN]
GO

/****** Object:  StoredProcedure [dbo].[ddProjectDisbursementSubmission_DisMaker_GetRejected_ByARN]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[ddProjectDisbursementSubmission_DisMaker_LegalFee_AddToCurrentPayment]    Script Date: 2/14/2022 5:44:13 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ddProjectDisbursementSubmission_DisMaker_LegalFee_AddToCurrentPayment]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[ddProjectDisbursementSubmission_DisMaker_LegalFee_AddToCurrentPayment]
GO

/****** Object:  StoredProcedure [dbo].[ddProjectDisbursementSubmission_DisMaker_LegalFee_AddToCurrentPayment]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[ddProjectDisbursementSubmission_DisMaker_ListByARN]    Script Date: 2/14/2022 5:44:13 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ddProjectDisbursementSubmission_DisMaker_ListByARN]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[ddProjectDisbursementSubmission_DisMaker_ListByARN]
GO

/****** Object:  StoredProcedure [dbo].[ddProjectDisbursementSubmission_DisMaker_ListByARN]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[ddProjectDisbursementSubmission_DisMaker_Main_PendingLA_DeleteWF]    Script Date: 2/14/2022 5:44:13 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ddProjectDisbursementSubmission_DisMaker_Main_PendingLA_DeleteWF]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[ddProjectDisbursementSubmission_DisMaker_Main_PendingLA_DeleteWF]
GO

/****** Object:  StoredProcedure [dbo].[ddProjectDisbursementSubmission_DisMaker_Main_PendingLA_DeleteWF]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[ddProjectDisbursementSubmission_DisMaker_MRTA_add]    Script Date: 2/14/2022 5:44:13 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ddProjectDisbursementSubmission_DisMaker_MRTA_add]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[ddProjectDisbursementSubmission_DisMaker_MRTA_add]
GO

/****** Object:  StoredProcedure [dbo].[ddProjectDisbursementSubmission_DisMaker_MRTA_add]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[ddProjectDisbursementSubmission_DisMaker_MRTA_delete]    Script Date: 2/14/2022 5:44:13 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ddProjectDisbursementSubmission_DisMaker_MRTA_delete]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[ddProjectDisbursementSubmission_DisMaker_MRTA_delete]
GO

/****** Object:  StoredProcedure [dbo].[ddProjectDisbursementSubmission_DisMaker_MRTA_delete]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[ddProjectDisbursementSubmission_DisMaker_MRTA_ExportToCurrentPayment]    Script Date: 2/14/2022 5:44:13 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ddProjectDisbursementSubmission_DisMaker_MRTA_ExportToCurrentPayment]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[ddProjectDisbursementSubmission_DisMaker_MRTA_ExportToCurrentPayment]
GO

/****** Object:  StoredProcedure [dbo].[ddProjectDisbursementSubmission_DisMaker_MRTA_ExportToCurrentPayment]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[ddProjectDisbursementSubmission_DisMaker_MRTA_GetSummary]    Script Date: 2/14/2022 5:44:13 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ddProjectDisbursementSubmission_DisMaker_MRTA_GetSummary]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[ddProjectDisbursementSubmission_DisMaker_MRTA_GetSummary]
GO

/****** Object:  StoredProcedure [dbo].[ddProjectDisbursementSubmission_DisMaker_MRTA_GetSummary]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[ddProjectDisbursementSubmission_DisMaker_MRTA_ListByARN]    Script Date: 2/14/2022 5:44:13 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ddProjectDisbursementSubmission_DisMaker_MRTA_ListByARN]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[ddProjectDisbursementSubmission_DisMaker_MRTA_ListByARN]
GO

/****** Object:  StoredProcedure [dbo].[ddProjectDisbursementSubmission_DisMaker_MRTA_ListByARN]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[ddProjectDisbursementSubmission_DisMaker_ValuationFee_AddToCurrentPayment]    Script Date: 2/14/2022 5:44:13 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ddProjectDisbursementSubmission_DisMaker_ValuationFee_AddToCurrentPayment]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[ddProjectDisbursementSubmission_DisMaker_ValuationFee_AddToCurrentPayment]
GO

/****** Object:  StoredProcedure [dbo].[ddProjectDisbursementSubmission_DisMaker_ValuationFee_AddToCurrentPayment]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[ddProjectDisbursementSubmission_DisMaker__Main]    Script Date: 2/14/2022 5:44:13 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ddProjectDisbursementSubmission_DisMaker__Main]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[ddProjectDisbursementSubmission_DisMaker__Main]
GO

/****** Object:  StoredProcedure [dbo].[ddProjectDisbursementSubmission_DisMaker__Main]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[ddProjectDisbursementSubmission_draft_CheckDoubleSubmit]    Script Date: 2/14/2022 5:44:13 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ddProjectDisbursementSubmission_draft_CheckDoubleSubmit]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[ddProjectDisbursementSubmission_draft_CheckDoubleSubmit]
GO

/****** Object:  StoredProcedure [dbo].[ddProjectDisbursementSubmission_draft_CheckDoubleSubmit]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[ddProjectDisbursementSubmission_draft_clear]    Script Date: 2/14/2022 5:44:13 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ddProjectDisbursementSubmission_draft_clear]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[ddProjectDisbursementSubmission_draft_clear]
GO

/****** Object:  StoredProcedure [dbo].[ddProjectDisbursementSubmission_draft_clear]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[ddProjectDisbursementSubmission_draft_getDeveloperCodeFromLoginID]    Script Date: 2/14/2022 5:44:13 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ddProjectDisbursementSubmission_draft_getDeveloperCodeFromLoginID]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[ddProjectDisbursementSubmission_draft_getDeveloperCodeFromLoginID]
GO

/****** Object:  StoredProcedure [dbo].[ddProjectDisbursementSubmission_draft_getDeveloperCodeFromLoginID]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[ddProjectDisbursementSubmission_draft_getDraftCount]    Script Date: 2/14/2022 5:44:13 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ddProjectDisbursementSubmission_draft_getDraftCount]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[ddProjectDisbursementSubmission_draft_getDraftCount]
GO

/****** Object:  StoredProcedure [dbo].[ddProjectDisbursementSubmission_draft_getDraftCount]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[ddProjectDisbursementSubmission_draft_import]    Script Date: 2/14/2022 5:44:13 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ddProjectDisbursementSubmission_draft_import]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[ddProjectDisbursementSubmission_draft_import]
GO

/****** Object:  StoredProcedure [dbo].[ddProjectDisbursementSubmission_draft_import]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[ddProjectDisbursementSubmission_draft_insert]    Script Date: 2/14/2022 5:44:13 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ddProjectDisbursementSubmission_draft_insert]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[ddProjectDisbursementSubmission_draft_insert]
GO

/****** Object:  StoredProcedure [dbo].[ddProjectDisbursementSubmission_draft_insert]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[ddProjectDisbursementSubmission_draft_list]    Script Date: 2/14/2022 5:44:13 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ddProjectDisbursementSubmission_draft_list]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[ddProjectDisbursementSubmission_draft_list]
GO

/****** Object:  StoredProcedure [dbo].[ddProjectDisbursementSubmission_draft_list]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[ddProjectDisbursementSubmission_draft_Master_Clear]    Script Date: 2/14/2022 5:44:13 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ddProjectDisbursementSubmission_draft_Master_Clear]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[ddProjectDisbursementSubmission_draft_Master_Clear]
GO

/****** Object:  StoredProcedure [dbo].[ddProjectDisbursementSubmission_draft_Master_Clear]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[ddProjectDisbursementSubmission_draft_Master_create]    Script Date: 2/14/2022 5:44:13 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ddProjectDisbursementSubmission_draft_Master_create]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[ddProjectDisbursementSubmission_draft_Master_create]
GO

/****** Object:  StoredProcedure [dbo].[ddProjectDisbursementSubmission_draft_Master_create]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[ddProjectDisbursementSubmission_draft_Master_GetDraftCount]    Script Date: 2/14/2022 5:44:13 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ddProjectDisbursementSubmission_draft_Master_GetDraftCount]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[ddProjectDisbursementSubmission_draft_Master_GetDraftCount]
GO

/****** Object:  StoredProcedure [dbo].[ddProjectDisbursementSubmission_draft_Master_GetDraftCount]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[ddProjectDisbursementSubmission_draft_Master_insert]    Script Date: 2/14/2022 5:44:13 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ddProjectDisbursementSubmission_draft_Master_insert]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[ddProjectDisbursementSubmission_draft_Master_insert]
GO

/****** Object:  StoredProcedure [dbo].[ddProjectDisbursementSubmission_draft_Master_insert]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[ddProjectDisbursementSubmission_draft_Master_Select]    Script Date: 2/14/2022 5:44:13 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ddProjectDisbursementSubmission_draft_Master_Select]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[ddProjectDisbursementSubmission_draft_Master_Select]
GO

/****** Object:  StoredProcedure [dbo].[ddProjectDisbursementSubmission_draft_Master_Select]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[ddProjectDisbursementSubmission_draft_Master_Select_ForPDF]    Script Date: 2/14/2022 5:44:13 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ddProjectDisbursementSubmission_draft_Master_Select_ForPDF]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[ddProjectDisbursementSubmission_draft_Master_Select_ForPDF]
GO

/****** Object:  StoredProcedure [dbo].[ddProjectDisbursementSubmission_draft_Master_Select_ForPDF]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[ddProjectDisbursementSubmission_draft_save]    Script Date: 2/14/2022 5:44:13 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ddProjectDisbursementSubmission_draft_save]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[ddProjectDisbursementSubmission_draft_save]
GO

/****** Object:  StoredProcedure [dbo].[ddProjectDisbursementSubmission_draft_save]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[ddProjectDisbursementSubmission_GetAttachmentDetailFromStaging]    Script Date: 2/14/2022 5:44:13 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ddProjectDisbursementSubmission_GetAttachmentDetailFromStaging]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[ddProjectDisbursementSubmission_GetAttachmentDetailFromStaging]
GO

/****** Object:  StoredProcedure [dbo].[ddProjectDisbursementSubmission_GetAttachmentDetailFromStaging]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[ddProjectDisbursementSubmission_GetDeveloperCodeFromLogin]    Script Date: 2/14/2022 5:44:13 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ddProjectDisbursementSubmission_GetDeveloperCodeFromLogin]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[ddProjectDisbursementSubmission_GetDeveloperCodeFromLogin]
GO

/****** Object:  StoredProcedure [dbo].[ddProjectDisbursementSubmission_GetDeveloperCodeFromLogin]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[ddProjectDisbursementSubmission_GetDraftIDFromStaging]    Script Date: 2/14/2022 5:44:13 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ddProjectDisbursementSubmission_GetDraftIDFromStaging]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[ddProjectDisbursementSubmission_GetDraftIDFromStaging]
GO

/****** Object:  StoredProcedure [dbo].[ddProjectDisbursementSubmission_GetDraftIDFromStaging]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[ddProjectDisbursementSubmission_GetList]    Script Date: 2/14/2022 5:44:13 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ddProjectDisbursementSubmission_GetList]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[ddProjectDisbursementSubmission_GetList]
GO

/****** Object:  StoredProcedure [dbo].[ddProjectDisbursementSubmission_GetList]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[ddProjectDisbursementSubmission_GetPhaseList]    Script Date: 2/14/2022 5:44:13 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ddProjectDisbursementSubmission_GetPhaseList]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[ddProjectDisbursementSubmission_GetPhaseList]
GO

/****** Object:  StoredProcedure [dbo].[ddProjectDisbursementSubmission_GetPhaseList]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[ddProjectDisbursementSubmission_GetProjectList]    Script Date: 2/14/2022 5:44:13 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ddProjectDisbursementSubmission_GetProjectList]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[ddProjectDisbursementSubmission_GetProjectList]
GO

/****** Object:  StoredProcedure [dbo].[ddProjectDisbursementSubmission_GetProjectList]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[ddProjectDisbursementSubmission_main]    Script Date: 2/14/2022 5:44:13 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ddProjectDisbursementSubmission_main]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[ddProjectDisbursementSubmission_main]
GO

/****** Object:  StoredProcedure [dbo].[ddProjectDisbursementSubmission_main]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[ddProjectDisbursementSubmission_MoveToHistory]    Script Date: 2/14/2022 5:44:13 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ddProjectDisbursementSubmission_MoveToHistory]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[ddProjectDisbursementSubmission_MoveToHistory]
GO

/****** Object:  StoredProcedure [dbo].[ddProjectDisbursementSubmission_MoveToHistory]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[ddProjectDisbursementSubmission_MoveToMain]    Script Date: 2/14/2022 5:44:13 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ddProjectDisbursementSubmission_MoveToMain]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[ddProjectDisbursementSubmission_MoveToMain]
GO

/****** Object:  StoredProcedure [dbo].[ddProjectDisbursementSubmission_MoveToMain]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[ddProjectDisbursementSubmission_MoveToMain_ByDraftARN]    Script Date: 2/14/2022 5:44:13 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ddProjectDisbursementSubmission_MoveToMain_ByDraftARN]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[ddProjectDisbursementSubmission_MoveToMain_ByDraftARN]
GO

/****** Object:  StoredProcedure [dbo].[ddProjectDisbursementSubmission_MoveToMain_ByDraftARN]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[ddProjectDisbursementSubmission_NotificationOfPayment_EDMSList]    Script Date: 2/14/2022 5:44:13 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ddProjectDisbursementSubmission_NotificationOfPayment_EDMSList]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[ddProjectDisbursementSubmission_NotificationOfPayment_EDMSList]
GO

/****** Object:  StoredProcedure [dbo].[ddProjectDisbursementSubmission_NotificationOfPayment_EDMSList]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[ddProjectDisbursementSubmission_NotificationOfPayment_EDMSStaging_MoveToCompleted]    Script Date: 2/14/2022 5:44:13 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ddProjectDisbursementSubmission_NotificationOfPayment_EDMSStaging_MoveToCompleted]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[ddProjectDisbursementSubmission_NotificationOfPayment_EDMSStaging_MoveToCompleted]
GO

/****** Object:  StoredProcedure [dbo].[ddProjectDisbursementSubmission_NotificationOfPayment_EDMSStaging_MoveToCompleted]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[ddProjectDisbursementSubmission_NotificationOfPayment_EDMS_ARNList]    Script Date: 2/14/2022 5:44:13 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ddProjectDisbursementSubmission_NotificationOfPayment_EDMS_ARNList]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[ddProjectDisbursementSubmission_NotificationOfPayment_EDMS_ARNList]
GO

/****** Object:  StoredProcedure [dbo].[ddProjectDisbursementSubmission_NotificationOfPayment_EDMS_ARNList]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[ddProjectDisbursementSubmission_NotificationOfPayment_EmailLog_list]    Script Date: 2/14/2022 5:44:13 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ddProjectDisbursementSubmission_NotificationOfPayment_EmailLog_list]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[ddProjectDisbursementSubmission_NotificationOfPayment_EmailLog_list]
GO

/****** Object:  StoredProcedure [dbo].[ddProjectDisbursementSubmission_NotificationOfPayment_EmailLog_list]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[ddProjectDisbursementSubmission_NotificationOfPayment_GetMasterList]    Script Date: 2/14/2022 5:44:13 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ddProjectDisbursementSubmission_NotificationOfPayment_GetMasterList]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[ddProjectDisbursementSubmission_NotificationOfPayment_GetMasterList]
GO

/****** Object:  StoredProcedure [dbo].[ddProjectDisbursementSubmission_NotificationOfPayment_GetMasterList]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[ddProjectDisbursementSubmission_NotificationOfPayment_GetPaymentList]    Script Date: 2/14/2022 5:44:13 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ddProjectDisbursementSubmission_NotificationOfPayment_GetPaymentList]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[ddProjectDisbursementSubmission_NotificationOfPayment_GetPaymentList]
GO

/****** Object:  StoredProcedure [dbo].[ddProjectDisbursementSubmission_NotificationOfPayment_GetPaymentList]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[ddProjectDisbursementSubmission_NotificationOfPayment_GetRecord]    Script Date: 2/14/2022 5:44:13 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ddProjectDisbursementSubmission_NotificationOfPayment_GetRecord]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[ddProjectDisbursementSubmission_NotificationOfPayment_GetRecord]
GO

/****** Object:  StoredProcedure [dbo].[ddProjectDisbursementSubmission_NotificationOfPayment_GetRecord]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[ddProjectDisbursementSubmission_NotificationOfPayment_GetRecordByRunningID]    Script Date: 2/14/2022 5:44:13 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ddProjectDisbursementSubmission_NotificationOfPayment_GetRecordByRunningID]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[ddProjectDisbursementSubmission_NotificationOfPayment_GetRecordByRunningID]
GO

/****** Object:  StoredProcedure [dbo].[ddProjectDisbursementSubmission_NotificationOfPayment_GetRecordByRunningID]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[ddProjectDisbursementSubmission_NotificationOfPayment_GetRecordCount]    Script Date: 2/14/2022 5:44:13 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ddProjectDisbursementSubmission_NotificationOfPayment_GetRecordCount]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[ddProjectDisbursementSubmission_NotificationOfPayment_GetRecordCount]
GO

/****** Object:  StoredProcedure [dbo].[ddProjectDisbursementSubmission_NotificationOfPayment_GetRecordCount]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[ddProjectDisbursementSubmission_NotificationOfPayment_MoveToCompleted]    Script Date: 2/14/2022 5:44:13 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ddProjectDisbursementSubmission_NotificationOfPayment_MoveToCompleted]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[ddProjectDisbursementSubmission_NotificationOfPayment_MoveToCompleted]
GO

/****** Object:  StoredProcedure [dbo].[ddProjectDisbursementSubmission_NotificationOfPayment_MoveToCompleted]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[ddProjectDisbursementSubmission_NotificationOfPayment_MoveToEDMSStaging]    Script Date: 2/14/2022 5:44:13 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ddProjectDisbursementSubmission_NotificationOfPayment_MoveToEDMSStaging]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[ddProjectDisbursementSubmission_NotificationOfPayment_MoveToEDMSStaging]
GO

/****** Object:  StoredProcedure [dbo].[ddProjectDisbursementSubmission_NotificationOfPayment_MoveToEDMSStaging]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[ddProjectDisbursementSubmission_NotificationOfPayment_PDFPassword_getPassword]    Script Date: 2/14/2022 5:44:13 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ddProjectDisbursementSubmission_NotificationOfPayment_PDFPassword_getPassword]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[ddProjectDisbursementSubmission_NotificationOfPayment_PDFPassword_getPassword]
GO

/****** Object:  StoredProcedure [dbo].[ddProjectDisbursementSubmission_NotificationOfPayment_PDFPassword_getPassword]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[ddProjectDisbursementSubmission_NotificationOfPayment_PDF_GenerateHTMLPaymentList]    Script Date: 2/14/2022 5:44:13 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ddProjectDisbursementSubmission_NotificationOfPayment_PDF_GenerateHTMLPaymentList]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[ddProjectDisbursementSubmission_NotificationOfPayment_PDF_GenerateHTMLPaymentList]
GO

/****** Object:  StoredProcedure [dbo].[ddProjectDisbursementSubmission_NotificationOfPayment_PDF_GenerateHTMLPaymentList]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[ddProjectDisbursementSubmission_NotificationOfPayment_PDF_GenerateHTMLPaymentList2]    Script Date: 2/14/2022 5:44:13 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ddProjectDisbursementSubmission_NotificationOfPayment_PDF_GenerateHTMLPaymentList2]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[ddProjectDisbursementSubmission_NotificationOfPayment_PDF_GenerateHTMLPaymentList2]
GO

/****** Object:  StoredProcedure [dbo].[ddProjectDisbursementSubmission_NotificationOfPayment_PDF_GenerateHTMLPaymentList2]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[ddProjectDisbursementSubmission_NotificationOfPayment_PDF_GetRecordByRunningID]    Script Date: 2/14/2022 5:44:13 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ddProjectDisbursementSubmission_NotificationOfPayment_PDF_GetRecordByRunningID]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[ddProjectDisbursementSubmission_NotificationOfPayment_PDF_GetRecordByRunningID]
GO

/****** Object:  StoredProcedure [dbo].[ddProjectDisbursementSubmission_NotificationOfPayment_PDF_GetRecordByRunningID]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[ddProjectDisbursementSubmission_NotificationOfPayment_Regenerate_GenerateHTMLPaymentList]    Script Date: 2/14/2022 5:44:13 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ddProjectDisbursementSubmission_NotificationOfPayment_Regenerate_GenerateHTMLPaymentList]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[ddProjectDisbursementSubmission_NotificationOfPayment_Regenerate_GenerateHTMLPaymentList]
GO

/****** Object:  StoredProcedure [dbo].[ddProjectDisbursementSubmission_NotificationOfPayment_Regenerate_GenerateHTMLPaymentList]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[ddProjectDisbursementSubmission_NotificationOfPayment_Regenerate_GenerateHTMLPaymentList2]    Script Date: 2/14/2022 5:44:13 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ddProjectDisbursementSubmission_NotificationOfPayment_Regenerate_GenerateHTMLPaymentList2]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[ddProjectDisbursementSubmission_NotificationOfPayment_Regenerate_GenerateHTMLPaymentList2]
GO

/****** Object:  StoredProcedure [dbo].[ddProjectDisbursementSubmission_NotificationOfPayment_Regenerate_GenerateHTMLPaymentList2]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[ddProjectDisbursementSubmission_NotificationOfPayment_Regenerate_GetMain]    Script Date: 2/14/2022 5:44:13 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ddProjectDisbursementSubmission_NotificationOfPayment_Regenerate_GetMain]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[ddProjectDisbursementSubmission_NotificationOfPayment_Regenerate_GetMain]
GO

/****** Object:  StoredProcedure [dbo].[ddProjectDisbursementSubmission_NotificationOfPayment_Regenerate_GetMain]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[ddProjectDisbursementSubmission_NotificationOfPayment_Regenerate_GetRecordCount]    Script Date: 2/14/2022 5:44:13 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ddProjectDisbursementSubmission_NotificationOfPayment_Regenerate_GetRecordCount]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[ddProjectDisbursementSubmission_NotificationOfPayment_Regenerate_GetRecordCount]
GO

/****** Object:  StoredProcedure [dbo].[ddProjectDisbursementSubmission_NotificationOfPayment_Regenerate_GetRecordCount]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[ddProjectDisbursementSubmission_NotificationOfPayment_Regenerate_Validate]    Script Date: 2/14/2022 5:44:13 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ddProjectDisbursementSubmission_NotificationOfPayment_Regenerate_Validate]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[ddProjectDisbursementSubmission_NotificationOfPayment_Regenerate_Validate]
GO

/****** Object:  StoredProcedure [dbo].[ddProjectDisbursementSubmission_NotificationOfPayment_Regenerate_Validate]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[ddProjectDisbursementSubmission_NotificationOfPayment_UpdatePDFID]    Script Date: 2/14/2022 5:44:13 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ddProjectDisbursementSubmission_NotificationOfPayment_UpdatePDFID]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[ddProjectDisbursementSubmission_NotificationOfPayment_UpdatePDFID]
GO

/****** Object:  StoredProcedure [dbo].[ddProjectDisbursementSubmission_NotificationOfPayment_UpdatePDFID]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[ddProjectDisbursementSubmission_PDF_GetCase]    Script Date: 2/14/2022 5:44:13 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ddProjectDisbursementSubmission_PDF_GetCase]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[ddProjectDisbursementSubmission_PDF_GetCase]
GO

/****** Object:  StoredProcedure [dbo].[ddProjectDisbursementSubmission_PDF_GetCase]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[ddProjectDisbursementSubmission_PDF_GetSubmissionList]    Script Date: 2/14/2022 5:44:13 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ddProjectDisbursementSubmission_PDF_GetSubmissionList]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[ddProjectDisbursementSubmission_PDF_GetSubmissionList]
GO

/****** Object:  StoredProcedure [dbo].[ddProjectDisbursementSubmission_PDF_GetSubmissionList]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[ddProjectDisbursementSubmission_RCOmaker_GetPaymentForCurrentSubmission]    Script Date: 2/14/2022 5:44:13 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ddProjectDisbursementSubmission_RCOmaker_GetPaymentForCurrentSubmission]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[ddProjectDisbursementSubmission_RCOmaker_GetPaymentForCurrentSubmission]
GO

/****** Object:  StoredProcedure [dbo].[ddProjectDisbursementSubmission_RCOmaker_GetPaymentForCurrentSubmission]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[ddProjectDisbursementSubmission_RCOMaker_GetRecordByARN]    Script Date: 2/14/2022 5:44:13 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ddProjectDisbursementSubmission_RCOMaker_GetRecordByARN]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[ddProjectDisbursementSubmission_RCOMaker_GetRecordByARN]
GO

/****** Object:  StoredProcedure [dbo].[ddProjectDisbursementSubmission_RCOMaker_GetRecordByARN]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[ddProjectDisbursementSubmission_Resubmit_GetCase]    Script Date: 2/14/2022 5:44:13 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ddProjectDisbursementSubmission_Resubmit_GetCase]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[ddProjectDisbursementSubmission_Resubmit_GetCase]
GO

/****** Object:  StoredProcedure [dbo].[ddProjectDisbursementSubmission_Resubmit_GetCase]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[ddProjectDisbursementSubmission_Resubmit_Main]    Script Date: 2/14/2022 5:44:13 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ddProjectDisbursementSubmission_Resubmit_Main]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[ddProjectDisbursementSubmission_Resubmit_Main]
GO

/****** Object:  StoredProcedure [dbo].[ddProjectDisbursementSubmission_Resubmit_Main]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[ddProjectDisbursementSubmission_Resubmit_MoveToMain]    Script Date: 2/14/2022 5:44:13 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ddProjectDisbursementSubmission_Resubmit_MoveToMain]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[ddProjectDisbursementSubmission_Resubmit_MoveToMain]
GO

/****** Object:  StoredProcedure [dbo].[ddProjectDisbursementSubmission_Resubmit_MoveToMain]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[ddProjectDisbursementSubmission_Resubmit_PDF_GetARNFromRunningID]    Script Date: 2/14/2022 5:44:13 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ddProjectDisbursementSubmission_Resubmit_PDF_GetARNFromRunningID]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[ddProjectDisbursementSubmission_Resubmit_PDF_GetARNFromRunningID]
GO

/****** Object:  StoredProcedure [dbo].[ddProjectDisbursementSubmission_Resubmit_PDF_GetARNFromRunningID]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[ddProjectDisbursementSubmission_Resubmit_PDF_GetCase]    Script Date: 2/14/2022 5:44:13 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ddProjectDisbursementSubmission_Resubmit_PDF_GetCase]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[ddProjectDisbursementSubmission_Resubmit_PDF_GetCase]
GO

/****** Object:  StoredProcedure [dbo].[ddProjectDisbursementSubmission_Resubmit_PDF_GetCase]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[ddProjectDisbursementSubmission_Resubmit_PDF_GetDevCodeFromRejectedTable]    Script Date: 2/14/2022 5:44:13 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ddProjectDisbursementSubmission_Resubmit_PDF_GetDevCodeFromRejectedTable]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[ddProjectDisbursementSubmission_Resubmit_PDF_GetDevCodeFromRejectedTable]
GO

/****** Object:  StoredProcedure [dbo].[ddProjectDisbursementSubmission_Resubmit_PDF_GetDevCodeFromRejectedTable]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[ddProjectDisbursementSubmission_Resubmit_PDF_GetListFromStaging]    Script Date: 2/14/2022 5:44:13 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ddProjectDisbursementSubmission_Resubmit_PDF_GetListFromStaging]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[ddProjectDisbursementSubmission_Resubmit_PDF_GetListFromStaging]
GO

/****** Object:  StoredProcedure [dbo].[ddProjectDisbursementSubmission_Resubmit_PDF_GetListFromStaging]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[ddProjectDisbursementSubmission_Resubmit_PDF_UpdatePDFID]    Script Date: 2/14/2022 5:44:13 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ddProjectDisbursementSubmission_Resubmit_PDF_UpdatePDFID]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[ddProjectDisbursementSubmission_Resubmit_PDF_UpdatePDFID]
GO

/****** Object:  StoredProcedure [dbo].[ddProjectDisbursementSubmission_Resubmit_PDF_UpdatePDFID]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[ddProjectDisbursementSubmission_Resubmit_ws_av_GetAttachmentListFromDraftID]    Script Date: 2/14/2022 5:44:13 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ddProjectDisbursementSubmission_Resubmit_ws_av_GetAttachmentListFromDraftID]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[ddProjectDisbursementSubmission_Resubmit_ws_av_GetAttachmentListFromDraftID]
GO

/****** Object:  StoredProcedure [dbo].[ddProjectDisbursementSubmission_Resubmit_ws_av_GetAttachmentListFromDraftID]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[ddProjectDisbursementSubmission_Resubmit_ws_av_GetRejectedRunningID]    Script Date: 2/14/2022 5:44:13 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ddProjectDisbursementSubmission_Resubmit_ws_av_GetRejectedRunningID]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[ddProjectDisbursementSubmission_Resubmit_ws_av_GetRejectedRunningID]
GO

/****** Object:  StoredProcedure [dbo].[ddProjectDisbursementSubmission_Resubmit_ws_av_GetRejectedRunningID]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[ddProjectDisbursementSubmission_Resubmit_ws_av_GetRejectedRunningIDList]    Script Date: 2/14/2022 5:44:13 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ddProjectDisbursementSubmission_Resubmit_ws_av_GetRejectedRunningIDList]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[ddProjectDisbursementSubmission_Resubmit_ws_av_GetRejectedRunningIDList]
GO

/****** Object:  StoredProcedure [dbo].[ddProjectDisbursementSubmission_Resubmit_ws_av_GetRejectedRunningIDList]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[ddProjectDisbursementSubmission_SubmissionHistory_GetRecordCount]    Script Date: 2/14/2022 5:44:13 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ddProjectDisbursementSubmission_SubmissionHistory_GetRecordCount]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[ddProjectDisbursementSubmission_SubmissionHistory_GetRecordCount]
GO

/****** Object:  StoredProcedure [dbo].[ddProjectDisbursementSubmission_SubmissionHistory_GetRecordCount]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[ddProjectDisbursementSubmission_SubmissionHistory_Select]    Script Date: 2/14/2022 5:44:13 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ddProjectDisbursementSubmission_SubmissionHistory_Select]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[ddProjectDisbursementSubmission_SubmissionHistory_Select]
GO

/****** Object:  StoredProcedure [dbo].[ddProjectDisbursementSubmission_SubmissionHistory_Select]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[ddProjectDisbursementSubmission_SubmissionHistory_Validate]    Script Date: 2/14/2022 5:44:13 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ddProjectDisbursementSubmission_SubmissionHistory_Validate]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[ddProjectDisbursementSubmission_SubmissionHistory_Validate]
GO

/****** Object:  StoredProcedure [dbo].[ddProjectDisbursementSubmission_SubmissionHistory_Validate]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  View [dbo].[ddProjectDisbursementSubmission_vw_NotificationOfPayment_Regenerate]    Script Date: 2/14/2022 5:44:14 PM ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[ddProjectDisbursementSubmission_vw_NotificationOfPayment_Regenerate]'))
DROP VIEW [dbo].[ddProjectDisbursementSubmission_vw_NotificationOfPayment_Regenerate]
GO

/****** Object:  View [dbo].[ddProjectDisbursementSubmission_vw_NotificationOfPayment_Regenerate]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[ddProjectDisbursementSubmission_WorkflowHistory_GetPhase]    Script Date: 2/14/2022 5:44:13 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ddProjectDisbursementSubmission_WorkflowHistory_GetPhase]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[ddProjectDisbursementSubmission_WorkflowHistory_GetPhase]
GO

/****** Object:  StoredProcedure [dbo].[ddProjectDisbursementSubmission_WorkflowHistory_GetPhase]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[ddProjectDisbursementSubmission_WorkflowHistory_GetProject]    Script Date: 2/14/2022 5:44:13 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ddProjectDisbursementSubmission_WorkflowHistory_GetProject]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[ddProjectDisbursementSubmission_WorkflowHistory_GetProject]
GO

/****** Object:  StoredProcedure [dbo].[ddProjectDisbursementSubmission_WorkflowHistory_GetProject]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[ddProjectDisbursementSubmission_WorkflowHistory_GetRecordCount]    Script Date: 2/14/2022 5:44:13 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ddProjectDisbursementSubmission_WorkflowHistory_GetRecordCount]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[ddProjectDisbursementSubmission_WorkflowHistory_GetRecordCount]
GO

/****** Object:  StoredProcedure [dbo].[ddProjectDisbursementSubmission_WorkflowHistory_GetRecordCount]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[ddProjectDisbursementSubmission_WorkflowHistory_Select]    Script Date: 2/14/2022 5:44:13 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ddProjectDisbursementSubmission_WorkflowHistory_Select]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[ddProjectDisbursementSubmission_WorkflowHistory_Select]
GO

/****** Object:  StoredProcedure [dbo].[ddProjectDisbursementSubmission_WorkflowHistory_Select]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[ddProjectDisbursementSubmission_WorkflowHistory_Validate]    Script Date: 2/14/2022 5:44:13 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ddProjectDisbursementSubmission_WorkflowHistory_Validate]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[ddProjectDisbursementSubmission_WorkflowHistory_Validate]
GO

/****** Object:  StoredProcedure [dbo].[ddProjectDisbursementSubmission_WorkflowHistory_Validate]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[ddProjectDisbursementSubmission_ws_av_GetARNList_ByDraft]    Script Date: 2/14/2022 5:44:13 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ddProjectDisbursementSubmission_ws_av_GetARNList_ByDraft]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[ddProjectDisbursementSubmission_ws_av_GetARNList_ByDraft]
GO

/****** Object:  StoredProcedure [dbo].[ddProjectDisbursementSubmission_ws_av_GetARNList_ByDraft]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[ddProjectDisbursementSubmission_ws_av_GetAttachmentListFromDraftID]    Script Date: 2/14/2022 5:44:13 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ddProjectDisbursementSubmission_ws_av_GetAttachmentListFromDraftID]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[ddProjectDisbursementSubmission_ws_av_GetAttachmentListFromDraftID]
GO

/****** Object:  StoredProcedure [dbo].[ddProjectDisbursementSubmission_ws_av_GetAttachmentListFromDraftID]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[ddProjectDisbursementSubmission_ws_av_GetDraft]    Script Date: 2/14/2022 5:44:13 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ddProjectDisbursementSubmission_ws_av_GetDraft]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[ddProjectDisbursementSubmission_ws_av_GetDraft]
GO

/****** Object:  StoredProcedure [dbo].[ddProjectDisbursementSubmission_ws_av_GetDraft]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[ddProjectDisbursementSubmission_ws_av_GetDraftList]    Script Date: 2/14/2022 5:44:13 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ddProjectDisbursementSubmission_ws_av_GetDraftList]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[ddProjectDisbursementSubmission_ws_av_GetDraftList]
GO

/****** Object:  StoredProcedure [dbo].[ddProjectDisbursementSubmission_ws_av_GetDraftList]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[ddProjectDisbursementSubmission_ws_av_GetSubmissionList]    Script Date: 2/14/2022 5:44:13 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ddProjectDisbursementSubmission_ws_av_GetSubmissionList]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[ddProjectDisbursementSubmission_ws_av_GetSubmissionList]
GO

/****** Object:  StoredProcedure [dbo].[ddProjectDisbursementSubmission_ws_av_GetSubmissionList]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[ddProjectDisbursementSubmission_ws_PDF_GetARN]    Script Date: 2/14/2022 5:44:13 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ddProjectDisbursementSubmission_ws_PDF_GetARN]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[ddProjectDisbursementSubmission_ws_PDF_GetARN]
GO

/****** Object:  StoredProcedure [dbo].[ddProjectDisbursementSubmission_ws_PDF_GetARN]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[ddProjectDisbursementSubmission__RCOmaker_Main]    Script Date: 2/14/2022 5:44:13 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ddProjectDisbursementSubmission__RCOmaker_Main]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[ddProjectDisbursementSubmission__RCOmaker_Main]
GO

/****** Object:  StoredProcedure [dbo].[ddProjectDisbursementSubmission__RCOmaker_Main]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[ddProjectEmailToDeveloperLog_CaseCount]    Script Date: 2/14/2022 5:44:13 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ddProjectEmailToDeveloperLog_CaseCount]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[ddProjectEmailToDeveloperLog_CaseCount]
GO

/****** Object:  StoredProcedure [dbo].[ddProjectEmailToDeveloperLog_CaseCount]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[ddProjectEmailToDeveloperLog_GetRecord]    Script Date: 2/14/2022 5:44:13 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ddProjectEmailToDeveloperLog_GetRecord]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[ddProjectEmailToDeveloperLog_GetRecord]
GO

/****** Object:  StoredProcedure [dbo].[ddProjectEmailToDeveloperLog_GetRecord]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[ddProjectEmailToDeveloperLog_Report_List]    Script Date: 2/14/2022 5:44:13 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ddProjectEmailToDeveloperLog_Report_List]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[ddProjectEmailToDeveloperLog_Report_List]
GO

/****** Object:  StoredProcedure [dbo].[ddProjectEmailToDeveloperLog_Report_List]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[ddProjectEmailToDeveloperLog_SaveRecord]    Script Date: 2/14/2022 5:44:13 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ddProjectEmailToDeveloperLog_SaveRecord]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[ddProjectEmailToDeveloperLog_SaveRecord]
GO

/****** Object:  StoredProcedure [dbo].[ddProjectEmailToDeveloperLog_SaveRecord]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[ddProjectGetActivationAndResetPwVisibilityButtonVisibilityByUser]    Script Date: 2/14/2022 5:44:13 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ddProjectGetActivationAndResetPwVisibilityButtonVisibilityByUser]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[ddProjectGetActivationAndResetPwVisibilityButtonVisibilityByUser]
GO

/****** Object:  StoredProcedure [dbo].[ddProjectGetActivationAndResetPwVisibilityButtonVisibilityByUser]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[ddProjectGetManageAnnouncementButtonVisibilityByUser]    Script Date: 2/14/2022 5:44:13 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ddProjectGetManageAnnouncementButtonVisibilityByUser]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[ddProjectGetManageAnnouncementButtonVisibilityByUser]
GO

/****** Object:  StoredProcedure [dbo].[ddProjectGetManageAnnouncementButtonVisibilityByUser]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[ddProjectGetNOPEmailReportButtonVisibilityByUser]    Script Date: 2/14/2022 5:44:13 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ddProjectGetNOPEmailReportButtonVisibilityByUser]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[ddProjectGetNOPEmailReportButtonVisibilityByUser]
GO

/****** Object:  StoredProcedure [dbo].[ddProjectGetNOPEmailReportButtonVisibilityByUser]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[ddProjectGetNOP_DevPortalButtonVisibilityByUser]    Script Date: 2/14/2022 5:44:13 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ddProjectGetNOP_DevPortalButtonVisibilityByUser]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[ddProjectGetNOP_DevPortalButtonVisibilityByUser]
GO

/****** Object:  StoredProcedure [dbo].[ddProjectGetNOP_DevPortalButtonVisibilityByUser]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[ddProjectGetNotificationOfPaymentSettingButtonVisibilityByUser]    Script Date: 2/14/2022 5:44:13 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ddProjectGetNotificationOfPaymentSettingButtonVisibilityByUser]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[ddProjectGetNotificationOfPaymentSettingButtonVisibilityByUser]
GO

/****** Object:  StoredProcedure [dbo].[ddProjectGetNotificationOfPaymentSettingButtonVisibilityByUser]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[ddProjectGetOneTimeEmailToDevReportButtonVisibilityByUser]    Script Date: 2/14/2022 5:44:13 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ddProjectGetOneTimeEmailToDevReportButtonVisibilityByUser]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[ddProjectGetOneTimeEmailToDevReportButtonVisibilityByUser]
GO

/****** Object:  StoredProcedure [dbo].[ddProjectGetOneTimeEmailToDevReportButtonVisibilityByUser]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[ddProjectGetPaymentHistoryReportButtonVisibilityByUser]    Script Date: 2/14/2022 5:44:13 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ddProjectGetPaymentHistoryReportButtonVisibilityByUser]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[ddProjectGetPaymentHistoryReportButtonVisibilityByUser]
GO

/****** Object:  StoredProcedure [dbo].[ddProjectGetPaymentHistoryReportButtonVisibilityByUser]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[ddProjectGetPhaseEmailReportButtonVisibilityByUser]    Script Date: 2/14/2022 5:44:13 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ddProjectGetPhaseEmailReportButtonVisibilityByUser]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[ddProjectGetPhaseEmailReportButtonVisibilityByUser]
GO

/****** Object:  StoredProcedure [dbo].[ddProjectGetPhaseEmailReportButtonVisibilityByUser]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[ddProjectGetProgressiveBillingReportButtonVisibilityByUser]    Script Date: 2/14/2022 5:44:13 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ddProjectGetProgressiveBillingReportButtonVisibilityByUser]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[ddProjectGetProgressiveBillingReportButtonVisibilityByUser]
GO

/****** Object:  StoredProcedure [dbo].[ddProjectGetProgressiveBillingReportButtonVisibilityByUser]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[ddProjectGetSADAReportButtonVisibilityByUser]    Script Date: 2/14/2022 5:44:13 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ddProjectGetSADAReportButtonVisibilityByUser]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[ddProjectGetSADAReportButtonVisibilityByUser]
GO

/****** Object:  StoredProcedure [dbo].[ddProjectGetSADAReportButtonVisibilityByUser]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[ddProjectGetSendDeveloperLoginIDEmailButtonVisibilityByUser]    Script Date: 2/14/2022 5:44:13 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ddProjectGetSendDeveloperLoginIDEmailButtonVisibilityByUser]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[ddProjectGetSendDeveloperLoginIDEmailButtonVisibilityByUser]
GO

/****** Object:  StoredProcedure [dbo].[ddProjectGetSendDeveloperLoginIDEmailButtonVisibilityByUser]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[ddProjectLoginSessionCheck]    Script Date: 2/14/2022 5:44:13 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ddProjectLoginSessionCheck]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[ddProjectLoginSessionCheck]
GO

/****** Object:  StoredProcedure [dbo].[ddProjectLoginSessionCheck]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[ddProjectLogin_ForcePasswordChangeCheck]    Script Date: 2/14/2022 5:44:13 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ddProjectLogin_ForcePasswordChangeCheck]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[ddProjectLogin_ForcePasswordChangeCheck]
GO

/****** Object:  StoredProcedure [dbo].[ddProjectLogin_ForcePasswordChangeCheck]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[ddProjectLogin_GetExpiryWarning]    Script Date: 2/14/2022 5:44:13 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ddProjectLogin_GetExpiryWarning]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[ddProjectLogin_GetExpiryWarning]
GO

/****** Object:  StoredProcedure [dbo].[ddProjectLogin_GetExpiryWarning]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[ddProjectLogin_getNumberOfTrialLeft]    Script Date: 2/14/2022 5:44:13 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ddProjectLogin_getNumberOfTrialLeft]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[ddProjectLogin_getNumberOfTrialLeft]
GO

/****** Object:  StoredProcedure [dbo].[ddProjectLogin_getNumberOfTrialLeft]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[ddProjectLogin_SaveLastLoginDatetime]    Script Date: 2/14/2022 5:44:13 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ddProjectLogin_SaveLastLoginDatetime]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[ddProjectLogin_SaveLastLoginDatetime]
GO

/****** Object:  StoredProcedure [dbo].[ddProjectLogin_SaveLastLoginDatetime]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[ddProjectMortgageAppTaskInstance_billing]    Script Date: 2/14/2022 5:44:13 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ddProjectMortgageAppTaskInstance_billing]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[ddProjectMortgageAppTaskInstance_billing]
GO

/****** Object:  StoredProcedure [dbo].[ddProjectMortgageAppTaskInstance_billing]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[ddProjectNotificationOfPayment_Setting_Select]    Script Date: 2/14/2022 5:44:13 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ddProjectNotificationOfPayment_Setting_Select]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[ddProjectNotificationOfPayment_Setting_Select]
GO

/****** Object:  StoredProcedure [dbo].[ddProjectNotificationOfPayment_Setting_Select]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[ddProjectNotificationOfPayment_Setting_Update]    Script Date: 2/14/2022 5:44:13 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ddProjectNotificationOfPayment_Setting_Update]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[ddProjectNotificationOfPayment_Setting_Update]
GO

/****** Object:  StoredProcedure [dbo].[ddProjectNotificationOfPayment_Setting_Update]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[ddProjectPasswordHistoryList]    Script Date: 2/14/2022 5:44:13 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ddProjectPasswordHistoryList]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[ddProjectPasswordHistoryList]
GO

/****** Object:  StoredProcedure [dbo].[ddProjectPasswordHistoryList]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[ddProjectPhase_Create]    Script Date: 2/14/2022 5:44:13 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ddProjectPhase_Create]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[ddProjectPhase_Create]
GO

/****** Object:  StoredProcedure [dbo].[ddProjectPhase_Create]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[ddProjectPhase_Create_Final]    Script Date: 2/14/2022 5:44:13 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ddProjectPhase_Create_Final]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[ddProjectPhase_Create_Final]
GO

/****** Object:  StoredProcedure [dbo].[ddProjectPhase_Create_Final]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[ddProjectPhase_Delete]    Script Date: 2/14/2022 5:44:13 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ddProjectPhase_Delete]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[ddProjectPhase_Delete]
GO

/****** Object:  StoredProcedure [dbo].[ddProjectPhase_Delete]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[ddProjectPhase_DetectPhaseInfo]    Script Date: 2/14/2022 5:44:13 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ddProjectPhase_DetectPhaseInfo]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[ddProjectPhase_DetectPhaseInfo]
GO

/****** Object:  StoredProcedure [dbo].[ddProjectPhase_DetectPhaseInfo]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[ddProjectPhase_DeveloperList]    Script Date: 2/14/2022 5:44:13 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ddProjectPhase_DeveloperList]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[ddProjectPhase_DeveloperList]
GO

/****** Object:  StoredProcedure [dbo].[ddProjectPhase_DeveloperList]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[ddProjectPhase_GetList]    Script Date: 2/14/2022 5:44:13 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ddProjectPhase_GetList]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[ddProjectPhase_GetList]
GO

/****** Object:  StoredProcedure [dbo].[ddProjectPhase_GetList]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[ddProjectPhase_GetProjectMasterRecord]    Script Date: 2/14/2022 5:44:13 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ddProjectPhase_GetProjectMasterRecord]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[ddProjectPhase_GetProjectMasterRecord]
GO

/****** Object:  StoredProcedure [dbo].[ddProjectPhase_GetProjectMasterRecord]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[ddProjectPhase_PhaseCodeListByDeveloperCode]    Script Date: 2/14/2022 5:44:13 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ddProjectPhase_PhaseCodeListByDeveloperCode]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[ddProjectPhase_PhaseCodeListByDeveloperCode]
GO

/****** Object:  StoredProcedure [dbo].[ddProjectPhase_PhaseCodeListByDeveloperCode]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[ddProjectPhase_ProjectListByDeveloperCode]    Script Date: 2/14/2022 5:44:13 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ddProjectPhase_ProjectListByDeveloperCode]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[ddProjectPhase_ProjectListByDeveloperCode]
GO

/****** Object:  StoredProcedure [dbo].[ddProjectPhase_ProjectListByDeveloperCode]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[ddProjectPhase_Update]    Script Date: 2/14/2022 5:44:13 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ddProjectPhase_Update]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[ddProjectPhase_Update]
GO

/****** Object:  StoredProcedure [dbo].[ddProjectPhase_Update]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[ddProjectSession_CheckAndAction]    Script Date: 2/14/2022 5:44:13 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ddProjectSession_CheckAndAction]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[ddProjectSession_CheckAndAction]
GO

/****** Object:  StoredProcedure [dbo].[ddProjectSession_CheckAndAction]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[ddProjectSession_Create]    Script Date: 2/14/2022 5:44:13 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ddProjectSession_Create]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[ddProjectSession_Create]
GO

/****** Object:  StoredProcedure [dbo].[ddProjectSession_Create]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[ddProjectSession_DeclaimerAcceptance]    Script Date: 2/14/2022 5:44:13 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ddProjectSession_DeclaimerAcceptance]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[ddProjectSession_DeclaimerAcceptance]
GO

/****** Object:  StoredProcedure [dbo].[ddProjectSession_DeclaimerAcceptance]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[ddProjectSession_DeclaimerCheck]    Script Date: 2/14/2022 5:44:13 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ddProjectSession_DeclaimerCheck]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[ddProjectSession_DeclaimerCheck]
GO

/****** Object:  StoredProcedure [dbo].[ddProjectSession_DeclaimerCheck]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[ddProjectSession_Delete]    Script Date: 2/14/2022 5:44:13 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ddProjectSession_Delete]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[ddProjectSession_Delete]
GO

/****** Object:  StoredProcedure [dbo].[ddProjectSession_Delete]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[ddProjectSession_GetSessionTime]    Script Date: 2/14/2022 5:44:13 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ddProjectSession_GetSessionTime]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[ddProjectSession_GetSessionTime]
GO

/****** Object:  StoredProcedure [dbo].[ddProjectSession_GetSessionTime]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[ddProject_Admin_PasswordReset_SaveLog]    Script Date: 2/14/2022 5:44:13 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ddProject_Admin_PasswordReset_SaveLog]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[ddProject_Admin_PasswordReset_SaveLog]
GO

/****** Object:  StoredProcedure [dbo].[ddProject_Admin_PasswordReset_SaveLog]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[ddProject_Admin_PaymentHistory_GetDevCode]    Script Date: 2/14/2022 5:44:13 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ddProject_Admin_PaymentHistory_GetDevCode]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[ddProject_Admin_PaymentHistory_GetDevCode]
GO

/****** Object:  StoredProcedure [dbo].[ddProject_Admin_PaymentHistory_GetDevCode]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[ddProject_Admin_PaymentHistory_GetPhaseCode]    Script Date: 2/14/2022 5:44:13 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ddProject_Admin_PaymentHistory_GetPhaseCode]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[ddProject_Admin_PaymentHistory_GetPhaseCode]
GO

/****** Object:  StoredProcedure [dbo].[ddProject_Admin_PaymentHistory_GetPhaseCode]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[ddProject_Admin_PaymentHistory_GetProjectCode]    Script Date: 2/14/2022 5:44:13 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ddProject_Admin_PaymentHistory_GetProjectCode]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[ddProject_Admin_PaymentHistory_GetProjectCode]
GO

/****** Object:  StoredProcedure [dbo].[ddProject_Admin_PaymentHistory_GetProjectCode]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[ddProject_Admin_PaymentHistory_GetRecordCount]    Script Date: 2/14/2022 5:44:13 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ddProject_Admin_PaymentHistory_GetRecordCount]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[ddProject_Admin_PaymentHistory_GetRecordCount]
GO

/****** Object:  StoredProcedure [dbo].[ddProject_Admin_PaymentHistory_GetRecordCount]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[ddProject_Admin_PaymentHistory_List]    Script Date: 2/14/2022 5:44:13 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ddProject_Admin_PaymentHistory_List]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[ddProject_Admin_PaymentHistory_List]
GO

/****** Object:  StoredProcedure [dbo].[ddProject_Admin_PaymentHistory_List]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[ddProject_Admin_PaymentHistory_Validate]    Script Date: 2/14/2022 5:44:13 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ddProject_Admin_PaymentHistory_Validate]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[ddProject_Admin_PaymentHistory_Validate]
GO

/****** Object:  StoredProcedure [dbo].[ddProject_Admin_PaymentHistory_Validate]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[ddProject_Admin_ProgressiveBilling_GetRecordCount]    Script Date: 2/14/2022 5:44:13 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ddProject_Admin_ProgressiveBilling_GetRecordCount]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[ddProject_Admin_ProgressiveBilling_GetRecordCount]
GO

/****** Object:  StoredProcedure [dbo].[ddProject_Admin_ProgressiveBilling_GetRecordCount]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[ddProject_Admin_ProgressiveBilling_ListResult]    Script Date: 2/14/2022 5:44:13 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ddProject_Admin_ProgressiveBilling_ListResult]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[ddProject_Admin_ProgressiveBilling_ListResult]
GO

/****** Object:  StoredProcedure [dbo].[ddProject_Admin_ProgressiveBilling_ListResult]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[ddProject_Admin_ProgressiveBilling_Validate]    Script Date: 2/14/2022 5:44:13 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ddProject_Admin_ProgressiveBilling_Validate]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[ddProject_Admin_ProgressiveBilling_Validate]
GO

/****** Object:  StoredProcedure [dbo].[ddProject_Admin_ProgressiveBilling_Validate]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[ddProject_Admin_ProgrressiveBilling_Validate]    Script Date: 2/14/2022 5:44:13 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ddProject_Admin_ProgrressiveBilling_Validate]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[ddProject_Admin_ProgrressiveBilling_Validate]
GO

/****** Object:  StoredProcedure [dbo].[ddProject_Admin_ProgrressiveBilling_Validate]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[ddProject_Datetime_HourList]    Script Date: 2/14/2022 5:44:13 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ddProject_Datetime_HourList]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[ddProject_Datetime_HourList]
GO

/****** Object:  StoredProcedure [dbo].[ddProject_Datetime_HourList]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[ddProject_Datetime_MinuteList]    Script Date: 2/14/2022 5:44:13 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ddProject_Datetime_MinuteList]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[ddProject_Datetime_MinuteList]
GO

/****** Object:  StoredProcedure [dbo].[ddProject_Datetime_MinuteList]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[ddProject_DetectProjectCode]    Script Date: 2/14/2022 5:44:13 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ddProject_DetectProjectCode]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[ddProject_DetectProjectCode]
GO

/****** Object:  StoredProcedure [dbo].[ddProject_DetectProjectCode]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[ddProject_DetectProjectCode_GetCount]    Script Date: 2/14/2022 5:44:13 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ddProject_DetectProjectCode_GetCount]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[ddProject_DetectProjectCode_GetCount]
GO

/****** Object:  StoredProcedure [dbo].[ddProject_DetectProjectCode_GetCount]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[ddProject_DetectProjectCode_s1]    Script Date: 2/14/2022 5:44:13 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ddProject_DetectProjectCode_s1]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[ddProject_DetectProjectCode_s1]
GO

/****** Object:  StoredProcedure [dbo].[ddProject_DetectProjectCode_s1]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[ddProject_DetectProjectCode_s2]    Script Date: 2/14/2022 5:44:13 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ddProject_DetectProjectCode_s2]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[ddProject_DetectProjectCode_s2]
GO

/****** Object:  StoredProcedure [dbo].[ddProject_DetectProjectCode_s2]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[ddProject_DetectProjectCode_s3]    Script Date: 2/14/2022 5:44:13 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ddProject_DetectProjectCode_s3]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[ddProject_DetectProjectCode_s3]
GO

/****** Object:  StoredProcedure [dbo].[ddProject_DetectProjectCode_s3]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[ddProject_DeveloperLoginLog_List]    Script Date: 2/14/2022 5:44:13 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ddProject_DeveloperLoginLog_List]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[ddProject_DeveloperLoginLog_List]
GO

/****** Object:  StoredProcedure [dbo].[ddProject_DeveloperLoginLog_List]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[ddproject_DeveloperLoginTrialSession_FailedAttemptLog_RptGen]    Script Date: 2/14/2022 5:44:13 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ddproject_DeveloperLoginTrialSession_FailedAttemptLog_RptGen]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[ddproject_DeveloperLoginTrialSession_FailedAttemptLog_RptGen]
GO

/****** Object:  StoredProcedure [dbo].[ddproject_DeveloperLoginTrialSession_FailedAttemptLog_RptGen]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[ddproject_DeveloperLogin_DormantID_RptGen]    Script Date: 2/14/2022 5:44:13 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ddproject_DeveloperLogin_DormantID_RptGen]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[ddproject_DeveloperLogin_DormantID_RptGen]
GO

/****** Object:  StoredProcedure [dbo].[ddproject_DeveloperLogin_DormantID_RptGen]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[ddProject_Email_AuditTrail_Select]    Script Date: 2/14/2022 5:44:13 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ddProject_Email_AuditTrail_Select]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[ddProject_Email_AuditTrail_Select]
GO

/****** Object:  StoredProcedure [dbo].[ddProject_Email_AuditTrail_Select]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[ddProject_GetLoginPasswordRequirement]    Script Date: 2/14/2022 5:44:13 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ddProject_GetLoginPasswordRequirement]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[ddProject_GetLoginPasswordRequirement]
GO

/****** Object:  StoredProcedure [dbo].[ddProject_GetLoginPasswordRequirement]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[ddProject_getPassword]    Script Date: 2/14/2022 5:44:13 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ddProject_getPassword]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[ddProject_getPassword]
GO

/****** Object:  StoredProcedure [dbo].[ddProject_getPassword]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[ddProject_GetProjectMasterList]    Script Date: 2/14/2022 5:44:13 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ddProject_GetProjectMasterList]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[ddProject_GetProjectMasterList]
GO

/****** Object:  StoredProcedure [dbo].[ddProject_GetProjectMasterList]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[ddProject_GetProjectMasterRecord]    Script Date: 2/14/2022 5:44:13 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ddProject_GetProjectMasterRecord]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[ddProject_GetProjectMasterRecord]
GO

/****** Object:  StoredProcedure [dbo].[ddProject_GetProjectMasterRecord]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[ddProject_InactiveDeveloperLoginID_Activate]    Script Date: 2/14/2022 5:44:13 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ddProject_InactiveDeveloperLoginID_Activate]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[ddProject_InactiveDeveloperLoginID_Activate]
GO

/****** Object:  StoredProcedure [dbo].[ddProject_InactiveDeveloperLoginID_Activate]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[ddProject_InactiveDeveloperLoginID_GetList]    Script Date: 2/14/2022 5:44:13 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ddProject_InactiveDeveloperLoginID_GetList]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[ddProject_InactiveDeveloperLoginID_GetList]
GO

/****** Object:  StoredProcedure [dbo].[ddProject_InactiveDeveloperLoginID_GetList]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[ddProject_LoadDevPortalNewFields]    Script Date: 2/14/2022 5:44:13 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ddProject_LoadDevPortalNewFields]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[ddProject_LoadDevPortalNewFields]
GO

/****** Object:  StoredProcedure [dbo].[ddProject_LoadDevPortalNewFields]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[ddProject_LoadDevPortalNewFields_GetCase]    Script Date: 2/14/2022 5:44:13 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ddProject_LoadDevPortalNewFields_GetCase]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[ddProject_LoadDevPortalNewFields_GetCase]
GO

/****** Object:  StoredProcedure [dbo].[ddProject_LoadDevPortalNewFields_GetCase]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[ddProject_LOADSUpdatePhaseCode_Select]    Script Date: 2/14/2022 5:44:13 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ddProject_LOADSUpdatePhaseCode_Select]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[ddProject_LOADSUpdatePhaseCode_Select]
GO

/****** Object:  StoredProcedure [dbo].[ddProject_LOADSUpdatePhaseCode_Select]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[ddProject_LOADSUpdatePhaseCode_Update]    Script Date: 2/14/2022 5:44:13 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ddProject_LOADSUpdatePhaseCode_Update]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[ddProject_LOADSUpdatePhaseCode_Update]
GO

/****** Object:  StoredProcedure [dbo].[ddProject_LOADSUpdatePhaseCode_Update]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[ddProject_Login]    Script Date: 2/14/2022 5:44:13 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ddProject_Login]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[ddProject_Login]
GO

/****** Object:  StoredProcedure [dbo].[ddProject_Login]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[ddProject_MortgageAppTaskInstance_billing_RecordCount]    Script Date: 2/14/2022 5:44:13 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ddProject_MortgageAppTaskInstance_billing_RecordCount]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[ddProject_MortgageAppTaskInstance_billing_RecordCount]
GO

/****** Object:  StoredProcedure [dbo].[ddProject_MortgageAppTaskInstance_billing_RecordCount]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[ddProject_MortgageAppTaskInstance_create]    Script Date: 2/14/2022 5:44:13 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ddProject_MortgageAppTaskInstance_create]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[ddProject_MortgageAppTaskInstance_create]
GO

/****** Object:  StoredProcedure [dbo].[ddProject_MortgageAppTaskInstance_create]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[ddProject_MortgageAppTaskInstance_delete]    Script Date: 2/14/2022 5:44:13 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ddProject_MortgageAppTaskInstance_delete]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[ddProject_MortgageAppTaskInstance_delete]
GO

/****** Object:  StoredProcedure [dbo].[ddProject_MortgageAppTaskInstance_delete]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[ddProject_MortgageCenter_List]    Script Date: 2/14/2022 5:44:13 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ddProject_MortgageCenter_List]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[ddProject_MortgageCenter_List]
GO

/****** Object:  StoredProcedure [dbo].[ddProject_MortgageCenter_List]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[ddProject_NewPhaseCodeEmail_CaseCount]    Script Date: 2/14/2022 5:44:13 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ddProject_NewPhaseCodeEmail_CaseCount]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[ddProject_NewPhaseCodeEmail_CaseCount]
GO

/****** Object:  StoredProcedure [dbo].[ddProject_NewPhaseCodeEmail_CaseCount]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[ddProject_NewPhaseCodeEmail_List]    Script Date: 2/14/2022 5:44:13 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ddProject_NewPhaseCodeEmail_List]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[ddProject_NewPhaseCodeEmail_List]
GO

/****** Object:  StoredProcedure [dbo].[ddProject_NewPhaseCodeEmail_List]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[ddProject_NewPhaseCodeEmail_SaveRecord]    Script Date: 2/14/2022 5:44:13 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ddProject_NewPhaseCodeEmail_SaveRecord]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[ddProject_NewPhaseCodeEmail_SaveRecord]
GO

/****** Object:  StoredProcedure [dbo].[ddProject_NewPhaseCodeEmail_SaveRecord]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[ddProject_NOP_Email_CheckFlag]    Script Date: 2/14/2022 5:44:13 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ddProject_NOP_Email_CheckFlag]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[ddProject_NOP_Email_CheckFlag]
GO

/****** Object:  StoredProcedure [dbo].[ddProject_NOP_Email_CheckFlag]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[ddProject_NOP_Email_GetList]    Script Date: 2/14/2022 5:44:13 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ddProject_NOP_Email_GetList]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[ddProject_NOP_Email_GetList]
GO

/****** Object:  StoredProcedure [dbo].[ddProject_NOP_Email_GetList]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[ddProject_NOP_Email_GetRecord]    Script Date: 2/14/2022 5:44:13 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ddProject_NOP_Email_GetRecord]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[ddProject_NOP_Email_GetRecord]
GO

/****** Object:  StoredProcedure [dbo].[ddProject_NOP_Email_GetRecord]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[ddProject_NOP_Email_Log]    Script Date: 2/14/2022 5:44:13 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ddProject_NOP_Email_Log]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[ddProject_NOP_Email_Log]
GO

/****** Object:  StoredProcedure [dbo].[ddProject_NOP_Email_Log]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[ddProject_PasswordReset_GenerateEmail]    Script Date: 2/14/2022 5:44:13 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ddProject_PasswordReset_GenerateEmail]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[ddProject_PasswordReset_GenerateEmail]
GO

/****** Object:  StoredProcedure [dbo].[ddProject_PasswordReset_GenerateEmail]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[ddProject_PasswordReset_GetList]    Script Date: 2/14/2022 5:44:13 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ddProject_PasswordReset_GetList]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[ddProject_PasswordReset_GetList]
GO

/****** Object:  StoredProcedure [dbo].[ddProject_PasswordReset_GetList]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[ddProject_PasswordReset_PasswordReset]    Script Date: 2/14/2022 5:44:13 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ddProject_PasswordReset_PasswordReset]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[ddProject_PasswordReset_PasswordReset]
GO

/****** Object:  StoredProcedure [dbo].[ddProject_PasswordReset_PasswordReset]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[ddProject_PasswordReset_PasswordReset_Final]    Script Date: 2/14/2022 5:44:13 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ddProject_PasswordReset_PasswordReset_Final]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[ddProject_PasswordReset_PasswordReset_Final]
GO

/****** Object:  StoredProcedure [dbo].[ddProject_PasswordReset_PasswordReset_Final]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[ddProject_SADA_AuditTrail_Select]    Script Date: 2/14/2022 5:44:13 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ddProject_SADA_AuditTrail_Select]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[ddProject_SADA_AuditTrail_Select]
GO

/****** Object:  StoredProcedure [dbo].[ddProject_SADA_AuditTrail_Select]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[ddProject_UserIDEmail_GenerateEmail]    Script Date: 2/14/2022 5:44:13 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ddProject_UserIDEmail_GenerateEmail]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[ddProject_UserIDEmail_GenerateEmail]
GO

/****** Object:  StoredProcedure [dbo].[ddProject_UserIDEmail_GenerateEmail]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[ddProject_UserIDEmail_GetEncryptedPassword]    Script Date: 2/14/2022 5:44:13 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ddProject_UserIDEmail_GetEncryptedPassword]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[ddProject_UserIDEmail_GetEncryptedPassword]
GO

/****** Object:  StoredProcedure [dbo].[ddProject_UserIDEmail_GetEncryptedPassword]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[ddProject_UserIDEmail_List]    Script Date: 2/14/2022 5:44:13 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ddProject_UserIDEmail_List]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[ddProject_UserIDEmail_List]
GO

/****** Object:  StoredProcedure [dbo].[ddProject_UserIDEmail_List]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[ddProject_UserIDEmail_SaveRecord]    Script Date: 2/14/2022 5:44:13 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ddProject_UserIDEmail_SaveRecord]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[ddProject_UserIDEmail_SaveRecord]
GO

/****** Object:  StoredProcedure [dbo].[ddProject_UserIDEmail_SaveRecord]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  View [dbo].[ddProject_vw_DeveloperLogin]    Script Date: 2/14/2022 5:44:15 PM ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[ddProject_vw_DeveloperLogin]'))
DROP VIEW [dbo].[ddProject_vw_DeveloperLogin]
GO

/****** Object:  View [dbo].[ddProject_vw_DeveloperLogin]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  View [dbo].[ddProject_vw_MortgageAppTaskInstance]    Script Date: 2/14/2022 5:44:14 PM ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[ddProject_vw_MortgageAppTaskInstance]'))
DROP VIEW [dbo].[ddProject_vw_MortgageAppTaskInstance]
GO

/****** Object:  View [dbo].[ddProject_vw_MortgageAppTaskInstance]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[DisbursementSubmission_GetFacilityAccountList]    Script Date: 2/14/2022 5:44:13 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DisbursementSubmission_GetFacilityAccountList]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[DisbursementSubmission_GetFacilityAccountList]
GO

/****** Object:  StoredProcedure [dbo].[DisbursementSubmission_GetFacilityAccountList]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  UserDefinedFunction [dbo].[fn_split_string_to_column]    Script Date: 2/14/2022 5:44:15 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[fn_split_string_to_column]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [dbo].[fn_split_string_to_column]
GO

/****** Object:  UserDefinedFunction [dbo].[fn_split_string_to_column]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  UserDefinedFunction [dbo].[fn_split_string_to_column2]    Script Date: 2/14/2022 5:44:15 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[fn_split_string_to_column2]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [dbo].[fn_split_string_to_column2]
GO

/****** Object:  UserDefinedFunction [dbo].[fn_split_string_to_column2]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  UserDefinedFunction [dbo].[func_Split]    Script Date: 2/14/2022 5:44:15 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[func_Split]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [dbo].[func_Split]
GO

/****** Object:  UserDefinedFunction [dbo].[func_Split]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  UserDefinedFunction [dbo].[GetContextUser]    Script Date: 2/14/2022 5:44:15 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GetContextUser]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [dbo].[GetContextUser]
GO

/****** Object:  UserDefinedFunction [dbo].[GetContextUser]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  UserDefinedFunction [dbo].[IsInt]    Script Date: 2/14/2022 5:44:15 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[IsInt]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [dbo].[IsInt]
GO

/****** Object:  UserDefinedFunction [dbo].[IsInt]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[loads_data]    Script Date: 2/14/2022 5:44:13 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[loads_data]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[loads_data]
GO

/****** Object:  StoredProcedure [dbo].[loads_data]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  UserDefinedFunction [dbo].[RemoveNonAlphaCharacters]    Script Date: 2/14/2022 5:44:15 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[RemoveNonAlphaCharacters]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [dbo].[RemoveNonAlphaCharacters]
GO

/****** Object:  UserDefinedFunction [dbo].[RemoveNonAlphaCharacters]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  UserDefinedFunction [dbo].[Split]    Script Date: 2/14/2022 5:44:15 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Split]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [dbo].[Split]
GO

/****** Object:  UserDefinedFunction [dbo].[Split]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  UserDefinedFunction [dbo].[SplitString]    Script Date: 2/14/2022 5:44:15 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SplitString]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [dbo].[SplitString]
GO

/****** Object:  UserDefinedFunction [dbo].[SplitString]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[SQLIntValuerDPSubmission_ValuationFee_AddToCurrentPayment]    Script Date: 2/14/2022 5:44:13 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SQLIntValuerDPSubmission_ValuationFee_AddToCurrentPayment]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SQLIntValuerDPSubmission_ValuationFee_AddToCurrentPayment]
GO

/****** Object:  StoredProcedure [dbo].[SQLIntValuerDPSubmission_ValuationFee_AddToCurrentPayment]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[SQLValuerDPSubmission_ValuationFee_AddToCurrentPayment]    Script Date: 2/14/2022 5:44:13 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SQLValuerDPSubmission_ValuationFee_AddToCurrentPayment]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SQLValuerDPSubmission_ValuationFee_AddToCurrentPayment]
GO

/****** Object:  StoredProcedure [dbo].[SQLValuerDPSubmission_ValuationFee_AddToCurrentPayment]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[SQLValuerDPSubmission_ValuationFee_CountByARN]    Script Date: 2/14/2022 5:44:13 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SQLValuerDPSubmission_ValuationFee_CountByARN]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SQLValuerDPSubmission_ValuationFee_CountByARN]
GO

/****** Object:  StoredProcedure [dbo].[SQLValuerDPSubmission_ValuationFee_CountByARN]    Script Date: 2/14/2022 5:44:16 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[SQLValuerDPSubmission_ValuationFee_FindOne]    Script Date: 2/14/2022 5:44:13 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SQLValuerDPSubmission_ValuationFee_FindOne]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SQLValuerDPSubmission_ValuationFee_FindOne]
GO

/****** Object:  StoredProcedure [dbo].[SQLValuerDPSubmission_ValuationFee_FindOne]    Script Date: 2/14/2022 5:44:16 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[tbd_aaa_SQLLOADS_List]    Script Date: 2/14/2022 5:44:13 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbd_aaa_SQLLOADS_List]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[tbd_aaa_SQLLOADS_List]
GO

/****** Object:  StoredProcedure [dbo].[tbd_aaa_SQLLOADS_List]    Script Date: 2/14/2022 5:44:16 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[tbd_aa_SolDisbursementSubmission_DisMaker_GetPaymentHistoty]    Script Date: 2/14/2022 5:44:13 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbd_aa_SolDisbursementSubmission_DisMaker_GetPaymentHistoty]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[tbd_aa_SolDisbursementSubmission_DisMaker_GetPaymentHistoty]
GO

/****** Object:  StoredProcedure [dbo].[tbd_aa_SolDisbursementSubmission_DisMaker_GetPaymentHistoty]    Script Date: 2/14/2022 5:44:16 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[tbd_aa_SolDisbursementSubmission_RCOMaker_GetNoBillingList]    Script Date: 2/14/2022 5:44:13 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbd_aa_SolDisbursementSubmission_RCOMaker_GetNoBillingList]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[tbd_aa_SolDisbursementSubmission_RCOMaker_GetNoBillingList]
GO

/****** Object:  StoredProcedure [dbo].[tbd_aa_SolDisbursementSubmission_RCOMaker_GetNoBillingList]    Script Date: 2/14/2022 5:44:16 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[tbd_ddProjectDisbursementSubmission_DisMaker_Rejected_GetRejected_ByARN]    Script Date: 2/14/2022 5:44:13 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbd_ddProjectDisbursementSubmission_DisMaker_Rejected_GetRejected_ByARN]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[tbd_ddProjectDisbursementSubmission_DisMaker_Rejected_GetRejected_ByARN]
GO

/****** Object:  StoredProcedure [dbo].[tbd_ddProjectDisbursementSubmission_DisMaker_Rejected_GetRejected_ByARN]    Script Date: 2/14/2022 5:44:16 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[tbd_ddProjectDisbursementSubmission_draft_Master_save]    Script Date: 2/14/2022 5:44:13 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbd_ddProjectDisbursementSubmission_draft_Master_save]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[tbd_ddProjectDisbursementSubmission_draft_Master_save]
GO

/****** Object:  StoredProcedure [dbo].[tbd_ddProjectDisbursementSubmission_draft_Master_save]    Script Date: 2/14/2022 5:44:16 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[tbd_ddProjectDisbursementSubmission_NotificationOfPayment_GetList]    Script Date: 2/14/2022 5:44:13 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbd_ddProjectDisbursementSubmission_NotificationOfPayment_GetList]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[tbd_ddProjectDisbursementSubmission_NotificationOfPayment_GetList]
GO

/****** Object:  StoredProcedure [dbo].[tbd_ddProjectDisbursementSubmission_NotificationOfPayment_GetList]    Script Date: 2/14/2022 5:44:16 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[tbd_ddProjectGetManageAnnouncecmentButtonVisibilityByUser]    Script Date: 2/14/2022 5:44:13 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbd_ddProjectGetManageAnnouncecmentButtonVisibilityByUser]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[tbd_ddProjectGetManageAnnouncecmentButtonVisibilityByUser]
GO

/****** Object:  StoredProcedure [dbo].[tbd_ddProjectGetManageAnnouncecmentButtonVisibilityByUser]    Script Date: 2/14/2022 5:44:16 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[tbd_emailtemplate_emailselect]    Script Date: 2/14/2022 5:44:13 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbd_emailtemplate_emailselect]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[tbd_emailtemplate_emailselect]
GO

/****** Object:  StoredProcedure [dbo].[tbd_emailtemplate_emailselect]    Script Date: 2/14/2022 5:44:16 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[tbd_emailtemplate_save]    Script Date: 2/14/2022 5:44:13 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbd_emailtemplate_save]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[tbd_emailtemplate_save]
GO

/****** Object:  StoredProcedure [dbo].[tbd_emailtemplate_save]    Script Date: 2/14/2022 5:44:16 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[tbd_emailtemplate_select]    Script Date: 2/14/2022 5:44:13 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbd_emailtemplate_select]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[tbd_emailtemplate_select]
GO

/****** Object:  StoredProcedure [dbo].[tbd_emailtemplate_select]    Script Date: 2/14/2022 5:44:16 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[tbd_getk2pdffile]    Script Date: 2/14/2022 5:44:13 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbd_getk2pdffile]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[tbd_getk2pdffile]
GO

/****** Object:  StoredProcedure [dbo].[tbd_getk2pdffile]    Script Date: 2/14/2022 5:44:16 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[tbd_poc_result]    Script Date: 2/14/2022 5:44:13 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbd_poc_result]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[tbd_poc_result]
GO

/****** Object:  StoredProcedure [dbo].[tbd_poc_result]    Script Date: 2/14/2022 5:44:16 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[TBD_TestDataSave]    Script Date: 2/14/2022 5:44:13 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TBD_TestDataSave]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[TBD_TestDataSave]
GO

/****** Object:  StoredProcedure [dbo].[TBD_TestDataSave]    Script Date: 2/14/2022 5:44:16 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[tbd_updatek2pdffile]    Script Date: 2/14/2022 5:44:13 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbd_updatek2pdffile]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[tbd_updatek2pdffile]
GO

/****** Object:  StoredProcedure [dbo].[tbd_updatek2pdffile]    Script Date: 2/14/2022 5:44:16 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[TBD_usp_ValuerUISession_SetVar1]    Script Date: 2/14/2022 5:44:12 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TBD_usp_ValuerUISession_SetVar1]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[TBD_usp_ValuerUISession_SetVar1]
GO

/****** Object:  StoredProcedure [dbo].[TBD_usp_ValuerUISession_SetVar1]    Script Date: 2/14/2022 5:44:16 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[test_loop]    Script Date: 2/14/2022 5:44:12 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[test_loop]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[test_loop]
GO

/****** Object:  StoredProcedure [dbo].[test_loop]    Script Date: 2/14/2022 5:44:16 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[test_usercontexta]    Script Date: 2/14/2022 5:44:12 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[test_usercontexta]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[test_usercontexta]
GO

/****** Object:  StoredProcedure [dbo].[test_usercontexta]    Script Date: 2/14/2022 5:44:16 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  UserDefinedFunction [dbo].[tfn_CoalesceConcat_PR_StageOthers]    Script Date: 2/14/2022 5:44:15 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tfn_CoalesceConcat_PR_StageOthers]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [dbo].[tfn_CoalesceConcat_PR_StageOthers]
GO

/****** Object:  UserDefinedFunction [dbo].[tfn_CoalesceConcat_PR_StageOthers]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  UserDefinedFunction [dbo].[tfn_CoalesceConcat_PR_StageOthers2]    Script Date: 2/14/2022 5:44:15 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tfn_CoalesceConcat_PR_StageOthers2]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [dbo].[tfn_CoalesceConcat_PR_StageOthers2]
GO

/****** Object:  UserDefinedFunction [dbo].[tfn_CoalesceConcat_PR_StageOthers2]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  UserDefinedFunction [dbo].[tfn_CoalesceConcat_PR_StageOthers3]    Script Date: 2/14/2022 5:44:15 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tfn_CoalesceConcat_PR_StageOthers3]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [dbo].[tfn_CoalesceConcat_PR_StageOthers3]
GO

/****** Object:  UserDefinedFunction [dbo].[tfn_CoalesceConcat_PR_StageOthers3]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  UserDefinedFunction [dbo].[ufn_AV_project_body_generate]    Script Date: 2/14/2022 5:44:15 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ufn_AV_project_body_generate]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [dbo].[ufn_AV_project_body_generate]
GO

/****** Object:  UserDefinedFunction [dbo].[ufn_AV_project_body_generate]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  UserDefinedFunction [dbo].[ufn_AV_project_header_generate]    Script Date: 2/14/2022 5:44:15 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ufn_AV_project_header_generate]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [dbo].[ufn_AV_project_header_generate]
GO

/****** Object:  UserDefinedFunction [dbo].[ufn_AV_project_header_generate]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  UserDefinedFunction [dbo].[ufn_ddProjectDisbursementSubmission_NotificationOfPayment_body_generate]    Script Date: 2/14/2022 5:44:15 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ufn_ddProjectDisbursementSubmission_NotificationOfPayment_body_generate]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [dbo].[ufn_ddProjectDisbursementSubmission_NotificationOfPayment_body_generate]
GO

/****** Object:  UserDefinedFunction [dbo].[ufn_ddProjectDisbursementSubmission_NotificationOfPayment_body_generate]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  UserDefinedFunction [dbo].[ufn_ddProjectDisbursementSubmission_NotificationOfPayment_header_generate]    Script Date: 2/14/2022 5:44:15 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ufn_ddProjectDisbursementSubmission_NotificationOfPayment_header_generate]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [dbo].[ufn_ddProjectDisbursementSubmission_NotificationOfPayment_header_generate]
GO

/****** Object:  UserDefinedFunction [dbo].[ufn_ddProjectDisbursementSubmission_NotificationOfPayment_header_generate]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  UserDefinedFunction [dbo].[ufn_DocApprovedEmailToDeveloper_body_generate]    Script Date: 2/14/2022 5:44:15 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ufn_DocApprovedEmailToDeveloper_body_generate]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [dbo].[ufn_DocApprovedEmailToDeveloper_body_generate]
GO

/****** Object:  UserDefinedFunction [dbo].[ufn_DocApprovedEmailToDeveloper_body_generate]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  UserDefinedFunction [dbo].[ufn_DocApprovedEmailToDeveloper_header_generate]    Script Date: 2/14/2022 5:44:15 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ufn_DocApprovedEmailToDeveloper_header_generate]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [dbo].[ufn_DocApprovedEmailToDeveloper_header_generate]
GO

/****** Object:  UserDefinedFunction [dbo].[ufn_DocApprovedEmailToDeveloper_header_generate]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  UserDefinedFunction [dbo].[ufn_DUMaker_Letter_A1_body_generate]    Script Date: 2/14/2022 5:44:15 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ufn_DUMaker_Letter_A1_body_generate]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [dbo].[ufn_DUMaker_Letter_A1_body_generate]
GO

/****** Object:  UserDefinedFunction [dbo].[ufn_DUMaker_Letter_A1_body_generate]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  UserDefinedFunction [dbo].[ufn_DUMaker_Letter_A1_header_generate]    Script Date: 2/14/2022 5:44:15 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ufn_DUMaker_Letter_A1_header_generate]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [dbo].[ufn_DUMaker_Letter_A1_header_generate]
GO

/****** Object:  UserDefinedFunction [dbo].[ufn_DUMaker_Letter_A1_header_generate]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  UserDefinedFunction [dbo].[ufn_DUMaker_Letter_A2_body_generate]    Script Date: 2/14/2022 5:44:15 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ufn_DUMaker_Letter_A2_body_generate]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [dbo].[ufn_DUMaker_Letter_A2_body_generate]
GO

/****** Object:  UserDefinedFunction [dbo].[ufn_DUMaker_Letter_A2_body_generate]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  UserDefinedFunction [dbo].[ufn_DUMaker_Letter_A2_header_generate]    Script Date: 2/14/2022 5:44:15 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ufn_DUMaker_Letter_A2_header_generate]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [dbo].[ufn_DUMaker_Letter_A2_header_generate]
GO

/****** Object:  UserDefinedFunction [dbo].[ufn_DUMaker_Letter_A2_header_generate]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  UserDefinedFunction [dbo].[ufn_DUMaker_Letter_A3_body_generate]    Script Date: 2/14/2022 5:44:15 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ufn_DUMaker_Letter_A3_body_generate]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [dbo].[ufn_DUMaker_Letter_A3_body_generate]
GO

/****** Object:  UserDefinedFunction [dbo].[ufn_DUMaker_Letter_A3_body_generate]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  UserDefinedFunction [dbo].[ufn_DUMaker_Letter_A3_header_generate]    Script Date: 2/14/2022 5:44:15 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ufn_DUMaker_Letter_A3_header_generate]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [dbo].[ufn_DUMaker_Letter_A3_header_generate]
GO

/****** Object:  UserDefinedFunction [dbo].[ufn_DUMaker_Letter_A3_header_generate]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  UserDefinedFunction [dbo].[ufn_DUMaker_Letter_A8_body_generate]    Script Date: 2/14/2022 5:44:15 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ufn_DUMaker_Letter_A8_body_generate]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [dbo].[ufn_DUMaker_Letter_A8_body_generate]
GO

/****** Object:  UserDefinedFunction [dbo].[ufn_DUMaker_Letter_A8_body_generate]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  UserDefinedFunction [dbo].[ufn_DUMaker_Letter_A8_header_generate]    Script Date: 2/14/2022 5:44:15 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ufn_DUMaker_Letter_A8_header_generate]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [dbo].[ufn_DUMaker_Letter_A8_header_generate]
GO

/****** Object:  UserDefinedFunction [dbo].[ufn_DUMaker_Letter_A8_header_generate]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  UserDefinedFunction [dbo].[ufn_DUMaker_Letter_A9_body_generate]    Script Date: 2/14/2022 5:44:15 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ufn_DUMaker_Letter_A9_body_generate]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [dbo].[ufn_DUMaker_Letter_A9_body_generate]
GO

/****** Object:  UserDefinedFunction [dbo].[ufn_DUMaker_Letter_A9_body_generate]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  UserDefinedFunction [dbo].[ufn_DUMaker_Letter_A9_header_generate]    Script Date: 2/14/2022 5:44:15 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ufn_DUMaker_Letter_A9_header_generate]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [dbo].[ufn_DUMaker_Letter_A9_header_generate]
GO

/****** Object:  UserDefinedFunction [dbo].[ufn_DUMaker_Letter_A9_header_generate]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  UserDefinedFunction [dbo].[ufn_DUMaker_Letter_AV_body_generate]    Script Date: 2/14/2022 5:44:15 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ufn_DUMaker_Letter_AV_body_generate]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [dbo].[ufn_DUMaker_Letter_AV_body_generate]
GO

/****** Object:  UserDefinedFunction [dbo].[ufn_DUMaker_Letter_AV_body_generate]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  UserDefinedFunction [dbo].[ufn_DUMaker_Letter_AV_disbursement_body_generate]    Script Date: 2/14/2022 5:44:15 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ufn_DUMaker_Letter_AV_disbursement_body_generate]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [dbo].[ufn_DUMaker_Letter_AV_disbursement_body_generate]
GO

/****** Object:  UserDefinedFunction [dbo].[ufn_DUMaker_Letter_AV_disbursement_body_generate]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  UserDefinedFunction [dbo].[ufn_DUMaker_Letter_AV_disbursement_header_generate]    Script Date: 2/14/2022 5:44:15 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ufn_DUMaker_Letter_AV_disbursement_header_generate]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [dbo].[ufn_DUMaker_Letter_AV_disbursement_header_generate]
GO

/****** Object:  UserDefinedFunction [dbo].[ufn_DUMaker_Letter_AV_disbursement_header_generate]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  UserDefinedFunction [dbo].[ufn_DUMaker_Letter_AV_header_generate]    Script Date: 2/14/2022 5:44:15 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ufn_DUMaker_Letter_AV_header_generate]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [dbo].[ufn_DUMaker_Letter_AV_header_generate]
GO

/****** Object:  UserDefinedFunction [dbo].[ufn_DUMaker_Letter_AV_header_generate]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  UserDefinedFunction [dbo].[ufn_DUMaker_Letter_AV_Valuer_body_generate]    Script Date: 2/14/2022 5:44:15 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ufn_DUMaker_Letter_AV_Valuer_body_generate]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [dbo].[ufn_DUMaker_Letter_AV_Valuer_body_generate]
GO

/****** Object:  UserDefinedFunction [dbo].[ufn_DUMaker_Letter_AV_Valuer_body_generate]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  UserDefinedFunction [dbo].[ufn_DUMaker_Letter_AV_Valuer_header_generate]    Script Date: 2/14/2022 5:44:15 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ufn_DUMaker_Letter_AV_Valuer_header_generate]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [dbo].[ufn_DUMaker_Letter_AV_Valuer_header_generate]
GO

/****** Object:  UserDefinedFunction [dbo].[ufn_DUMaker_Letter_AV_Valuer_header_generate]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  UserDefinedFunction [dbo].[ufn_DUMaker_Letter_B1_body_generate]    Script Date: 2/14/2022 5:44:15 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ufn_DUMaker_Letter_B1_body_generate]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [dbo].[ufn_DUMaker_Letter_B1_body_generate]
GO

/****** Object:  UserDefinedFunction [dbo].[ufn_DUMaker_Letter_B1_body_generate]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  UserDefinedFunction [dbo].[ufn_DUMaker_Letter_B1_header_generate]    Script Date: 2/14/2022 5:44:15 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ufn_DUMaker_Letter_B1_header_generate]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [dbo].[ufn_DUMaker_Letter_B1_header_generate]
GO

/****** Object:  UserDefinedFunction [dbo].[ufn_DUMaker_Letter_B1_header_generate]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  UserDefinedFunction [dbo].[ufn_DUMaker_Letter_B2_body_generate]    Script Date: 2/14/2022 5:44:15 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ufn_DUMaker_Letter_B2_body_generate]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [dbo].[ufn_DUMaker_Letter_B2_body_generate]
GO

/****** Object:  UserDefinedFunction [dbo].[ufn_DUMaker_Letter_B2_body_generate]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  UserDefinedFunction [dbo].[ufn_DUMaker_Letter_B2_header_generate]    Script Date: 2/14/2022 5:44:15 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ufn_DUMaker_Letter_B2_header_generate]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [dbo].[ufn_DUMaker_Letter_B2_header_generate]
GO

/****** Object:  UserDefinedFunction [dbo].[ufn_DUMaker_Letter_B2_header_generate]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  UserDefinedFunction [dbo].[ufn_getPDFImage]    Script Date: 2/14/2022 5:44:15 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ufn_getPDFImage]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [dbo].[ufn_getPDFImage]
GO

/****** Object:  UserDefinedFunction [dbo].[ufn_getPDFImage]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  UserDefinedFunction [dbo].[ufn_getPDFImageName]    Script Date: 2/14/2022 5:44:15 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ufn_getPDFImageName]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [dbo].[ufn_getPDFImageName]
GO

/****** Object:  UserDefinedFunction [dbo].[ufn_getPDFImageName]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  UserDefinedFunction [dbo].[ufn_getPDFImageNameFileType]    Script Date: 2/14/2022 5:44:15 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ufn_getPDFImageNameFileType]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [dbo].[ufn_getPDFImageNameFileType]
GO

/****** Object:  UserDefinedFunction [dbo].[ufn_getPDFImageNameFileType]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  UserDefinedFunction [dbo].[ufn_NewPhaseCode_body_generate]    Script Date: 2/14/2022 5:44:15 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ufn_NewPhaseCode_body_generate]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [dbo].[ufn_NewPhaseCode_body_generate]
GO

/****** Object:  UserDefinedFunction [dbo].[ufn_NewPhaseCode_body_generate]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  UserDefinedFunction [dbo].[ufn_NewPhaseCode_header_generate]    Script Date: 2/14/2022 5:44:15 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ufn_NewPhaseCode_header_generate]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [dbo].[ufn_NewPhaseCode_header_generate]
GO

/****** Object:  UserDefinedFunction [dbo].[ufn_NewPhaseCode_header_generate]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  UserDefinedFunction [dbo].[ufn_NotificationOfPayment_body_generate]    Script Date: 2/14/2022 5:44:15 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ufn_NotificationOfPayment_body_generate]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [dbo].[ufn_NotificationOfPayment_body_generate]
GO

/****** Object:  UserDefinedFunction [dbo].[ufn_NotificationOfPayment_body_generate]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  UserDefinedFunction [dbo].[ufn_NotificationOfPayment_header_generate]    Script Date: 2/14/2022 5:44:15 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ufn_NotificationOfPayment_header_generate]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [dbo].[ufn_NotificationOfPayment_header_generate]
GO

/****** Object:  UserDefinedFunction [dbo].[ufn_NotificationOfPayment_header_generate]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  UserDefinedFunction [dbo].[ufn_UserIDEmail_body_generate]    Script Date: 2/14/2022 5:44:15 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ufn_UserIDEmail_body_generate]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [dbo].[ufn_UserIDEmail_body_generate]
GO

/****** Object:  UserDefinedFunction [dbo].[ufn_UserIDEmail_body_generate]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  UserDefinedFunction [dbo].[ufn_UserIDEmail_header_generate]    Script Date: 2/14/2022 5:44:15 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ufn_UserIDEmail_header_generate]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [dbo].[ufn_UserIDEmail_header_generate]
GO

/****** Object:  UserDefinedFunction [dbo].[ufn_UserIDEmail_header_generate]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[usp_aaSolDisbursementSubmission_DisMakerSubmissionPaymentDetail_UpdateAccountFrom]    Script Date: 2/14/2022 5:44:12 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_aaSolDisbursementSubmission_DisMakerSubmissionPaymentDetail_UpdateAccountFrom]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_aaSolDisbursementSubmission_DisMakerSubmissionPaymentDetail_UpdateAccountFrom]
GO

/****** Object:  StoredProcedure [dbo].[usp_aaSolDisbursementSubmission_DisMakerSubmissionPaymentDetail_UpdateAccountFrom]    Script Date: 2/14/2022 5:44:16 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[usp_AdminOperationAuditLog_SelectAll]    Script Date: 2/14/2022 5:44:12 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_AdminOperationAuditLog_SelectAll]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_AdminOperationAuditLog_SelectAll]
GO

/****** Object:  StoredProcedure [dbo].[usp_AdminOperationAuditLog_SelectAll]    Script Date: 2/14/2022 5:44:16 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[usp_AdminOperationAuditLog_SelectAll_MortgageAdmin]    Script Date: 2/14/2022 5:44:12 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_AdminOperationAuditLog_SelectAll_MortgageAdmin]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_AdminOperationAuditLog_SelectAll_MortgageAdmin]
GO

/****** Object:  StoredProcedure [dbo].[usp_AdminOperationAuditLog_SelectAll_MortgageAdmin]    Script Date: 2/14/2022 5:44:16 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[usp_AdminOperationAuditLog_SelectAll_UserMetric]    Script Date: 2/14/2022 5:44:12 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_AdminOperationAuditLog_SelectAll_UserMetric]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_AdminOperationAuditLog_SelectAll_UserMetric]
GO

/****** Object:  StoredProcedure [dbo].[usp_AdminOperationAuditLog_SelectAll_UserMetric]    Script Date: 2/14/2022 5:44:16 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[usp_AdminOperationAuditTrailReportDetail]    Script Date: 2/14/2022 5:44:12 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_AdminOperationAuditTrailReportDetail]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_AdminOperationAuditTrailReportDetail]
GO

/****** Object:  StoredProcedure [dbo].[usp_AdminOperationAuditTrailReportDetail]    Script Date: 2/14/2022 5:44:16 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[usp_AdminOperationAuditTrailReportDetail_Select]    Script Date: 2/14/2022 5:44:12 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_AdminOperationAuditTrailReportDetail_Select]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_AdminOperationAuditTrailReportDetail_Select]
GO

/****** Object:  StoredProcedure [dbo].[usp_AdminOperationAuditTrailReportDetail_Select]    Script Date: 2/14/2022 5:44:16 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[usp_Admin_AttorneyCentre_Create]    Script Date: 2/14/2022 5:44:12 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_Admin_AttorneyCentre_Create]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_Admin_AttorneyCentre_Create]
GO

/****** Object:  StoredProcedure [dbo].[usp_Admin_AttorneyCentre_Create]    Script Date: 2/14/2022 5:44:16 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[usp_Admin_AttorneyCentre_Delete]    Script Date: 2/14/2022 5:44:12 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_Admin_AttorneyCentre_Delete]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_Admin_AttorneyCentre_Delete]
GO

/****** Object:  StoredProcedure [dbo].[usp_Admin_AttorneyCentre_Delete]    Script Date: 2/14/2022 5:44:16 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[usp_Admin_AttorneyCentre_Update]    Script Date: 2/14/2022 5:44:12 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_Admin_AttorneyCentre_Update]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_Admin_AttorneyCentre_Update]
GO

/****** Object:  StoredProcedure [dbo].[usp_Admin_AttorneyCentre_Update]    Script Date: 2/14/2022 5:44:16 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[usp_Admin_Attorney_Create]    Script Date: 2/14/2022 5:44:12 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_Admin_Attorney_Create]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_Admin_Attorney_Create]
GO

/****** Object:  StoredProcedure [dbo].[usp_Admin_Attorney_Create]    Script Date: 2/14/2022 5:44:16 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[usp_Admin_Attorney_Delete]    Script Date: 2/14/2022 5:44:12 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_Admin_Attorney_Delete]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_Admin_Attorney_Delete]
GO

/****** Object:  StoredProcedure [dbo].[usp_Admin_Attorney_Delete]    Script Date: 2/14/2022 5:44:16 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[usp_Admin_Attorney_Update]    Script Date: 2/14/2022 5:44:12 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_Admin_Attorney_Update]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_Admin_Attorney_Update]
GO

/****** Object:  StoredProcedure [dbo].[usp_Admin_Attorney_Update]    Script Date: 2/14/2022 5:44:16 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[usp_Admin_GenerateDU1_Check]    Script Date: 2/14/2022 5:44:12 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_Admin_GenerateDU1_Check]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_Admin_GenerateDU1_Check]
GO

/****** Object:  StoredProcedure [dbo].[usp_Admin_GenerateDU1_Check]    Script Date: 2/14/2022 5:44:16 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[usp_Admin_GenerateDU2_Check]    Script Date: 2/14/2022 5:44:12 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_Admin_GenerateDU2_Check]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_Admin_GenerateDU2_Check]
GO

/****** Object:  StoredProcedure [dbo].[usp_Admin_GenerateDU2_Check]    Script Date: 2/14/2022 5:44:16 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[usp_Admin_GenerateSolicitorForm_Check]    Script Date: 2/14/2022 5:44:12 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_Admin_GenerateSolicitorForm_Check]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_Admin_GenerateSolicitorForm_Check]
GO

/****** Object:  StoredProcedure [dbo].[usp_Admin_GenerateSolicitorForm_Check]    Script Date: 2/14/2022 5:44:16 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[usp_Admin_GenerateValuerForm_Check]    Script Date: 2/14/2022 5:44:12 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_Admin_GenerateValuerForm_Check]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_Admin_GenerateValuerForm_Check]
GO

/****** Object:  StoredProcedure [dbo].[usp_Admin_GenerateValuerForm_Check]    Script Date: 2/14/2022 5:44:16 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[usp_Admin_Solicitor_Create]    Script Date: 2/14/2022 5:44:12 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_Admin_Solicitor_Create]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_Admin_Solicitor_Create]
GO

/****** Object:  StoredProcedure [dbo].[usp_Admin_Solicitor_Create]    Script Date: 2/14/2022 5:44:16 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[usp_Admin_Solicitor_Create_Final]    Script Date: 2/14/2022 5:44:12 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_Admin_Solicitor_Create_Final]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_Admin_Solicitor_Create_Final]
GO

/****** Object:  StoredProcedure [dbo].[usp_Admin_Solicitor_Create_Final]    Script Date: 2/14/2022 5:44:16 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[usp_Admin_Solicitor_Delete]    Script Date: 2/14/2022 5:44:12 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_Admin_Solicitor_Delete]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_Admin_Solicitor_Delete]
GO

/****** Object:  StoredProcedure [dbo].[usp_Admin_Solicitor_Delete]    Script Date: 2/14/2022 5:44:16 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[usp_Admin_Solicitor_PasswordReset]    Script Date: 2/14/2022 5:44:12 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_Admin_Solicitor_PasswordReset]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_Admin_Solicitor_PasswordReset]
GO

/****** Object:  StoredProcedure [dbo].[usp_Admin_Solicitor_PasswordReset]    Script Date: 2/14/2022 5:44:16 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[usp_Admin_Solicitor_PasswordReset_Final]    Script Date: 2/14/2022 5:44:12 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_Admin_Solicitor_PasswordReset_Final]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_Admin_Solicitor_PasswordReset_Final]
GO

/****** Object:  StoredProcedure [dbo].[usp_Admin_Solicitor_PasswordReset_Final]    Script Date: 2/14/2022 5:44:16 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[usp_Admin_Solicitor_PasswordReset_GenerateEmail]    Script Date: 2/14/2022 5:44:12 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_Admin_Solicitor_PasswordReset_GenerateEmail]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_Admin_Solicitor_PasswordReset_GenerateEmail]
GO

/****** Object:  StoredProcedure [dbo].[usp_Admin_Solicitor_PasswordReset_GenerateEmail]    Script Date: 2/14/2022 5:44:16 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[usp_Admin_Solicitor_Update_Info]    Script Date: 2/14/2022 5:44:12 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_Admin_Solicitor_Update_Info]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_Admin_Solicitor_Update_Info]
GO

/****** Object:  StoredProcedure [dbo].[usp_Admin_Solicitor_Update_Info]    Script Date: 2/14/2022 5:44:16 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[usp_Admin_Solicitor_Update_Password]    Script Date: 2/14/2022 5:44:12 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_Admin_Solicitor_Update_Password]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_Admin_Solicitor_Update_Password]
GO

/****** Object:  StoredProcedure [dbo].[usp_Admin_Solicitor_Update_Password]    Script Date: 2/14/2022 5:44:16 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[usp_Admin_Solicitor_Update_Password_Final]    Script Date: 2/14/2022 5:44:12 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_Admin_Solicitor_Update_Password_Final]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_Admin_Solicitor_Update_Password_Final]
GO

/****** Object:  StoredProcedure [dbo].[usp_Admin_Solicitor_Update_Password_Final]    Script Date: 2/14/2022 5:44:16 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[usp_Admin_Solicitor_Update_Password_Get]    Script Date: 2/14/2022 5:44:12 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_Admin_Solicitor_Update_Password_Get]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_Admin_Solicitor_Update_Password_Get]
GO

/****** Object:  StoredProcedure [dbo].[usp_Admin_Solicitor_Update_Password_Get]    Script Date: 2/14/2022 5:44:16 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[usp_Admin_Solicitor_Update_Status]    Script Date: 2/14/2022 5:44:12 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_Admin_Solicitor_Update_Status]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_Admin_Solicitor_Update_Status]
GO

/****** Object:  StoredProcedure [dbo].[usp_Admin_Solicitor_Update_Status]    Script Date: 2/14/2022 5:44:16 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[usp_Admin_Valuer_Create]    Script Date: 2/14/2022 5:44:12 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_Admin_Valuer_Create]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_Admin_Valuer_Create]
GO

/****** Object:  StoredProcedure [dbo].[usp_Admin_Valuer_Create]    Script Date: 2/14/2022 5:44:16 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[usp_Admin_Valuer_Create_Final]    Script Date: 2/14/2022 5:44:12 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_Admin_Valuer_Create_Final]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_Admin_Valuer_Create_Final]
GO

/****** Object:  StoredProcedure [dbo].[usp_Admin_Valuer_Create_Final]    Script Date: 2/14/2022 5:44:16 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[usp_Admin_Valuer_Delete]    Script Date: 2/14/2022 5:44:12 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_Admin_Valuer_Delete]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_Admin_Valuer_Delete]
GO

/****** Object:  StoredProcedure [dbo].[usp_Admin_Valuer_Delete]    Script Date: 2/14/2022 5:44:16 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[usp_Admin_Valuer_PasswordReset]    Script Date: 2/14/2022 5:44:12 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_Admin_Valuer_PasswordReset]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_Admin_Valuer_PasswordReset]
GO

/****** Object:  StoredProcedure [dbo].[usp_Admin_Valuer_PasswordReset]    Script Date: 2/14/2022 5:44:16 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[usp_Admin_Valuer_PasswordReset_Final]    Script Date: 2/14/2022 5:44:12 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_Admin_Valuer_PasswordReset_Final]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_Admin_Valuer_PasswordReset_Final]
GO

/****** Object:  StoredProcedure [dbo].[usp_Admin_Valuer_PasswordReset_Final]    Script Date: 2/14/2022 5:44:16 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[usp_Admin_Valuer_PasswordReset_GenerateEmail]    Script Date: 2/14/2022 5:44:12 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_Admin_Valuer_PasswordReset_GenerateEmail]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_Admin_Valuer_PasswordReset_GenerateEmail]
GO

/****** Object:  StoredProcedure [dbo].[usp_Admin_Valuer_PasswordReset_GenerateEmail]    Script Date: 2/14/2022 5:44:16 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[usp_Admin_Valuer_Update_Info]    Script Date: 2/14/2022 5:44:12 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_Admin_Valuer_Update_Info]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_Admin_Valuer_Update_Info]
GO

/****** Object:  StoredProcedure [dbo].[usp_Admin_Valuer_Update_Info]    Script Date: 2/14/2022 5:44:16 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[usp_Admin_Valuer_Update_Password]    Script Date: 2/14/2022 5:44:12 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_Admin_Valuer_Update_Password]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_Admin_Valuer_Update_Password]
GO

/****** Object:  StoredProcedure [dbo].[usp_Admin_Valuer_Update_Password]    Script Date: 2/14/2022 5:44:16 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[usp_Admin_Valuer_Update_Password_Final]    Script Date: 2/14/2022 5:44:12 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_Admin_Valuer_Update_Password_Final]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_Admin_Valuer_Update_Password_Final]
GO

/****** Object:  StoredProcedure [dbo].[usp_Admin_Valuer_Update_Password_Final]    Script Date: 2/14/2022 5:44:16 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[usp_Admin_Valuer_Update_Password_Get]    Script Date: 2/14/2022 5:44:12 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_Admin_Valuer_Update_Password_Get]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_Admin_Valuer_Update_Password_Get]
GO

/****** Object:  StoredProcedure [dbo].[usp_Admin_Valuer_Update_Password_Get]    Script Date: 2/14/2022 5:44:16 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[usp_Admin_Valuer_Update_Status]    Script Date: 2/14/2022 5:44:12 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_Admin_Valuer_Update_Status]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_Admin_Valuer_Update_Status]
GO

/****** Object:  StoredProcedure [dbo].[usp_Admin_Valuer_Update_Status]    Script Date: 2/14/2022 5:44:16 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[usp_ApplicantID_query]    Script Date: 2/14/2022 5:44:12 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_ApplicantID_query]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_ApplicantID_query]
GO

/****** Object:  StoredProcedure [dbo].[usp_ApplicantID_query]    Script Date: 2/14/2022 5:44:16 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[usp_ApplicantName_query]    Script Date: 2/14/2022 5:44:12 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_ApplicantName_query]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_ApplicantName_query]
GO

/****** Object:  StoredProcedure [dbo].[usp_ApplicantName_query]    Script Date: 2/14/2022 5:44:16 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[usp_ApplicationSetting_save]    Script Date: 2/14/2022 5:44:12 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_ApplicationSetting_save]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_ApplicationSetting_save]
GO

/****** Object:  StoredProcedure [dbo].[usp_ApplicationSetting_save]    Script Date: 2/14/2022 5:44:16 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[usp_ApplicationSetting_select]    Script Date: 2/14/2022 5:44:12 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_ApplicationSetting_select]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_ApplicationSetting_select]
GO

/****** Object:  StoredProcedure [dbo].[usp_ApplicationSetting_select]    Script Date: 2/14/2022 5:44:16 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[usp_ARN_query]    Script Date: 2/14/2022 5:44:12 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_ARN_query]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_ARN_query]
GO

/****** Object:  StoredProcedure [dbo].[usp_ARN_query]    Script Date: 2/14/2022 5:44:16 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[usp_AttorneyName_list_select]    Script Date: 2/14/2022 5:44:12 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_AttorneyName_list_select]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_AttorneyName_list_select]
GO

/****** Object:  StoredProcedure [dbo].[usp_AttorneyName_list_select]    Script Date: 2/14/2022 5:44:16 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[usp_CheckAndUpdateExtUserStatusForDormantID]    Script Date: 2/14/2022 5:44:12 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_CheckAndUpdateExtUserStatusForDormantID]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_CheckAndUpdateExtUserStatusForDormantID]
GO

/****** Object:  StoredProcedure [dbo].[usp_CheckAndUpdateExtUserStatusForDormantID]    Script Date: 2/14/2022 5:44:16 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[usp_CheckAndUpdateExtUserStatusForExpiredPassword]    Script Date: 2/14/2022 5:44:12 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_CheckAndUpdateExtUserStatusForExpiredPassword]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_CheckAndUpdateExtUserStatusForExpiredPassword]
GO

/****** Object:  StoredProcedure [dbo].[usp_CheckAndUpdateExtUserStatusForExpiredPassword]    Script Date: 2/14/2022 5:44:16 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[usp_CheckAndUpdateIntUserStatusForDormantID]    Script Date: 2/14/2022 5:44:12 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_CheckAndUpdateIntUserStatusForDormantID]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_CheckAndUpdateIntUserStatusForDormantID]
GO

/****** Object:  StoredProcedure [dbo].[usp_CheckAndUpdateIntUserStatusForDormantID]    Script Date: 2/14/2022 5:44:16 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[usp_check_SolicitorSubmissionStillInStaging]    Script Date: 2/14/2022 5:44:12 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_check_SolicitorSubmissionStillInStaging]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_check_SolicitorSubmissionStillInStaging]
GO

/****** Object:  StoredProcedure [dbo].[usp_check_SolicitorSubmissionStillInStaging]    Script Date: 2/14/2022 5:44:16 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[usp_check_ValuerSubmissionStillInStaging]    Script Date: 2/14/2022 5:44:12 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_check_ValuerSubmissionStillInStaging]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_check_ValuerSubmissionStillInStaging]
GO

/****** Object:  StoredProcedure [dbo].[usp_check_ValuerSubmissionStillInStaging]    Script Date: 2/14/2022 5:44:16 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[usp_CIF_Number_Check]    Script Date: 2/14/2022 5:44:12 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_CIF_Number_Check]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_CIF_Number_Check]
GO

/****** Object:  StoredProcedure [dbo].[usp_CIF_Number_Check]    Script Date: 2/14/2022 5:44:16 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[usp_DeleteSolicitorAttachment]    Script Date: 2/14/2022 5:44:12 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_DeleteSolicitorAttachment]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_DeleteSolicitorAttachment]
GO

/****** Object:  StoredProcedure [dbo].[usp_DeleteSolicitorAttachment]    Script Date: 2/14/2022 5:44:16 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[usp_DeleteSolicitorDisbusementAttachment]    Script Date: 2/14/2022 5:44:12 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_DeleteSolicitorDisbusementAttachment]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_DeleteSolicitorDisbusementAttachment]
GO

/****** Object:  StoredProcedure [dbo].[usp_DeleteSolicitorDisbusementAttachment]    Script Date: 2/14/2022 5:44:16 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[usp_DeleteValuerAttachment]    Script Date: 2/14/2022 5:44:12 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_DeleteValuerAttachment]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_DeleteValuerAttachment]
GO

/****** Object:  StoredProcedure [dbo].[usp_DeleteValuerAttachment]    Script Date: 2/14/2022 5:44:16 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[usp_DUMaker_Letter_A1_generate_getrecord]    Script Date: 2/14/2022 5:44:12 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_DUMaker_Letter_A1_generate_getrecord]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_DUMaker_Letter_A1_generate_getrecord]
GO

/****** Object:  StoredProcedure [dbo].[usp_DUMaker_Letter_A1_generate_getrecord]    Script Date: 2/14/2022 5:44:16 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[usp_DUMaker_Letter_A1_generate_list8]    Script Date: 2/14/2022 5:44:12 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_DUMaker_Letter_A1_generate_list8]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_DUMaker_Letter_A1_generate_list8]
GO

/****** Object:  StoredProcedure [dbo].[usp_DUMaker_Letter_A1_generate_list8]    Script Date: 2/14/2022 5:44:16 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[usp_DUMaker_Letter_A2_generate_getrecord]    Script Date: 2/14/2022 5:44:12 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_DUMaker_Letter_A2_generate_getrecord]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_DUMaker_Letter_A2_generate_getrecord]
GO

/****** Object:  StoredProcedure [dbo].[usp_DUMaker_Letter_A2_generate_getrecord]    Script Date: 2/14/2022 5:44:16 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[usp_DUMaker_Letter_A2_generate_list]    Script Date: 2/14/2022 5:44:12 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_DUMaker_Letter_A2_generate_list]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_DUMaker_Letter_A2_generate_list]
GO

/****** Object:  StoredProcedure [dbo].[usp_DUMaker_Letter_A2_generate_list]    Script Date: 2/14/2022 5:44:16 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[usp_DUMaker_Letter_A3_generate_getrecord]    Script Date: 2/14/2022 5:44:12 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_DUMaker_Letter_A3_generate_getrecord]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_DUMaker_Letter_A3_generate_getrecord]
GO

/****** Object:  StoredProcedure [dbo].[usp_DUMaker_Letter_A3_generate_getrecord]    Script Date: 2/14/2022 5:44:16 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[usp_DUMaker_Letter_A3_generate_list]    Script Date: 2/14/2022 5:44:12 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_DUMaker_Letter_A3_generate_list]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_DUMaker_Letter_A3_generate_list]
GO

/****** Object:  StoredProcedure [dbo].[usp_DUMaker_Letter_A3_generate_list]    Script Date: 2/14/2022 5:44:16 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[usp_DUMaker_Letter_A4_generate]    Script Date: 2/14/2022 5:44:12 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_DUMaker_Letter_A4_generate]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_DUMaker_Letter_A4_generate]
GO

/****** Object:  StoredProcedure [dbo].[usp_DUMaker_Letter_A4_generate]    Script Date: 2/14/2022 5:44:16 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[usp_DUMaker_Letter_A5_generate]    Script Date: 2/14/2022 5:44:12 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_DUMaker_Letter_A5_generate]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_DUMaker_Letter_A5_generate]
GO

/****** Object:  StoredProcedure [dbo].[usp_DUMaker_Letter_A5_generate]    Script Date: 2/14/2022 5:44:16 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[usp_DUMaker_Letter_A6_generate]    Script Date: 2/14/2022 5:44:12 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_DUMaker_Letter_A6_generate]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_DUMaker_Letter_A6_generate]
GO

/****** Object:  StoredProcedure [dbo].[usp_DUMaker_Letter_A6_generate]    Script Date: 2/14/2022 5:44:16 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[usp_DUMaker_Letter_A7_generate]    Script Date: 2/14/2022 5:44:12 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_DUMaker_Letter_A7_generate]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_DUMaker_Letter_A7_generate]
GO

/****** Object:  StoredProcedure [dbo].[usp_DUMaker_Letter_A7_generate]    Script Date: 2/14/2022 5:44:16 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[usp_DUMaker_Letter_A8_generate_getrecord]    Script Date: 2/14/2022 5:44:12 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_DUMaker_Letter_A8_generate_getrecord]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_DUMaker_Letter_A8_generate_getrecord]
GO

/****** Object:  StoredProcedure [dbo].[usp_DUMaker_Letter_A8_generate_getrecord]    Script Date: 2/14/2022 5:44:16 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[usp_DUMaker_Letter_A8_generate_list]    Script Date: 2/14/2022 5:44:12 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_DUMaker_Letter_A8_generate_list]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_DUMaker_Letter_A8_generate_list]
GO

/****** Object:  StoredProcedure [dbo].[usp_DUMaker_Letter_A8_generate_list]    Script Date: 2/14/2022 5:44:16 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[usp_DUMaker_Letter_A9_generate_getrecord]    Script Date: 2/14/2022 5:44:12 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_DUMaker_Letter_A9_generate_getrecord]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_DUMaker_Letter_A9_generate_getrecord]
GO

/****** Object:  StoredProcedure [dbo].[usp_DUMaker_Letter_A9_generate_getrecord]    Script Date: 2/14/2022 5:44:16 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[usp_DUMaker_Letter_A9_generate_list]    Script Date: 2/14/2022 5:44:12 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_DUMaker_Letter_A9_generate_list]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_DUMaker_Letter_A9_generate_list]
GO

/****** Object:  StoredProcedure [dbo].[usp_DUMaker_Letter_A9_generate_list]    Script Date: 2/14/2022 5:44:16 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[usp_DUMaker_Letter_AV_generate_getrecord]    Script Date: 2/14/2022 5:44:12 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_DUMaker_Letter_AV_generate_getrecord]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_DUMaker_Letter_AV_generate_getrecord]
GO

/****** Object:  StoredProcedure [dbo].[usp_DUMaker_Letter_AV_generate_getrecord]    Script Date: 2/14/2022 5:44:16 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[usp_DUMaker_Letter_AV_generate_list]    Script Date: 2/14/2022 5:44:12 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_DUMaker_Letter_AV_generate_list]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_DUMaker_Letter_AV_generate_list]
GO

/****** Object:  StoredProcedure [dbo].[usp_DUMaker_Letter_AV_generate_list]    Script Date: 2/14/2022 5:44:16 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[usp_DUMaker_Letter_AV_generate_list_delete_staging]    Script Date: 2/14/2022 5:44:12 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_DUMaker_Letter_AV_generate_list_delete_staging]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_DUMaker_Letter_AV_generate_list_delete_staging]
GO

/****** Object:  StoredProcedure [dbo].[usp_DUMaker_Letter_AV_generate_list_delete_staging]    Script Date: 2/14/2022 5:44:16 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[usp_DUMaker_Letter_AV_SolicitorDisbursement_email_content_delete]    Script Date: 2/14/2022 5:44:12 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_DUMaker_Letter_AV_SolicitorDisbursement_email_content_delete]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_DUMaker_Letter_AV_SolicitorDisbursement_email_content_delete]
GO

/****** Object:  StoredProcedure [dbo].[usp_DUMaker_Letter_AV_SolicitorDisbursement_email_content_delete]    Script Date: 2/14/2022 5:44:16 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[usp_DUMaker_Letter_AV_SolicitorDisbursement_email_content_generate]    Script Date: 2/14/2022 5:44:12 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_DUMaker_Letter_AV_SolicitorDisbursement_email_content_generate]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_DUMaker_Letter_AV_SolicitorDisbursement_email_content_generate]
GO

/****** Object:  StoredProcedure [dbo].[usp_DUMaker_Letter_AV_SolicitorDisbursement_email_content_generate]    Script Date: 2/14/2022 5:44:16 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[usp_DUMaker_Letter_AV_Solicitor_email_content_generate]    Script Date: 2/14/2022 5:44:12 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_DUMaker_Letter_AV_Solicitor_email_content_generate]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_DUMaker_Letter_AV_Solicitor_email_content_generate]
GO

/****** Object:  StoredProcedure [dbo].[usp_DUMaker_Letter_AV_Solicitor_email_content_generate]    Script Date: 2/14/2022 5:44:16 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[usp_DUMaker_Letter_AV_Valuer_email_content_generate]    Script Date: 2/14/2022 5:44:12 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_DUMaker_Letter_AV_Valuer_email_content_generate]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_DUMaker_Letter_AV_Valuer_email_content_generate]
GO

/****** Object:  StoredProcedure [dbo].[usp_DUMaker_Letter_AV_Valuer_email_content_generate]    Script Date: 2/14/2022 5:44:16 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[usp_DUMaker_Letter_AV_Valuer_generate_getrecord]    Script Date: 2/14/2022 5:44:12 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_DUMaker_Letter_AV_Valuer_generate_getrecord]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_DUMaker_Letter_AV_Valuer_generate_getrecord]
GO

/****** Object:  StoredProcedure [dbo].[usp_DUMaker_Letter_AV_Valuer_generate_getrecord]    Script Date: 2/14/2022 5:44:16 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[usp_DUMaker_Letter_AV_Valuer_generate_list]    Script Date: 2/14/2022 5:44:12 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_DUMaker_Letter_AV_Valuer_generate_list]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_DUMaker_Letter_AV_Valuer_generate_list]
GO

/****** Object:  StoredProcedure [dbo].[usp_DUMaker_Letter_AV_Valuer_generate_list]    Script Date: 2/14/2022 5:44:16 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[usp_DUMaker_Letter_AV_Valuer_generate_list_delete_staging]    Script Date: 2/14/2022 5:44:12 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_DUMaker_Letter_AV_Valuer_generate_list_delete_staging]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_DUMaker_Letter_AV_Valuer_generate_list_delete_staging]
GO

/****** Object:  StoredProcedure [dbo].[usp_DUMaker_Letter_AV_Valuer_generate_list_delete_staging]    Script Date: 2/14/2022 5:44:16 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[usp_DUMaker_Letter_B1_generate_getrecord]    Script Date: 2/14/2022 5:44:12 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_DUMaker_Letter_B1_generate_getrecord]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_DUMaker_Letter_B1_generate_getrecord]
GO

/****** Object:  StoredProcedure [dbo].[usp_DUMaker_Letter_B1_generate_getrecord]    Script Date: 2/14/2022 5:44:16 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[usp_DUMaker_Letter_B1_generate_list]    Script Date: 2/14/2022 5:44:12 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_DUMaker_Letter_B1_generate_list]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_DUMaker_Letter_B1_generate_list]
GO

/****** Object:  StoredProcedure [dbo].[usp_DUMaker_Letter_B1_generate_list]    Script Date: 2/14/2022 5:44:16 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[usp_DUMaker_Letter_B2_generate_getrecord]    Script Date: 2/14/2022 5:44:12 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_DUMaker_Letter_B2_generate_getrecord]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_DUMaker_Letter_B2_generate_getrecord]
GO

/****** Object:  StoredProcedure [dbo].[usp_DUMaker_Letter_B2_generate_getrecord]    Script Date: 2/14/2022 5:44:16 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[usp_DUMaker_Letter_B2_generate_list]    Script Date: 2/14/2022 5:44:12 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_DUMaker_Letter_B2_generate_list]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_DUMaker_Letter_B2_generate_list]
GO

/****** Object:  StoredProcedure [dbo].[usp_DUMaker_Letter_B2_generate_list]    Script Date: 2/14/2022 5:44:16 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[usp_DUMaker_Letter_B3_generate]    Script Date: 2/14/2022 5:44:12 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_DUMaker_Letter_B3_generate]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_DUMaker_Letter_B3_generate]
GO

/****** Object:  StoredProcedure [dbo].[usp_DUMaker_Letter_B3_generate]    Script Date: 2/14/2022 5:44:16 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[usp_DUMaker_Letter_D1_generate]    Script Date: 2/14/2022 5:44:12 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_DUMaker_Letter_D1_generate]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_DUMaker_Letter_D1_generate]
GO

/****** Object:  StoredProcedure [dbo].[usp_DUMaker_Letter_D1_generate]    Script Date: 2/14/2022 5:44:16 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[usp_DUMaker_Letter_DU1_generate]    Script Date: 2/14/2022 5:44:12 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_DUMaker_Letter_DU1_generate]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_DUMaker_Letter_DU1_generate]
GO

/****** Object:  StoredProcedure [dbo].[usp_DUMaker_Letter_DU1_generate]    Script Date: 2/14/2022 5:44:16 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[usp_DUMaker_Letter_DU2_generate]    Script Date: 2/14/2022 5:44:12 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_DUMaker_Letter_DU2_generate]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_DUMaker_Letter_DU2_generate]
GO

/****** Object:  StoredProcedure [dbo].[usp_DUMaker_Letter_DU2_generate]    Script Date: 2/14/2022 5:44:16 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[usp_dynamicqueryExecution]    Script Date: 2/14/2022 5:44:12 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_dynamicqueryExecution]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_dynamicqueryExecution]
GO

/****** Object:  StoredProcedure [dbo].[usp_dynamicqueryExecution]    Script Date: 2/14/2022 5:44:16 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[usp_dynamicqueryExecution_GetResult]    Script Date: 2/14/2022 5:44:12 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_dynamicqueryExecution_GetResult]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_dynamicqueryExecution_GetResult]
GO

/****** Object:  StoredProcedure [dbo].[usp_dynamicqueryExecution_GetResult]    Script Date: 2/14/2022 5:44:16 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[usp_EAM_ExternalUsers]    Script Date: 2/14/2022 5:44:12 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_EAM_ExternalUsers]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_EAM_ExternalUsers]
GO

/****** Object:  StoredProcedure [dbo].[usp_EAM_ExternalUsers]    Script Date: 2/14/2022 5:44:16 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[usp_errorlog_view]    Script Date: 2/14/2022 5:44:12 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_errorlog_view]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_errorlog_view]
GO

/****** Object:  StoredProcedure [dbo].[usp_errorlog_view]    Script Date: 2/14/2022 5:44:16 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[usp_getArtifactLastChangedInfo]    Script Date: 2/14/2022 5:44:12 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_getArtifactLastChangedInfo]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_getArtifactLastChangedInfo]
GO

/****** Object:  StoredProcedure [dbo].[usp_getArtifactLastChangedInfo]    Script Date: 2/14/2022 5:44:16 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[usp_getK2PDFFileContent]    Script Date: 2/14/2022 5:44:12 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_getK2PDFFileContent]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_getK2PDFFileContent]
GO

/****** Object:  StoredProcedure [dbo].[usp_getK2PDFFileContent]    Script Date: 2/14/2022 5:44:16 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[usp_getSettings]    Script Date: 2/14/2022 5:44:12 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_getSettings]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_getSettings]
GO

/****** Object:  StoredProcedure [dbo].[usp_getSettings]    Script Date: 2/14/2022 5:44:16 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[usp_getSolicitorAttachmentFileContent]    Script Date: 2/14/2022 5:44:12 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_getSolicitorAttachmentFileContent]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_getSolicitorAttachmentFileContent]
GO

/****** Object:  StoredProcedure [dbo].[usp_getSolicitorAttachmentFileContent]    Script Date: 2/14/2022 5:44:16 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[usp_getSolicitorCancellationAttachmentFileContent]    Script Date: 2/14/2022 5:44:12 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_getSolicitorCancellationAttachmentFileContent]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_getSolicitorCancellationAttachmentFileContent]
GO

/****** Object:  StoredProcedure [dbo].[usp_getSolicitorCancellationAttachmentFileContent]    Script Date: 2/14/2022 5:44:16 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[usp_getSolicitorList]    Script Date: 2/14/2022 5:44:12 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_getSolicitorList]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_getSolicitorList]
GO

/****** Object:  StoredProcedure [dbo].[usp_getSolicitorList]    Script Date: 2/14/2022 5:44:16 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[usp_getSolicitorOthersAttachmentFileContent]    Script Date: 2/14/2022 5:44:12 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_getSolicitorOthersAttachmentFileContent]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_getSolicitorOthersAttachmentFileContent]
GO

/****** Object:  StoredProcedure [dbo].[usp_getSolicitorOthersAttachmentFileContent]    Script Date: 2/14/2022 5:44:16 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[usp_getValuerAttachmentFileContent]    Script Date: 2/14/2022 5:44:12 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_getValuerAttachmentFileContent]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_getValuerAttachmentFileContent]
GO

/****** Object:  StoredProcedure [dbo].[usp_getValuerAttachmentFileContent]    Script Date: 2/14/2022 5:44:16 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[usp_getValuerList]    Script Date: 2/14/2022 5:44:12 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_getValuerList]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_getValuerList]
GO

/****** Object:  StoredProcedure [dbo].[usp_getValuerList]    Script Date: 2/14/2022 5:44:16 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[usp_get_encryptionkey]    Script Date: 2/14/2022 5:44:12 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_get_encryptionkey]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_get_encryptionkey]
GO

/****** Object:  StoredProcedure [dbo].[usp_get_encryptionkey]    Script Date: 2/14/2022 5:44:16 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[usp_InternalUserLoginLog_Insert]    Script Date: 2/14/2022 5:44:12 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_InternalUserLoginLog_Insert]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_InternalUserLoginLog_Insert]
GO

/****** Object:  StoredProcedure [dbo].[usp_InternalUserLoginLog_Insert]    Script Date: 2/14/2022 5:44:16 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[usp_InternalUserLoginLog_List]    Script Date: 2/14/2022 5:44:12 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_InternalUserLoginLog_List]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_InternalUserLoginLog_List]
GO

/****** Object:  StoredProcedure [dbo].[usp_InternalUserLoginLog_List]    Script Date: 2/14/2022 5:44:16 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[usp_InternalUserLoginTrial]    Script Date: 2/14/2022 5:44:12 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_InternalUserLoginTrial]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_InternalUserLoginTrial]
GO

/****** Object:  StoredProcedure [dbo].[usp_InternalUserLoginTrial]    Script Date: 2/14/2022 5:44:16 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[usp_InternalUserLoginTrialSession_FailedAttemptLog_RptGen]    Script Date: 2/14/2022 5:44:12 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_InternalUserLoginTrialSession_FailedAttemptLog_RptGen]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_InternalUserLoginTrialSession_FailedAttemptLog_RptGen]
GO

/****** Object:  StoredProcedure [dbo].[usp_InternalUserLoginTrialSession_FailedAttemptLog_RptGen]    Script Date: 2/14/2022 5:44:16 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[usp_InternalUserLogin_getNumberOfTrialLeft]    Script Date: 2/14/2022 5:44:12 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_InternalUserLogin_getNumberOfTrialLeft]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_InternalUserLogin_getNumberOfTrialLeft]
GO

/****** Object:  StoredProcedure [dbo].[usp_InternalUserLogin_getNumberOfTrialLeft]    Script Date: 2/14/2022 5:44:16 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[usp_InternalUserLogoutLog_Insert]    Script Date: 2/14/2022 5:44:12 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_InternalUserLogoutLog_Insert]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_InternalUserLogoutLog_Insert]
GO

/****** Object:  StoredProcedure [dbo].[usp_InternalUserLogoutLog_Insert]    Script Date: 2/14/2022 5:44:16 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[usp_InternalUserRole_AddUser_1]    Script Date: 2/14/2022 5:44:12 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_InternalUserRole_AddUser_1]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_InternalUserRole_AddUser_1]
GO

/****** Object:  StoredProcedure [dbo].[usp_InternalUserRole_AddUser_1]    Script Date: 2/14/2022 5:44:16 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[usp_InternalUserRole_AddUser_1b]    Script Date: 2/14/2022 5:44:12 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_InternalUserRole_AddUser_1b]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_InternalUserRole_AddUser_1b]
GO

/****** Object:  StoredProcedure [dbo].[usp_InternalUserRole_AddUser_1b]    Script Date: 2/14/2022 5:44:16 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[usp_InternalUserRole_AddUser_2]    Script Date: 2/14/2022 5:44:12 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_InternalUserRole_AddUser_2]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_InternalUserRole_AddUser_2]
GO

/****** Object:  StoredProcedure [dbo].[usp_InternalUserRole_AddUser_2]    Script Date: 2/14/2022 5:44:16 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[usp_InternalUserRole_AddUser_3]    Script Date: 2/14/2022 5:44:12 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_InternalUserRole_AddUser_3]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_InternalUserRole_AddUser_3]
GO

/****** Object:  StoredProcedure [dbo].[usp_InternalUserRole_AddUser_3]    Script Date: 2/14/2022 5:44:16 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[usp_InternalUserRole_AddUser_3b]    Script Date: 2/14/2022 5:44:12 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_InternalUserRole_AddUser_3b]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_InternalUserRole_AddUser_3b]
GO

/****** Object:  StoredProcedure [dbo].[usp_InternalUserRole_AddUser_3b]    Script Date: 2/14/2022 5:44:16 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[usp_InternalUserRole_Delete]    Script Date: 2/14/2022 5:44:12 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_InternalUserRole_Delete]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_InternalUserRole_Delete]
GO

/****** Object:  StoredProcedure [dbo].[usp_InternalUserRole_Delete]    Script Date: 2/14/2022 5:44:16 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[usp_InternalUserRole_Edit]    Script Date: 2/14/2022 5:44:12 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_InternalUserRole_Edit]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_InternalUserRole_Edit]
GO

/****** Object:  StoredProcedure [dbo].[usp_InternalUserRole_Edit]    Script Date: 2/14/2022 5:44:16 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[usp_InternalUserRole_GenerateUAM]    Script Date: 2/14/2022 5:44:12 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_InternalUserRole_GenerateUAM]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_InternalUserRole_GenerateUAM]
GO

/****** Object:  StoredProcedure [dbo].[usp_InternalUserRole_GenerateUAM]    Script Date: 2/14/2022 5:44:16 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[usp_InternalUserRole_GenerateUAM2]    Script Date: 2/14/2022 5:44:12 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_InternalUserRole_GenerateUAM2]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_InternalUserRole_GenerateUAM2]
GO

/****** Object:  StoredProcedure [dbo].[usp_InternalUserRole_GenerateUAM2]    Script Date: 2/14/2022 5:44:16 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[usp_InternalUserRole_GenerateUAM3]    Script Date: 2/14/2022 5:44:12 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_InternalUserRole_GenerateUAM3]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_InternalUserRole_GenerateUAM3]
GO

/****** Object:  StoredProcedure [dbo].[usp_InternalUserRole_GenerateUAM3]    Script Date: 2/14/2022 5:44:16 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[usp_InternalUserRole_GenerateUAM4]    Script Date: 2/14/2022 5:44:12 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_InternalUserRole_GenerateUAM4]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_InternalUserRole_GenerateUAM4]
GO

/****** Object:  StoredProcedure [dbo].[usp_InternalUserRole_GenerateUAM4]    Script Date: 2/14/2022 5:44:16 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[usp_InternalUserRole_GenerateUAM5]    Script Date: 2/14/2022 5:44:12 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_InternalUserRole_GenerateUAM5]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_InternalUserRole_GenerateUAM5]
GO

/****** Object:  StoredProcedure [dbo].[usp_InternalUserRole_GenerateUAM5]    Script Date: 2/14/2022 5:44:16 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[usp_InternalUserRole_GenerateUAM6]    Script Date: 2/14/2022 5:44:12 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_InternalUserRole_GenerateUAM6]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_InternalUserRole_GenerateUAM6]
GO

/****** Object:  StoredProcedure [dbo].[usp_InternalUserRole_GenerateUAM6]    Script Date: 2/14/2022 5:44:16 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[usp_InternalUserRole_GetRoleByUser]    Script Date: 2/14/2022 5:44:12 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_InternalUserRole_GetRoleByUser]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_InternalUserRole_GetRoleByUser]
GO

/****** Object:  StoredProcedure [dbo].[usp_InternalUserRole_GetRoleByUser]    Script Date: 2/14/2022 5:44:16 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[usp_InternalUserRole_Insert]    Script Date: 2/14/2022 5:44:12 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_InternalUserRole_Insert]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_InternalUserRole_Insert]
GO

/****** Object:  StoredProcedure [dbo].[usp_InternalUserRole_Insert]    Script Date: 2/14/2022 5:44:16 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[usp_InternalUserRole_IsUserAuthorized]    Script Date: 2/14/2022 5:44:12 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_InternalUserRole_IsUserAuthorized]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_InternalUserRole_IsUserAuthorized]
GO

/****** Object:  StoredProcedure [dbo].[usp_InternalUserRole_IsUserAuthorized]    Script Date: 2/14/2022 5:44:16 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[usp_InternalUserRole_SaveUser_step1]    Script Date: 2/14/2022 5:44:12 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_InternalUserRole_SaveUser_step1]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_InternalUserRole_SaveUser_step1]
GO

/****** Object:  StoredProcedure [dbo].[usp_InternalUserRole_SaveUser_step1]    Script Date: 2/14/2022 5:44:16 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[usp_InternalUserRole_SelectAll]    Script Date: 2/14/2022 5:44:12 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_InternalUserRole_SelectAll]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_InternalUserRole_SelectAll]
GO

/****** Object:  StoredProcedure [dbo].[usp_InternalUserRole_SelectAll]    Script Date: 2/14/2022 5:44:16 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[usp_InternalUserRole_SelectAllUsers]    Script Date: 2/14/2022 5:44:12 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_InternalUserRole_SelectAllUsers]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_InternalUserRole_SelectAllUsers]
GO

/****** Object:  StoredProcedure [dbo].[usp_InternalUserRole_SelectAllUsers]    Script Date: 2/14/2022 5:44:16 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[usp_InternalUserRole_SelectAllWithAccess]    Script Date: 2/14/2022 5:44:12 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_InternalUserRole_SelectAllWithAccess]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_InternalUserRole_SelectAllWithAccess]
GO

/****** Object:  StoredProcedure [dbo].[usp_InternalUserRole_SelectAllWithAccess]    Script Date: 2/14/2022 5:44:16 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[usp_InternalUserRole_SelectByID]    Script Date: 2/14/2022 5:44:12 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_InternalUserRole_SelectByID]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_InternalUserRole_SelectByID]
GO

/****** Object:  StoredProcedure [dbo].[usp_InternalUserRole_SelectByID]    Script Date: 2/14/2022 5:44:16 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[usp_InternalUserRole_SelectRemainingRole]    Script Date: 2/14/2022 5:44:12 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_InternalUserRole_SelectRemainingRole]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_InternalUserRole_SelectRemainingRole]
GO

/****** Object:  StoredProcedure [dbo].[usp_InternalUserRole_SelectRemainingRole]    Script Date: 2/14/2022 5:44:16 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[usp_InternalUserRole_SelectUserList_Disbursement]    Script Date: 2/14/2022 5:44:12 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_InternalUserRole_SelectUserList_Disbursement]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_InternalUserRole_SelectUserList_Disbursement]
GO

/****** Object:  StoredProcedure [dbo].[usp_InternalUserRole_SelectUserList_Disbursement]    Script Date: 2/14/2022 5:44:16 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[usp_InternalUserRole_SelectUserList_DU]    Script Date: 2/14/2022 5:44:12 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_InternalUserRole_SelectUserList_DU]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_InternalUserRole_SelectUserList_DU]
GO

/****** Object:  StoredProcedure [dbo].[usp_InternalUserRole_SelectUserList_DU]    Script Date: 2/14/2022 5:44:16 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[usp_InternalUserRole_SelectUserList_VU2]    Script Date: 2/14/2022 5:44:12 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_InternalUserRole_SelectUserList_VU2]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_InternalUserRole_SelectUserList_VU2]
GO

/****** Object:  StoredProcedure [dbo].[usp_InternalUserRole_SelectUserList_VU2]    Script Date: 2/14/2022 5:44:16 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[usp_InternalUser_ActiveUsers_SelectAll]    Script Date: 2/14/2022 5:44:12 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_InternalUser_ActiveUsers_SelectAll]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_InternalUser_ActiveUsers_SelectAll]
GO

/****** Object:  StoredProcedure [dbo].[usp_InternalUser_ActiveUsers_SelectAll]    Script Date: 2/14/2022 5:44:16 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[usp_InternalUser_CheckClosed]    Script Date: 2/14/2022 5:44:12 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_InternalUser_CheckClosed]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_InternalUser_CheckClosed]
GO

/****** Object:  StoredProcedure [dbo].[usp_InternalUser_CheckClosed]    Script Date: 2/14/2022 5:44:16 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[usp_InternalUser_Closed_GetList]    Script Date: 2/14/2022 5:44:12 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_InternalUser_Closed_GetList]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_InternalUser_Closed_GetList]
GO

/****** Object:  StoredProcedure [dbo].[usp_InternalUser_Closed_GetList]    Script Date: 2/14/2022 5:44:16 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[usp_InternalUser_GenerateDormantIDReport]    Script Date: 2/14/2022 5:44:12 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_InternalUser_GenerateDormantIDReport]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_InternalUser_GenerateDormantIDReport]
GO

/****** Object:  StoredProcedure [dbo].[usp_InternalUser_GenerateDormantIDReport]    Script Date: 2/14/2022 5:44:16 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[usp_InternalUser_GetRemarks]    Script Date: 2/14/2022 5:44:12 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_InternalUser_GetRemarks]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_InternalUser_GetRemarks]
GO

/****** Object:  StoredProcedure [dbo].[usp_InternalUser_GetRemarks]    Script Date: 2/14/2022 5:44:16 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[usp_InternalUser_InactiveUsers_SelectAll]    Script Date: 2/14/2022 5:44:12 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_InternalUser_InactiveUsers_SelectAll]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_InternalUser_InactiveUsers_SelectAll]
GO

/****** Object:  StoredProcedure [dbo].[usp_InternalUser_InactiveUsers_SelectAll]    Script Date: 2/14/2022 5:44:16 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[usp_InternalUser_SelectAll]    Script Date: 2/14/2022 5:44:12 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_InternalUser_SelectAll]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_InternalUser_SelectAll]
GO

/****** Object:  StoredProcedure [dbo].[usp_InternalUser_SelectAll]    Script Date: 2/14/2022 5:44:16 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[usp_InternalUser_SelectByID]    Script Date: 2/14/2022 5:44:12 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_InternalUser_SelectByID]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_InternalUser_SelectByID]
GO

/****** Object:  StoredProcedure [dbo].[usp_InternalUser_SelectByID]    Script Date: 2/14/2022 5:44:16 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[usp_InternalUser_Session_check_and_create]    Script Date: 2/14/2022 5:44:12 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_InternalUser_Session_check_and_create]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_InternalUser_Session_check_and_create]
GO

/****** Object:  StoredProcedure [dbo].[usp_InternalUser_Session_check_and_create]    Script Date: 2/14/2022 5:44:16 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[usp_InternalUser_Session_delete]    Script Date: 2/14/2022 5:44:12 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_InternalUser_Session_delete]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_InternalUser_Session_delete]
GO

/****** Object:  StoredProcedure [dbo].[usp_InternalUser_Session_delete]    Script Date: 2/14/2022 5:44:16 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[usp_InternalUser_Session_ExtendSessionByUserActionAndReturnNewSessionPeriod]    Script Date: 2/14/2022 5:44:12 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_InternalUser_Session_ExtendSessionByUserActionAndReturnNewSessionPeriod]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_InternalUser_Session_ExtendSessionByUserActionAndReturnNewSessionPeriod]
GO

/****** Object:  StoredProcedure [dbo].[usp_InternalUser_Session_ExtendSessionByUserActionAndReturnNewSessionPeriod]    Script Date: 2/14/2022 5:44:16 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[usp_InternalUser_Session_GetGeneralSessionInSecond]    Script Date: 2/14/2022 5:44:12 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_InternalUser_Session_GetGeneralSessionInSecond]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_InternalUser_Session_GetGeneralSessionInSecond]
GO

/****** Object:  StoredProcedure [dbo].[usp_InternalUser_Session_GetGeneralSessionInSecond]    Script Date: 2/14/2022 5:44:16 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[usp_InternalUser_Session_GetSessionRemainingTime]    Script Date: 2/14/2022 5:44:12 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_InternalUser_Session_GetSessionRemainingTime]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_InternalUser_Session_GetSessionRemainingTime]
GO

/****** Object:  StoredProcedure [dbo].[usp_InternalUser_Session_GetSessionRemainingTime]    Script Date: 2/14/2022 5:44:16 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[usp_InternalUser_SetActive]    Script Date: 2/14/2022 5:44:12 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_InternalUser_SetActive]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_InternalUser_SetActive]
GO

/****** Object:  StoredProcedure [dbo].[usp_InternalUser_SetActive]    Script Date: 2/14/2022 5:44:16 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[usp_InternalUser_SetClosed]    Script Date: 2/14/2022 5:44:12 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_InternalUser_SetClosed]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_InternalUser_SetClosed]
GO

/****** Object:  StoredProcedure [dbo].[usp_InternalUser_SetClosed]    Script Date: 2/14/2022 5:44:16 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[usp_InternalUser_SetInactive]    Script Date: 2/14/2022 5:44:12 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_InternalUser_SetInactive]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_InternalUser_SetInactive]
GO

/****** Object:  StoredProcedure [dbo].[usp_InternalUser_SetInactive]    Script Date: 2/14/2022 5:44:16 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[usp_loadImage]    Script Date: 2/14/2022 5:44:12 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_loadImage]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_loadImage]
GO

/****** Object:  StoredProcedure [dbo].[usp_loadImage]    Script Date: 2/14/2022 5:44:16 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[usp_LOADS_selectby_ARN]    Script Date: 2/14/2022 5:44:12 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_LOADS_selectby_ARN]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_LOADS_selectby_ARN]
GO

/****** Object:  StoredProcedure [dbo].[usp_LOADS_selectby_ARN]    Script Date: 2/14/2022 5:44:16 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[usp_LOADS_select_UAT]    Script Date: 2/14/2022 5:44:12 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_LOADS_select_UAT]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_LOADS_select_UAT]
GO

/****** Object:  StoredProcedure [dbo].[usp_LOADS_select_UAT]    Script Date: 2/14/2022 5:44:16 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[usp_LOADS_update]    Script Date: 2/14/2022 5:44:12 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_LOADS_update]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_LOADS_update]
GO

/****** Object:  StoredProcedure [dbo].[usp_LOADS_update]    Script Date: 2/14/2022 5:44:16 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[usp_LOADS_update_UAT]    Script Date: 2/14/2022 5:44:12 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_LOADS_update_UAT]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_LOADS_update_UAT]
GO

/****** Object:  StoredProcedure [dbo].[usp_LOADS_update_UAT]    Script Date: 2/14/2022 5:44:16 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[usp_Maintenance_SQLSolicitor_GetCurrentPassword]    Script Date: 2/14/2022 5:44:12 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_Maintenance_SQLSolicitor_GetCurrentPassword]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_Maintenance_SQLSolicitor_GetCurrentPassword]
GO

/****** Object:  StoredProcedure [dbo].[usp_Maintenance_SQLSolicitor_GetCurrentPassword]    Script Date: 2/14/2022 5:44:16 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[usp_Maintenance_SQLSolicitor_Login_Check]    Script Date: 2/14/2022 5:44:12 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_Maintenance_SQLSolicitor_Login_Check]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_Maintenance_SQLSolicitor_Login_Check]
GO

/****** Object:  StoredProcedure [dbo].[usp_Maintenance_SQLSolicitor_Login_Check]    Script Date: 2/14/2022 5:44:16 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[usp_Maintenance_SQLSolicitor_PasswordReset_Check]    Script Date: 2/14/2022 5:44:12 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_Maintenance_SQLSolicitor_PasswordReset_Check]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_Maintenance_SQLSolicitor_PasswordReset_Check]
GO

/****** Object:  StoredProcedure [dbo].[usp_Maintenance_SQLSolicitor_PasswordReset_Check]    Script Date: 2/14/2022 5:44:16 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[usp_Maintenance_SQLSolicitor_PasswordReset_GenerateEmail]    Script Date: 2/14/2022 5:44:12 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_Maintenance_SQLSolicitor_PasswordReset_GenerateEmail]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_Maintenance_SQLSolicitor_PasswordReset_GenerateEmail]
GO

/****** Object:  StoredProcedure [dbo].[usp_Maintenance_SQLSolicitor_PasswordReset_GenerateEmail]    Script Date: 2/14/2022 5:44:16 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[usp_Maintenance_SQLSolicitor_PasswordReset_updatePassword]    Script Date: 2/14/2022 5:44:12 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_Maintenance_SQLSolicitor_PasswordReset_updatePassword]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_Maintenance_SQLSolicitor_PasswordReset_updatePassword]
GO

/****** Object:  StoredProcedure [dbo].[usp_Maintenance_SQLSolicitor_PasswordReset_updatePassword]    Script Date: 2/14/2022 5:44:16 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[usp_Maintenance_SQLSolicitor_PasswordReset_updatePassword_Final]    Script Date: 2/14/2022 5:44:12 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_Maintenance_SQLSolicitor_PasswordReset_updatePassword_Final]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_Maintenance_SQLSolicitor_PasswordReset_updatePassword_Final]
GO

/****** Object:  StoredProcedure [dbo].[usp_Maintenance_SQLSolicitor_PasswordReset_updatePassword_Final]    Script Date: 2/14/2022 5:44:16 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[usp_Maintenance_SQLSolicitor_PasswordUpdate]    Script Date: 2/14/2022 5:44:12 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_Maintenance_SQLSolicitor_PasswordUpdate]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_Maintenance_SQLSolicitor_PasswordUpdate]
GO

/****** Object:  StoredProcedure [dbo].[usp_Maintenance_SQLSolicitor_PasswordUpdate]    Script Date: 2/14/2022 5:44:16 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[usp_Maintenance_SQLSolicitor_PasswordUpdate_Final]    Script Date: 2/14/2022 5:44:12 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_Maintenance_SQLSolicitor_PasswordUpdate_Final]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_Maintenance_SQLSolicitor_PasswordUpdate_Final]
GO

/****** Object:  StoredProcedure [dbo].[usp_Maintenance_SQLSolicitor_PasswordUpdate_Final]    Script Date: 2/14/2022 5:44:16 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[usp_Maintenance_SQLValuer_GetCurrentPassword]    Script Date: 2/14/2022 5:44:12 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_Maintenance_SQLValuer_GetCurrentPassword]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_Maintenance_SQLValuer_GetCurrentPassword]
GO

/****** Object:  StoredProcedure [dbo].[usp_Maintenance_SQLValuer_GetCurrentPassword]    Script Date: 2/14/2022 5:44:16 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[usp_Maintenance_SQLValuer_Login_Check]    Script Date: 2/14/2022 5:44:12 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_Maintenance_SQLValuer_Login_Check]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_Maintenance_SQLValuer_Login_Check]
GO

/****** Object:  StoredProcedure [dbo].[usp_Maintenance_SQLValuer_Login_Check]    Script Date: 2/14/2022 5:44:16 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[usp_Maintenance_SQLValuer_PasswordReset_Check]    Script Date: 2/14/2022 5:44:12 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_Maintenance_SQLValuer_PasswordReset_Check]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_Maintenance_SQLValuer_PasswordReset_Check]
GO

/****** Object:  StoredProcedure [dbo].[usp_Maintenance_SQLValuer_PasswordReset_Check]    Script Date: 2/14/2022 5:44:16 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[usp_Maintenance_SQLValuer_PasswordReset_GenerateEmail]    Script Date: 2/14/2022 5:44:12 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_Maintenance_SQLValuer_PasswordReset_GenerateEmail]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_Maintenance_SQLValuer_PasswordReset_GenerateEmail]
GO

/****** Object:  StoredProcedure [dbo].[usp_Maintenance_SQLValuer_PasswordReset_GenerateEmail]    Script Date: 2/14/2022 5:44:16 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[usp_Maintenance_SQLValuer_PasswordReset_updatePassword]    Script Date: 2/14/2022 5:44:12 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_Maintenance_SQLValuer_PasswordReset_updatePassword]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_Maintenance_SQLValuer_PasswordReset_updatePassword]
GO

/****** Object:  StoredProcedure [dbo].[usp_Maintenance_SQLValuer_PasswordReset_updatePassword]    Script Date: 2/14/2022 5:44:16 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[usp_Maintenance_SQLValuer_PasswordReset_updatePassword_Final]    Script Date: 2/14/2022 5:44:12 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_Maintenance_SQLValuer_PasswordReset_updatePassword_Final]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_Maintenance_SQLValuer_PasswordReset_updatePassword_Final]
GO

/****** Object:  StoredProcedure [dbo].[usp_Maintenance_SQLValuer_PasswordReset_updatePassword_Final]    Script Date: 2/14/2022 5:44:16 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[usp_Maintenance_SQLValuer_PasswordUpdate]    Script Date: 2/14/2022 5:44:12 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_Maintenance_SQLValuer_PasswordUpdate]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_Maintenance_SQLValuer_PasswordUpdate]
GO

/****** Object:  StoredProcedure [dbo].[usp_Maintenance_SQLValuer_PasswordUpdate]    Script Date: 2/14/2022 5:44:16 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[usp_Maintenance_SQLValuer_PasswordUpdate_Final]    Script Date: 2/14/2022 5:44:12 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_Maintenance_SQLValuer_PasswordUpdate_Final]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_Maintenance_SQLValuer_PasswordUpdate_Final]
GO

/****** Object:  StoredProcedure [dbo].[usp_Maintenance_SQLValuer_PasswordUpdate_Final]    Script Date: 2/14/2022 5:44:16 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[usp_MortgageAppTaskInstance_billing_create]    Script Date: 2/14/2022 5:44:12 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_MortgageAppTaskInstance_billing_create]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_MortgageAppTaskInstance_billing_create]
GO

/****** Object:  StoredProcedure [dbo].[usp_MortgageAppTaskInstance_billing_create]    Script Date: 2/14/2022 5:44:16 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[usp_MortgageAppTaskInstance_billing_delete]    Script Date: 2/14/2022 5:44:12 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_MortgageAppTaskInstance_billing_delete]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_MortgageAppTaskInstance_billing_delete]
GO

/****** Object:  StoredProcedure [dbo].[usp_MortgageAppTaskInstance_billing_delete]    Script Date: 2/14/2022 5:44:16 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[usp_MortgageAppTaskInstance_billing_select_DisbursementChecker]    Script Date: 2/14/2022 5:44:12 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_MortgageAppTaskInstance_billing_select_DisbursementChecker]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_MortgageAppTaskInstance_billing_select_DisbursementChecker]
GO

/****** Object:  StoredProcedure [dbo].[usp_MortgageAppTaskInstance_billing_select_DisbursementChecker]    Script Date: 2/14/2022 5:44:16 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[usp_MortgageAppTaskInstance_billing_select_DisbursementMaker]    Script Date: 2/14/2022 5:44:12 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_MortgageAppTaskInstance_billing_select_DisbursementMaker]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_MortgageAppTaskInstance_billing_select_DisbursementMaker]
GO

/****** Object:  StoredProcedure [dbo].[usp_MortgageAppTaskInstance_billing_select_DisbursementMaker]    Script Date: 2/14/2022 5:44:16 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[usp_MortgageAppTaskInstance_billing_select_RCOChecker]    Script Date: 2/14/2022 5:44:12 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_MortgageAppTaskInstance_billing_select_RCOChecker]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_MortgageAppTaskInstance_billing_select_RCOChecker]
GO

/****** Object:  StoredProcedure [dbo].[usp_MortgageAppTaskInstance_billing_select_RCOChecker]    Script Date: 2/14/2022 5:44:16 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[usp_MortgageAppTaskInstance_billing_select_RCOMaker]    Script Date: 2/14/2022 5:44:12 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_MortgageAppTaskInstance_billing_select_RCOMaker]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_MortgageAppTaskInstance_billing_select_RCOMaker]
GO

/****** Object:  StoredProcedure [dbo].[usp_MortgageAppTaskInstance_billing_select_RCOMaker]    Script Date: 2/14/2022 5:44:16 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[usp_MortgageAppTaskInstance_create]    Script Date: 2/14/2022 5:44:12 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_MortgageAppTaskInstance_create]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_MortgageAppTaskInstance_create]
GO

/****** Object:  StoredProcedure [dbo].[usp_MortgageAppTaskInstance_create]    Script Date: 2/14/2022 5:44:16 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[usp_MortgageAppTaskInstance_delete]    Script Date: 2/14/2022 5:44:12 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_MortgageAppTaskInstance_delete]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_MortgageAppTaskInstance_delete]
GO

/****** Object:  StoredProcedure [dbo].[usp_MortgageAppTaskInstance_delete]    Script Date: 2/14/2022 5:44:16 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[usp_MortgageAppTaskInstance_Disbursement_Billing_list]    Script Date: 2/14/2022 5:44:12 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_MortgageAppTaskInstance_Disbursement_Billing_list]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_MortgageAppTaskInstance_Disbursement_Billing_list]
GO

/****** Object:  StoredProcedure [dbo].[usp_MortgageAppTaskInstance_Disbursement_Billing_list]    Script Date: 2/14/2022 5:44:16 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[usp_MortgageAppTaskInstance_Disbursement_Billing_TaskRedirect]    Script Date: 2/14/2022 5:44:12 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_MortgageAppTaskInstance_Disbursement_Billing_TaskRedirect]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_MortgageAppTaskInstance_Disbursement_Billing_TaskRedirect]
GO

/****** Object:  StoredProcedure [dbo].[usp_MortgageAppTaskInstance_Disbursement_Billing_TaskRedirect]    Script Date: 2/14/2022 5:44:16 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[usp_MortgageAppTaskInstance_Disbursement_list]    Script Date: 2/14/2022 5:44:12 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_MortgageAppTaskInstance_Disbursement_list]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_MortgageAppTaskInstance_Disbursement_list]
GO

/****** Object:  StoredProcedure [dbo].[usp_MortgageAppTaskInstance_Disbursement_list]    Script Date: 2/14/2022 5:44:16 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[usp_MortgageAppTaskInstance_Disbursement_TaskRedirect]    Script Date: 2/14/2022 5:44:12 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_MortgageAppTaskInstance_Disbursement_TaskRedirect]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_MortgageAppTaskInstance_Disbursement_TaskRedirect]
GO

/****** Object:  StoredProcedure [dbo].[usp_MortgageAppTaskInstance_Disbursement_TaskRedirect]    Script Date: 2/14/2022 5:44:16 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[usp_MortgageAppTaskInstance_list]    Script Date: 2/14/2022 5:44:12 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_MortgageAppTaskInstance_list]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_MortgageAppTaskInstance_list]
GO

/****** Object:  StoredProcedure [dbo].[usp_MortgageAppTaskInstance_list]    Script Date: 2/14/2022 5:44:16 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[usp_MortgageAppTaskInstance_select_Billing]    Script Date: 2/14/2022 5:44:12 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_MortgageAppTaskInstance_select_Billing]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_MortgageAppTaskInstance_select_Billing]
GO

/****** Object:  StoredProcedure [dbo].[usp_MortgageAppTaskInstance_select_Billing]    Script Date: 2/14/2022 5:44:16 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[usp_MortgageAppTaskInstance_select_Billing_ByARN_Billing]    Script Date: 2/14/2022 5:44:12 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_MortgageAppTaskInstance_select_Billing_ByARN_Billing]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_MortgageAppTaskInstance_select_Billing_ByARN_Billing]
GO

/****** Object:  StoredProcedure [dbo].[usp_MortgageAppTaskInstance_select_Billing_ByARN_Billing]    Script Date: 2/14/2022 5:44:16 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[usp_MortgageAppTaskInstance_select_Billing_RunningID]    Script Date: 2/14/2022 5:44:12 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_MortgageAppTaskInstance_select_Billing_RunningID]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_MortgageAppTaskInstance_select_Billing_RunningID]
GO

/****** Object:  StoredProcedure [dbo].[usp_MortgageAppTaskInstance_select_Billing_RunningID]    Script Date: 2/14/2022 5:44:16 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[usp_MortgageAppTaskInstance_select_Disbursement]    Script Date: 2/14/2022 5:44:12 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_MortgageAppTaskInstance_select_Disbursement]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_MortgageAppTaskInstance_select_Disbursement]
GO

/****** Object:  StoredProcedure [dbo].[usp_MortgageAppTaskInstance_select_Disbursement]    Script Date: 2/14/2022 5:44:16 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[usp_MortgageAppTaskInstance_select_DisbursementChecker]    Script Date: 2/14/2022 5:44:12 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_MortgageAppTaskInstance_select_DisbursementChecker]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_MortgageAppTaskInstance_select_DisbursementChecker]
GO

/****** Object:  StoredProcedure [dbo].[usp_MortgageAppTaskInstance_select_DisbursementChecker]    Script Date: 2/14/2022 5:44:16 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[usp_MortgageAppTaskInstance_select_DisbursementChecker_ByARN]    Script Date: 2/14/2022 5:44:12 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_MortgageAppTaskInstance_select_DisbursementChecker_ByARN]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_MortgageAppTaskInstance_select_DisbursementChecker_ByARN]
GO

/****** Object:  StoredProcedure [dbo].[usp_MortgageAppTaskInstance_select_DisbursementChecker_ByARN]    Script Date: 2/14/2022 5:44:16 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[usp_MortgageAppTaskInstance_select_DisbursementMaker]    Script Date: 2/14/2022 5:44:12 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_MortgageAppTaskInstance_select_DisbursementMaker]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_MortgageAppTaskInstance_select_DisbursementMaker]
GO

/****** Object:  StoredProcedure [dbo].[usp_MortgageAppTaskInstance_select_DisbursementMaker]    Script Date: 2/14/2022 5:44:16 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[usp_MortgageAppTaskInstance_select_DisbursementMaker_ByARN]    Script Date: 2/14/2022 5:44:12 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_MortgageAppTaskInstance_select_DisbursementMaker_ByARN]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_MortgageAppTaskInstance_select_DisbursementMaker_ByARN]
GO

/****** Object:  StoredProcedure [dbo].[usp_MortgageAppTaskInstance_select_DisbursementMaker_ByARN]    Script Date: 2/14/2022 5:44:16 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[usp_MortgageAppTaskInstance_select_Disbursement_ByARN]    Script Date: 2/14/2022 5:44:12 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_MortgageAppTaskInstance_select_Disbursement_ByARN]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_MortgageAppTaskInstance_select_Disbursement_ByARN]
GO

/****** Object:  StoredProcedure [dbo].[usp_MortgageAppTaskInstance_select_Disbursement_ByARN]    Script Date: 2/14/2022 5:44:16 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[usp_MortgageAppTaskInstance_select_DU]    Script Date: 2/14/2022 5:44:12 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_MortgageAppTaskInstance_select_DU]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_MortgageAppTaskInstance_select_DU]
GO

/****** Object:  StoredProcedure [dbo].[usp_MortgageAppTaskInstance_select_DU]    Script Date: 2/14/2022 5:44:16 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[usp_MortgageAppTaskInstance_select_DU_ByARN]    Script Date: 2/14/2022 5:44:12 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_MortgageAppTaskInstance_select_DU_ByARN]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_MortgageAppTaskInstance_select_DU_ByARN]
GO

/****** Object:  StoredProcedure [dbo].[usp_MortgageAppTaskInstance_select_DU_ByARN]    Script Date: 2/14/2022 5:44:16 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[usp_MortgageAppTaskInstance_select_RCOChecker]    Script Date: 2/14/2022 5:44:12 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_MortgageAppTaskInstance_select_RCOChecker]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_MortgageAppTaskInstance_select_RCOChecker]
GO

/****** Object:  StoredProcedure [dbo].[usp_MortgageAppTaskInstance_select_RCOChecker]    Script Date: 2/14/2022 5:44:16 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[usp_MortgageAppTaskInstance_select_RCOChecker_ByARN]    Script Date: 2/14/2022 5:44:12 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_MortgageAppTaskInstance_select_RCOChecker_ByARN]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_MortgageAppTaskInstance_select_RCOChecker_ByARN]
GO

/****** Object:  StoredProcedure [dbo].[usp_MortgageAppTaskInstance_select_RCOChecker_ByARN]    Script Date: 2/14/2022 5:44:16 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[usp_MortgageAppTaskInstance_select_RCOMaker]    Script Date: 2/14/2022 5:44:12 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_MortgageAppTaskInstance_select_RCOMaker]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_MortgageAppTaskInstance_select_RCOMaker]
GO

/****** Object:  StoredProcedure [dbo].[usp_MortgageAppTaskInstance_select_RCOMaker]    Script Date: 2/14/2022 5:44:16 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[usp_MortgageAppTaskInstance_select_RCOMaker_ByARN]    Script Date: 2/14/2022 5:44:12 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_MortgageAppTaskInstance_select_RCOMaker_ByARN]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_MortgageAppTaskInstance_select_RCOMaker_ByARN]
GO

/****** Object:  StoredProcedure [dbo].[usp_MortgageAppTaskInstance_select_RCOMaker_ByARN]    Script Date: 2/14/2022 5:44:16 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[usp_MortgageAppTaskInstance_select_VU2]    Script Date: 2/14/2022 5:44:12 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_MortgageAppTaskInstance_select_VU2]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_MortgageAppTaskInstance_select_VU2]
GO

/****** Object:  StoredProcedure [dbo].[usp_MortgageAppTaskInstance_select_VU2]    Script Date: 2/14/2022 5:44:16 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[usp_MortgageAppTaskInstance_select_VU_ByARN]    Script Date: 2/14/2022 5:44:12 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_MortgageAppTaskInstance_select_VU_ByARN]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_MortgageAppTaskInstance_select_VU_ByARN]
GO

/****** Object:  StoredProcedure [dbo].[usp_MortgageAppTaskInstance_select_VU_ByARN]    Script Date: 2/14/2022 5:44:16 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[usp_MortgageAppTaskInstance_TaskRedirect]    Script Date: 2/14/2022 5:44:12 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_MortgageAppTaskInstance_TaskRedirect]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_MortgageAppTaskInstance_TaskRedirect]
GO

/****** Object:  StoredProcedure [dbo].[usp_MortgageAppTaskInstance_TaskRedirect]    Script Date: 2/14/2022 5:44:16 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[usp_MRTAAcctNumberSetting_GetHLA]    Script Date: 2/14/2022 5:44:12 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_MRTAAcctNumberSetting_GetHLA]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_MRTAAcctNumberSetting_GetHLA]
GO

/****** Object:  StoredProcedure [dbo].[usp_MRTAAcctNumberSetting_GetHLA]    Script Date: 2/14/2022 5:44:16 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[usp_MRTAAcctNumberSetting_GetHLMT]    Script Date: 2/14/2022 5:44:12 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_MRTAAcctNumberSetting_GetHLMT]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_MRTAAcctNumberSetting_GetHLMT]
GO

/****** Object:  StoredProcedure [dbo].[usp_MRTAAcctNumberSetting_GetHLMT]    Script Date: 2/14/2022 5:44:16 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[usp_NewLI_Rerun_GetList]    Script Date: 2/14/2022 5:44:12 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_NewLI_Rerun_GetList]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_NewLI_Rerun_GetList]
GO

/****** Object:  StoredProcedure [dbo].[usp_NewLI_Rerun_GetList]    Script Date: 2/14/2022 5:44:16 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[usp_PDFPasswordSol_getPassword]    Script Date: 2/14/2022 5:44:12 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_PDFPasswordSol_getPassword]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_PDFPasswordSol_getPassword]
GO

/****** Object:  StoredProcedure [dbo].[usp_PDFPasswordSol_getPassword]    Script Date: 2/14/2022 5:44:16 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[usp_ProjectLoginSessionCheck]    Script Date: 2/14/2022 5:44:12 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_ProjectLoginSessionCheck]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_ProjectLoginSessionCheck]
GO

/****** Object:  StoredProcedure [dbo].[usp_ProjectLoginSessionCheck]    Script Date: 2/14/2022 5:44:16 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[usp_ProjectLogin_ForcePasswordChangeCheck]    Script Date: 2/14/2022 5:44:12 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_ProjectLogin_ForcePasswordChangeCheck]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_ProjectLogin_ForcePasswordChangeCheck]
GO

/****** Object:  StoredProcedure [dbo].[usp_ProjectLogin_ForcePasswordChangeCheck]    Script Date: 2/14/2022 5:44:16 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[usp_ProjectSession_Create]    Script Date: 2/14/2022 5:44:12 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_ProjectSession_Create]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_ProjectSession_Create]
GO

/****** Object:  StoredProcedure [dbo].[usp_ProjectSession_Create]    Script Date: 2/14/2022 5:44:16 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[usp_saveSettings]    Script Date: 2/14/2022 5:44:12 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_saveSettings]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_saveSettings]
GO

/****** Object:  StoredProcedure [dbo].[usp_saveSettings]    Script Date: 2/14/2022 5:44:16 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[usp_solicitorinstance_check]    Script Date: 2/14/2022 5:44:12 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_solicitorinstance_check]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_solicitorinstance_check]
GO

/****** Object:  StoredProcedure [dbo].[usp_solicitorinstance_check]    Script Date: 2/14/2022 5:44:16 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[usp_solicitorinstance_remove]    Script Date: 2/14/2022 5:44:12 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_solicitorinstance_remove]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_solicitorinstance_remove]
GO

/****** Object:  StoredProcedure [dbo].[usp_solicitorinstance_remove]    Script Date: 2/14/2022 5:44:16 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[usp_solicitorinstance_removeSolicitor]    Script Date: 2/14/2022 5:44:12 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_solicitorinstance_removeSolicitor]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_solicitorinstance_removeSolicitor]
GO

/****** Object:  StoredProcedure [dbo].[usp_solicitorinstance_removeSolicitor]    Script Date: 2/14/2022 5:44:16 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[usp_SolicitorLoginLog_List]    Script Date: 2/14/2022 5:44:12 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_SolicitorLoginLog_List]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_SolicitorLoginLog_List]
GO

/****** Object:  StoredProcedure [dbo].[usp_SolicitorLoginLog_List]    Script Date: 2/14/2022 5:44:16 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[usp_SolicitorLoginSessionCheck]    Script Date: 2/14/2022 5:44:12 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_SolicitorLoginSessionCheck]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_SolicitorLoginSessionCheck]
GO

/****** Object:  StoredProcedure [dbo].[usp_SolicitorLoginSessionCheck]    Script Date: 2/14/2022 5:44:16 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[usp_SolicitorLoginTrialSession_FailedAttemptLog_RptGen]    Script Date: 2/14/2022 5:44:12 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_SolicitorLoginTrialSession_FailedAttemptLog_RptGen]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_SolicitorLoginTrialSession_FailedAttemptLog_RptGen]
GO

/****** Object:  StoredProcedure [dbo].[usp_SolicitorLoginTrialSession_FailedAttemptLog_RptGen]    Script Date: 2/14/2022 5:44:16 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[usp_SolicitorLogin_DormantID_RptGen]    Script Date: 2/14/2022 5:44:12 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_SolicitorLogin_DormantID_RptGen]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_SolicitorLogin_DormantID_RptGen]
GO

/****** Object:  StoredProcedure [dbo].[usp_SolicitorLogin_DormantID_RptGen]    Script Date: 2/14/2022 5:44:16 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[usp_SolicitorLogin_ForcePasswordChangeCheck]    Script Date: 2/14/2022 5:44:12 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_SolicitorLogin_ForcePasswordChangeCheck]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_SolicitorLogin_ForcePasswordChangeCheck]
GO

/****** Object:  StoredProcedure [dbo].[usp_SolicitorLogin_ForcePasswordChangeCheck]    Script Date: 2/14/2022 5:44:16 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[usp_SolicitorLogin_GetExpiryWarning]    Script Date: 2/14/2022 5:44:12 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_SolicitorLogin_GetExpiryWarning]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_SolicitorLogin_GetExpiryWarning]
GO

/****** Object:  StoredProcedure [dbo].[usp_SolicitorLogin_GetExpiryWarning]    Script Date: 2/14/2022 5:44:16 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[usp_SolicitorLogin_getNumberOfTrialLeft]    Script Date: 2/14/2022 5:44:12 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_SolicitorLogin_getNumberOfTrialLeft]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_SolicitorLogin_getNumberOfTrialLeft]
GO

/****** Object:  StoredProcedure [dbo].[usp_SolicitorLogin_getNumberOfTrialLeft]    Script Date: 2/14/2022 5:44:16 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[usp_SolicitorLogin_SaveLastLoginDatetime]    Script Date: 2/14/2022 5:44:12 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_SolicitorLogin_SaveLastLoginDatetime]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_SolicitorLogin_SaveLastLoginDatetime]
GO

/****** Object:  StoredProcedure [dbo].[usp_SolicitorLogin_SaveLastLoginDatetime]    Script Date: 2/14/2022 5:44:16 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[usp_solicitorpasswordhistorylist]    Script Date: 2/14/2022 5:44:12 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_solicitorpasswordhistorylist]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_solicitorpasswordhistorylist]
GO

/****** Object:  StoredProcedure [dbo].[usp_solicitorpasswordhistorylist]    Script Date: 2/14/2022 5:44:16 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[usp_SolicitorSession_CheckAndAction]    Script Date: 2/14/2022 5:44:12 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_SolicitorSession_CheckAndAction]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_SolicitorSession_CheckAndAction]
GO

/****** Object:  StoredProcedure [dbo].[usp_SolicitorSession_CheckAndAction]    Script Date: 2/14/2022 5:44:16 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[usp_SolicitorSession_Create]    Script Date: 2/14/2022 5:44:12 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_SolicitorSession_Create]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_SolicitorSession_Create]
GO

/****** Object:  StoredProcedure [dbo].[usp_SolicitorSession_Create]    Script Date: 2/14/2022 5:44:16 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[usp_SolicitorSession_Delete]    Script Date: 2/14/2022 5:44:12 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_SolicitorSession_Delete]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_SolicitorSession_Delete]
GO

/****** Object:  StoredProcedure [dbo].[usp_SolicitorSession_Delete]    Script Date: 2/14/2022 5:44:16 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[usp_SolicitorSession_GetSessionTime]    Script Date: 2/14/2022 5:44:12 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_SolicitorSession_GetSessionTime]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_SolicitorSession_GetSessionTime]
GO

/****** Object:  StoredProcedure [dbo].[usp_SolicitorSession_GetSessionTime]    Script Date: 2/14/2022 5:44:16 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[usp_SolPDFPasswordSetting_FieldName_FindAll]    Script Date: 2/14/2022 5:44:12 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_SolPDFPasswordSetting_FieldName_FindAll]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_SolPDFPasswordSetting_FieldName_FindAll]
GO

/****** Object:  StoredProcedure [dbo].[usp_SolPDFPasswordSetting_FieldName_FindAll]    Script Date: 2/14/2022 5:44:16 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[usp_SolPDFPasswordSetting_GetSetting]    Script Date: 2/14/2022 5:44:12 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_SolPDFPasswordSetting_GetSetting]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_SolPDFPasswordSetting_GetSetting]
GO

/****** Object:  StoredProcedure [dbo].[usp_SolPDFPasswordSetting_GetSetting]    Script Date: 2/14/2022 5:44:16 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[usp_SolPDFPasswordSetting_SaveSetting]    Script Date: 2/14/2022 5:44:12 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_SolPDFPasswordSetting_SaveSetting]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_SolPDFPasswordSetting_SaveSetting]
GO

/****** Object:  StoredProcedure [dbo].[usp_SolPDFPasswordSetting_SaveSetting]    Script Date: 2/14/2022 5:44:16 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[usp_SQLDUMakerDPSubmissionRemark_add]    Script Date: 2/14/2022 5:44:12 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_SQLDUMakerDPSubmissionRemark_add]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_SQLDUMakerDPSubmissionRemark_add]
GO

/****** Object:  StoredProcedure [dbo].[usp_SQLDUMakerDPSubmissionRemark_add]    Script Date: 2/14/2022 5:44:16 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[usp_SQLDUMakerDPSubmissionRemark_list]    Script Date: 2/14/2022 5:44:12 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_SQLDUMakerDPSubmissionRemark_list]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_SQLDUMakerDPSubmissionRemark_list]
GO

/****** Object:  StoredProcedure [dbo].[usp_SQLDUMakerDPSubmissionRemark_list]    Script Date: 2/14/2022 5:44:16 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[usp_SQLDUMakerDPSubmission_SolicitorInput_SubmissionAttachment_select]    Script Date: 2/14/2022 5:44:12 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_SQLDUMakerDPSubmission_SolicitorInput_SubmissionAttachment_select]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_SQLDUMakerDPSubmission_SolicitorInput_SubmissionAttachment_select]
GO

/****** Object:  StoredProcedure [dbo].[usp_SQLDUMakerDPSubmission_SolicitorInput_SubmissionAttachment_select]    Script Date: 2/14/2022 5:44:16 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[usp_SQLDUMakerDPSubmission_SolicitorInput_SubmissionExeDocs_select]    Script Date: 2/14/2022 5:44:12 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_SQLDUMakerDPSubmission_SolicitorInput_SubmissionExeDocs_select]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_SQLDUMakerDPSubmission_SolicitorInput_SubmissionExeDocs_select]
GO

/****** Object:  StoredProcedure [dbo].[usp_SQLDUMakerDPSubmission_SolicitorInput_SubmissionExeDocs_select]    Script Date: 2/14/2022 5:44:16 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[usp_SQLDUMakerDPSubmission_SolicitorInput_Submission_select]    Script Date: 2/14/2022 5:44:12 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_SQLDUMakerDPSubmission_SolicitorInput_Submission_select]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_SQLDUMakerDPSubmission_SolicitorInput_Submission_select]
GO

/****** Object:  StoredProcedure [dbo].[usp_SQLDUMakerDPSubmission_SolicitorInput_Submission_select]    Script Date: 2/14/2022 5:44:16 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[usp_SQLDUMakerDPSubmission_SolicitorInput_Submission_selectUpdateInfo]    Script Date: 2/14/2022 5:44:12 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_SQLDUMakerDPSubmission_SolicitorInput_Submission_selectUpdateInfo]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_SQLDUMakerDPSubmission_SolicitorInput_Submission_selectUpdateInfo]
GO

/****** Object:  StoredProcedure [dbo].[usp_SQLDUMakerDPSubmission_SolicitorInput_Submission_selectUpdateInfo]    Script Date: 2/14/2022 5:44:16 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[usp_SQLDUMakerDPSubmission_ValuerInput_Submission_select]    Script Date: 2/14/2022 5:44:12 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_SQLDUMakerDPSubmission_ValuerInput_Submission_select]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_SQLDUMakerDPSubmission_ValuerInput_Submission_select]
GO

/****** Object:  StoredProcedure [dbo].[usp_SQLDUMakerDPSubmission_ValuerInput_Submission_select]    Script Date: 2/14/2022 5:44:16 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[usp_SQLDUMakerDPSubmission_ValuerInput_Submission_selectUpdateInfo]    Script Date: 2/14/2022 5:44:12 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_SQLDUMakerDPSubmission_ValuerInput_Submission_selectUpdateInfo]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_SQLDUMakerDPSubmission_ValuerInput_Submission_selectUpdateInfo]
GO

/****** Object:  StoredProcedure [dbo].[usp_SQLDUMakerDPSubmission_ValuerInput_Submission_selectUpdateInfo]    Script Date: 2/14/2022 5:44:16 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[usp_SQLDUMakerDP_SolicitorSubmission_K2Instance_Select]    Script Date: 2/14/2022 5:44:12 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_SQLDUMakerDP_SolicitorSubmission_K2Instance_Select]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_SQLDUMakerDP_SolicitorSubmission_K2Instance_Select]
GO

/****** Object:  StoredProcedure [dbo].[usp_SQLDUMakerDP_SolicitorSubmission_K2Instance_Select]    Script Date: 2/14/2022 5:44:16 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[usp_SQLDUMakerDP_ValuerSubmission_K2Instance_Select]    Script Date: 2/14/2022 5:44:12 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_SQLDUMakerDP_ValuerSubmission_K2Instance_Select]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_SQLDUMakerDP_ValuerSubmission_K2Instance_Select]
GO

/****** Object:  StoredProcedure [dbo].[usp_SQLDUMakerDP_ValuerSubmission_K2Instance_Select]    Script Date: 2/14/2022 5:44:16 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[usp_SQLDUMaker_LOADSdata_Update]    Script Date: 2/14/2022 5:44:12 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_SQLDUMaker_LOADSdata_Update]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_SQLDUMaker_LOADSdata_Update]
GO

/****** Object:  StoredProcedure [dbo].[usp_SQLDUMaker_LOADSdata_Update]    Script Date: 2/14/2022 5:44:16 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[usp_SQLDUMaker_SolicitorSubmission_Delete]    Script Date: 2/14/2022 5:44:12 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_SQLDUMaker_SolicitorSubmission_Delete]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_SQLDUMaker_SolicitorSubmission_Delete]
GO

/****** Object:  StoredProcedure [dbo].[usp_SQLDUMaker_SolicitorSubmission_Delete]    Script Date: 2/14/2022 5:44:16 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[usp_SQLDUMaker_SolicitorSubmission_ExeDocs_Select_ARN_Rejected]    Script Date: 2/14/2022 5:44:12 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_SQLDUMaker_SolicitorSubmission_ExeDocs_Select_ARN_Rejected]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_SQLDUMaker_SolicitorSubmission_ExeDocs_Select_ARN_Rejected]
GO

/****** Object:  StoredProcedure [dbo].[usp_SQLDUMaker_SolicitorSubmission_ExeDocs_Select_ARN_Rejected]    Script Date: 2/14/2022 5:44:16 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[usp_SQLDUMaker_SolicitorSubmission_Main]    Script Date: 2/14/2022 5:44:12 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_SQLDUMaker_SolicitorSubmission_Main]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_SQLDUMaker_SolicitorSubmission_Main]
GO

/****** Object:  StoredProcedure [dbo].[usp_SQLDUMaker_SolicitorSubmission_Main]    Script Date: 2/14/2022 5:44:16 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[usp_SQLDUMaker_SolicitorSubmission_Select_ARN_Rejected]    Script Date: 2/14/2022 5:44:12 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_SQLDUMaker_SolicitorSubmission_Select_ARN_Rejected]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_SQLDUMaker_SolicitorSubmission_Select_ARN_Rejected]
GO

/****** Object:  StoredProcedure [dbo].[usp_SQLDUMaker_SolicitorSubmission_Select_ARN_Rejected]    Script Date: 2/14/2022 5:44:16 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[usp_SQLDUMaker_SolicitorSubmission_Select_Completed]    Script Date: 2/14/2022 5:44:12 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_SQLDUMaker_SolicitorSubmission_Select_Completed]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_SQLDUMaker_SolicitorSubmission_Select_Completed]
GO

/****** Object:  StoredProcedure [dbo].[usp_SQLDUMaker_SolicitorSubmission_Select_Completed]    Script Date: 2/14/2022 5:44:16 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[usp_SQLDUMaker_SolicitorSubmission_Select_Opened]    Script Date: 2/14/2022 5:44:12 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_SQLDUMaker_SolicitorSubmission_Select_Opened]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_SQLDUMaker_SolicitorSubmission_Select_Opened]
GO

/****** Object:  StoredProcedure [dbo].[usp_SQLDUMaker_SolicitorSubmission_Select_Opened]    Script Date: 2/14/2022 5:44:16 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[usp_SQLDUMaker_SolicitorSubmission_Select_Rejected]    Script Date: 2/14/2022 5:44:12 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_SQLDUMaker_SolicitorSubmission_Select_Rejected]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_SQLDUMaker_SolicitorSubmission_Select_Rejected]
GO

/****** Object:  StoredProcedure [dbo].[usp_SQLDUMaker_SolicitorSubmission_Select_Rejected]    Script Date: 2/14/2022 5:44:16 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[usp_SQLDUMaker_SolicitorSubmission_UpdateInfo_Select]    Script Date: 2/14/2022 5:44:12 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_SQLDUMaker_SolicitorSubmission_UpdateInfo_Select]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_SQLDUMaker_SolicitorSubmission_UpdateInfo_Select]
GO

/****** Object:  StoredProcedure [dbo].[usp_SQLDUMaker_SolicitorSubmission_UpdateInfo_Select]    Script Date: 2/14/2022 5:44:16 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[usp_SQLDUMaker_ValuerSubmission_Delete]    Script Date: 2/14/2022 5:44:12 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_SQLDUMaker_ValuerSubmission_Delete]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_SQLDUMaker_ValuerSubmission_Delete]
GO

/****** Object:  StoredProcedure [dbo].[usp_SQLDUMaker_ValuerSubmission_Delete]    Script Date: 2/14/2022 5:44:16 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[usp_SQLDUMaker_ValuerSubmission_Main]    Script Date: 2/14/2022 5:44:12 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_SQLDUMaker_ValuerSubmission_Main]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_SQLDUMaker_ValuerSubmission_Main]
GO

/****** Object:  StoredProcedure [dbo].[usp_SQLDUMaker_ValuerSubmission_Main]    Script Date: 2/14/2022 5:44:16 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[usp_SQLDUMaker_ValuerSubmission_SelectPendingVRList]    Script Date: 2/14/2022 5:44:12 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_SQLDUMaker_ValuerSubmission_SelectPendingVRList]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_SQLDUMaker_ValuerSubmission_SelectPendingVRList]
GO

/****** Object:  StoredProcedure [dbo].[usp_SQLDUMaker_ValuerSubmission_SelectPendingVRList]    Script Date: 2/14/2022 5:44:16 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[usp_SQLDUMaker_ValuerSubmission_Select_ARN_LoweredOMV]    Script Date: 2/14/2022 5:44:12 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_SQLDUMaker_ValuerSubmission_Select_ARN_LoweredOMV]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_SQLDUMaker_ValuerSubmission_Select_ARN_LoweredOMV]
GO

/****** Object:  StoredProcedure [dbo].[usp_SQLDUMaker_ValuerSubmission_Select_ARN_LoweredOMV]    Script Date: 2/14/2022 5:44:16 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[usp_SQLDUMaker_ValuerSubmission_Select_Completed]    Script Date: 2/14/2022 5:44:12 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_SQLDUMaker_ValuerSubmission_Select_Completed]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_SQLDUMaker_ValuerSubmission_Select_Completed]
GO

/****** Object:  StoredProcedure [dbo].[usp_SQLDUMaker_ValuerSubmission_Select_Completed]    Script Date: 2/14/2022 5:44:16 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[usp_SQLDUMaker_ValuerSubmission_Select_LoweredOMV]    Script Date: 2/14/2022 5:44:12 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_SQLDUMaker_ValuerSubmission_Select_LoweredOMV]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_SQLDUMaker_ValuerSubmission_Select_LoweredOMV]
GO

/****** Object:  StoredProcedure [dbo].[usp_SQLDUMaker_ValuerSubmission_Select_LoweredOMV]    Script Date: 2/14/2022 5:44:16 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[usp_SQLDUMaker_ValuerSubmission_Select_Opened]    Script Date: 2/14/2022 5:44:12 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_SQLDUMaker_ValuerSubmission_Select_Opened]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_SQLDUMaker_ValuerSubmission_Select_Opened]
GO

/****** Object:  StoredProcedure [dbo].[usp_SQLDUMaker_ValuerSubmission_Select_Opened]    Script Date: 2/14/2022 5:44:16 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[usp_SQLDUMaker_ValuerSubmission_UpdateInfo_Select]    Script Date: 2/14/2022 5:44:12 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_SQLDUMaker_ValuerSubmission_UpdateInfo_Select]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_SQLDUMaker_ValuerSubmission_UpdateInfo_Select]
GO

/****** Object:  StoredProcedure [dbo].[usp_SQLDUMaker_ValuerSubmission_UpdateInfo_Select]    Script Date: 2/14/2022 5:44:16 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[usp_SQLSolicitorDPSubmissionAttachment_delete]    Script Date: 2/14/2022 5:44:12 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_SQLSolicitorDPSubmissionAttachment_delete]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_SQLSolicitorDPSubmissionAttachment_delete]
GO

/****** Object:  StoredProcedure [dbo].[usp_SQLSolicitorDPSubmissionAttachment_delete]    Script Date: 2/14/2022 5:44:16 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[usp_SQLSolicitorDPSubmissionExeDocs_selectARN_ForPDFForm]    Script Date: 2/14/2022 5:44:12 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_SQLSolicitorDPSubmissionExeDocs_selectARN_ForPDFForm]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_SQLSolicitorDPSubmissionExeDocs_selectARN_ForPDFForm]
GO

/****** Object:  StoredProcedure [dbo].[usp_SQLSolicitorDPSubmissionExeDocs_selectARN_ForPDFForm]    Script Date: 2/14/2022 5:44:16 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[usp_SQLSolicitorDPSubmissionEXEDoc_add]    Script Date: 2/14/2022 5:44:12 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_SQLSolicitorDPSubmissionEXEDoc_add]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_SQLSolicitorDPSubmissionEXEDoc_add]
GO

/****** Object:  StoredProcedure [dbo].[usp_SQLSolicitorDPSubmissionEXEDoc_add]    Script Date: 2/14/2022 5:44:16 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[usp_SQLSolicitorDPSubmissionEXEDoc_delete]    Script Date: 2/14/2022 5:44:12 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_SQLSolicitorDPSubmissionEXEDoc_delete]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_SQLSolicitorDPSubmissionEXEDoc_delete]
GO

/****** Object:  StoredProcedure [dbo].[usp_SQLSolicitorDPSubmissionEXEDoc_delete]    Script Date: 2/14/2022 5:44:16 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[usp_SQLSolicitorDPSubmissionREFDoc_add]    Script Date: 2/14/2022 5:44:12 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_SQLSolicitorDPSubmissionREFDoc_add]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_SQLSolicitorDPSubmissionREFDoc_add]
GO

/****** Object:  StoredProcedure [dbo].[usp_SQLSolicitorDPSubmissionREFDoc_add]    Script Date: 2/14/2022 5:44:16 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[usp_SQLSolicitorDPSubmissionREFDoc_delete]    Script Date: 2/14/2022 5:44:12 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_SQLSolicitorDPSubmissionREFDoc_delete]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_SQLSolicitorDPSubmissionREFDoc_delete]
GO

/****** Object:  StoredProcedure [dbo].[usp_SQLSolicitorDPSubmissionREFDoc_delete]    Script Date: 2/14/2022 5:44:16 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[usp_SQLSolicitorDPSubmissionRemark_add]    Script Date: 2/14/2022 5:44:12 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_SQLSolicitorDPSubmissionRemark_add]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_SQLSolicitorDPSubmissionRemark_add]
GO

/****** Object:  StoredProcedure [dbo].[usp_SQLSolicitorDPSubmissionRemark_add]    Script Date: 2/14/2022 5:44:16 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[usp_SQLSolicitorDPSubmissionRemark_list]    Script Date: 2/14/2022 5:44:12 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_SQLSolicitorDPSubmissionRemark_list]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_SQLSolicitorDPSubmissionRemark_list]
GO

/****** Object:  StoredProcedure [dbo].[usp_SQLSolicitorDPSubmissionRemark_list]    Script Date: 2/14/2022 5:44:16 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[usp_SQLSolicitorDPSubmissionRemark_selectARN_ForPDFForm]    Script Date: 2/14/2022 5:44:12 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_SQLSolicitorDPSubmissionRemark_selectARN_ForPDFForm]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_SQLSolicitorDPSubmissionRemark_selectARN_ForPDFForm]
GO

/****** Object:  StoredProcedure [dbo].[usp_SQLSolicitorDPSubmissionRemark_selectARN_ForPDFForm]    Script Date: 2/14/2022 5:44:16 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[usp_SQLSolicitorDPSubmission_List_Select]    Script Date: 2/14/2022 5:44:12 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_SQLSolicitorDPSubmission_List_Select]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_SQLSolicitorDPSubmission_List_Select]
GO

/****** Object:  StoredProcedure [dbo].[usp_SQLSolicitorDPSubmission_List_Select]    Script Date: 2/14/2022 5:44:16 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[usp_SQLSolicitorDPSubmission_Main]    Script Date: 2/14/2022 5:44:12 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_SQLSolicitorDPSubmission_Main]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_SQLSolicitorDPSubmission_Main]
GO

/****** Object:  StoredProcedure [dbo].[usp_SQLSolicitorDPSubmission_Main]    Script Date: 2/14/2022 5:44:16 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[usp_SQLSolicitorDPSubmission_Main_MoveToStaging]    Script Date: 2/14/2022 5:44:12 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_SQLSolicitorDPSubmission_Main_MoveToStaging]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_SQLSolicitorDPSubmission_Main_MoveToStaging]
GO

/****** Object:  StoredProcedure [dbo].[usp_SQLSolicitorDPSubmission_Main_MoveToStaging]    Script Date: 2/14/2022 5:44:16 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[usp_SQLSolicitorDPSubmission_Main_SelectAvailableARN]    Script Date: 2/14/2022 5:44:12 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_SQLSolicitorDPSubmission_Main_SelectAvailableARN]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_SQLSolicitorDPSubmission_Main_SelectAvailableARN]
GO

/****** Object:  StoredProcedure [dbo].[usp_SQLSolicitorDPSubmission_Main_SelectAvailableARN]    Script Date: 2/14/2022 5:44:16 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[usp_SQLSolicitorDPSubmission_selectARN]    Script Date: 2/14/2022 5:44:12 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_SQLSolicitorDPSubmission_selectARN]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_SQLSolicitorDPSubmission_selectARN]
GO

/****** Object:  StoredProcedure [dbo].[usp_SQLSolicitorDPSubmission_selectARN]    Script Date: 2/14/2022 5:44:16 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[usp_SQLSolicitorDPSubmission_selectARN_ForPDFForm]    Script Date: 2/14/2022 5:44:12 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_SQLSolicitorDPSubmission_selectARN_ForPDFForm]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_SQLSolicitorDPSubmission_selectARN_ForPDFForm]
GO

/****** Object:  StoredProcedure [dbo].[usp_SQLSolicitorDPSubmission_selectARN_ForPDFForm]    Script Date: 2/14/2022 5:44:16 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[usp_SQLSolicitor_getPassword]    Script Date: 2/14/2022 5:44:12 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_SQLSolicitor_getPassword]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_SQLSolicitor_getPassword]
GO

/****** Object:  StoredProcedure [dbo].[usp_SQLSolicitor_getPassword]    Script Date: 2/14/2022 5:44:16 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[usp_SQLSolicitor_Login]    Script Date: 2/14/2022 5:44:12 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_SQLSolicitor_Login]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_SQLSolicitor_Login]
GO

/****** Object:  StoredProcedure [dbo].[usp_SQLSolicitor_Login]    Script Date: 2/14/2022 5:44:16 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[usp_SQLSolicitor_SelectAll]    Script Date: 2/14/2022 5:44:12 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_SQLSolicitor_SelectAll]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_SQLSolicitor_SelectAll]
GO

/****** Object:  StoredProcedure [dbo].[usp_SQLSolicitor_SelectAll]    Script Date: 2/14/2022 5:44:16 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[usp_SQLValuerDPSubmissionRemark_add]    Script Date: 2/14/2022 5:44:12 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_SQLValuerDPSubmissionRemark_add]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_SQLValuerDPSubmissionRemark_add]
GO

/****** Object:  StoredProcedure [dbo].[usp_SQLValuerDPSubmissionRemark_add]    Script Date: 2/14/2022 5:44:16 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[usp_SQLValuerDPSubmissionRemark_list]    Script Date: 2/14/2022 5:44:12 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_SQLValuerDPSubmissionRemark_list]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_SQLValuerDPSubmissionRemark_list]
GO

/****** Object:  StoredProcedure [dbo].[usp_SQLValuerDPSubmissionRemark_list]    Script Date: 2/14/2022 5:44:16 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[usp_SQLValuerDPSubmissionRemark_selectARN_ForPDFForm]    Script Date: 2/14/2022 5:44:12 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_SQLValuerDPSubmissionRemark_selectARN_ForPDFForm]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_SQLValuerDPSubmissionRemark_selectARN_ForPDFForm]
GO

/****** Object:  StoredProcedure [dbo].[usp_SQLValuerDPSubmissionRemark_selectARN_ForPDFForm]    Script Date: 2/14/2022 5:44:16 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[usp_SQLValuerDPSubmission_GetPaymentTabVisibility]    Script Date: 2/14/2022 5:44:12 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_SQLValuerDPSubmission_GetPaymentTabVisibility]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_SQLValuerDPSubmission_GetPaymentTabVisibility]
GO

/****** Object:  StoredProcedure [dbo].[usp_SQLValuerDPSubmission_GetPaymentTabVisibility]    Script Date: 2/14/2022 5:44:16 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[usp_SQLValuerDPSubmission_GetRecordByARN]    Script Date: 2/14/2022 5:44:12 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_SQLValuerDPSubmission_GetRecordByARN]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_SQLValuerDPSubmission_GetRecordByARN]
GO

/****** Object:  StoredProcedure [dbo].[usp_SQLValuerDPSubmission_GetRecordByARN]    Script Date: 2/14/2022 5:44:16 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[usp_SQLValuerDPSubmission_List_Select]    Script Date: 2/14/2022 5:44:12 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_SQLValuerDPSubmission_List_Select]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_SQLValuerDPSubmission_List_Select]
GO

/****** Object:  StoredProcedure [dbo].[usp_SQLValuerDPSubmission_List_Select]    Script Date: 2/14/2022 5:44:16 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[usp_SQLValuerDPSubmission_Main]    Script Date: 2/14/2022 5:44:12 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_SQLValuerDPSubmission_Main]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_SQLValuerDPSubmission_Main]
GO

/****** Object:  StoredProcedure [dbo].[usp_SQLValuerDPSubmission_Main]    Script Date: 2/14/2022 5:44:16 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[usp_SQLValuerDPSubmission_Main_MoveToStaging]    Script Date: 2/14/2022 5:44:12 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_SQLValuerDPSubmission_Main_MoveToStaging]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_SQLValuerDPSubmission_Main_MoveToStaging]
GO

/****** Object:  StoredProcedure [dbo].[usp_SQLValuerDPSubmission_Main_MoveToStaging]    Script Date: 2/14/2022 5:44:16 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[usp_SQLValuerDPSubmission_Main_SelectAvailableARN]    Script Date: 2/14/2022 5:44:12 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_SQLValuerDPSubmission_Main_SelectAvailableARN]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_SQLValuerDPSubmission_Main_SelectAvailableARN]
GO

/****** Object:  StoredProcedure [dbo].[usp_SQLValuerDPSubmission_Main_SelectAvailableARN]    Script Date: 2/14/2022 5:44:16 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[usp_SQLValuerDPSubmission_selectARN_ForPDFForm]    Script Date: 2/14/2022 5:44:12 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_SQLValuerDPSubmission_selectARN_ForPDFForm]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_SQLValuerDPSubmission_selectARN_ForPDFForm]
GO

/****** Object:  StoredProcedure [dbo].[usp_SQLValuerDPSubmission_selectARN_ForPDFForm]    Script Date: 2/14/2022 5:44:16 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[usp_SQLValuer_getPassword]    Script Date: 2/14/2022 5:44:12 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_SQLValuer_getPassword]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_SQLValuer_getPassword]
GO

/****** Object:  StoredProcedure [dbo].[usp_SQLValuer_getPassword]    Script Date: 2/14/2022 5:44:16 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[usp_SQLValuer_Login]    Script Date: 2/14/2022 5:44:12 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_SQLValuer_Login]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_SQLValuer_Login]
GO

/****** Object:  StoredProcedure [dbo].[usp_SQLValuer_Login]    Script Date: 2/14/2022 5:44:16 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[usp_SQLValuer_SelectAll]    Script Date: 2/14/2022 5:44:12 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_SQLValuer_SelectAll]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_SQLValuer_SelectAll]
GO

/****** Object:  StoredProcedure [dbo].[usp_SQLValuer_SelectAll]    Script Date: 2/14/2022 5:44:16 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[usp_updatePDFID]    Script Date: 2/14/2022 5:44:12 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_updatePDFID]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_updatePDFID]
GO

/****** Object:  StoredProcedure [dbo].[usp_updatePDFID]    Script Date: 2/14/2022 5:44:16 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[usp_updatePDFID_ProjectSubmission]    Script Date: 2/14/2022 5:44:12 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_updatePDFID_ProjectSubmission]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_updatePDFID_ProjectSubmission]
GO

/****** Object:  StoredProcedure [dbo].[usp_updatePDFID_ProjectSubmission]    Script Date: 2/14/2022 5:44:16 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[usp_URL_Setting_select]    Script Date: 2/14/2022 5:44:12 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_URL_Setting_select]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_URL_Setting_select]
GO

/****** Object:  StoredProcedure [dbo].[usp_URL_Setting_select]    Script Date: 2/14/2022 5:44:16 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[usp_valuerinstance_check]    Script Date: 2/14/2022 5:44:12 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_valuerinstance_check]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_valuerinstance_check]
GO

/****** Object:  StoredProcedure [dbo].[usp_valuerinstance_check]    Script Date: 2/14/2022 5:44:16 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[usp_valuerinstance_remove]    Script Date: 2/14/2022 5:44:12 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_valuerinstance_remove]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_valuerinstance_remove]
GO

/****** Object:  StoredProcedure [dbo].[usp_valuerinstance_remove]    Script Date: 2/14/2022 5:44:16 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[usp_valuerinstance_removeValuer]    Script Date: 2/14/2022 5:44:12 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_valuerinstance_removeValuer]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_valuerinstance_removeValuer]
GO

/****** Object:  StoredProcedure [dbo].[usp_valuerinstance_removeValuer]    Script Date: 2/14/2022 5:44:16 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[usp_ValuerLoginLog_List]    Script Date: 2/14/2022 5:44:12 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_ValuerLoginLog_List]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_ValuerLoginLog_List]
GO

/****** Object:  StoredProcedure [dbo].[usp_ValuerLoginLog_List]    Script Date: 2/14/2022 5:44:16 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[usp_ValuerLoginSessionCheck]    Script Date: 2/14/2022 5:44:12 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_ValuerLoginSessionCheck]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_ValuerLoginSessionCheck]
GO

/****** Object:  StoredProcedure [dbo].[usp_ValuerLoginSessionCheck]    Script Date: 2/14/2022 5:44:16 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[usp_ValuerLoginTrialSession_FailedAttemptLog_RptGen]    Script Date: 2/14/2022 5:44:12 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_ValuerLoginTrialSession_FailedAttemptLog_RptGen]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_ValuerLoginTrialSession_FailedAttemptLog_RptGen]
GO

/****** Object:  StoredProcedure [dbo].[usp_ValuerLoginTrialSession_FailedAttemptLog_RptGen]    Script Date: 2/14/2022 5:44:16 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[usp_ValuerLogin_DormantID_RptGen]    Script Date: 2/14/2022 5:44:12 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_ValuerLogin_DormantID_RptGen]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_ValuerLogin_DormantID_RptGen]
GO

/****** Object:  StoredProcedure [dbo].[usp_ValuerLogin_DormantID_RptGen]    Script Date: 2/14/2022 5:44:16 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[usp_ValuerLogin_ForcePasswordChangeCheck]    Script Date: 2/14/2022 5:44:12 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_ValuerLogin_ForcePasswordChangeCheck]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_ValuerLogin_ForcePasswordChangeCheck]
GO

/****** Object:  StoredProcedure [dbo].[usp_ValuerLogin_ForcePasswordChangeCheck]    Script Date: 2/14/2022 5:44:16 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[usp_ValuerLogin_GetExpiryWarning]    Script Date: 2/14/2022 5:44:12 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_ValuerLogin_GetExpiryWarning]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_ValuerLogin_GetExpiryWarning]
GO

/****** Object:  StoredProcedure [dbo].[usp_ValuerLogin_GetExpiryWarning]    Script Date: 2/14/2022 5:44:16 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[usp_ValuerLogin_getNumberOfTrialLeft]    Script Date: 2/14/2022 5:44:12 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_ValuerLogin_getNumberOfTrialLeft]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_ValuerLogin_getNumberOfTrialLeft]
GO

/****** Object:  StoredProcedure [dbo].[usp_ValuerLogin_getNumberOfTrialLeft]    Script Date: 2/14/2022 5:44:16 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[usp_ValuerLogin_SaveLastLoginDatetime]    Script Date: 2/14/2022 5:44:12 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_ValuerLogin_SaveLastLoginDatetime]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_ValuerLogin_SaveLastLoginDatetime]
GO

/****** Object:  StoredProcedure [dbo].[usp_ValuerLogin_SaveLastLoginDatetime]    Script Date: 2/14/2022 5:44:16 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[usp_valuerpasswordhistorylist]    Script Date: 2/14/2022 5:44:12 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_valuerpasswordhistorylist]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_valuerpasswordhistorylist]
GO

/****** Object:  StoredProcedure [dbo].[usp_valuerpasswordhistorylist]    Script Date: 2/14/2022 5:44:16 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[usp_ValuerSession_CheckAndAction]    Script Date: 2/14/2022 5:44:12 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_ValuerSession_CheckAndAction]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_ValuerSession_CheckAndAction]
GO

/****** Object:  StoredProcedure [dbo].[usp_ValuerSession_CheckAndAction]    Script Date: 2/14/2022 5:44:16 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[usp_ValuerSession_Create]    Script Date: 2/14/2022 5:44:12 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_ValuerSession_Create]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_ValuerSession_Create]
GO

/****** Object:  StoredProcedure [dbo].[usp_ValuerSession_Create]    Script Date: 2/14/2022 5:44:16 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[usp_ValuerSession_Delete]    Script Date: 2/14/2022 5:44:12 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_ValuerSession_Delete]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_ValuerSession_Delete]
GO

/****** Object:  StoredProcedure [dbo].[usp_ValuerSession_Delete]    Script Date: 2/14/2022 5:44:16 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[usp_ValuerSession_GetSessionTime]    Script Date: 2/14/2022 5:44:12 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_ValuerSession_GetSessionTime]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_ValuerSession_GetSessionTime]
GO

/****** Object:  StoredProcedure [dbo].[usp_ValuerSession_GetSessionTime]    Script Date: 2/14/2022 5:44:16 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[usp_wf_ConvertFormToPDF_GetURL]    Script Date: 2/14/2022 5:44:12 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_wf_ConvertFormToPDF_GetURL]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_wf_ConvertFormToPDF_GetURL]
GO

/****** Object:  StoredProcedure [dbo].[usp_wf_ConvertFormToPDF_GetURL]    Script Date: 2/14/2022 5:44:16 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[usp_WorkflowHistory_CheckDisbursementWorkflowHistoryByARN]    Script Date: 2/14/2022 5:44:12 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_WorkflowHistory_CheckDisbursementWorkflowHistoryByARN]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_WorkflowHistory_CheckDisbursementWorkflowHistoryByARN]
GO

/****** Object:  StoredProcedure [dbo].[usp_WorkflowHistory_CheckDisbursementWorkflowHistoryByARN]    Script Date: 2/14/2022 5:44:16 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[usp_WorkflowHistory_CheckWorkflowHistoryByARN]    Script Date: 2/14/2022 5:44:12 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_WorkflowHistory_CheckWorkflowHistoryByARN]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_WorkflowHistory_CheckWorkflowHistoryByARN]
GO

/****** Object:  StoredProcedure [dbo].[usp_WorkflowHistory_CheckWorkflowHistoryByARN]    Script Date: 2/14/2022 5:44:16 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[usp_WorkflowHistory_GetDisbursementWorkflowHistoryByARN]    Script Date: 2/14/2022 5:44:12 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_WorkflowHistory_GetDisbursementWorkflowHistoryByARN]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_WorkflowHistory_GetDisbursementWorkflowHistoryByARN]
GO

/****** Object:  StoredProcedure [dbo].[usp_WorkflowHistory_GetDisbursementWorkflowHistoryByARN]    Script Date: 2/14/2022 5:44:16 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[usp_WorkflowHistory_GetWorkflowHistoryByARN]    Script Date: 2/14/2022 5:44:12 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_WorkflowHistory_GetWorkflowHistoryByARN]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_WorkflowHistory_GetWorkflowHistoryByARN]
GO

/****** Object:  StoredProcedure [dbo].[usp_WorkflowHistory_GetWorkflowHistoryByARN]    Script Date: 2/14/2022 5:44:16 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[usp_ws_check_SolicitorSubmissionStillInStaging]    Script Date: 2/14/2022 5:44:12 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_ws_check_SolicitorSubmissionStillInStaging]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_ws_check_SolicitorSubmissionStillInStaging]
GO

/****** Object:  StoredProcedure [dbo].[usp_ws_check_SolicitorSubmissionStillInStaging]    Script Date: 2/14/2022 5:44:16 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[usp_ws_check_ValuerSubmissionStillInStaging]    Script Date: 2/14/2022 5:44:12 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_ws_check_ValuerSubmissionStillInStaging]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_ws_check_ValuerSubmissionStillInStaging]
GO

/****** Object:  StoredProcedure [dbo].[usp_ws_check_ValuerSubmissionStillInStaging]    Script Date: 2/14/2022 5:44:16 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[usp_ws_DeleteK2File]    Script Date: 2/14/2022 5:44:12 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_ws_DeleteK2File]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_ws_DeleteK2File]
GO

/****** Object:  StoredProcedure [dbo].[usp_ws_DeleteK2File]    Script Date: 2/14/2022 5:44:16 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[usp_ws_deleterecords]    Script Date: 2/14/2022 5:44:12 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_ws_deleterecords]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_ws_deleterecords]
GO

/****** Object:  StoredProcedure [dbo].[usp_ws_deleterecords]    Script Date: 2/14/2022 5:44:16 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[usp_ws_errorLog]    Script Date: 2/14/2022 5:44:12 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_ws_errorLog]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_ws_errorLog]
GO

/****** Object:  StoredProcedure [dbo].[usp_ws_errorLog]    Script Date: 2/14/2022 5:44:16 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[usp_ws_FailedEmail_ErrorLog]    Script Date: 2/14/2022 5:44:12 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_ws_FailedEmail_ErrorLog]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_ws_FailedEmail_ErrorLog]
GO

/****** Object:  StoredProcedure [dbo].[usp_ws_FailedEmail_ErrorLog]    Script Date: 2/14/2022 5:44:16 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[usp_ws_getCustomerInfo_forARN]    Script Date: 2/14/2022 5:44:12 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_ws_getCustomerInfo_forARN]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_ws_getCustomerInfo_forARN]
GO

/****** Object:  StoredProcedure [dbo].[usp_ws_getCustomerInfo_forARN]    Script Date: 2/14/2022 5:44:16 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[usp_ws_getEDMS_ProjectDisbursement_Setting]    Script Date: 2/14/2022 5:44:12 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_ws_getEDMS_ProjectDisbursement_Setting]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_ws_getEDMS_ProjectDisbursement_Setting]
GO

/****** Object:  StoredProcedure [dbo].[usp_ws_getEDMS_ProjectDisbursement_Setting]    Script Date: 2/14/2022 5:44:16 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[usp_ws_getEDMS_SolicitorDisbursement_Setting]    Script Date: 2/14/2022 5:44:12 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_ws_getEDMS_SolicitorDisbursement_Setting]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_ws_getEDMS_SolicitorDisbursement_Setting]
GO

/****** Object:  StoredProcedure [dbo].[usp_ws_getEDMS_SolicitorDisbursement_Setting]    Script Date: 2/14/2022 5:44:16 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[usp_ws_getEDMS_Solicitor_Setting]    Script Date: 2/14/2022 5:44:12 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_ws_getEDMS_Solicitor_Setting]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_ws_getEDMS_Solicitor_Setting]
GO

/****** Object:  StoredProcedure [dbo].[usp_ws_getEDMS_Solicitor_Setting]    Script Date: 2/14/2022 5:44:16 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[usp_ws_getEDMS_Valuer_Setting]    Script Date: 2/14/2022 5:44:12 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_ws_getEDMS_Valuer_Setting]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_ws_getEDMS_Valuer_Setting]
GO

/****** Object:  StoredProcedure [dbo].[usp_ws_getEDMS_Valuer_Setting]    Script Date: 2/14/2022 5:44:16 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[usp_ws_getFireEyeFlag]    Script Date: 2/14/2022 5:44:12 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_ws_getFireEyeFlag]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_ws_getFireEyeFlag]
GO

/****** Object:  StoredProcedure [dbo].[usp_ws_getFireEyeFlag]    Script Date: 2/14/2022 5:44:16 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[usp_ws_getNewLI]    Script Date: 2/14/2022 5:44:12 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_ws_getNewLI]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_ws_getNewLI]
GO

/****** Object:  StoredProcedure [dbo].[usp_ws_getNewLI]    Script Date: 2/14/2022 5:44:16 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[usp_ws_getSolicitorOtherDocumentsFromARN]    Script Date: 2/14/2022 5:44:12 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_ws_getSolicitorOtherDocumentsFromARN]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_ws_getSolicitorOtherDocumentsFromARN]
GO

/****** Object:  StoredProcedure [dbo].[usp_ws_getSolicitorOtherDocumentsFromARN]    Script Date: 2/14/2022 5:44:16 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[usp_ws_InternalUserLoginSessionCheck]    Script Date: 2/14/2022 5:44:12 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_ws_InternalUserLoginSessionCheck]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_ws_InternalUserLoginSessionCheck]
GO

/****** Object:  StoredProcedure [dbo].[usp_ws_InternalUserLoginSessionCheck]    Script Date: 2/14/2022 5:44:16 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[usp_ws_list_SolicitorDocumentationSubmissionAttachmentInStaging]    Script Date: 2/14/2022 5:44:12 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_ws_list_SolicitorDocumentationSubmissionAttachmentInStaging]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_ws_list_SolicitorDocumentationSubmissionAttachmentInStaging]
GO

/****** Object:  StoredProcedure [dbo].[usp_ws_list_SolicitorDocumentationSubmissionAttachmentInStaging]    Script Date: 2/14/2022 5:44:16 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[usp_ws_list_ValuerSubmissionAttachmentInStaging]    Script Date: 2/14/2022 5:44:12 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_ws_list_ValuerSubmissionAttachmentInStaging]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_ws_list_ValuerSubmissionAttachmentInStaging]
GO

/****** Object:  StoredProcedure [dbo].[usp_ws_list_ValuerSubmissionAttachmentInStaging]    Script Date: 2/14/2022 5:44:16 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[usp_ws_LOADS_STAGING_COMPLETE]    Script Date: 2/14/2022 5:44:12 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_ws_LOADS_STAGING_COMPLETE]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_ws_LOADS_STAGING_COMPLETE]
GO

/****** Object:  StoredProcedure [dbo].[usp_ws_LOADS_STAGING_COMPLETE]    Script Date: 2/14/2022 5:44:16 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[usp_ws_LOADS_STAGING_COMPLETE2]    Script Date: 2/14/2022 5:44:12 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_ws_LOADS_STAGING_COMPLETE2]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_ws_LOADS_STAGING_COMPLETE2]
GO

/****** Object:  StoredProcedure [dbo].[usp_ws_LOADS_STAGING_COMPLETE2]    Script Date: 2/14/2022 5:44:16 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[usp_ws_LOADS_STAGING_INSERT]    Script Date: 2/14/2022 5:44:12 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_ws_LOADS_STAGING_INSERT]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_ws_LOADS_STAGING_INSERT]
GO

/****** Object:  StoredProcedure [dbo].[usp_ws_LOADS_STAGING_INSERT]    Script Date: 2/14/2022 5:44:16 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[usp_ws_LOADS_STAGING_INSERT2]    Script Date: 2/14/2022 5:44:12 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_ws_LOADS_STAGING_INSERT2]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_ws_LOADS_STAGING_INSERT2]
GO

/****** Object:  StoredProcedure [dbo].[usp_ws_LOADS_STAGING_INSERT2]    Script Date: 2/14/2022 5:44:16 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[usp_ws_LOADS_STAGING_TRUNCATE_STAGING]    Script Date: 2/14/2022 5:44:12 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_ws_LOADS_STAGING_TRUNCATE_STAGING]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_ws_LOADS_STAGING_TRUNCATE_STAGING]
GO

/****** Object:  StoredProcedure [dbo].[usp_ws_LOADS_STAGING_TRUNCATE_STAGING]    Script Date: 2/14/2022 5:44:16 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[usp_ws_savefailedattachmentdata]    Script Date: 2/14/2022 5:44:12 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_ws_savefailedattachmentdata]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_ws_savefailedattachmentdata]
GO

/****** Object:  StoredProcedure [dbo].[usp_ws_savefailedattachmentdata]    Script Date: 2/14/2022 5:44:16 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[usp_ws_select_SolicitorDocumentationSubmissionPFDFFormData]    Script Date: 2/14/2022 5:44:12 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_ws_select_SolicitorDocumentationSubmissionPFDFFormData]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_ws_select_SolicitorDocumentationSubmissionPFDFFormData]
GO

/****** Object:  StoredProcedure [dbo].[usp_ws_select_SolicitorDocumentationSubmissionPFDFFormData]    Script Date: 2/14/2022 5:44:16 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[usp_ws_setting_getDU1pdfmasterpassword]    Script Date: 2/14/2022 5:44:12 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_ws_setting_getDU1pdfmasterpassword]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_ws_setting_getDU1pdfmasterpassword]
GO

/****** Object:  StoredProcedure [dbo].[usp_ws_setting_getDU1pdfmasterpassword]    Script Date: 2/14/2022 5:44:16 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[usp_ws_solicitorattachment_preupload]    Script Date: 2/14/2022 5:44:12 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_ws_solicitorattachment_preupload]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_ws_solicitorattachment_preupload]
GO

/****** Object:  StoredProcedure [dbo].[usp_ws_solicitorattachment_preupload]    Script Date: 2/14/2022 5:44:16 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[usp_ws_SolicitorSubmission_getallARNInStaging]    Script Date: 2/14/2022 5:44:12 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_ws_SolicitorSubmission_getallARNInStaging]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_ws_SolicitorSubmission_getallARNInStaging]
GO

/****** Object:  StoredProcedure [dbo].[usp_ws_SolicitorSubmission_getallARNInStaging]    Script Date: 2/14/2022 5:44:16 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[usp_ws_SQLSolicitorDPSubmissionAttachment_add_withattachment]    Script Date: 2/14/2022 5:44:12 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_ws_SQLSolicitorDPSubmissionAttachment_add_withattachment]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_ws_SQLSolicitorDPSubmissionAttachment_add_withattachment]
GO

/****** Object:  StoredProcedure [dbo].[usp_ws_SQLSolicitorDPSubmissionAttachment_add_withattachment]    Script Date: 2/14/2022 5:44:16 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[usp_ws_SQLSolicitorDPSubmission_ListUploadedARN]    Script Date: 2/14/2022 5:44:12 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_ws_SQLSolicitorDPSubmission_ListUploadedARN]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_ws_SQLSolicitorDPSubmission_ListUploadedARN]
GO

/****** Object:  StoredProcedure [dbo].[usp_ws_SQLSolicitorDPSubmission_ListUploadedARN]    Script Date: 2/14/2022 5:44:16 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[usp_ws_SQLSolicitorDPSubmission_Main_MoveToMain]    Script Date: 2/14/2022 5:44:12 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_ws_SQLSolicitorDPSubmission_Main_MoveToMain]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_ws_SQLSolicitorDPSubmission_Main_MoveToMain]
GO

/****** Object:  StoredProcedure [dbo].[usp_ws_SQLSolicitorDPSubmission_Main_MoveToMain]    Script Date: 2/14/2022 5:44:16 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[usp_ws_SQLSolicitorDPSubmission_MoveFailedToMain]    Script Date: 2/14/2022 5:44:12 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_ws_SQLSolicitorDPSubmission_MoveFailedToMain]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_ws_SQLSolicitorDPSubmission_MoveFailedToMain]
GO

/****** Object:  StoredProcedure [dbo].[usp_ws_SQLSolicitorDPSubmission_MoveFailedToMain]    Script Date: 2/14/2022 5:44:16 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[usp_ws_SQLValuerDPSubmission_ListUploadedARN]    Script Date: 2/14/2022 5:44:12 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_ws_SQLValuerDPSubmission_ListUploadedARN]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_ws_SQLValuerDPSubmission_ListUploadedARN]
GO

/****** Object:  StoredProcedure [dbo].[usp_ws_SQLValuerDPSubmission_ListUploadedARN]    Script Date: 2/14/2022 5:44:16 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[usp_ws_SQLValuerDPSubmission_Main_MoveToMain]    Script Date: 2/14/2022 5:44:12 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_ws_SQLValuerDPSubmission_Main_MoveToMain]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_ws_SQLValuerDPSubmission_Main_MoveToMain]
GO

/****** Object:  StoredProcedure [dbo].[usp_ws_SQLValuerDPSubmission_Main_MoveToMain]    Script Date: 2/14/2022 5:44:16 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[usp_ws_SQLValuerDPSubmission_MoveFailedToMain]    Script Date: 2/14/2022 5:44:12 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_ws_SQLValuerDPSubmission_MoveFailedToMain]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_ws_SQLValuerDPSubmission_MoveFailedToMain]
GO

/****** Object:  StoredProcedure [dbo].[usp_ws_SQLValuerDPSubmission_MoveFailedToMain]    Script Date: 2/14/2022 5:44:16 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[usp_ws_valuerattachment_preupload]    Script Date: 2/14/2022 5:44:12 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_ws_valuerattachment_preupload]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_ws_valuerattachment_preupload]
GO

/****** Object:  StoredProcedure [dbo].[usp_ws_valuerattachment_preupload]    Script Date: 2/14/2022 5:44:16 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[usp_ws_ValuerSubmission_getallARNInStaging]    Script Date: 2/14/2022 5:44:11 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_ws_ValuerSubmission_getallARNInStaging]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_ws_ValuerSubmission_getallARNInStaging]
GO

/****** Object:  StoredProcedure [dbo].[usp_ws_ValuerSubmission_getallARNInStaging]    Script Date: 2/14/2022 5:44:16 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  View [dbo].[vw_aaDisbursementHistory]    Script Date: 2/14/2022 5:44:15 PM ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vw_aaDisbursementHistory]'))
DROP VIEW [dbo].[vw_aaDisbursementHistory]
GO

/****** Object:  View [dbo].[vw_aaDisbursementHistory]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  View [dbo].[vw_aaDisbursementPaymentHistory]    Script Date: 2/14/2022 5:44:14 PM ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vw_aaDisbursementPaymentHistory]'))
DROP VIEW [dbo].[vw_aaDisbursementPaymentHistory]
GO

/****** Object:  View [dbo].[vw_aaDisbursementPaymentHistory]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  View [dbo].[vw_aaDisbursementPaymentInProgress]    Script Date: 2/14/2022 5:44:14 PM ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vw_aaDisbursementPaymentInProgress]'))
DROP VIEW [dbo].[vw_aaDisbursementPaymentInProgress]
GO

/****** Object:  View [dbo].[vw_aaDisbursementPaymentInProgress]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  View [dbo].[vw_aaSolDisbursementSubmission]    Script Date: 2/14/2022 5:44:14 PM ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vw_aaSolDisbursementSubmission]'))
DROP VIEW [dbo].[vw_aaSolDisbursementSubmission]
GO

/****** Object:  View [dbo].[vw_aaSolDisbursementSubmission]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  View [dbo].[vw_aaSolDisbursementSubmissionIncludeHistory]    Script Date: 2/14/2022 5:44:14 PM ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vw_aaSolDisbursementSubmissionIncludeHistory]'))
DROP VIEW [dbo].[vw_aaSolDisbursementSubmissionIncludeHistory]
GO

/****** Object:  View [dbo].[vw_aaSolDisbursementSubmissionIncludeHistory]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  View [dbo].[vw_rpt_aaIntDisbursementSubmission]    Script Date: 2/14/2022 5:44:14 PM ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vw_rpt_aaIntDisbursementSubmission]'))
DROP VIEW [dbo].[vw_rpt_aaIntDisbursementSubmission]
GO

/****** Object:  View [dbo].[vw_rpt_aaIntDisbursementSubmission]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  View [dbo].[vw_rpt_ddProjectDisbursementSubmission_DisMaker]    Script Date: 2/14/2022 5:44:14 PM ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vw_rpt_ddProjectDisbursementSubmission_DisMaker]'))
DROP VIEW [dbo].[vw_rpt_ddProjectDisbursementSubmission_DisMaker]
GO

/****** Object:  View [dbo].[vw_rpt_ddProjectDisbursementSubmission_DisMaker]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  View [dbo].[vw_rpt_ddProjectDisbursementSubmission_DisMaker_Rejected]    Script Date: 2/14/2022 5:44:14 PM ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vw_rpt_ddProjectDisbursementSubmission_DisMaker_Rejected]'))
DROP VIEW [dbo].[vw_rpt_ddProjectDisbursementSubmission_DisMaker_Rejected]
GO

/****** Object:  View [dbo].[vw_rpt_ddProjectDisbursementSubmission_DisMaker_Rejected]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  View [dbo].[vw_rpt_ddProjectDisbursementSubmission_DisMaker_Rejected_MainStaging]    Script Date: 2/14/2022 5:44:14 PM ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vw_rpt_ddProjectDisbursementSubmission_DisMaker_Rejected_MainStaging]'))
DROP VIEW [dbo].[vw_rpt_ddProjectDisbursementSubmission_DisMaker_Rejected_MainStaging]
GO

/****** Object:  View [dbo].[vw_rpt_ddProjectDisbursementSubmission_DisMaker_Rejected_MainStaging]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  View [dbo].[vw_SQLSolicitorDPSubmission]    Script Date: 2/14/2022 5:44:14 PM ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vw_SQLSolicitorDPSubmission]'))
DROP VIEW [dbo].[vw_SQLSolicitorDPSubmission]
GO

/****** Object:  View [dbo].[vw_SQLSolicitorDPSubmission]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  View [dbo].[vw_SQLValuerDPSubmission]    Script Date: 2/14/2022 5:44:14 PM ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vw_SQLValuerDPSubmission]'))
DROP VIEW [dbo].[vw_SQLValuerDPSubmission]
GO

/****** Object:  View [dbo].[vw_SQLValuerDPSubmission]    Script Date: 2/14/2022 5:44:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  Table [dbo].[aaBF_BridgingFinancierRedemptionSumAuditLog]    Script Date: 2/14/2022 5:57:09 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aaBF_BridgingFinancierRedemptionSumAuditLog]') AND type in (N'U'))
DROP TABLE [dbo].[aaBF_BridgingFinancierRedemptionSumAuditLog]
GO

/****** Object:  Table [dbo].[aaBF_BridgingFinancierRedemptionSumAuditLog]    Script Date: 2/14/2022 5:57:10 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  Table [dbo].[aaBF_RedemptionPaymentAccountNumberAuditLog]    Script Date: 2/14/2022 5:57:09 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aaBF_RedemptionPaymentAccountNumberAuditLog]') AND type in (N'U'))
DROP TABLE [dbo].[aaBF_RedemptionPaymentAccountNumberAuditLog]
GO

/****** Object:  Table [dbo].[aaBF_RedemptionPaymentAccountNumberAuditLog]    Script Date: 2/14/2022 5:57:10 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  Table [dbo].[aaDI_ProjectAccountAuditLog]    Script Date: 2/14/2022 5:57:09 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aaDI_ProjectAccountAuditLog]') AND type in (N'U'))
DROP TABLE [dbo].[aaDI_ProjectAccountAuditLog]
GO

/****** Object:  Table [dbo].[aaDI_ProjectAccountAuditLog]    Script Date: 2/14/2022 5:57:10 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  Table [dbo].[aaDI_ProjectAccountBankAuditLog]    Script Date: 2/14/2022 5:57:09 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aaDI_ProjectAccountBankAuditLog]') AND type in (N'U'))
DROP TABLE [dbo].[aaDI_ProjectAccountBankAuditLog]
GO

/****** Object:  Table [dbo].[aaDI_ProjectAccountBankAuditLog]    Script Date: 2/14/2022 5:57:10 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  Table [dbo].[aaFacilityAccountMaintenance]    Script Date: 2/14/2022 5:57:09 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aaFacilityAccountMaintenance]') AND type in (N'U'))
DROP TABLE [dbo].[aaFacilityAccountMaintenance]
GO

/****** Object:  Table [dbo].[aaFacilityAccountMaintenance]    Script Date: 2/14/2022 5:57:10 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  Table [dbo].[aaIntDisbursementSubmission]    Script Date: 2/14/2022 5:57:09 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aaIntDisbursementSubmission]') AND type in (N'U'))
DROP TABLE [dbo].[aaIntDisbursementSubmission]
GO

/****** Object:  Table [dbo].[aaIntDisbursementSubmission]    Script Date: 2/14/2022 5:57:10 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  Table [dbo].[aaIntDisbursementSubmissionPendingLA_DeleteWF]    Script Date: 2/14/2022 5:57:09 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aaIntDisbursementSubmissionPendingLA_DeleteWF]') AND type in (N'U'))
DROP TABLE [dbo].[aaIntDisbursementSubmissionPendingLA_DeleteWF]
GO

/****** Object:  Table [dbo].[aaIntDisbursementSubmissionPendingLA_DeleteWF]    Script Date: 2/14/2022 5:57:10 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  Table [dbo].[aaIntDisbursementSubmissionPendingLA_DeleteWF_Log]    Script Date: 2/14/2022 5:57:09 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aaIntDisbursementSubmissionPendingLA_DeleteWF_Log]') AND type in (N'U'))
DROP TABLE [dbo].[aaIntDisbursementSubmissionPendingLA_DeleteWF_Log]
GO

/****** Object:  Table [dbo].[aaIntDisbursementSubmissionPendingLA_DeleteWF_Log]    Script Date: 2/14/2022 5:57:10 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  Table [dbo].[aaIntDisbursementSubmission_DisCheckerRejected]    Script Date: 2/14/2022 5:57:09 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aaIntDisbursementSubmission_DisCheckerRejected]') AND type in (N'U'))
DROP TABLE [dbo].[aaIntDisbursementSubmission_DisCheckerRejected]
GO

/****** Object:  Table [dbo].[aaIntDisbursementSubmission_DisCheckerRejected]    Script Date: 2/14/2022 5:57:10 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  Table [dbo].[aaIntDisbursementSubmission_DisCheckerRejectedPaymentDetail]    Script Date: 2/14/2022 5:57:09 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aaIntDisbursementSubmission_DisCheckerRejectedPaymentDetail]') AND type in (N'U'))
DROP TABLE [dbo].[aaIntDisbursementSubmission_DisCheckerRejectedPaymentDetail]
GO

/****** Object:  Table [dbo].[aaIntDisbursementSubmission_DisCheckerRejectedPaymentDetail]    Script Date: 2/14/2022 5:57:10 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  Table [dbo].[aaIntDisbursementSubmission_DisMakerSubmissionPaymentDetail]    Script Date: 2/14/2022 5:57:09 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aaIntDisbursementSubmission_DisMakerSubmissionPaymentDetail]') AND type in (N'U'))
DROP TABLE [dbo].[aaIntDisbursementSubmission_DisMakerSubmissionPaymentDetail]
GO

/****** Object:  Table [dbo].[aaIntDisbursementSubmission_DisMakerSubmissionPaymentDetail]    Script Date: 2/14/2022 5:57:10 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  Table [dbo].[aaIntDisbursementSubmission_DisMakerSubmissionPaymentDetail_history]    Script Date: 2/14/2022 5:57:09 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aaIntDisbursementSubmission_DisMakerSubmissionPaymentDetail_history]') AND type in (N'U'))
DROP TABLE [dbo].[aaIntDisbursementSubmission_DisMakerSubmissionPaymentDetail_history]
GO

/****** Object:  Table [dbo].[aaIntDisbursementSubmission_DisMakerSubmissionPaymentDetail_history]    Script Date: 2/14/2022 5:57:10 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  Table [dbo].[aaIntDisbursementSubmission_History]    Script Date: 2/14/2022 5:57:09 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aaIntDisbursementSubmission_History]') AND type in (N'U'))
DROP TABLE [dbo].[aaIntDisbursementSubmission_History]
GO

/****** Object:  Table [dbo].[aaIntDisbursementSubmission_History]    Script Date: 2/14/2022 5:57:10 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  Table [dbo].[aaIntDisbursementSubmission_MRTA]    Script Date: 2/14/2022 5:57:09 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aaIntDisbursementSubmission_MRTA]') AND type in (N'U'))
DROP TABLE [dbo].[aaIntDisbursementSubmission_MRTA]
GO

/****** Object:  Table [dbo].[aaIntDisbursementSubmission_MRTA]    Script Date: 2/14/2022 5:57:10 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  Table [dbo].[aaIntDisbursementSubmission_RCOCheckerRejected]    Script Date: 2/14/2022 5:57:09 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aaIntDisbursementSubmission_RCOCheckerRejected]') AND type in (N'U'))
DROP TABLE [dbo].[aaIntDisbursementSubmission_RCOCheckerRejected]
GO

/****** Object:  Table [dbo].[aaIntDisbursementSubmission_RCOCheckerRejected]    Script Date: 2/14/2022 5:57:10 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  Table [dbo].[aaIntDisbursementSubmission_RCOMakerRejected]    Script Date: 2/14/2022 5:57:09 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aaIntDisbursementSubmission_RCOMakerRejected]') AND type in (N'U'))
DROP TABLE [dbo].[aaIntDisbursementSubmission_RCOMakerRejected]
GO

/****** Object:  Table [dbo].[aaIntDisbursementSubmission_RCOMakerRejected]    Script Date: 2/14/2022 5:57:10 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  Table [dbo].[aaIntDisbursementSubmission_RCOMakerSubmission]    Script Date: 2/14/2022 5:57:09 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aaIntDisbursementSubmission_RCOMakerSubmission]') AND type in (N'U'))
DROP TABLE [dbo].[aaIntDisbursementSubmission_RCOMakerSubmission]
GO

/****** Object:  Table [dbo].[aaIntDisbursementSubmission_RCOMakerSubmission]    Script Date: 2/14/2022 5:57:10 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  Table [dbo].[aaIntDisbursementSubmission_RCOMakerSubmissionPaymentDetail]    Script Date: 2/14/2022 5:57:09 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aaIntDisbursementSubmission_RCOMakerSubmissionPaymentDetail]') AND type in (N'U'))
DROP TABLE [dbo].[aaIntDisbursementSubmission_RCOMakerSubmissionPaymentDetail]
GO

/****** Object:  Table [dbo].[aaIntDisbursementSubmission_RCOMakerSubmissionPaymentDetail]    Script Date: 2/14/2022 5:57:10 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  Table [dbo].[aaIntDisbursementSubmission_RCOMakerSubmissionPaymentDetail_history]    Script Date: 2/14/2022 5:57:09 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aaIntDisbursementSubmission_RCOMakerSubmissionPaymentDetail_history]') AND type in (N'U'))
DROP TABLE [dbo].[aaIntDisbursementSubmission_RCOMakerSubmissionPaymentDetail_history]
GO

/****** Object:  Table [dbo].[aaIntDisbursementSubmission_RCOMakerSubmissionPaymentDetail_history]    Script Date: 2/14/2022 5:57:10 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  Table [dbo].[aaIntDisbursementSubmission_RCOMakerSubmission_History]    Script Date: 2/14/2022 5:57:09 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aaIntDisbursementSubmission_RCOMakerSubmission_History]') AND type in (N'U'))
DROP TABLE [dbo].[aaIntDisbursementSubmission_RCOMakerSubmission_History]
GO

/****** Object:  Table [dbo].[aaIntDisbursementSubmission_RCOMakerSubmission_History]    Script Date: 2/14/2022 5:57:10 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  Table [dbo].[aaIntDisbursement_New_Billing_Staging]    Script Date: 2/14/2022 5:57:09 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aaIntDisbursement_New_Billing_Staging]') AND type in (N'U'))
DROP TABLE [dbo].[aaIntDisbursement_New_Billing_Staging]
GO

/****** Object:  Table [dbo].[aaIntDisbursement_New_Billing_Staging]    Script Date: 2/14/2022 5:57:10 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  Table [dbo].[aaMortgageReport_AcceptanceSubmitted]    Script Date: 2/14/2022 5:57:09 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aaMortgageReport_AcceptanceSubmitted]') AND type in (N'U'))
DROP TABLE [dbo].[aaMortgageReport_AcceptanceSubmitted]
GO

/****** Object:  Table [dbo].[aaMortgageReport_AcceptanceSubmitted]    Script Date: 2/14/2022 5:57:10 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  Table [dbo].[aaMortgageReport_DocumentationPendingProcessing]    Script Date: 2/14/2022 5:57:09 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aaMortgageReport_DocumentationPendingProcessing]') AND type in (N'U'))
DROP TABLE [dbo].[aaMortgageReport_DocumentationPendingProcessing]
GO

/****** Object:  Table [dbo].[aaMortgageReport_DocumentationPendingProcessing]    Script Date: 2/14/2022 5:57:10 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  Table [dbo].[aaMortgageReport_PendingVR]    Script Date: 2/14/2022 5:57:09 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aaMortgageReport_PendingVR]') AND type in (N'U'))
DROP TABLE [dbo].[aaMortgageReport_PendingVR]
GO

/****** Object:  Table [dbo].[aaMortgageReport_PendingVR]    Script Date: 2/14/2022 5:57:10 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  Table [dbo].[aaMortgageReport_RevertedBySol]    Script Date: 2/14/2022 5:57:09 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aaMortgageReport_RevertedBySol]') AND type in (N'U'))
DROP TABLE [dbo].[aaMortgageReport_RevertedBySol]
GO

/****** Object:  Table [dbo].[aaMortgageReport_RevertedBySol]    Script Date: 2/14/2022 5:57:10 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  Table [dbo].[aaMortgageReport_RevertedByVal]    Script Date: 2/14/2022 5:57:09 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aaMortgageReport_RevertedByVal]') AND type in (N'U'))
DROP TABLE [dbo].[aaMortgageReport_RevertedByVal]
GO

/****** Object:  Table [dbo].[aaMortgageReport_RevertedByVal]    Script Date: 2/14/2022 5:57:10 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  Table [dbo].[aaMortgageReport_UpdateStatus]    Script Date: 2/14/2022 5:57:09 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aaMortgageReport_UpdateStatus]') AND type in (N'U'))
DROP TABLE [dbo].[aaMortgageReport_UpdateStatus]
GO

/****** Object:  Table [dbo].[aaMortgageReport_UpdateStatus]    Script Date: 2/14/2022 5:57:10 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  Table [dbo].[aaNotificationOfPayment]    Script Date: 2/14/2022 5:57:09 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aaNotificationOfPayment]') AND type in (N'U'))
DROP TABLE [dbo].[aaNotificationOfPayment]
GO

/****** Object:  Table [dbo].[aaNotificationOfPayment]    Script Date: 2/14/2022 5:57:10 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  Table [dbo].[aaNotificationOfPayment_failedlog]    Script Date: 2/14/2022 5:57:09 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aaNotificationOfPayment_failedlog]') AND type in (N'U'))
DROP TABLE [dbo].[aaNotificationOfPayment_failedlog]
GO

/****** Object:  Table [dbo].[aaNotificationOfPayment_failedlog]    Script Date: 2/14/2022 5:57:10 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  Table [dbo].[aaNotificationOfPayment_log]    Script Date: 2/14/2022 5:57:09 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aaNotificationOfPayment_log]') AND type in (N'U'))
DROP TABLE [dbo].[aaNotificationOfPayment_log]
GO

/****** Object:  Table [dbo].[aaNotificationOfPayment_log]    Script Date: 2/14/2022 5:57:10 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  Table [dbo].[aaNotificationOfPayment_Setting]    Script Date: 2/14/2022 5:57:09 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aaNotificationOfPayment_Setting]') AND type in (N'U'))
DROP TABLE [dbo].[aaNotificationOfPayment_Setting]
GO

/****** Object:  Table [dbo].[aaNotificationOfPayment_Setting]    Script Date: 2/14/2022 5:57:10 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  Table [dbo].[aaNotificationOfPayment_staging]    Script Date: 2/14/2022 5:57:09 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aaNotificationOfPayment_staging]') AND type in (N'U'))
DROP TABLE [dbo].[aaNotificationOfPayment_staging]
GO

/****** Object:  Table [dbo].[aaNotificationOfPayment_staging]    Script Date: 2/14/2022 5:57:10 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  Table [dbo].[aaSolCodeChangeLog]    Script Date: 2/14/2022 5:57:09 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aaSolCodeChangeLog]') AND type in (N'U'))
DROP TABLE [dbo].[aaSolCodeChangeLog]
GO

/****** Object:  Table [dbo].[aaSolCodeChangeLog]    Script Date: 2/14/2022 5:57:10 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  Table [dbo].[aaSolDisbursementSubmission]    Script Date: 2/14/2022 5:57:09 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aaSolDisbursementSubmission]') AND type in (N'U'))
DROP TABLE [dbo].[aaSolDisbursementSubmission]
GO

/****** Object:  Table [dbo].[aaSolDisbursementSubmission]    Script Date: 2/14/2022 5:57:10 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  Table [dbo].[aaSolDisbursementSubmissionSubmittedView]    Script Date: 2/14/2022 5:57:09 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aaSolDisbursementSubmissionSubmittedView]') AND type in (N'U'))
DROP TABLE [dbo].[aaSolDisbursementSubmissionSubmittedView]
GO

/****** Object:  Table [dbo].[aaSolDisbursementSubmissionSubmittedView]    Script Date: 2/14/2022 5:57:10 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  Table [dbo].[aaSolDisbursementSubmissionSubmittedView_PaymentDetail]    Script Date: 2/14/2022 5:57:09 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aaSolDisbursementSubmissionSubmittedView_PaymentDetail]') AND type in (N'U'))
DROP TABLE [dbo].[aaSolDisbursementSubmissionSubmittedView_PaymentDetail]
GO

/****** Object:  Table [dbo].[aaSolDisbursementSubmissionSubmittedView_PaymentDetail]    Script Date: 2/14/2022 5:57:10 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  Table [dbo].[aaSolDisbursementSubmission_BankInfo]    Script Date: 2/14/2022 5:57:09 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aaSolDisbursementSubmission_BankInfo]') AND type in (N'U'))
DROP TABLE [dbo].[aaSolDisbursementSubmission_BankInfo]
GO

/****** Object:  Table [dbo].[aaSolDisbursementSubmission_BankInfo]    Script Date: 2/14/2022 5:57:10 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  Table [dbo].[aaSolDisbursementSubmission_DisCheckerRejected]    Script Date: 2/14/2022 5:57:09 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aaSolDisbursementSubmission_DisCheckerRejected]') AND type in (N'U'))
DROP TABLE [dbo].[aaSolDisbursementSubmission_DisCheckerRejected]
GO

/****** Object:  Table [dbo].[aaSolDisbursementSubmission_DisCheckerRejected]    Script Date: 2/14/2022 5:57:10 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  Table [dbo].[aaSolDisbursementSubmission_DisCheckerRejectedPaymentDetail]    Script Date: 2/14/2022 5:57:09 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aaSolDisbursementSubmission_DisCheckerRejectedPaymentDetail]') AND type in (N'U'))
DROP TABLE [dbo].[aaSolDisbursementSubmission_DisCheckerRejectedPaymentDetail]
GO

/****** Object:  Table [dbo].[aaSolDisbursementSubmission_DisCheckerRejectedPaymentDetail]    Script Date: 2/14/2022 5:57:10 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  Table [dbo].[aaSolDisbursementSubmission_DisMakerRejected]    Script Date: 2/14/2022 5:57:09 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aaSolDisbursementSubmission_DisMakerRejected]') AND type in (N'U'))
DROP TABLE [dbo].[aaSolDisbursementSubmission_DisMakerRejected]
GO

/****** Object:  Table [dbo].[aaSolDisbursementSubmission_DisMakerRejected]    Script Date: 2/14/2022 5:57:10 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  Table [dbo].[aaSolDisbursementSubmission_DisMakerSubmission]    Script Date: 2/14/2022 5:57:09 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aaSolDisbursementSubmission_DisMakerSubmission]') AND type in (N'U'))
DROP TABLE [dbo].[aaSolDisbursementSubmission_DisMakerSubmission]
GO

/****** Object:  Table [dbo].[aaSolDisbursementSubmission_DisMakerSubmission]    Script Date: 2/14/2022 5:57:10 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  Table [dbo].[aaSolDisbursementSubmission_DisMakerSubmissionPaymentDetail]    Script Date: 2/14/2022 5:57:09 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aaSolDisbursementSubmission_DisMakerSubmissionPaymentDetail]') AND type in (N'U'))
DROP TABLE [dbo].[aaSolDisbursementSubmission_DisMakerSubmissionPaymentDetail]
GO

/****** Object:  Table [dbo].[aaSolDisbursementSubmission_DisMakerSubmissionPaymentDetail]    Script Date: 2/14/2022 5:57:10 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  Table [dbo].[aaSolDisbursementSubmission_DisMakerSubmissionPaymentDetail_history]    Script Date: 2/14/2022 5:57:09 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aaSolDisbursementSubmission_DisMakerSubmissionPaymentDetail_history]') AND type in (N'U'))
DROP TABLE [dbo].[aaSolDisbursementSubmission_DisMakerSubmissionPaymentDetail_history]
GO

/****** Object:  Table [dbo].[aaSolDisbursementSubmission_DisMakerSubmissionPaymentDetail_history]    Script Date: 2/14/2022 5:57:10 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  Table [dbo].[aaSolDisbursementSubmission_DisMakerSubmissionPaymentDetail_history_20211207]    Script Date: 2/14/2022 5:57:09 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aaSolDisbursementSubmission_DisMakerSubmissionPaymentDetail_history_20211207]') AND type in (N'U'))
DROP TABLE [dbo].[aaSolDisbursementSubmission_DisMakerSubmissionPaymentDetail_history_20211207]
GO

/****** Object:  Table [dbo].[aaSolDisbursementSubmission_DisMakerSubmissionPaymentDetail_history_20211207]    Script Date: 2/14/2022 5:57:10 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  Table [dbo].[aaSolDisbursementSubmission_DisMakerSubmission_History]    Script Date: 2/14/2022 5:57:09 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aaSolDisbursementSubmission_DisMakerSubmission_History]') AND type in (N'U'))
DROP TABLE [dbo].[aaSolDisbursementSubmission_DisMakerSubmission_History]
GO

/****** Object:  Table [dbo].[aaSolDisbursementSubmission_DisMakerSubmission_History]    Script Date: 2/14/2022 5:57:10 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  Table [dbo].[aaSolDisbursementSubmission_DisMakerSubmission_History_20211207]    Script Date: 2/14/2022 5:57:09 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aaSolDisbursementSubmission_DisMakerSubmission_History_20211207]') AND type in (N'U'))
DROP TABLE [dbo].[aaSolDisbursementSubmission_DisMakerSubmission_History_20211207]
GO

/****** Object:  Table [dbo].[aaSolDisbursementSubmission_DisMakerSubmission_History_20211207]    Script Date: 2/14/2022 5:57:10 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  Table [dbo].[aaSolDisbursementSubmission_History]    Script Date: 2/14/2022 5:57:09 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aaSolDisbursementSubmission_History]') AND type in (N'U'))
DROP TABLE [dbo].[aaSolDisbursementSubmission_History]
GO

/****** Object:  Table [dbo].[aaSolDisbursementSubmission_History]    Script Date: 2/14/2022 5:57:10 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  Table [dbo].[aaSolDisbursementSubmission_LegalFee]    Script Date: 2/14/2022 5:57:09 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aaSolDisbursementSubmission_LegalFee]') AND type in (N'U'))
DROP TABLE [dbo].[aaSolDisbursementSubmission_LegalFee]
GO

/****** Object:  Table [dbo].[aaSolDisbursementSubmission_LegalFee]    Script Date: 2/14/2022 5:57:10 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  Table [dbo].[aaSolDisbursementSubmission_MRTA]    Script Date: 2/14/2022 5:57:09 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aaSolDisbursementSubmission_MRTA]') AND type in (N'U'))
DROP TABLE [dbo].[aaSolDisbursementSubmission_MRTA]
GO

/****** Object:  Table [dbo].[aaSolDisbursementSubmission_MRTA]    Script Date: 2/14/2022 5:57:10 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  Table [dbo].[aaSolDisbursementSubmission_PaymentDetail]    Script Date: 2/14/2022 5:57:09 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aaSolDisbursementSubmission_PaymentDetail]') AND type in (N'U'))
DROP TABLE [dbo].[aaSolDisbursementSubmission_PaymentDetail]
GO

/****** Object:  Table [dbo].[aaSolDisbursementSubmission_PaymentDetail]    Script Date: 2/14/2022 5:57:10 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  Table [dbo].[aaSolDisbursementSubmission_PaymentDetail_history]    Script Date: 2/14/2022 5:57:09 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aaSolDisbursementSubmission_PaymentDetail_history]') AND type in (N'U'))
DROP TABLE [dbo].[aaSolDisbursementSubmission_PaymentDetail_history]
GO

/****** Object:  Table [dbo].[aaSolDisbursementSubmission_PaymentDetail_history]    Script Date: 2/14/2022 5:57:10 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  Table [dbo].[aaSolDisbursementSubmission_PaymentDetail_staging]    Script Date: 2/14/2022 5:57:09 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aaSolDisbursementSubmission_PaymentDetail_staging]') AND type in (N'U'))
DROP TABLE [dbo].[aaSolDisbursementSubmission_PaymentDetail_staging]
GO

/****** Object:  Table [dbo].[aaSolDisbursementSubmission_PaymentDetail_staging]    Script Date: 2/14/2022 5:57:10 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  Table [dbo].[aaSolDisbursementSubmission_PaymentDetail_temp]    Script Date: 2/14/2022 5:57:09 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aaSolDisbursementSubmission_PaymentDetail_temp]') AND type in (N'U'))
DROP TABLE [dbo].[aaSolDisbursementSubmission_PaymentDetail_temp]
GO

/****** Object:  Table [dbo].[aaSolDisbursementSubmission_PaymentDetail_temp]    Script Date: 2/14/2022 5:57:10 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  Table [dbo].[aaSolDisbursementSubmission_PaymentReference]    Script Date: 2/14/2022 5:57:09 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aaSolDisbursementSubmission_PaymentReference]') AND type in (N'U'))
DROP TABLE [dbo].[aaSolDisbursementSubmission_PaymentReference]
GO

/****** Object:  Table [dbo].[aaSolDisbursementSubmission_PaymentReference]    Script Date: 2/14/2022 5:57:10 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  Table [dbo].[aaSolDisbursementSubmission_PaymentReference_FLVM]    Script Date: 2/14/2022 5:57:09 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aaSolDisbursementSubmission_PaymentReference_FLVM]') AND type in (N'U'))
DROP TABLE [dbo].[aaSolDisbursementSubmission_PaymentReference_FLVM]
GO

/****** Object:  Table [dbo].[aaSolDisbursementSubmission_PaymentReference_FLVM]    Script Date: 2/14/2022 5:57:10 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  Table [dbo].[aaSolDisbursementSubmission_RCOCheckerRejected]    Script Date: 2/14/2022 5:57:09 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aaSolDisbursementSubmission_RCOCheckerRejected]') AND type in (N'U'))
DROP TABLE [dbo].[aaSolDisbursementSubmission_RCOCheckerRejected]
GO

/****** Object:  Table [dbo].[aaSolDisbursementSubmission_RCOCheckerRejected]    Script Date: 2/14/2022 5:57:10 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  Table [dbo].[aaSolDisbursementSubmission_RCOMakerRejected]    Script Date: 2/14/2022 5:57:09 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aaSolDisbursementSubmission_RCOMakerRejected]') AND type in (N'U'))
DROP TABLE [dbo].[aaSolDisbursementSubmission_RCOMakerRejected]
GO

/****** Object:  Table [dbo].[aaSolDisbursementSubmission_RCOMakerRejected]    Script Date: 2/14/2022 5:57:10 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  Table [dbo].[aaSolDisbursementSubmission_RCOMakerSubmission]    Script Date: 2/14/2022 5:57:09 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aaSolDisbursementSubmission_RCOMakerSubmission]') AND type in (N'U'))
DROP TABLE [dbo].[aaSolDisbursementSubmission_RCOMakerSubmission]
GO

/****** Object:  Table [dbo].[aaSolDisbursementSubmission_RCOMakerSubmission]    Script Date: 2/14/2022 5:57:10 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  Table [dbo].[aaSolDisbursementSubmission_RCOMakerSubmissionPaymentDetail]    Script Date: 2/14/2022 5:57:09 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aaSolDisbursementSubmission_RCOMakerSubmissionPaymentDetail]') AND type in (N'U'))
DROP TABLE [dbo].[aaSolDisbursementSubmission_RCOMakerSubmissionPaymentDetail]
GO

/****** Object:  Table [dbo].[aaSolDisbursementSubmission_RCOMakerSubmissionPaymentDetail]    Script Date: 2/14/2022 5:57:10 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  Table [dbo].[aaSolDisbursementSubmission_RCOMakerSubmissionPaymentDetail_history]    Script Date: 2/14/2022 5:57:09 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aaSolDisbursementSubmission_RCOMakerSubmissionPaymentDetail_history]') AND type in (N'U'))
DROP TABLE [dbo].[aaSolDisbursementSubmission_RCOMakerSubmissionPaymentDetail_history]
GO

/****** Object:  Table [dbo].[aaSolDisbursementSubmission_RCOMakerSubmissionPaymentDetail_history]    Script Date: 2/14/2022 5:57:10 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  Table [dbo].[aaSolDisbursementSubmission_RCOMakerSubmission_History]    Script Date: 2/14/2022 5:57:09 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aaSolDisbursementSubmission_RCOMakerSubmission_History]') AND type in (N'U'))
DROP TABLE [dbo].[aaSolDisbursementSubmission_RCOMakerSubmission_History]
GO

/****** Object:  Table [dbo].[aaSolDisbursementSubmission_RCOMakerSubmission_History]    Script Date: 2/14/2022 5:57:10 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  Table [dbo].[aaSolDisbursementSubmission_staging]    Script Date: 2/14/2022 5:57:09 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aaSolDisbursementSubmission_staging]') AND type in (N'U'))
DROP TABLE [dbo].[aaSolDisbursementSubmission_staging]
GO

/****** Object:  Table [dbo].[aaSolDisbursementSubmission_staging]    Script Date: 2/14/2022 5:57:10 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  Table [dbo].[aaSolDisbursementSubmission_UpdateInfo]    Script Date: 2/14/2022 5:57:09 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aaSolDisbursementSubmission_UpdateInfo]') AND type in (N'U'))
DROP TABLE [dbo].[aaSolDisbursementSubmission_UpdateInfo]
GO

/****** Object:  Table [dbo].[aaSolDisbursementSubmission_UpdateInfo]    Script Date: 2/14/2022 5:57:10 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  Table [dbo].[aa_DUMaker_Letter_AV_SolicitorDisbursementSubmission_generate_list_aging_staging]    Script Date: 2/14/2022 5:57:09 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aa_DUMaker_Letter_AV_SolicitorDisbursementSubmission_generate_list_aging_staging]') AND type in (N'U'))
DROP TABLE [dbo].[aa_DUMaker_Letter_AV_SolicitorDisbursementSubmission_generate_list_aging_staging]
GO

/****** Object:  Table [dbo].[aa_DUMaker_Letter_AV_SolicitorDisbursementSubmission_generate_list_aging_staging]    Script Date: 2/14/2022 5:57:09 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  Table [dbo].[AdminOperationAuditLog]    Script Date: 2/14/2022 5:57:09 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AdminOperationAuditLog]') AND type in (N'U'))
DROP TABLE [dbo].[AdminOperationAuditLog]
GO

/****** Object:  Table [dbo].[AdminOperationAuditLog]    Script Date: 2/14/2022 5:57:10 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  Table [dbo].[AdminOperationAuditLog2]    Script Date: 2/14/2022 5:57:09 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AdminOperationAuditLog2]') AND type in (N'U'))
DROP TABLE [dbo].[AdminOperationAuditLog2]
GO

/****** Object:  Table [dbo].[AdminOperationAuditLog2]    Script Date: 2/14/2022 5:57:10 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  Table [dbo].[AdminOperationAuditLog_UserMetric]    Script Date: 2/14/2022 5:57:09 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AdminOperationAuditLog_UserMetric]') AND type in (N'U'))
DROP TABLE [dbo].[AdminOperationAuditLog_UserMetric]
GO

/****** Object:  Table [dbo].[AdminOperationAuditLog_UserMetric]    Script Date: 2/14/2022 5:57:10 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  Table [dbo].[attachment_staging]    Script Date: 2/14/2022 5:57:09 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[attachment_staging]') AND type in (N'U'))
DROP TABLE [dbo].[attachment_staging]
GO

/****** Object:  Table [dbo].[attachment_staging]    Script Date: 2/14/2022 5:57:10 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  Table [dbo].[ddProjectAnnouncement]    Script Date: 2/14/2022 5:57:09 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ddProjectAnnouncement]') AND type in (N'U'))
DROP TABLE [dbo].[ddProjectAnnouncement]
GO

/****** Object:  Table [dbo].[ddProjectAnnouncement]    Script Date: 2/14/2022 5:57:10 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  Table [dbo].[ddProjectAnnouncementLog]    Script Date: 2/14/2022 5:57:09 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ddProjectAnnouncementLog]') AND type in (N'U'))
DROP TABLE [dbo].[ddProjectAnnouncementLog]
GO

/****** Object:  Table [dbo].[ddProjectAnnouncementLog]    Script Date: 2/14/2022 5:57:10 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  Table [dbo].[ddProjectAnnouncementSettings]    Script Date: 2/14/2022 5:57:09 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ddProjectAnnouncementSettings]') AND type in (N'U'))
DROP TABLE [dbo].[ddProjectAnnouncementSettings]
GO

/****** Object:  Table [dbo].[ddProjectAnnouncementSettings]    Script Date: 2/14/2022 5:57:10 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  Table [dbo].[ddProjectAutoDetectProjectCode]    Script Date: 2/14/2022 5:57:09 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ddProjectAutoDetectProjectCode]') AND type in (N'U'))
DROP TABLE [dbo].[ddProjectAutoDetectProjectCode]
GO

/****** Object:  Table [dbo].[ddProjectAutoDetectProjectCode]    Script Date: 2/14/2022 5:57:10 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  Table [dbo].[ddProjectDeveloper]    Script Date: 2/14/2022 5:57:09 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ddProjectDeveloper]') AND type in (N'U'))
DROP TABLE [dbo].[ddProjectDeveloper]
GO

/****** Object:  Table [dbo].[ddProjectDeveloper]    Script Date: 2/14/2022 5:57:10 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  Table [dbo].[ddProjectDeveloperPortalSetting]    Script Date: 2/14/2022 5:57:09 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ddProjectDeveloperPortalSetting]') AND type in (N'U'))
DROP TABLE [dbo].[ddProjectDeveloperPortalSetting]
GO

/****** Object:  Table [dbo].[ddProjectDeveloperPortalSetting]    Script Date: 2/14/2022 5:57:10 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  Table [dbo].[ddProjectDeveloperProjectMapping]    Script Date: 2/14/2022 5:57:09 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ddProjectDeveloperProjectMapping]') AND type in (N'U'))
DROP TABLE [dbo].[ddProjectDeveloperProjectMapping]
GO

/****** Object:  Table [dbo].[ddProjectDeveloperProjectMapping]    Script Date: 2/14/2022 5:57:10 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  Table [dbo].[ddProjectDeveloperProjectMapping_Draft]    Script Date: 2/14/2022 5:57:09 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ddProjectDeveloperProjectMapping_Draft]') AND type in (N'U'))
DROP TABLE [dbo].[ddProjectDeveloperProjectMapping_Draft]
GO

/****** Object:  Table [dbo].[ddProjectDeveloperProjectMapping_Draft]    Script Date: 2/14/2022 5:57:10 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  Table [dbo].[ddProjectDeveloperSubUser]    Script Date: 2/14/2022 5:57:09 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ddProjectDeveloperSubUser]') AND type in (N'U'))
DROP TABLE [dbo].[ddProjectDeveloperSubUser]
GO

/****** Object:  Table [dbo].[ddProjectDeveloperSubUser]    Script Date: 2/14/2022 5:57:10 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  Table [dbo].[ddProjectDisbursementSubmission_DeleteWF]    Script Date: 2/14/2022 5:57:09 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ddProjectDisbursementSubmission_DeleteWF]') AND type in (N'U'))
DROP TABLE [dbo].[ddProjectDisbursementSubmission_DeleteWF]
GO

/****** Object:  Table [dbo].[ddProjectDisbursementSubmission_DeleteWF]    Script Date: 2/14/2022 5:57:10 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  Table [dbo].[ddProjectDisbursementSubmission_DeleteWF_log]    Script Date: 2/14/2022 5:57:09 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ddProjectDisbursementSubmission_DeleteWF_log]') AND type in (N'U'))
DROP TABLE [dbo].[ddProjectDisbursementSubmission_DeleteWF_log]
GO

/****** Object:  Table [dbo].[ddProjectDisbursementSubmission_DeleteWF_log]    Script Date: 2/14/2022 5:57:10 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  Table [dbo].[ddProjectDisbursementSubmission_DisCheckerRejected]    Script Date: 2/14/2022 5:57:09 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ddProjectDisbursementSubmission_DisCheckerRejected]') AND type in (N'U'))
DROP TABLE [dbo].[ddProjectDisbursementSubmission_DisCheckerRejected]
GO

/****** Object:  Table [dbo].[ddProjectDisbursementSubmission_DisCheckerRejected]    Script Date: 2/14/2022 5:57:10 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  Table [dbo].[ddProjectDisbursementSubmission_DisChecker_RejectedPaymentDetail]    Script Date: 2/14/2022 5:57:09 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ddProjectDisbursementSubmission_DisChecker_RejectedPaymentDetail]') AND type in (N'U'))
DROP TABLE [dbo].[ddProjectDisbursementSubmission_DisChecker_RejectedPaymentDetail]
GO

/****** Object:  Table [dbo].[ddProjectDisbursementSubmission_DisChecker_RejectedPaymentDetail]    Script Date: 2/14/2022 5:57:10 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  Table [dbo].[ddProjectDisbursementSubmission_DisMaker]    Script Date: 2/14/2022 5:57:09 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ddProjectDisbursementSubmission_DisMaker]') AND type in (N'U'))
DROP TABLE [dbo].[ddProjectDisbursementSubmission_DisMaker]
GO

/****** Object:  Table [dbo].[ddProjectDisbursementSubmission_DisMaker]    Script Date: 2/14/2022 5:57:10 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  Table [dbo].[ddProjectDisbursementSubmission_DisMakerHistory]    Script Date: 2/14/2022 5:57:09 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ddProjectDisbursementSubmission_DisMakerHistory]') AND type in (N'U'))
DROP TABLE [dbo].[ddProjectDisbursementSubmission_DisMakerHistory]
GO

/****** Object:  Table [dbo].[ddProjectDisbursementSubmission_DisMakerHistory]    Script Date: 2/14/2022 5:57:10 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  Table [dbo].[ddProjectDisbursementSubmission_DisMaker_MRTA]    Script Date: 2/14/2022 5:57:09 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ddProjectDisbursementSubmission_DisMaker_MRTA]') AND type in (N'U'))
DROP TABLE [dbo].[ddProjectDisbursementSubmission_DisMaker_MRTA]
GO

/****** Object:  Table [dbo].[ddProjectDisbursementSubmission_DisMaker_MRTA]    Script Date: 2/14/2022 5:57:10 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  Table [dbo].[ddProjectDisbursementSubmission_DisMaker_PaymentDetail]    Script Date: 2/14/2022 5:57:09 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ddProjectDisbursementSubmission_DisMaker_PaymentDetail]') AND type in (N'U'))
DROP TABLE [dbo].[ddProjectDisbursementSubmission_DisMaker_PaymentDetail]
GO

/****** Object:  Table [dbo].[ddProjectDisbursementSubmission_DisMaker_PaymentDetail]    Script Date: 2/14/2022 5:57:10 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  Table [dbo].[ddProjectDisbursementSubmission_DisMaker_PaymentDetail_history]    Script Date: 2/14/2022 5:57:09 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ddProjectDisbursementSubmission_DisMaker_PaymentDetail_history]') AND type in (N'U'))
DROP TABLE [dbo].[ddProjectDisbursementSubmission_DisMaker_PaymentDetail_history]
GO

/****** Object:  Table [dbo].[ddProjectDisbursementSubmission_DisMaker_PaymentDetail_history]    Script Date: 2/14/2022 5:57:10 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  Table [dbo].[ddProjectDisbursementSubmission_DisMaker_Rejected]    Script Date: 2/14/2022 5:57:09 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ddProjectDisbursementSubmission_DisMaker_Rejected]') AND type in (N'U'))
DROP TABLE [dbo].[ddProjectDisbursementSubmission_DisMaker_Rejected]
GO

/****** Object:  Table [dbo].[ddProjectDisbursementSubmission_DisMaker_Rejected]    Script Date: 2/14/2022 5:57:10 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  Table [dbo].[ddProjectDisbursementSubmission_DisMaker_Rejected_bk]    Script Date: 2/14/2022 5:57:09 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ddProjectDisbursementSubmission_DisMaker_Rejected_bk]') AND type in (N'U'))
DROP TABLE [dbo].[ddProjectDisbursementSubmission_DisMaker_Rejected_bk]
GO

/****** Object:  Table [dbo].[ddProjectDisbursementSubmission_DisMaker_Rejected_bk]    Script Date: 2/14/2022 5:57:10 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  Table [dbo].[ddProjectDisbursementSubmission_DisMaker_Rejected_History]    Script Date: 2/14/2022 5:57:09 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ddProjectDisbursementSubmission_DisMaker_Rejected_History]') AND type in (N'U'))
DROP TABLE [dbo].[ddProjectDisbursementSubmission_DisMaker_Rejected_History]
GO

/****** Object:  Table [dbo].[ddProjectDisbursementSubmission_DisMaker_Rejected_History]    Script Date: 2/14/2022 5:57:10 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  Table [dbo].[ddProjectDisbursementSubmission_DisMaker_Rejected_Staging]    Script Date: 2/14/2022 5:57:09 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ddProjectDisbursementSubmission_DisMaker_Rejected_Staging]') AND type in (N'U'))
DROP TABLE [dbo].[ddProjectDisbursementSubmission_DisMaker_Rejected_Staging]
GO

/****** Object:  Table [dbo].[ddProjectDisbursementSubmission_DisMaker_Rejected_Staging]    Script Date: 2/14/2022 5:57:10 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  Table [dbo].[ddProjectDisbursementSubmission_DisMaker_Rejected_ViewOnly]    Script Date: 2/14/2022 5:57:09 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ddProjectDisbursementSubmission_DisMaker_Rejected_ViewOnly]') AND type in (N'U'))
DROP TABLE [dbo].[ddProjectDisbursementSubmission_DisMaker_Rejected_ViewOnly]
GO

/****** Object:  Table [dbo].[ddProjectDisbursementSubmission_DisMaker_Rejected_ViewOnly]    Script Date: 2/14/2022 5:57:10 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  Table [dbo].[ddProjectDisbursementSubmission_DisMaker_Rejected_ViewOnly_bk]    Script Date: 2/14/2022 5:57:09 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ddProjectDisbursementSubmission_DisMaker_Rejected_ViewOnly_bk]') AND type in (N'U'))
DROP TABLE [dbo].[ddProjectDisbursementSubmission_DisMaker_Rejected_ViewOnly_bk]
GO

/****** Object:  Table [dbo].[ddProjectDisbursementSubmission_DisMaker_Rejected_ViewOnly_bk]    Script Date: 2/14/2022 5:57:10 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  Table [dbo].[ddProjectDisbursementSubmission_draft]    Script Date: 2/14/2022 5:57:09 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ddProjectDisbursementSubmission_draft]') AND type in (N'U'))
DROP TABLE [dbo].[ddProjectDisbursementSubmission_draft]
GO

/****** Object:  Table [dbo].[ddProjectDisbursementSubmission_draft]    Script Date: 2/14/2022 5:57:10 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  Table [dbo].[ddProjectDisbursementSubmission_draft_History]    Script Date: 2/14/2022 5:57:09 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ddProjectDisbursementSubmission_draft_History]') AND type in (N'U'))
DROP TABLE [dbo].[ddProjectDisbursementSubmission_draft_History]
GO

/****** Object:  Table [dbo].[ddProjectDisbursementSubmission_draft_History]    Script Date: 2/14/2022 5:57:10 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  Table [dbo].[ddProjectDisbursementSubmission_draft_Master]    Script Date: 2/14/2022 5:57:09 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ddProjectDisbursementSubmission_draft_Master]') AND type in (N'U'))
DROP TABLE [dbo].[ddProjectDisbursementSubmission_draft_Master]
GO

/****** Object:  Table [dbo].[ddProjectDisbursementSubmission_draft_Master]    Script Date: 2/14/2022 5:57:10 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  Table [dbo].[ddProjectDisbursementSubmission_draft_Master_History]    Script Date: 2/14/2022 5:57:09 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ddProjectDisbursementSubmission_draft_Master_History]') AND type in (N'U'))
DROP TABLE [dbo].[ddProjectDisbursementSubmission_draft_Master_History]
GO

/****** Object:  Table [dbo].[ddProjectDisbursementSubmission_draft_Master_History]    Script Date: 2/14/2022 5:57:10 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  Table [dbo].[ddProjectDisbursementSubmission_draft_Master_Staging]    Script Date: 2/14/2022 5:57:09 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ddProjectDisbursementSubmission_draft_Master_Staging]') AND type in (N'U'))
DROP TABLE [dbo].[ddProjectDisbursementSubmission_draft_Master_Staging]
GO

/****** Object:  Table [dbo].[ddProjectDisbursementSubmission_draft_Master_Staging]    Script Date: 2/14/2022 5:57:10 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  Table [dbo].[ddProjectDisbursementSubmission_draft_PermenentTempTable]    Script Date: 2/14/2022 5:57:09 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ddProjectDisbursementSubmission_draft_PermenentTempTable]') AND type in (N'U'))
DROP TABLE [dbo].[ddProjectDisbursementSubmission_draft_PermenentTempTable]
GO

/****** Object:  Table [dbo].[ddProjectDisbursementSubmission_draft_PermenentTempTable]    Script Date: 2/14/2022 5:57:10 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  Table [dbo].[ddProjectDisbursementSubmission_draft_Staging]    Script Date: 2/14/2022 5:57:09 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ddProjectDisbursementSubmission_draft_Staging]') AND type in (N'U'))
DROP TABLE [dbo].[ddProjectDisbursementSubmission_draft_Staging]
GO

/****** Object:  Table [dbo].[ddProjectDisbursementSubmission_draft_Staging]    Script Date: 2/14/2022 5:57:10 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  Table [dbo].[ddProjectDisbursementSubmission_NotificationOfPayment]    Script Date: 2/14/2022 5:57:09 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ddProjectDisbursementSubmission_NotificationOfPayment]') AND type in (N'U'))
DROP TABLE [dbo].[ddProjectDisbursementSubmission_NotificationOfPayment]
GO

/****** Object:  Table [dbo].[ddProjectDisbursementSubmission_NotificationOfPayment]    Script Date: 2/14/2022 5:57:10 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  Table [dbo].[ddProjectDisbursementSubmission_NotificationOfPayment_BK20211201]    Script Date: 2/14/2022 5:57:09 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ddProjectDisbursementSubmission_NotificationOfPayment_BK20211201]') AND type in (N'U'))
DROP TABLE [dbo].[ddProjectDisbursementSubmission_NotificationOfPayment_BK20211201]
GO

/****** Object:  Table [dbo].[ddProjectDisbursementSubmission_NotificationOfPayment_BK20211201]    Script Date: 2/14/2022 5:57:10 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  Table [dbo].[ddProjectDisbursementSubmission_NotificationOfPayment_Completed]    Script Date: 2/14/2022 5:57:09 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ddProjectDisbursementSubmission_NotificationOfPayment_Completed]') AND type in (N'U'))
DROP TABLE [dbo].[ddProjectDisbursementSubmission_NotificationOfPayment_Completed]
GO

/****** Object:  Table [dbo].[ddProjectDisbursementSubmission_NotificationOfPayment_Completed]    Script Date: 2/14/2022 5:57:10 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  Table [dbo].[ddProjectDisbursementSubmission_NotificationOfPayment_EmailLog]    Script Date: 2/14/2022 5:57:09 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ddProjectDisbursementSubmission_NotificationOfPayment_EmailLog]') AND type in (N'U'))
DROP TABLE [dbo].[ddProjectDisbursementSubmission_NotificationOfPayment_EmailLog]
GO

/****** Object:  Table [dbo].[ddProjectDisbursementSubmission_NotificationOfPayment_EmailLog]    Script Date: 2/14/2022 5:57:10 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  Table [dbo].[ddProjectDisbursementSubmission_NotificationOfPayment_staging]    Script Date: 2/14/2022 5:57:09 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ddProjectDisbursementSubmission_NotificationOfPayment_staging]') AND type in (N'U'))
DROP TABLE [dbo].[ddProjectDisbursementSubmission_NotificationOfPayment_staging]
GO

/****** Object:  Table [dbo].[ddProjectDisbursementSubmission_NotificationOfPayment_staging]    Script Date: 2/14/2022 5:57:10 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  Table [dbo].[ddProjectDisbursementSubmission_NotificationOfPayment_staging_master]    Script Date: 2/14/2022 5:57:09 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ddProjectDisbursementSubmission_NotificationOfPayment_staging_master]') AND type in (N'U'))
DROP TABLE [dbo].[ddProjectDisbursementSubmission_NotificationOfPayment_staging_master]
GO

/****** Object:  Table [dbo].[ddProjectDisbursementSubmission_NotificationOfPayment_staging_master]    Script Date: 2/14/2022 5:57:10 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  Table [dbo].[ddProjectDisbursementSubmission_NotificationOfPayment_staging_master_Completed]    Script Date: 2/14/2022 5:57:09 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ddProjectDisbursementSubmission_NotificationOfPayment_staging_master_Completed]') AND type in (N'U'))
DROP TABLE [dbo].[ddProjectDisbursementSubmission_NotificationOfPayment_staging_master_Completed]
GO

/****** Object:  Table [dbo].[ddProjectDisbursementSubmission_NotificationOfPayment_staging_master_Completed]    Script Date: 2/14/2022 5:57:10 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  Table [dbo].[ddProjectDisbursementSubmission_NotificationOfPayment_staging_master_EDMS]    Script Date: 2/14/2022 5:57:09 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ddProjectDisbursementSubmission_NotificationOfPayment_staging_master_EDMS]') AND type in (N'U'))
DROP TABLE [dbo].[ddProjectDisbursementSubmission_NotificationOfPayment_staging_master_EDMS]
GO

/****** Object:  Table [dbo].[ddProjectDisbursementSubmission_NotificationOfPayment_staging_master_EDMS]    Script Date: 2/14/2022 5:57:10 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  Table [dbo].[ddProjectDisbursementSubmission_RCOMaker]    Script Date: 2/14/2022 5:57:09 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ddProjectDisbursementSubmission_RCOMaker]') AND type in (N'U'))
DROP TABLE [dbo].[ddProjectDisbursementSubmission_RCOMaker]
GO

/****** Object:  Table [dbo].[ddProjectDisbursementSubmission_RCOMaker]    Script Date: 2/14/2022 5:57:10 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  Table [dbo].[ddProjectDisbursementSubmission_RCOMaker_History]    Script Date: 2/14/2022 5:57:09 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ddProjectDisbursementSubmission_RCOMaker_History]') AND type in (N'U'))
DROP TABLE [dbo].[ddProjectDisbursementSubmission_RCOMaker_History]
GO

/****** Object:  Table [dbo].[ddProjectDisbursementSubmission_RCOMaker_History]    Script Date: 2/14/2022 5:57:10 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  Table [dbo].[ddProjectDisbursementSubmission_RCOMaker_PaymentDetail]    Script Date: 2/14/2022 5:57:09 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ddProjectDisbursementSubmission_RCOMaker_PaymentDetail]') AND type in (N'U'))
DROP TABLE [dbo].[ddProjectDisbursementSubmission_RCOMaker_PaymentDetail]
GO

/****** Object:  Table [dbo].[ddProjectDisbursementSubmission_RCOMaker_PaymentDetail]    Script Date: 2/14/2022 5:57:10 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  Table [dbo].[ddProjectDisbursementSubmission_RCOMaker_PaymentDetail_History]    Script Date: 2/14/2022 5:57:09 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ddProjectDisbursementSubmission_RCOMaker_PaymentDetail_History]') AND type in (N'U'))
DROP TABLE [dbo].[ddProjectDisbursementSubmission_RCOMaker_PaymentDetail_History]
GO

/****** Object:  Table [dbo].[ddProjectDisbursementSubmission_RCOMaker_PaymentDetail_History]    Script Date: 2/14/2022 5:57:10 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  Table [dbo].[ddProjectDisbursementSubmission_SubmissionHistory2]    Script Date: 2/14/2022 5:57:09 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ddProjectDisbursementSubmission_SubmissionHistory2]') AND type in (N'U'))
DROP TABLE [dbo].[ddProjectDisbursementSubmission_SubmissionHistory2]
GO

/****** Object:  Table [dbo].[ddProjectDisbursementSubmission_SubmissionHistory2]    Script Date: 2/14/2022 5:57:10 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  Table [dbo].[ddProjectEmailAuditTrail]    Script Date: 2/14/2022 5:57:09 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ddProjectEmailAuditTrail]') AND type in (N'U'))
DROP TABLE [dbo].[ddProjectEmailAuditTrail]
GO

/****** Object:  Table [dbo].[ddProjectEmailAuditTrail]    Script Date: 2/14/2022 5:57:10 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  Table [dbo].[ddProjectEmailToDeveloperLog]    Script Date: 2/14/2022 5:57:09 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ddProjectEmailToDeveloperLog]') AND type in (N'U'))
DROP TABLE [dbo].[ddProjectEmailToDeveloperLog]
GO

/****** Object:  Table [dbo].[ddProjectEmailToDeveloperLog]    Script Date: 2/14/2022 5:57:10 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  Table [dbo].[ddProjectLoginTrialSession]    Script Date: 2/14/2022 5:57:09 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ddProjectLoginTrialSession]') AND type in (N'U'))
DROP TABLE [dbo].[ddProjectLoginTrialSession]
GO

/****** Object:  Table [dbo].[ddProjectLoginTrialSession]    Script Date: 2/14/2022 5:57:10 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  Table [dbo].[ddProjectLoginTrialSession_FailedAttemptLog]    Script Date: 2/14/2022 5:57:09 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ddProjectLoginTrialSession_FailedAttemptLog]') AND type in (N'U'))
DROP TABLE [dbo].[ddProjectLoginTrialSession_FailedAttemptLog]
GO

/****** Object:  Table [dbo].[ddProjectLoginTrialSession_FailedAttemptLog]    Script Date: 2/14/2022 5:57:10 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  Table [dbo].[ddProjectLogoutLog]    Script Date: 2/14/2022 5:57:09 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ddProjectLogoutLog]') AND type in (N'U'))
DROP TABLE [dbo].[ddProjectLogoutLog]
GO

/****** Object:  Table [dbo].[ddProjectLogoutLog]    Script Date: 2/14/2022 5:57:10 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  Table [dbo].[ddProjectNewPhaseCodeEmailToAdminLog]    Script Date: 2/14/2022 5:57:09 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ddProjectNewPhaseCodeEmailToAdminLog]') AND type in (N'U'))
DROP TABLE [dbo].[ddProjectNewPhaseCodeEmailToAdminLog]
GO

/****** Object:  Table [dbo].[ddProjectNewPhaseCodeEmailToAdminLog]    Script Date: 2/14/2022 5:57:10 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  Table [dbo].[ddProjectNotificationOfPayment_Setting]    Script Date: 2/14/2022 5:57:09 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ddProjectNotificationOfPayment_Setting]') AND type in (N'U'))
DROP TABLE [dbo].[ddProjectNotificationOfPayment_Setting]
GO

/****** Object:  Table [dbo].[ddProjectNotificationOfPayment_Setting]    Script Date: 2/14/2022 5:57:10 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  Table [dbo].[ddProjectPasswordHistory]    Script Date: 2/14/2022 5:57:09 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ddProjectPasswordHistory]') AND type in (N'U'))
DROP TABLE [dbo].[ddProjectPasswordHistory]
GO

/****** Object:  Table [dbo].[ddProjectPasswordHistory]    Script Date: 2/14/2022 5:57:10 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  Table [dbo].[ddProjectPhase]    Script Date: 2/14/2022 5:57:09 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ddProjectPhase]') AND type in (N'U'))
DROP TABLE [dbo].[ddProjectPhase]
GO

/****** Object:  Table [dbo].[ddProjectPhase]    Script Date: 2/14/2022 5:57:10 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  Table [dbo].[ddProjectSADAAuditTrail]    Script Date: 2/14/2022 5:57:09 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ddProjectSADAAuditTrail]') AND type in (N'U'))
DROP TABLE [dbo].[ddProjectSADAAuditTrail]
GO

/****** Object:  Table [dbo].[ddProjectSADAAuditTrail]    Script Date: 2/14/2022 5:57:10 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  Table [dbo].[ddProjectSession]    Script Date: 2/14/2022 5:57:09 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ddProjectSession]') AND type in (N'U'))
DROP TABLE [dbo].[ddProjectSession]
GO

/****** Object:  Table [dbo].[ddProjectSession]    Script Date: 2/14/2022 5:57:10 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  Table [dbo].[ddProjectUserLoginLog]    Script Date: 2/14/2022 5:57:09 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ddProjectUserLoginLog]') AND type in (N'U'))
DROP TABLE [dbo].[ddProjectUserLoginLog]
GO

/****** Object:  Table [dbo].[ddProjectUserLoginLog]    Script Date: 2/14/2022 5:57:10 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  Table [dbo].[ddProject_MortgageAppTaskInstance]    Script Date: 2/14/2022 5:57:09 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ddProject_MortgageAppTaskInstance]') AND type in (N'U'))
DROP TABLE [dbo].[ddProject_MortgageAppTaskInstance]
GO

/****** Object:  Table [dbo].[ddProject_MortgageAppTaskInstance]    Script Date: 2/14/2022 5:57:10 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  Table [dbo].[ddProject_MortgageAppTaskInstance_logs]    Script Date: 2/14/2022 5:57:09 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ddProject_MortgageAppTaskInstance_logs]') AND type in (N'U'))
DROP TABLE [dbo].[ddProject_MortgageAppTaskInstance_logs]
GO

/****** Object:  Table [dbo].[ddProject_MortgageAppTaskInstance_logs]    Script Date: 2/14/2022 5:57:10 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  Table [dbo].[ddProject_PasswordReset_Log]    Script Date: 2/14/2022 5:57:09 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ddProject_PasswordReset_Log]') AND type in (N'U'))
DROP TABLE [dbo].[ddProject_PasswordReset_Log]
GO

/****** Object:  Table [dbo].[ddProject_PasswordReset_Log]    Script Date: 2/14/2022 5:57:10 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  Table [dbo].[ddProject_Report_PaymentHistory]    Script Date: 2/14/2022 5:57:09 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ddProject_Report_PaymentHistory]') AND type in (N'U'))
DROP TABLE [dbo].[ddProject_Report_PaymentHistory]
GO

/****** Object:  Table [dbo].[ddProject_Report_PaymentHistory]    Script Date: 2/14/2022 5:57:10 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  Table [dbo].[ddProject_Report_ProgressiveBilling]    Script Date: 2/14/2022 5:57:09 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ddProject_Report_ProgressiveBilling]') AND type in (N'U'))
DROP TABLE [dbo].[ddProject_Report_ProgressiveBilling]
GO

/****** Object:  Table [dbo].[ddProject_Report_ProgressiveBilling]    Script Date: 2/14/2022 5:57:10 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  Table [dbo].[ddSettingsExt]    Script Date: 2/14/2022 5:57:09 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ddSettingsExt]') AND type in (N'U'))
DROP TABLE [dbo].[ddSettingsExt]
GO

/****** Object:  Table [dbo].[ddSettingsExt]    Script Date: 2/14/2022 5:57:10 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  Table [dbo].[DefaultPassword_Setting]    Script Date: 2/14/2022 5:57:09 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DefaultPassword_Setting]') AND type in (N'U'))
DROP TABLE [dbo].[DefaultPassword_Setting]
GO

/****** Object:  Table [dbo].[DefaultPassword_Setting]    Script Date: 2/14/2022 5:57:10 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  Table [dbo].[DynamicQueryResultTable]    Script Date: 2/14/2022 5:57:09 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DynamicQueryResultTable]') AND type in (N'U'))
DROP TABLE [dbo].[DynamicQueryResultTable]
GO

/****** Object:  Table [dbo].[DynamicQueryResultTable]    Script Date: 2/14/2022 5:57:10 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  Table [dbo].[EDMS_Settings]    Script Date: 2/14/2022 5:57:09 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[EDMS_Settings]') AND type in (N'U'))
DROP TABLE [dbo].[EDMS_Settings]
GO

/****** Object:  Table [dbo].[EDMS_Settings]    Script Date: 2/14/2022 5:57:10 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  Table [dbo].[errorLog]    Script Date: 2/14/2022 5:57:09 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[errorLog]') AND type in (N'U'))
DROP TABLE [dbo].[errorLog]
GO

/****** Object:  Table [dbo].[errorLog]    Script Date: 2/14/2022 5:57:10 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  Table [dbo].[errorLog2]    Script Date: 2/14/2022 5:57:09 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[errorLog2]') AND type in (N'U'))
DROP TABLE [dbo].[errorLog2]
GO

/****** Object:  Table [dbo].[errorLog2]    Script Date: 2/14/2022 5:57:10 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  Table [dbo].[errorLog_LOADSOneTimeLoad]    Script Date: 2/14/2022 5:57:09 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[errorLog_LOADSOneTimeLoad]') AND type in (N'U'))
DROP TABLE [dbo].[errorLog_LOADSOneTimeLoad]
GO

/****** Object:  Table [dbo].[errorLog_LOADSOneTimeLoad]    Script Date: 2/14/2022 5:57:10 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  Table [dbo].[FailedEmailLog]    Script Date: 2/14/2022 5:57:09 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[FailedEmailLog]') AND type in (N'U'))
DROP TABLE [dbo].[FailedEmailLog]
GO

/****** Object:  Table [dbo].[FailedEmailLog]    Script Date: 2/14/2022 5:57:10 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  Table [dbo].[ImageSettings]    Script Date: 2/14/2022 5:57:09 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ImageSettings]') AND type in (N'U'))
DROP TABLE [dbo].[ImageSettings]
GO

/****** Object:  Table [dbo].[ImageSettings]    Script Date: 2/14/2022 5:57:10 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  Table [dbo].[InternalUser]    Script Date: 2/14/2022 5:57:09 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[InternalUser]') AND type in (N'U'))
DROP TABLE [dbo].[InternalUser]
GO

/****** Object:  Table [dbo].[InternalUser]    Script Date: 2/14/2022 5:57:10 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  Table [dbo].[InternalUserLoginLog]    Script Date: 2/14/2022 5:57:09 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[InternalUserLoginLog]') AND type in (N'U'))
DROP TABLE [dbo].[InternalUserLoginLog]
GO

/****** Object:  Table [dbo].[InternalUserLoginLog]    Script Date: 2/14/2022 5:57:10 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  Table [dbo].[InternalUserLoginTrialSession]    Script Date: 2/14/2022 5:57:09 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[InternalUserLoginTrialSession]') AND type in (N'U'))
DROP TABLE [dbo].[InternalUserLoginTrialSession]
GO

/****** Object:  Table [dbo].[InternalUserLoginTrialSession]    Script Date: 2/14/2022 5:57:10 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  Table [dbo].[InternalUserLoginTrialSession_FailedAttemptLog]    Script Date: 2/14/2022 5:57:09 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[InternalUserLoginTrialSession_FailedAttemptLog]') AND type in (N'U'))
DROP TABLE [dbo].[InternalUserLoginTrialSession_FailedAttemptLog]
GO

/****** Object:  Table [dbo].[InternalUserLoginTrialSession_FailedAttemptLog]    Script Date: 2/14/2022 5:57:10 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  Table [dbo].[InternalUserLogoutLog]    Script Date: 2/14/2022 5:57:09 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[InternalUserLogoutLog]') AND type in (N'U'))
DROP TABLE [dbo].[InternalUserLogoutLog]
GO

/****** Object:  Table [dbo].[InternalUserLogoutLog]    Script Date: 2/14/2022 5:57:10 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  Table [dbo].[InternalUserRole]    Script Date: 2/14/2022 5:57:09 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[InternalUserRole]') AND type in (N'U'))
DROP TABLE [dbo].[InternalUserRole]
GO

/****** Object:  Table [dbo].[InternalUserRole]    Script Date: 2/14/2022 5:57:10 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  Table [dbo].[InternalUserRole_AccessList]    Script Date: 2/14/2022 5:57:09 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[InternalUserRole_AccessList]') AND type in (N'U'))
DROP TABLE [dbo].[InternalUserRole_AccessList]
GO

/****** Object:  Table [dbo].[InternalUserRole_AccessList]    Script Date: 2/14/2022 5:57:10 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  Table [dbo].[InternalUserRole_UAM5]    Script Date: 2/14/2022 5:57:09 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[InternalUserRole_UAM5]') AND type in (N'U'))
DROP TABLE [dbo].[InternalUserRole_UAM5]
GO

/****** Object:  Table [dbo].[InternalUserRole_UAM5]    Script Date: 2/14/2022 5:57:10 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  Table [dbo].[InternalUserSession]    Script Date: 2/14/2022 5:57:09 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[InternalUserSession]') AND type in (N'U'))
DROP TABLE [dbo].[InternalUserSession]
GO

/****** Object:  Table [dbo].[InternalUserSession]    Script Date: 2/14/2022 5:57:10 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  Table [dbo].[InternalUserSessionActive]    Script Date: 2/14/2022 5:57:09 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[InternalUserSessionActive]') AND type in (N'U'))
DROP TABLE [dbo].[InternalUserSessionActive]
GO

/****** Object:  Table [dbo].[InternalUserSessionActive]    Script Date: 2/14/2022 5:57:10 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  Table [dbo].[K2SaveAsPDFSettings]    Script Date: 2/14/2022 5:57:09 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[K2SaveAsPDFSettings]') AND type in (N'U'))
DROP TABLE [dbo].[K2SaveAsPDFSettings]
GO

/****** Object:  Table [dbo].[K2SaveAsPDFSettings]    Script Date: 2/14/2022 5:57:10 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_LOADS_API_LOG_InsertedDatatime]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[LOADS_API_LOG] DROP CONSTRAINT [DF_LOADS_API_LOG_InsertedDatatime]
END
GO

/****** Object:  Table [dbo].[LOADS_API_LOG]    Script Date: 2/14/2022 5:57:09 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[LOADS_API_LOG]') AND type in (N'U'))
DROP TABLE [dbo].[LOADS_API_LOG]
GO

/****** Object:  Table [dbo].[LOADS_API_LOG]    Script Date: 2/14/2022 5:57:10 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  Table [dbo].[LOADS_NEW_LI_STAGING]    Script Date: 2/14/2022 5:57:09 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[LOADS_NEW_LI_STAGING]') AND type in (N'U'))
DROP TABLE [dbo].[LOADS_NEW_LI_STAGING]
GO

/****** Object:  Table [dbo].[LOADS_NEW_LI_STAGING]    Script Date: 2/14/2022 5:57:10 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  Table [dbo].[MortgageAppTaskInstance]    Script Date: 2/14/2022 5:57:09 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[MortgageAppTaskInstance]') AND type in (N'U'))
DROP TABLE [dbo].[MortgageAppTaskInstance]
GO

/****** Object:  Table [dbo].[MortgageAppTaskInstance]    Script Date: 2/14/2022 5:57:10 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  Table [dbo].[MortgageAppTaskInstance_billing]    Script Date: 2/14/2022 5:57:09 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[MortgageAppTaskInstance_billing]') AND type in (N'U'))
DROP TABLE [dbo].[MortgageAppTaskInstance_billing]
GO

/****** Object:  Table [dbo].[MortgageAppTaskInstance_billing]    Script Date: 2/14/2022 5:57:10 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  Table [dbo].[MortgageAppTaskInstance_Billing_logs]    Script Date: 2/14/2022 5:57:09 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[MortgageAppTaskInstance_Billing_logs]') AND type in (N'U'))
DROP TABLE [dbo].[MortgageAppTaskInstance_Billing_logs]
GO

/****** Object:  Table [dbo].[MortgageAppTaskInstance_Billing_logs]    Script Date: 2/14/2022 5:57:10 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  Table [dbo].[MortgageAppTaskInstance_logs]    Script Date: 2/14/2022 5:57:09 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[MortgageAppTaskInstance_logs]') AND type in (N'U'))
DROP TABLE [dbo].[MortgageAppTaskInstance_logs]
GO

/****** Object:  Table [dbo].[MortgageAppTaskInstance_logs]    Script Date: 2/14/2022 5:57:10 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  Table [dbo].[MRTAAcctNumberSetting]    Script Date: 2/14/2022 5:57:09 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[MRTAAcctNumberSetting]') AND type in (N'U'))
DROP TABLE [dbo].[MRTAAcctNumberSetting]
GO

/****** Object:  Table [dbo].[MRTAAcctNumberSetting]    Script Date: 2/14/2022 5:57:10 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  Table [dbo].[ScriptSetting]    Script Date: 2/14/2022 5:57:09 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ScriptSetting]') AND type in (N'U'))
DROP TABLE [dbo].[ScriptSetting]
GO

/****** Object:  Table [dbo].[ScriptSetting]    Script Date: 2/14/2022 5:57:10 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  Table [dbo].[Settings]    Script Date: 2/14/2022 5:57:09 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Settings]') AND type in (N'U'))
DROP TABLE [dbo].[Settings]
GO

/****** Object:  Table [dbo].[Settings]    Script Date: 2/14/2022 5:57:10 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  Table [dbo].[SolicitorLoginTrialSession]    Script Date: 2/14/2022 5:57:09 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SolicitorLoginTrialSession]') AND type in (N'U'))
DROP TABLE [dbo].[SolicitorLoginTrialSession]
GO

/****** Object:  Table [dbo].[SolicitorLoginTrialSession]    Script Date: 2/14/2022 5:57:10 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  Table [dbo].[SolicitorLoginTrialSession_FailedAttemptLog]    Script Date: 2/14/2022 5:57:09 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SolicitorLoginTrialSession_FailedAttemptLog]') AND type in (N'U'))
DROP TABLE [dbo].[SolicitorLoginTrialSession_FailedAttemptLog]
GO

/****** Object:  Table [dbo].[SolicitorLoginTrialSession_FailedAttemptLog]    Script Date: 2/14/2022 5:57:10 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  Table [dbo].[SolicitorLogoutLog]    Script Date: 2/14/2022 5:57:09 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SolicitorLogoutLog]') AND type in (N'U'))
DROP TABLE [dbo].[SolicitorLogoutLog]
GO

/****** Object:  Table [dbo].[SolicitorLogoutLog]    Script Date: 2/14/2022 5:57:10 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  Table [dbo].[SolicitorPasswordHistory]    Script Date: 2/14/2022 5:57:09 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SolicitorPasswordHistory]') AND type in (N'U'))
DROP TABLE [dbo].[SolicitorPasswordHistory]
GO

/****** Object:  Table [dbo].[SolicitorPasswordHistory]    Script Date: 2/14/2022 5:57:10 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  Table [dbo].[SolicitorSession]    Script Date: 2/14/2022 5:57:09 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SolicitorSession]') AND type in (N'U'))
DROP TABLE [dbo].[SolicitorSession]
GO

/****** Object:  Table [dbo].[SolicitorSession]    Script Date: 2/14/2022 5:57:10 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  Table [dbo].[SolicitorUISession]    Script Date: 2/14/2022 5:57:09 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SolicitorUISession]') AND type in (N'U'))
DROP TABLE [dbo].[SolicitorUISession]
GO

/****** Object:  Table [dbo].[SolicitorUISession]    Script Date: 2/14/2022 5:57:10 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  Table [dbo].[SolicitorUserLoginLog]    Script Date: 2/14/2022 5:57:09 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SolicitorUserLoginLog]') AND type in (N'U'))
DROP TABLE [dbo].[SolicitorUserLoginLog]
GO

/****** Object:  Table [dbo].[SolicitorUserLoginLog]    Script Date: 2/14/2022 5:57:10 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  Table [dbo].[SolPDFPasswordSetting]    Script Date: 2/14/2022 5:57:09 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SolPDFPasswordSetting]') AND type in (N'U'))
DROP TABLE [dbo].[SolPDFPasswordSetting]
GO

/****** Object:  Table [dbo].[SolPDFPasswordSetting]    Script Date: 2/14/2022 5:57:10 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  Table [dbo].[SolPDFPasswordSetting_FieldName]    Script Date: 2/14/2022 5:57:09 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SolPDFPasswordSetting_FieldName]') AND type in (N'U'))
DROP TABLE [dbo].[SolPDFPasswordSetting_FieldName]
GO

/****** Object:  Table [dbo].[SolPDFPasswordSetting_FieldName]    Script Date: 2/14/2022 5:57:10 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  Table [dbo].[SQLDUMakerDP_AttorneyCentre]    Script Date: 2/14/2022 5:57:09 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SQLDUMakerDP_AttorneyCentre]') AND type in (N'U'))
DROP TABLE [dbo].[SQLDUMakerDP_AttorneyCentre]
GO

/****** Object:  Table [dbo].[SQLDUMakerDP_AttorneyCentre]    Script Date: 2/14/2022 5:57:10 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  Table [dbo].[SQLDUMakerDP_AttorneyName]    Script Date: 2/14/2022 5:57:09 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SQLDUMakerDP_AttorneyName]') AND type in (N'U'))
DROP TABLE [dbo].[SQLDUMakerDP_AttorneyName]
GO

/****** Object:  Table [dbo].[SQLDUMakerDP_AttorneyName]    Script Date: 2/14/2022 5:57:10 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  Table [dbo].[SQLDUMakerDP_SolicitorSubmission]    Script Date: 2/14/2022 5:57:09 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SQLDUMakerDP_SolicitorSubmission]') AND type in (N'U'))
DROP TABLE [dbo].[SQLDUMakerDP_SolicitorSubmission]
GO

/****** Object:  Table [dbo].[SQLDUMakerDP_SolicitorSubmission]    Script Date: 2/14/2022 5:57:10 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  Table [dbo].[SQLDUMakerDP_SolicitorSubmissionRemark]    Script Date: 2/14/2022 5:57:09 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SQLDUMakerDP_SolicitorSubmissionRemark]') AND type in (N'U'))
DROP TABLE [dbo].[SQLDUMakerDP_SolicitorSubmissionRemark]
GO

/****** Object:  Table [dbo].[SQLDUMakerDP_SolicitorSubmissionRemark]    Script Date: 2/14/2022 5:57:10 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  Table [dbo].[SQLDUMakerDP_SolicitorSubmission_ExeDocs_Rejected]    Script Date: 2/14/2022 5:57:09 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SQLDUMakerDP_SolicitorSubmission_ExeDocs_Rejected]') AND type in (N'U'))
DROP TABLE [dbo].[SQLDUMakerDP_SolicitorSubmission_ExeDocs_Rejected]
GO

/****** Object:  Table [dbo].[SQLDUMakerDP_SolicitorSubmission_ExeDocs_Rejected]    Script Date: 2/14/2022 5:57:10 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  Table [dbo].[SQLDUMakerDP_SolicitorSubmission_Rejected]    Script Date: 2/14/2022 5:57:09 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SQLDUMakerDP_SolicitorSubmission_Rejected]') AND type in (N'U'))
DROP TABLE [dbo].[SQLDUMakerDP_SolicitorSubmission_Rejected]
GO

/****** Object:  Table [dbo].[SQLDUMakerDP_SolicitorSubmission_Rejected]    Script Date: 2/14/2022 5:57:10 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  Table [dbo].[SQLDUMakerDP_ValuerSubmission]    Script Date: 2/14/2022 5:57:09 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SQLDUMakerDP_ValuerSubmission]') AND type in (N'U'))
DROP TABLE [dbo].[SQLDUMakerDP_ValuerSubmission]
GO

/****** Object:  Table [dbo].[SQLDUMakerDP_ValuerSubmission]    Script Date: 2/14/2022 5:57:10 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  Table [dbo].[SQLDUMakerDP_ValuerSubmission_LoweredOMV]    Script Date: 2/14/2022 5:57:09 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SQLDUMakerDP_ValuerSubmission_LoweredOMV]') AND type in (N'U'))
DROP TABLE [dbo].[SQLDUMakerDP_ValuerSubmission_LoweredOMV]
GO

/****** Object:  Table [dbo].[SQLDUMakerDP_ValuerSubmission_LoweredOMV]    Script Date: 2/14/2022 5:57:10 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  Table [dbo].[SQLJOB_AV_ProjectDisbursement_email_content]    Script Date: 2/14/2022 5:57:09 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SQLJOB_AV_ProjectDisbursement_email_content]') AND type in (N'U'))
DROP TABLE [dbo].[SQLJOB_AV_ProjectDisbursement_email_content]
GO

/****** Object:  Table [dbo].[SQLJOB_AV_ProjectDisbursement_email_content]    Script Date: 2/14/2022 5:57:10 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  Table [dbo].[SQLJOB_DUMaker_Letter_A1_generate_list_aging]    Script Date: 2/14/2022 5:57:09 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SQLJOB_DUMaker_Letter_A1_generate_list_aging]') AND type in (N'U'))
DROP TABLE [dbo].[SQLJOB_DUMaker_Letter_A1_generate_list_aging]
GO

/****** Object:  Table [dbo].[SQLJOB_DUMaker_Letter_A1_generate_list_aging]    Script Date: 2/14/2022 5:57:10 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  Table [dbo].[SQLJOB_DUMaker_Letter_A1_generate_list_aging_staging]    Script Date: 2/14/2022 5:57:09 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SQLJOB_DUMaker_Letter_A1_generate_list_aging_staging]') AND type in (N'U'))
DROP TABLE [dbo].[SQLJOB_DUMaker_Letter_A1_generate_list_aging_staging]
GO

/****** Object:  Table [dbo].[SQLJOB_DUMaker_Letter_A1_generate_list_aging_staging]    Script Date: 2/14/2022 5:57:10 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  Table [dbo].[SQLJOB_DUMaker_Letter_A1_generate_list_aging_staging2]    Script Date: 2/14/2022 5:57:09 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SQLJOB_DUMaker_Letter_A1_generate_list_aging_staging2]') AND type in (N'U'))
DROP TABLE [dbo].[SQLJOB_DUMaker_Letter_A1_generate_list_aging_staging2]
GO

/****** Object:  Table [dbo].[SQLJOB_DUMaker_Letter_A1_generate_list_aging_staging2]    Script Date: 2/14/2022 5:57:10 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  Table [dbo].[SQLJOB_DUMaker_Letter_A2_generate_list_aging]    Script Date: 2/14/2022 5:57:09 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SQLJOB_DUMaker_Letter_A2_generate_list_aging]') AND type in (N'U'))
DROP TABLE [dbo].[SQLJOB_DUMaker_Letter_A2_generate_list_aging]
GO

/****** Object:  Table [dbo].[SQLJOB_DUMaker_Letter_A2_generate_list_aging]    Script Date: 2/14/2022 5:57:10 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  Table [dbo].[SQLJOB_DUMaker_Letter_A2_generate_list_aging_staging]    Script Date: 2/14/2022 5:57:09 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SQLJOB_DUMaker_Letter_A2_generate_list_aging_staging]') AND type in (N'U'))
DROP TABLE [dbo].[SQLJOB_DUMaker_Letter_A2_generate_list_aging_staging]
GO

/****** Object:  Table [dbo].[SQLJOB_DUMaker_Letter_A2_generate_list_aging_staging]    Script Date: 2/14/2022 5:57:10 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  Table [dbo].[SQLJOB_DUMaker_Letter_A2_generate_list_aging_staging2]    Script Date: 2/14/2022 5:57:09 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SQLJOB_DUMaker_Letter_A2_generate_list_aging_staging2]') AND type in (N'U'))
DROP TABLE [dbo].[SQLJOB_DUMaker_Letter_A2_generate_list_aging_staging2]
GO

/****** Object:  Table [dbo].[SQLJOB_DUMaker_Letter_A2_generate_list_aging_staging2]    Script Date: 2/14/2022 5:57:10 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  Table [dbo].[SQLJOB_DUMaker_Letter_A3_generate_list_aging]    Script Date: 2/14/2022 5:57:09 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SQLJOB_DUMaker_Letter_A3_generate_list_aging]') AND type in (N'U'))
DROP TABLE [dbo].[SQLJOB_DUMaker_Letter_A3_generate_list_aging]
GO

/****** Object:  Table [dbo].[SQLJOB_DUMaker_Letter_A3_generate_list_aging]    Script Date: 2/14/2022 5:57:10 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  Table [dbo].[SQLJOB_DUMaker_Letter_A3_generate_list_aging_staging]    Script Date: 2/14/2022 5:57:09 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SQLJOB_DUMaker_Letter_A3_generate_list_aging_staging]') AND type in (N'U'))
DROP TABLE [dbo].[SQLJOB_DUMaker_Letter_A3_generate_list_aging_staging]
GO

/****** Object:  Table [dbo].[SQLJOB_DUMaker_Letter_A3_generate_list_aging_staging]    Script Date: 2/14/2022 5:57:10 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  Table [dbo].[SQLJOB_DUMaker_Letter_A3_generate_list_aging_staging2]    Script Date: 2/14/2022 5:57:09 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SQLJOB_DUMaker_Letter_A3_generate_list_aging_staging2]') AND type in (N'U'))
DROP TABLE [dbo].[SQLJOB_DUMaker_Letter_A3_generate_list_aging_staging2]
GO

/****** Object:  Table [dbo].[SQLJOB_DUMaker_Letter_A3_generate_list_aging_staging2]    Script Date: 2/14/2022 5:57:10 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  Table [dbo].[SQLJOB_DUMaker_Letter_A8_generate_list_aging]    Script Date: 2/14/2022 5:57:09 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SQLJOB_DUMaker_Letter_A8_generate_list_aging]') AND type in (N'U'))
DROP TABLE [dbo].[SQLJOB_DUMaker_Letter_A8_generate_list_aging]
GO

/****** Object:  Table [dbo].[SQLJOB_DUMaker_Letter_A8_generate_list_aging]    Script Date: 2/14/2022 5:57:10 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  Table [dbo].[SQLJOB_DUMaker_Letter_A8_generate_list_aging_staging]    Script Date: 2/14/2022 5:57:09 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SQLJOB_DUMaker_Letter_A8_generate_list_aging_staging]') AND type in (N'U'))
DROP TABLE [dbo].[SQLJOB_DUMaker_Letter_A8_generate_list_aging_staging]
GO

/****** Object:  Table [dbo].[SQLJOB_DUMaker_Letter_A8_generate_list_aging_staging]    Script Date: 2/14/2022 5:57:10 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  Table [dbo].[SQLJOB_DUMaker_Letter_A8_generate_list_aging_staging2]    Script Date: 2/14/2022 5:57:09 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SQLJOB_DUMaker_Letter_A8_generate_list_aging_staging2]') AND type in (N'U'))
DROP TABLE [dbo].[SQLJOB_DUMaker_Letter_A8_generate_list_aging_staging2]
GO

/****** Object:  Table [dbo].[SQLJOB_DUMaker_Letter_A8_generate_list_aging_staging2]    Script Date: 2/14/2022 5:57:10 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  Table [dbo].[SQLJOB_DUMaker_Letter_A9_generate_list_aging]    Script Date: 2/14/2022 5:57:09 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SQLJOB_DUMaker_Letter_A9_generate_list_aging]') AND type in (N'U'))
DROP TABLE [dbo].[SQLJOB_DUMaker_Letter_A9_generate_list_aging]
GO

/****** Object:  Table [dbo].[SQLJOB_DUMaker_Letter_A9_generate_list_aging]    Script Date: 2/14/2022 5:57:10 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  Table [dbo].[SQLJOB_DUMaker_Letter_A9_generate_list_aging_staging]    Script Date: 2/14/2022 5:57:09 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SQLJOB_DUMaker_Letter_A9_generate_list_aging_staging]') AND type in (N'U'))
DROP TABLE [dbo].[SQLJOB_DUMaker_Letter_A9_generate_list_aging_staging]
GO

/****** Object:  Table [dbo].[SQLJOB_DUMaker_Letter_A9_generate_list_aging_staging]    Script Date: 2/14/2022 5:57:10 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  Table [dbo].[SQLJOB_DUMaker_Letter_A9_generate_list_aging_staging2]    Script Date: 2/14/2022 5:57:08 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SQLJOB_DUMaker_Letter_A9_generate_list_aging_staging2]') AND type in (N'U'))
DROP TABLE [dbo].[SQLJOB_DUMaker_Letter_A9_generate_list_aging_staging2]
GO

/****** Object:  Table [dbo].[SQLJOB_DUMaker_Letter_A9_generate_list_aging_staging2]    Script Date: 2/14/2022 5:57:10 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  Table [dbo].[SQLJOB_DUMaker_Letter_AV_generate_list_aging_staging]    Script Date: 2/14/2022 5:57:08 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SQLJOB_DUMaker_Letter_AV_generate_list_aging_staging]') AND type in (N'U'))
DROP TABLE [dbo].[SQLJOB_DUMaker_Letter_AV_generate_list_aging_staging]
GO

/****** Object:  Table [dbo].[SQLJOB_DUMaker_Letter_AV_generate_list_aging_staging]    Script Date: 2/14/2022 5:57:10 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  Table [dbo].[SQLJOB_DUMaker_Letter_AV_generate_list_aging_staging2]    Script Date: 2/14/2022 5:57:08 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SQLJOB_DUMaker_Letter_AV_generate_list_aging_staging2]') AND type in (N'U'))
DROP TABLE [dbo].[SQLJOB_DUMaker_Letter_AV_generate_list_aging_staging2]
GO

/****** Object:  Table [dbo].[SQLJOB_DUMaker_Letter_AV_generate_list_aging_staging2]    Script Date: 2/14/2022 5:57:10 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  Table [dbo].[SQLJOB_DUMaker_Letter_AV_SolicitorDisbursement_email_content]    Script Date: 2/14/2022 5:57:08 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SQLJOB_DUMaker_Letter_AV_SolicitorDisbursement_email_content]') AND type in (N'U'))
DROP TABLE [dbo].[SQLJOB_DUMaker_Letter_AV_SolicitorDisbursement_email_content]
GO

/****** Object:  Table [dbo].[SQLJOB_DUMaker_Letter_AV_SolicitorDisbursement_email_content]    Script Date: 2/14/2022 5:57:10 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  Table [dbo].[SQLJOB_DUMaker_Letter_AV_Solicitor_email_content]    Script Date: 2/14/2022 5:57:08 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SQLJOB_DUMaker_Letter_AV_Solicitor_email_content]') AND type in (N'U'))
DROP TABLE [dbo].[SQLJOB_DUMaker_Letter_AV_Solicitor_email_content]
GO

/****** Object:  Table [dbo].[SQLJOB_DUMaker_Letter_AV_Solicitor_email_content]    Script Date: 2/14/2022 5:57:10 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  Table [dbo].[SQLJOB_DUMaker_Letter_AV_Valuer_email_content]    Script Date: 2/14/2022 5:57:08 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SQLJOB_DUMaker_Letter_AV_Valuer_email_content]') AND type in (N'U'))
DROP TABLE [dbo].[SQLJOB_DUMaker_Letter_AV_Valuer_email_content]
GO

/****** Object:  Table [dbo].[SQLJOB_DUMaker_Letter_AV_Valuer_email_content]    Script Date: 2/14/2022 5:57:10 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  Table [dbo].[SQLJOB_DUMaker_Letter_AV_Valuer_generate_list_aging_staging]    Script Date: 2/14/2022 5:57:08 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SQLJOB_DUMaker_Letter_AV_Valuer_generate_list_aging_staging]') AND type in (N'U'))
DROP TABLE [dbo].[SQLJOB_DUMaker_Letter_AV_Valuer_generate_list_aging_staging]
GO

/****** Object:  Table [dbo].[SQLJOB_DUMaker_Letter_AV_Valuer_generate_list_aging_staging]    Script Date: 2/14/2022 5:57:10 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  Table [dbo].[SQLJOB_DUMaker_Letter_AV_Valuer_generate_list_aging_staging2]    Script Date: 2/14/2022 5:57:08 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SQLJOB_DUMaker_Letter_AV_Valuer_generate_list_aging_staging2]') AND type in (N'U'))
DROP TABLE [dbo].[SQLJOB_DUMaker_Letter_AV_Valuer_generate_list_aging_staging2]
GO

/****** Object:  Table [dbo].[SQLJOB_DUMaker_Letter_AV_Valuer_generate_list_aging_staging2]    Script Date: 2/14/2022 5:57:10 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  Table [dbo].[SQLJOB_DUMaker_Letter_B1_generate_list_aging]    Script Date: 2/14/2022 5:57:08 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SQLJOB_DUMaker_Letter_B1_generate_list_aging]') AND type in (N'U'))
DROP TABLE [dbo].[SQLJOB_DUMaker_Letter_B1_generate_list_aging]
GO

/****** Object:  Table [dbo].[SQLJOB_DUMaker_Letter_B1_generate_list_aging]    Script Date: 2/14/2022 5:57:10 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  Table [dbo].[SQLJOB_DUMaker_Letter_B1_generate_list_aging_staging]    Script Date: 2/14/2022 5:57:08 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SQLJOB_DUMaker_Letter_B1_generate_list_aging_staging]') AND type in (N'U'))
DROP TABLE [dbo].[SQLJOB_DUMaker_Letter_B1_generate_list_aging_staging]
GO

/****** Object:  Table [dbo].[SQLJOB_DUMaker_Letter_B1_generate_list_aging_staging]    Script Date: 2/14/2022 5:57:10 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  Table [dbo].[SQLJOB_DUMaker_Letter_B1_generate_list_aging_staging2]    Script Date: 2/14/2022 5:57:08 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SQLJOB_DUMaker_Letter_B1_generate_list_aging_staging2]') AND type in (N'U'))
DROP TABLE [dbo].[SQLJOB_DUMaker_Letter_B1_generate_list_aging_staging2]
GO

/****** Object:  Table [dbo].[SQLJOB_DUMaker_Letter_B1_generate_list_aging_staging2]    Script Date: 2/14/2022 5:57:10 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  Table [dbo].[SQLJOB_DUMaker_Letter_B2_generate_list_aging]    Script Date: 2/14/2022 5:57:08 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SQLJOB_DUMaker_Letter_B2_generate_list_aging]') AND type in (N'U'))
DROP TABLE [dbo].[SQLJOB_DUMaker_Letter_B2_generate_list_aging]
GO

/****** Object:  Table [dbo].[SQLJOB_DUMaker_Letter_B2_generate_list_aging]    Script Date: 2/14/2022 5:57:10 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  Table [dbo].[SQLJOB_DUMaker_Letter_B2_generate_list_aging_staging]    Script Date: 2/14/2022 5:57:08 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SQLJOB_DUMaker_Letter_B2_generate_list_aging_staging]') AND type in (N'U'))
DROP TABLE [dbo].[SQLJOB_DUMaker_Letter_B2_generate_list_aging_staging]
GO

/****** Object:  Table [dbo].[SQLJOB_DUMaker_Letter_B2_generate_list_aging_staging]    Script Date: 2/14/2022 5:57:10 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  Table [dbo].[SQLJOB_DUMaker_Letter_B2_generate_list_aging_staging2]    Script Date: 2/14/2022 5:57:08 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SQLJOB_DUMaker_Letter_B2_generate_list_aging_staging2]') AND type in (N'U'))
DROP TABLE [dbo].[SQLJOB_DUMaker_Letter_B2_generate_list_aging_staging2]
GO

/****** Object:  Table [dbo].[SQLJOB_DUMaker_Letter_B2_generate_list_aging_staging2]    Script Date: 2/14/2022 5:57:10 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  Table [dbo].[SQLLOADS]    Script Date: 2/14/2022 5:57:08 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SQLLOADS]') AND type in (N'U'))
DROP TABLE [dbo].[SQLLOADS]
GO

/****** Object:  Table [dbo].[SQLLOADS]    Script Date: 2/14/2022 5:57:10 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  Table [dbo].[SQLLOADS_staging]    Script Date: 2/14/2022 5:57:08 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SQLLOADS_staging]') AND type in (N'U'))
DROP TABLE [dbo].[SQLLOADS_staging]
GO

/****** Object:  Table [dbo].[SQLLOADS_staging]    Script Date: 2/14/2022 5:57:10 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  Table [dbo].[SQLLOADS_staging2]    Script Date: 2/14/2022 5:57:08 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SQLLOADS_staging2]') AND type in (N'U'))
DROP TABLE [dbo].[SQLLOADS_staging2]
GO

/****** Object:  Table [dbo].[SQLLOADS_staging2]    Script Date: 2/14/2022 5:57:10 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  Table [dbo].[SQLSolicitor]    Script Date: 2/14/2022 5:57:08 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SQLSolicitor]') AND type in (N'U'))
DROP TABLE [dbo].[SQLSolicitor]
GO

/****** Object:  Table [dbo].[SQLSolicitor]    Script Date: 2/14/2022 5:57:11 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  Table [dbo].[SQLSolicitorDPSubmission]    Script Date: 2/14/2022 5:57:08 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SQLSolicitorDPSubmission]') AND type in (N'U'))
DROP TABLE [dbo].[SQLSolicitorDPSubmission]
GO

/****** Object:  Table [dbo].[SQLSolicitorDPSubmission]    Script Date: 2/14/2022 5:57:11 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  Table [dbo].[SQLSolicitorDPSubmissionAttachment2]    Script Date: 2/14/2022 5:57:08 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SQLSolicitorDPSubmissionAttachment2]') AND type in (N'U'))
DROP TABLE [dbo].[SQLSolicitorDPSubmissionAttachment2]
GO

/****** Object:  Table [dbo].[SQLSolicitorDPSubmissionAttachment2]    Script Date: 2/14/2022 5:57:11 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  Table [dbo].[SQLSolicitorDPSubmissionAttachment2_Staging]    Script Date: 2/14/2022 5:57:08 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SQLSolicitorDPSubmissionAttachment2_Staging]') AND type in (N'U'))
DROP TABLE [dbo].[SQLSolicitorDPSubmissionAttachment2_Staging]
GO

/****** Object:  Table [dbo].[SQLSolicitorDPSubmissionAttachment2_Staging]    Script Date: 2/14/2022 5:57:11 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  Table [dbo].[SQLSolicitorDPSubmissionExeDocs]    Script Date: 2/14/2022 5:57:08 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SQLSolicitorDPSubmissionExeDocs]') AND type in (N'U'))
DROP TABLE [dbo].[SQLSolicitorDPSubmissionExeDocs]
GO

/****** Object:  Table [dbo].[SQLSolicitorDPSubmissionExeDocs]    Script Date: 2/14/2022 5:57:11 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  Table [dbo].[SQLSolicitorDPSubmissionExeDocs_Staging]    Script Date: 2/14/2022 5:57:08 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SQLSolicitorDPSubmissionExeDocs_Staging]') AND type in (N'U'))
DROP TABLE [dbo].[SQLSolicitorDPSubmissionExeDocs_Staging]
GO

/****** Object:  Table [dbo].[SQLSolicitorDPSubmissionExeDocs_Staging]    Script Date: 2/14/2022 5:57:11 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  Table [dbo].[SQLSolicitorDPSubmissionRemark]    Script Date: 2/14/2022 5:57:08 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SQLSolicitorDPSubmissionRemark]') AND type in (N'U'))
DROP TABLE [dbo].[SQLSolicitorDPSubmissionRemark]
GO

/****** Object:  Table [dbo].[SQLSolicitorDPSubmissionRemark]    Script Date: 2/14/2022 5:57:11 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  Table [dbo].[SQLSolicitorDPSubmissionRemark_Staging]    Script Date: 2/14/2022 5:57:08 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SQLSolicitorDPSubmissionRemark_Staging]') AND type in (N'U'))
DROP TABLE [dbo].[SQLSolicitorDPSubmissionRemark_Staging]
GO

/****** Object:  Table [dbo].[SQLSolicitorDPSubmissionRemark_Staging]    Script Date: 2/14/2022 5:57:11 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  Table [dbo].[SQLSolicitorDPSubmission_Staging]    Script Date: 2/14/2022 5:57:08 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SQLSolicitorDPSubmission_Staging]') AND type in (N'U'))
DROP TABLE [dbo].[SQLSolicitorDPSubmission_Staging]
GO

/****** Object:  Table [dbo].[SQLSolicitorDPSubmission_Staging]    Script Date: 2/14/2022 5:57:11 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  Table [dbo].[SQLSolicitorDPSubmission_UpdateInfo]    Script Date: 2/14/2022 5:57:08 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SQLSolicitorDPSubmission_UpdateInfo]') AND type in (N'U'))
DROP TABLE [dbo].[SQLSolicitorDPSubmission_UpdateInfo]
GO

/****** Object:  Table [dbo].[SQLSolicitorDPSubmission_UpdateInfo]    Script Date: 2/14/2022 5:57:11 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  Table [dbo].[SQLSolicitor_DocumentAdminFeeCreditedToOption]    Script Date: 2/14/2022 5:57:08 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SQLSolicitor_DocumentAdminFeeCreditedToOption]') AND type in (N'U'))
DROP TABLE [dbo].[SQLSolicitor_DocumentAdminFeeCreditedToOption]
GO

/****** Object:  Table [dbo].[SQLSolicitor_DocumentAdminFeeCreditedToOption]    Script Date: 2/14/2022 5:57:11 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  Table [dbo].[SQLValuer]    Script Date: 2/14/2022 5:57:08 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SQLValuer]') AND type in (N'U'))
DROP TABLE [dbo].[SQLValuer]
GO

/****** Object:  Table [dbo].[SQLValuer]    Script Date: 2/14/2022 5:57:11 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  Table [dbo].[SQLValuerDPSubmission]    Script Date: 2/14/2022 5:57:08 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SQLValuerDPSubmission]') AND type in (N'U'))
DROP TABLE [dbo].[SQLValuerDPSubmission]
GO

/****** Object:  Table [dbo].[SQLValuerDPSubmission]    Script Date: 2/14/2022 5:57:11 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  Table [dbo].[SQLValuerDPSubmissionRemark]    Script Date: 2/14/2022 5:57:08 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SQLValuerDPSubmissionRemark]') AND type in (N'U'))
DROP TABLE [dbo].[SQLValuerDPSubmissionRemark]
GO

/****** Object:  Table [dbo].[SQLValuerDPSubmissionRemark]    Script Date: 2/14/2022 5:57:11 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  Table [dbo].[SQLValuerDPSubmissionRemark_Staging]    Script Date: 2/14/2022 5:57:08 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SQLValuerDPSubmissionRemark_Staging]') AND type in (N'U'))
DROP TABLE [dbo].[SQLValuerDPSubmissionRemark_Staging]
GO

/****** Object:  Table [dbo].[SQLValuerDPSubmissionRemark_Staging]    Script Date: 2/14/2022 5:57:11 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  Table [dbo].[SQLValuerDPSubmission_Staging]    Script Date: 2/14/2022 5:57:08 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SQLValuerDPSubmission_Staging]') AND type in (N'U'))
DROP TABLE [dbo].[SQLValuerDPSubmission_Staging]
GO

/****** Object:  Table [dbo].[SQLValuerDPSubmission_Staging]    Script Date: 2/14/2022 5:57:11 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  Table [dbo].[SQLValuerDPSubmission_UpdateInfo]    Script Date: 2/14/2022 5:57:08 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SQLValuerDPSubmission_UpdateInfo]') AND type in (N'U'))
DROP TABLE [dbo].[SQLValuerDPSubmission_UpdateInfo]
GO

/****** Object:  Table [dbo].[SQLValuerDPSubmission_UpdateInfo]    Script Date: 2/14/2022 5:57:11 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  Table [dbo].[SQLValuerDPSubmission_ValuationFee]    Script Date: 2/14/2022 5:57:08 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SQLValuerDPSubmission_ValuationFee]') AND type in (N'U'))
DROP TABLE [dbo].[SQLValuerDPSubmission_ValuationFee]
GO

/****** Object:  Table [dbo].[SQLValuerDPSubmission_ValuationFee]    Script Date: 2/14/2022 5:57:11 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  Table [dbo].[tbd2_ddProjectDisbursementSubmission_DisMakerRejected]    Script Date: 2/14/2022 5:57:08 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbd2_ddProjectDisbursementSubmission_DisMakerRejected]') AND type in (N'U'))
DROP TABLE [dbo].[tbd2_ddProjectDisbursementSubmission_DisMakerRejected]
GO

/****** Object:  Table [dbo].[tbd2_ddProjectDisbursementSubmission_DisMakerRejected]    Script Date: 2/14/2022 5:57:11 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  Table [dbo].[TBD_aaDeveloperExt]    Script Date: 2/14/2022 5:57:08 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TBD_aaDeveloperExt]') AND type in (N'U'))
DROP TABLE [dbo].[TBD_aaDeveloperExt]
GO

/****** Object:  Table [dbo].[TBD_aaDeveloperExt]    Script Date: 2/14/2022 5:57:11 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  Table [dbo].[TBD_aaIntDisbursementSubmission_DisMakerSubmissionPaymentDetail_Draft]    Script Date: 2/14/2022 5:57:08 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TBD_aaIntDisbursementSubmission_DisMakerSubmissionPaymentDetail_Draft]') AND type in (N'U'))
DROP TABLE [dbo].[TBD_aaIntDisbursementSubmission_DisMakerSubmissionPaymentDetail_Draft]
GO

/****** Object:  Table [dbo].[TBD_aaIntDisbursementSubmission_DisMakerSubmissionPaymentDetail_Draft]    Script Date: 2/14/2022 5:57:11 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  Table [dbo].[TBD_aaNotificationOfPayment]    Script Date: 2/14/2022 5:57:08 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TBD_aaNotificationOfPayment]') AND type in (N'U'))
DROP TABLE [dbo].[TBD_aaNotificationOfPayment]
GO

/****** Object:  Table [dbo].[TBD_aaNotificationOfPayment]    Script Date: 2/14/2022 5:57:11 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  Table [dbo].[TBD_aaNotificationOfPayment_bk]    Script Date: 2/14/2022 5:57:08 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TBD_aaNotificationOfPayment_bk]') AND type in (N'U'))
DROP TABLE [dbo].[TBD_aaNotificationOfPayment_bk]
GO

/****** Object:  Table [dbo].[TBD_aaNotificationOfPayment_bk]    Script Date: 2/14/2022 5:57:11 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  Table [dbo].[TBD_aaSolDisbursementSubmission_DisMakerSubmission]    Script Date: 2/14/2022 5:57:08 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TBD_aaSolDisbursementSubmission_DisMakerSubmission]') AND type in (N'U'))
DROP TABLE [dbo].[TBD_aaSolDisbursementSubmission_DisMakerSubmission]
GO

/****** Object:  Table [dbo].[TBD_aaSolDisbursementSubmission_DisMakerSubmission]    Script Date: 2/14/2022 5:57:11 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  Table [dbo].[TBD_aaSolDisbursementSubmission__DisMakerSubmission_History]    Script Date: 2/14/2022 5:57:08 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TBD_aaSolDisbursementSubmission__DisMakerSubmission_History]') AND type in (N'U'))
DROP TABLE [dbo].[TBD_aaSolDisbursementSubmission__DisMakerSubmission_History]
GO

/****** Object:  Table [dbo].[TBD_aaSolDisbursementSubmission__DisMakerSubmission_History]    Script Date: 2/14/2022 5:57:11 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  Table [dbo].[TBD_aaSolicitorDisbursementSubmissionAttachment]    Script Date: 2/14/2022 5:57:08 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TBD_aaSolicitorDisbursementSubmissionAttachment]') AND type in (N'U'))
DROP TABLE [dbo].[TBD_aaSolicitorDisbursementSubmissionAttachment]
GO

/****** Object:  Table [dbo].[TBD_aaSolicitorDisbursementSubmissionAttachment]    Script Date: 2/14/2022 5:57:11 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  Table [dbo].[TBD_aaSolicitorDisbursementSubmissionAttachment_Staging]    Script Date: 2/14/2022 5:57:08 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TBD_aaSolicitorDisbursementSubmissionAttachment_Staging]') AND type in (N'U'))
DROP TABLE [dbo].[TBD_aaSolicitorDisbursementSubmissionAttachment_Staging]
GO

/****** Object:  Table [dbo].[TBD_aaSolicitorDisbursementSubmissionAttachment_Staging]    Script Date: 2/14/2022 5:57:11 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  Table [dbo].[TBD_aaSolicitorExt]    Script Date: 2/14/2022 5:57:08 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TBD_aaSolicitorExt]') AND type in (N'U'))
DROP TABLE [dbo].[TBD_aaSolicitorExt]
GO

/****** Object:  Table [dbo].[TBD_aaSolicitorExt]    Script Date: 2/14/2022 5:57:11 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  Table [dbo].[tbd_ddProjectDisbursementSubmission]    Script Date: 2/14/2022 5:57:08 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbd_ddProjectDisbursementSubmission]') AND type in (N'U'))
DROP TABLE [dbo].[tbd_ddProjectDisbursementSubmission]
GO

/****** Object:  Table [dbo].[tbd_ddProjectDisbursementSubmission]    Script Date: 2/14/2022 5:57:11 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  Table [dbo].[TBD_ddProjectDisbursementSubmission_DisMakerHistory]    Script Date: 2/14/2022 5:57:08 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TBD_ddProjectDisbursementSubmission_DisMakerHistory]') AND type in (N'U'))
DROP TABLE [dbo].[TBD_ddProjectDisbursementSubmission_DisMakerHistory]
GO

/****** Object:  Table [dbo].[TBD_ddProjectDisbursementSubmission_DisMakerHistory]    Script Date: 2/14/2022 5:57:11 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  Table [dbo].[tbd_ddProjectDisbursementSubmission_DisMakerRejected]    Script Date: 2/14/2022 5:57:08 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbd_ddProjectDisbursementSubmission_DisMakerRejected]') AND type in (N'U'))
DROP TABLE [dbo].[tbd_ddProjectDisbursementSubmission_DisMakerRejected]
GO

/****** Object:  Table [dbo].[tbd_ddProjectDisbursementSubmission_DisMakerRejected]    Script Date: 2/14/2022 5:57:11 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  Table [dbo].[tbd_ddProjectDisbursementSubmission_NotificationOfPayment_Setting]    Script Date: 2/14/2022 5:57:08 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbd_ddProjectDisbursementSubmission_NotificationOfPayment_Setting]') AND type in (N'U'))
DROP TABLE [dbo].[tbd_ddProjectDisbursementSubmission_NotificationOfPayment_Setting]
GO

/****** Object:  Table [dbo].[tbd_ddProjectDisbursementSubmission_NotificationOfPayment_Setting]    Script Date: 2/14/2022 5:57:11 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  Table [dbo].[tbd_ddProjectDisbursementSubmission_staging]    Script Date: 2/14/2022 5:57:08 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbd_ddProjectDisbursementSubmission_staging]') AND type in (N'U'))
DROP TABLE [dbo].[tbd_ddProjectDisbursementSubmission_staging]
GO

/****** Object:  Table [dbo].[tbd_ddProjectDisbursementSubmission_staging]    Script Date: 2/14/2022 5:57:11 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  Table [dbo].[tbd_ddProjectDisbursementSubmission_SubmissionHistory]    Script Date: 2/14/2022 5:57:08 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbd_ddProjectDisbursementSubmission_SubmissionHistory]') AND type in (N'U'))
DROP TABLE [dbo].[tbd_ddProjectDisbursementSubmission_SubmissionHistory]
GO

/****** Object:  Table [dbo].[tbd_ddProjectDisbursementSubmission_SubmissionHistory]    Script Date: 2/14/2022 5:57:11 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  Table [dbo].[tbd_ddProject_DisMakerSubmissionPaymentDetail_history]    Script Date: 2/14/2022 5:57:08 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbd_ddProject_DisMakerSubmissionPaymentDetail_history]') AND type in (N'U'))
DROP TABLE [dbo].[tbd_ddProject_DisMakerSubmissionPaymentDetail_history]
GO

/****** Object:  Table [dbo].[tbd_ddProject_DisMakerSubmissionPaymentDetail_history]    Script Date: 2/14/2022 5:57:11 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  Table [dbo].[tbd_emailtemplate]    Script Date: 2/14/2022 5:57:08 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbd_emailtemplate]') AND type in (N'U'))
DROP TABLE [dbo].[tbd_emailtemplate]
GO

/****** Object:  Table [dbo].[tbd_emailtemplate]    Script Date: 2/14/2022 5:57:11 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  Table [dbo].[tbd_ScriptSetting]    Script Date: 2/14/2022 5:57:08 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbd_ScriptSetting]') AND type in (N'U'))
DROP TABLE [dbo].[tbd_ScriptSetting]
GO

/****** Object:  Table [dbo].[tbd_ScriptSetting]    Script Date: 2/14/2022 5:57:11 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  Table [dbo].[TBD_ValuerUISession]    Script Date: 2/14/2022 5:57:08 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TBD_ValuerUISession]') AND type in (N'U'))
DROP TABLE [dbo].[TBD_ValuerUISession]
GO

/****** Object:  Table [dbo].[TBD_ValuerUISession]    Script Date: 2/14/2022 5:57:11 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  Table [dbo].[tblCDC]    Script Date: 2/14/2022 5:57:08 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tblCDC]') AND type in (N'U'))
DROP TABLE [dbo].[tblCDC]
GO

/****** Object:  Table [dbo].[tblCDC]    Script Date: 2/14/2022 5:57:11 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  Table [dbo].[tbl_ValueChanged]    Script Date: 2/14/2022 5:57:08 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_ValueChanged]') AND type in (N'U'))
DROP TABLE [dbo].[tbl_ValueChanged]
GO

/****** Object:  Table [dbo].[tbl_ValueChanged]    Script Date: 2/14/2022 5:57:11 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  Table [dbo].[TemporaryList]    Script Date: 2/14/2022 5:57:08 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TemporaryList]') AND type in (N'U'))
DROP TABLE [dbo].[TemporaryList]
GO

/****** Object:  Table [dbo].[TemporaryList]    Script Date: 2/14/2022 5:57:11 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  Table [dbo].[testconcat]    Script Date: 2/14/2022 5:57:08 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[testconcat]') AND type in (N'U'))
DROP TABLE [dbo].[testconcat]
GO

/****** Object:  Table [dbo].[testconcat]    Script Date: 2/14/2022 5:57:11 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  Table [dbo].[UAMReport]    Script Date: 2/14/2022 5:57:08 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UAMReport]') AND type in (N'U'))
DROP TABLE [dbo].[UAMReport]
GO

/****** Object:  Table [dbo].[UAMReport]    Script Date: 2/14/2022 5:57:11 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  Table [dbo].[URL_Setting]    Script Date: 2/14/2022 5:57:08 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[URL_Setting]') AND type in (N'U'))
DROP TABLE [dbo].[URL_Setting]
GO

/****** Object:  Table [dbo].[URL_Setting]    Script Date: 2/14/2022 5:57:11 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  Table [dbo].[UserRoleMetric]    Script Date: 2/14/2022 5:57:08 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UserRoleMetric]') AND type in (N'U'))
DROP TABLE [dbo].[UserRoleMetric]
GO

/****** Object:  Table [dbo].[UserRoleMetric]    Script Date: 2/14/2022 5:57:11 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  Table [dbo].[UserRoleMetric_staging]    Script Date: 2/14/2022 5:57:08 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UserRoleMetric_staging]') AND type in (N'U'))
DROP TABLE [dbo].[UserRoleMetric_staging]
GO

/****** Object:  Table [dbo].[UserRoleMetric_staging]    Script Date: 2/14/2022 5:57:11 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  Table [dbo].[ValuerLoginTrialSession]    Script Date: 2/14/2022 5:57:08 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ValuerLoginTrialSession]') AND type in (N'U'))
DROP TABLE [dbo].[ValuerLoginTrialSession]
GO

/****** Object:  Table [dbo].[ValuerLoginTrialSession]    Script Date: 2/14/2022 5:57:11 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  Table [dbo].[ValuerLoginTrialSession_FailedAttemptLog]    Script Date: 2/14/2022 5:57:08 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ValuerLoginTrialSession_FailedAttemptLog]') AND type in (N'U'))
DROP TABLE [dbo].[ValuerLoginTrialSession_FailedAttemptLog]
GO

/****** Object:  Table [dbo].[ValuerLoginTrialSession_FailedAttemptLog]    Script Date: 2/14/2022 5:57:11 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  Table [dbo].[ValuerLogoutLog]    Script Date: 2/14/2022 5:57:08 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ValuerLogoutLog]') AND type in (N'U'))
DROP TABLE [dbo].[ValuerLogoutLog]
GO

/****** Object:  Table [dbo].[ValuerLogoutLog]    Script Date: 2/14/2022 5:57:11 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  Table [dbo].[ValuerPasswordHistory]    Script Date: 2/14/2022 5:57:08 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ValuerPasswordHistory]') AND type in (N'U'))
DROP TABLE [dbo].[ValuerPasswordHistory]
GO

/****** Object:  Table [dbo].[ValuerPasswordHistory]    Script Date: 2/14/2022 5:57:11 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  Table [dbo].[ValuerSession]    Script Date: 2/14/2022 5:57:08 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ValuerSession]') AND type in (N'U'))
DROP TABLE [dbo].[ValuerSession]
GO

/****** Object:  Table [dbo].[ValuerSession]    Script Date: 2/14/2022 5:57:11 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  Table [dbo].[ValuerUserLoginLog]    Script Date: 2/14/2022 5:57:08 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ValuerUserLoginLog]') AND type in (N'U'))
DROP TABLE [dbo].[ValuerUserLoginLog]
GO

/****** Object:  Table [dbo].[ValuerUserLoginLog]    Script Date: 2/14/2022 5:57:11 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  Table [dbo].[VS_attachment_detail]    Script Date: 2/14/2022 5:57:08 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[VS_attachment_detail]') AND type in (N'U'))
DROP TABLE [dbo].[VS_attachment_detail]
GO

/****** Object:  Table [dbo].[VS_attachment_detail]    Script Date: 2/14/2022 5:57:11 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  Table [dbo].[vw_aaDisbursementPaymentHistory2]    Script Date: 2/14/2022 5:57:08 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[vw_aaDisbursementPaymentHistory2]') AND type in (N'U'))
DROP TABLE [dbo].[vw_aaDisbursementPaymentHistory2]
GO

/****** Object:  Table [dbo].[vw_aaDisbursementPaymentHistory2]    Script Date: 2/14/2022 5:57:11 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  Table [dbo].[WorkflowHistory]    Script Date: 2/14/2022 5:57:08 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[WorkflowHistory]') AND type in (N'U'))
DROP TABLE [dbo].[WorkflowHistory]
GO

/****** Object:  Table [dbo].[WorkflowHistory]    Script Date: 2/14/2022 5:57:11 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  Table [dbo].[WorkflowHistory_Billing]    Script Date: 2/14/2022 5:57:08 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[WorkflowHistory_Billing]') AND type in (N'U'))
DROP TABLE [dbo].[WorkflowHistory_Billing]
GO

/****** Object:  Table [dbo].[WorkflowHistory_Billing]    Script Date: 2/14/2022 5:57:11 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  Table [dbo].[WorkflowHistory_ProjectBilling]    Script Date: 2/14/2022 5:57:08 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[WorkflowHistory_ProjectBilling]') AND type in (N'U'))
DROP TABLE [dbo].[WorkflowHistory_ProjectBilling]
GO

/****** Object:  Table [dbo].[WorkflowHistory_ProjectBilling]    Script Date: 2/14/2022 5:57:11 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO
