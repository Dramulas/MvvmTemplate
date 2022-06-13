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
import '../../../../product/enum/safety_tour_url_enum.dart';
import '../../../authenticate/login/model/sign_in_response.dart';
import '../model/sign_in_safety_tour_model.dart';

part 'home_view_model.g.dart';

class HomeViewModel = _HomeViewModelBase with _$HomeViewModel;

abstract class _HomeViewModelBase with Store, BaseViewModel {
  void navigateToOnBoard() {
    navigation.navigateToPage(NavigationConstants.ONBOARD);
  }

  @override
  void setContext(BuildContext context) => this.context = context;

  final String _connString = "http://safetytour.mobile.demos.arfitect.net/api";
  final Map<String, String> _headers = {
    "Content-Type": "application/json-patch+json"
  };

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
  Future<void> signInSafetyTour() async {
    isLoadingChange();
    final dio = Dio(BaseOptions(
      baseUrl: _connString,
      headers: _headers,
    ));

    final response = await dio.post(SafetyTourURLs.SignInMobile.rawValue,
        data: json.encode(SignInModel(
                userNameOrEmailAddress: LocaleManager.instance
                    .getStringValue(PreferencesKeys.USER_MAIL),
                rememberClient: true)
            .toJson()));

    switch (response.statusCode) {
      case HttpStatus.ok:
        final SignInResponse signInResponse =
            SignInResponse.fromJson(response.data["result"]);
        if (signInResponse.accessToken!.isNotEmpty) {
          await LocaleManager.instance.setStringValue(
              PreferencesKeys.ACCESSTOKEN_SAFETYTOUR,
              signInResponse.accessToken!);
          await LocaleManager.instance.setIntValue(
              PreferencesKeys.SAFETY_TOUR_TOKEN_EXPIRE_TIME,
              signInResponse.expireInSeconds ?? 0);
        }
        isLoadingChange();
        await NavigationService.instance
            .navigateToPageClear(NavigationConstants.TOURS_HOME_VIEW);
        Future<void> logoutApp() async {
          await localeManager.clearAllSaveFirst();
          await NavigationService.instance
              .navigateToPageClear(NavigationConstants.LOGIN_VIA_AZURE_VIEW);
        }
    }
  }
}
