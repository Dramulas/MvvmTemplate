import 'dart:io';

import 'package:dio/dio.dart';

import '../../../../core/constants/enums/preferences_keys_enum.dart';
import '../../../../core/constants/network/network_constants.dart';
import '../../../../core/init/cache/locale_manager.dart';
import '../../../product/enum/moc_url_enum.dart';
import '../model/approve_moc_form_model.dart';
import '../model/give_technical_opinion_acceptance_model.dart';
import '../model/moc_form_model.dart';
import '../model/moc_technical_opinion_acceptance_model.dart';

class MocFormService {
  static MocFormService? _instance;
  static MocFormService? get instance {
    if (_instance == null) _instance = MocFormService._init();
    return _instance;
  }

  MocFormService._init();

  final dio = Dio(BaseOptions(
    baseUrl: NetworkConstants.BASE_URL_TEMPLATE,
    headers: {"Content-Type": "application/json-patch+json"},
  ));

  Future<List<MocFormModel>?> getConfirmationItems() async {
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
  }

  Future<Response<dynamic>> approveMocForm(ApproveMocFormModel model) async {
    final response = await dio.post(
      MOCUrls.ApproveMocForm.rawValue,
      options: Options(headers: {
        'Authorization':
            'Bearer ${LocaleManager.instance.getStringValue(PreferencesKeys.ACCESSTOKEN_MOC)}',
      }),
      data: model.toJson(),
    );
    return response;
  }

  Future<Response<dynamic>> rejectMocForm(ApproveMocFormModel model) async {
    final response = await dio.post(
      MOCUrls.RejectMocForm.rawValue,
      options: Options(headers: {
        'Authorization':
            'Bearer ${LocaleManager.instance.getStringValue(PreferencesKeys.ACCESSTOKEN_MOC)}',
      }),
      data: model.toJson(),
    );
    print(response.data);
    return response;
  }

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
