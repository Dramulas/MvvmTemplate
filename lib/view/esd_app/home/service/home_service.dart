import 'dart:io';

import 'package:dio/dio.dart';

import '../../../../core/constants/enums/preferences_keys_enum.dart';
import '../../../../core/constants/network/network_constants.dart';
import '../../../../core/init/cache/locale_manager.dart';
import '../../../../product/enum/esd_url_enum.dart';
import '../../confirmation_inbox/model/bypass_form_model.dart';

class HomeService {
  static HomeService? _instance;
  static HomeService? get instance {
    if (_instance == null) _instance = HomeService._init();
    return _instance;
  }

  HomeService._init();

  final dio = Dio(BaseOptions(
    baseUrl: NetworkConstants.BASE_URL_TEMPLATE,
    headers: {"Content-Type": "application/json-patch+json"},
  ));

  // Future<List<ByPassFormModel>?> getConfirmationItems() async {
  //   final response = await dio.get(
  //     ESDUrls.GetAllByPassFormsWaitingForMyApprovalMobile.rawValue,
  //     options: Options(headers: {
  //       'Authorization':
  //           'Bearer ${LocaleManager.instance.getStringValue(PreferencesKeys.ACCESSTOKEN_ESD)}',
  //     }),
  //   );

  //   switch (response.statusCode) {
  //     case HttpStatus.ok:
  //       final responseBody = await response.data['result'];
  //       if (responseBody is List) {
  //         return responseBody.map((e) => ByPassFormModel.fromJson(e)).toList();
  //       }
  //   }
  //   return null;
  // }
}
