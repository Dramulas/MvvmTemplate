import 'dart:io';

import 'package:dio/dio.dart';

import '../../../../core/constants/enums/preferences_keys_enum.dart';
import '../../../../core/constants/network/network_constants.dart';
import '../../../../core/init/cache/locale_manager.dart';
import '../../../product/enum/moc_url_enum.dart';
import '../model/give_technical_opinion_acceptance_model.dart';
import '../model/moc_technical_opinion_acceptance_model.dart';

class TechnicalOpinionAcceptanceService {
  static TechnicalOpinionAcceptanceService? _instance;
  static TechnicalOpinionAcceptanceService? get instance {
    if (_instance == null)
      _instance = TechnicalOpinionAcceptanceService._init();
    return _instance;
  }

  TechnicalOpinionAcceptanceService._init();

  final dio = Dio(BaseOptions(
    baseUrl: NetworkConstants.BASE_URL_TEMPLATE,
    headers: {"Content-Type": "application/json-patch+json"},
  ));

  Future<List<TechnicalOAModel>?> getTechnicalOpinionItems() async {
    final response = await dio.get(
      MOCUrls.GetAllTechnicalOpinionsMobile.rawValue,
      options: Options(headers: {
        'Authorization':
            'Bearer ${LocaleManager.instance.getStringValue(PreferencesKeys.ACCESSTOKEN_MOC)}',
      }),
    );

    switch (response.statusCode) {
      case HttpStatus.ok:
        final responseBody = await response.data['result'];
        if (responseBody is List) {
          return responseBody.map((e) => TechnicalOAModel.fromJson(e)).toList();
        }
    }
  }

  Future<List<TechnicalOAModel>?> getTechnicalAcceptanceItems() async {
    final response = await dio.get(
      MOCUrls.GetAllTechnicalAcceptancesMobile.rawValue,
      options: Options(headers: {
        'Authorization':
            'Bearer ${LocaleManager.instance.getStringValue(PreferencesKeys.ACCESSTOKEN_MOC)}',
      }),
    );

    switch (response.statusCode) {
      case HttpStatus.ok:
        final responseBody = await response.data['result'];
        if (responseBody is List) {
          return responseBody.map((e) => TechnicalOAModel.fromJson(e)).toList();
        }
    }
    return null;
  }

  Future<Response<dynamic>> giveTechnicalOA(GiveTechnicalOAModel model) async {
    final response = await dio.post(
      MOCUrls.GiveTechnicalOA.rawValue,
      options: Options(headers: {
        'Authorization':
            'Bearer ${LocaleManager.instance.getStringValue(PreferencesKeys.ACCESSTOKEN_MOC)}',
      }),
      data: model.toJson(),
    );
    return response;
  }

  Future<Response<dynamic>> contestMocForm(GiveTechnicalOAModel model) async {
    final response = await dio.post(
      MOCUrls.ContestMocForm.rawValue,
      options: Options(headers: {
        'Authorization':
            'Bearer ${LocaleManager.instance.getStringValue(PreferencesKeys.ACCESSTOKEN_MOC)}',
      }),
      data: model.toJson(),
    );
    return response;
  }
}
