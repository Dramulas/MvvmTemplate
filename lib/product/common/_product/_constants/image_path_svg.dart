import '../../../../core/extensions/string_extension.dart';

class SVGImagePaths {
  static SVGImagePaths? _instance;
  static SVGImagePaths? get instance {
    if (_instance == null) _instance = SVGImagePaths._init();
    return _instance;
  }

  SVGImagePaths._init();

  final contractSVG = "undraw_Contract_re_ves9".toSVG;
  final designProcessSVG = "undraw_Design_process_re_0dhf".toSVG;
  final realTimeSyncSVG = "undraw_Real_time_sync_re_nky7".toSVG;
  final templateLogoSVG = "templatelogo".toSVG;
  final noData = "undraw_No_data".toSVG;
  final noDataToConfirm = 'undraw_no_data_to_confirm'.toSVG;
  final errorGettingDataByPass = 'undraw_server_down'.toSVG;
}
