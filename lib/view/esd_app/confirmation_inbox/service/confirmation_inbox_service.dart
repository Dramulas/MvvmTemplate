import 'dart:io';

import 'package:dio/dio.dart';

import '../../../../core/constants/enums/preferences_keys_enum.dart';
import '../../../../core/constants/network/network_constants.dart';
import '../../../../core/init/cache/locale_manager.dart';
import '../../../../product/enum/esd_url_enum.dart';
import '../model/approve_bypass_model.dart';
import '../model/bypass_form_model.dart';

class ConfirmationInboxService {
  static ConfirmationInboxService? _instance;
  static ConfirmationInboxService? get instance {
    if (_instance == null) _instance = ConfirmationInboxService._init();
    return _instance;
  }

  ConfirmationInboxService._init();

  final dio = Dio(BaseOptions(
    baseUrl: NetworkConstants.BASE_URL_TEMPLATE,
    headers: {"Content-Type": "application/json-patch+json"},
  ));

  Future<List<ByPassFormModel>?> getConfirmationItems() async {
    final response = await dio.get(
      ESDUrls.GetAllByPassFormsWaitingForMyApprovalMobile.rawValue,
      options: Options(headers: {
        'Authorization':
            'Bearer ${LocaleManager.instance.getStringValue(PreferencesKeys.ACCESSTOKEN_ESD)}',
      }),
    );

    switch (response.statusCode) {
      case HttpStatus.ok:
        final responseBody = await response.data['result'];
        if (responseBody is List) {
          return responseBody.map((e) => ByPassFormModel.fromJson(e)).toList();
        }
    }
    return null;
  }

  Future<Response<dynamic>> approveByPassForm(ApproveByPassModel model) async {
    final response = await dio.post(
      ESDUrls.ApproveByPassForm.rawValue,
      options: Options(headers: {
        'Authorization':
            'Bearer ${LocaleManager.instance.getStringValue(PreferencesKeys.ACCESSTOKEN_ESD)}',
      }),
      data: model.toJson(),
    );
    return response;
  }
}
