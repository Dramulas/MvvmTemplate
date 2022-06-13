enum ESDUrls {
  SignInMobile,
  GetAllByPassFormsWaitingForMyApprovalMobile,
  ApproveByPassForm
}

extension ESDUrlsExtension on ESDUrls {
  String get rawValue {
    switch (this) {
      case ESDUrls.SignInMobile:
        return "/TokenAuth/SignInMobile";
      case ESDUrls.GetAllByPassFormsWaitingForMyApprovalMobile:
        return "/services/app/ByPassForms/GetAllByPassFormsWaitingForMyApprovalMobile";
      case ESDUrls.ApproveByPassForm:
        return "/services/app/ByPassForms/ApproveFromMobile";
    }
  }
}
