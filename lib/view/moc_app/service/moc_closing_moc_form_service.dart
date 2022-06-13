import 'dart:io';

import 'package:dio/dio.dart';

import '../../../../core/constants/enums/preferences_keys_enum.dart';
import '../../../../core/constants/network/network_constants.dart';
import '../../../../core/init/cache/locale_manager.dart';
import '../../../product/enum/moc_url_enum.dart';
import '../model/approve_closing_moc_form_model.dart';
import '../model/moc_closing_approvals_model.dart';

class ClosingMocFormService {
  static ClosingMocFormService? _instance;
  static ClosingMocFormService? get instance {
    if (_instance == null) _instance = ClosingMocFormService._init();
    return _instance;
  }

  ClosingMocFormService._init();

  final dio = Dio(BaseOptions(
    baseUrl: NetworkConstants.BASE_URL_TEMPLATE,
    headers: {"Content-Type": "application/json-patch+json"},
  ));

  Future<List<ClosingMocFormModel>?> getClosingMocFormItems() async {
    final response = await dio.get(
      MOCUrls.GetAllMocClosingApprovalsMobile.rawValue,
      options: Options(headers: {
        'Authorization':
            'Bearer ${LocaleManager.instance.getStringValue(PreferencesKeys.ACCESSTOKEN_MOC)}',
      }),
    );

    switch (response.statusCode) {
      case HttpStatus.ok:
        final responseBody = await response.data['result'];
        if (responseBody is List) {
          return responseBody
              .map((e) => ClosingMocFormModel.fromJson(e))
              .toList();
        }
    }
  }

  Future<Response<dynamic>> approveClosingMocForm(
      ApproveClosingMocFormModel model) async {
    final response = await dio.post(
      MOCUrls.ApproveClosingMocFormMobile.rawValue,
      options: Options(headers: {
        'Authorization':
            'Bearer ${LocaleManager.instance.getStringValue(PreferencesKeys.ACCESSTOKEN_MOC)}',
      }),
      data: model.toJson(),
    );
    return response;
  }
}
