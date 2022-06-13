import '../../core/constants/network/network_constants.dart';

enum SafetyTourURLs {
  BaseURL,
  GetAllTours,
  GetAllUnplannedTours,
  GetAllPlannedTours,
  GetAllCategories,
  GetAllLocations,
  GetAllFields,
  GetUsers,
  CreateUnplannedTourMobile,
  UpdateTourMobile,
  GetTourByIdMobile,
  FinalizeTourCreation,
  DeleteTour,
  SignInMobile
}

extension SafetyTourURLsExtension on SafetyTourURLs {
  String get rawValue {
    switch (this) {
      case SafetyTourURLs.BaseURL:
        return NetworkConstants.BASE_URL_TEMPLATE;
      case SafetyTourURLs.GetAllTours:
        return "/Tours/GetAllToursMobile";
      case SafetyTourURLs.GetAllUnplannedTours:
        return "/Tours/GetAllUnplannedToursMobile";
      case SafetyTourURLs.GetAllPlannedTours:
        return "/Tours/GetAllPlannedToursMobile";
      case SafetyTourURLs.GetAllCategories:
        return "/Categories/GetAllCategoriesMobile";
      case SafetyTourURLs.GetAllLocations:
        return "/Locations/GetAllLocationsMobile";
      case SafetyTourURLs.GetAllFields:
        return "/Fields/GetAllFieldsMobile";
      case SafetyTourURLs.GetUsers:
        return "/User/GetUsersMobile";
      case SafetyTourURLs.CreateUnplannedTourMobile:
        return "/Tours/CreateUnplannedTourMobile";
      case SafetyTourURLs.UpdateTourMobile:
        return "/Tours/UpdateTourMobile";
      case SafetyTourURLs.GetTourByIdMobile:
        return "/Tours/GetTourByIdMobile";
      case SafetyTourURLs.FinalizeTourCreation:
        return "/Tours/FinalizeTourCreation";
      case SafetyTourURLs.DeleteTour:
        return "/Tours/DeleteTourMobile";
      case SafetyTourURLs.SignInMobile:
        return "/TokenAuth/SignInMobile";
    }
  }
}

enum SafetyTourDetailsURLs {
  CreateFindingForTour,
  RemoveFindingFromTour,
  GetFindingFiles,
  UploadFiles,
  RemoveFindingFile,
  GetFindingsOfTourMobile
}

extension SafetyTourDetailsURLsExtension on SafetyTourDetailsURLs {
  String get rawValue {
    switch (this) {
      case SafetyTourDetailsURLs.CreateFindingForTour:
        return "/Tours/CreateFindingForTourMobile";
      case SafetyTourDetailsURLs.GetFindingFiles:
        return "/Tours/GetFindingFilesMobile";
      case SafetyTourDetailsURLs.RemoveFindingFromTour:
        return "/Tours/RemoveFindingFromTourMobile";
      case SafetyTourDetailsURLs.UploadFiles:
        return "/Tours/UploadFilesMobile";
      case SafetyTourDetailsURLs.RemoveFindingFile:
        return "/Tours/RemoveFindingFileMobile";
      case SafetyTourDetailsURLs.GetFindingsOfTourMobile:
        return "/Tours/GetFindingsOfTourMobile";
    }
  }
}
