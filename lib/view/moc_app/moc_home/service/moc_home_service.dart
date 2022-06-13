import 'dart:io';

import 'package:dio/dio.dart';

import '../../../../core/constants/enums/preferences_keys_enum.dart';
import '../../../../core/constants/network/network_constants.dart';
import '../../../../core/init/cache/locale_manager.dart';
import '../../../../product/enum/moc_url_enum.dart';
import '../../model/moc_form_model.dart';

class MocHomeService {
  static MocHomeService? _instance;
  static MocHomeService? get instance {
    if (_instance == null) _instance = MocHomeService._init();
    return _instance;
  }

  MocHomeService._init();

  final dio = Dio(BaseOptions(
    baseUrl: NetworkConstants.BASE_URL_TEMPLATE,
    headers: {"Content-Type": "application/json-patch+json"},
  ));

  Future<List<MocFormModel>?> getMocForms() async {
    final response = await dio.get(
      MOCUrls.GetAllMocFormsWaitingForMyApprovalMobile.rawValue,
      options: Options(headers: {
        'Authorization':
            'Bearer ${LocaleManager.instance.getStringValue(PreferencesKeys.ACCESSTOKEN_MOC)}',
      }),
    );

    switch (response.statusCode) {
      case HttpStatus.ok:
        final responseBody = await response.data['result'];
        if (responseBody is List) {
          return responseBody.map((e) => MocFormModel.fromJson(e)).toList();
        }
    }
    return null;
  }
}
