enum MOCUrls {
  SignInMobile,
  GetAllMocFormsWaitingForMyApprovalMobile,
  ApproveMocForm,
  RejectMocForm,
  GetAllTechnicalOpinionsMobile,
  GetAllTechnicalAcceptancesMobile,
  GiveTechnicalOA,
  ContestMocForm,
  GetAllMocClosingApprovalsMobile,
  ApproveClosingMocFormMobile
}

extension MOCUrlsExtension on MOCUrls {
  String get rawValue {
    switch (this) {
      case MOCUrls.SignInMobile:
        return "/TokenAuth/SignInMobile";
      case MOCUrls.GetAllMocFormsWaitingForMyApprovalMobile:
        return "/services/app/MobilApi/GetAllMocFormsWaitingForMyApproval";
      case MOCUrls.ApproveMocForm:
        return "/services/app/MobilApi/ApproveMocForm";
      case MOCUrls.RejectMocForm:
        return "/services/app/MobilApi/RejectMocForm";
      case MOCUrls.GetAllTechnicalOpinionsMobile:
        return "/services/app/MobilApi/GetAllTechnicalOpinion";
      case MOCUrls.GetAllTechnicalAcceptancesMobile:
        return "/services/app/MobilApi/GetAllTechnicalAcceptance";
      case MOCUrls.GiveTechnicalOA:
        return "/services/app/MobilApi/UpdateTechicalOrAcceptance";
      case MOCUrls.ContestMocForm:
        return "/services/app/MobilApi/ReturnMocForm";
      case MOCUrls.GetAllMocClosingApprovalsMobile:
        return "/services/app/MobilApi/GetAllMocClosingApprovals";
      case MOCUrls.ApproveClosingMocFormMobile:
        return "/services/app/MobilApi/ApproveClosingMocForm";
    }
  }
}
