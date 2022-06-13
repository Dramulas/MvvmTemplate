import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import '../../../../core/constants/network/network_constants.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '../../../../core/base/model/base_viewmodel.dart';
import '../../../../core/constants/enums/preferences_keys_enum.dart';
import '../../../../core/constants/navigation/navigation_constants.dart';
import '../../../../core/init/cache/locale_manager.dart';
import '../../../../core/init/navigation/navigation_service.dart';
import '../../../../product/enum/moc_url_enum.dart';
import '../../../authenticate/login/model/sign_in_response.dart';
import '../../../authenticate/login/model/sign_in_response_moc.dart';
import '../model/sign_in_safety_tour_model.dart';

part 'moc_home_view_model.g.dart';

class MocHomeModel = _MocHomeModelBase with _$MocHomeModel;

abstract class _MocHomeModelBase with Store, BaseViewModel {
  void navigateToOnBoard() {
    navigation.navigateToPage(NavigationConstants.ONBOARD);
  }

  @override
  void setContext(BuildContext context) => this.context = context;

  @observable
  bool isLoading = false;

  @action
  void isLoadingChange() {
    isLoading = !isLoading;
  }

  final dio = Dio(BaseOptions(
    baseUrl: NetworkConstants.BASE_URL_TEMPLATE,
    headers: {"Content-Type": "application/json-patch+json"},
  ));

  @action
  Future<void> signInMoc() async {
    isLoadingChange();
    final dio2 = Dio(BaseOptions(
      baseUrl: NetworkConstants.BASE_URL_TEMPLATE,
      headers: {"Content-Type": "application/json-patch+json"},
    ));

    final response2 = await dio2.post(MOCUrls.SignInMobile.rawValue,
        data: json.encode(SignInModel(
                userNameOrEmailAddress: LocaleManager.instance
                    .getStringValue(PreferencesKeys.USER_MAIL),
                rememberClient: true)
            .toJson()));

    switch (response2.statusCode) {
      case HttpStatus.ok:
        final SignInResponseMoc signInResponse =
            SignInResponseMoc.fromJson(response2.data["result"]);
        if (signInResponse.accessToken!.isNotEmpty) {
          await LocaleManager.instance.setStringValue(
              PreferencesKeys.ACCESSTOKEN_MOC, signInResponse.accessToken!);
          await LocaleManager.instance.setIntValue(
              PreferencesKeys.MOC_TOKEN_EXPIRE_TIME,
              signInResponse.expireInSeconds ?? 0);
        }
        isLoadingChange();
        await NavigationService.instance
            .navigateToPageClear(NavigationConstants.MOC_HOME_VIEW);
    }
  }
}
