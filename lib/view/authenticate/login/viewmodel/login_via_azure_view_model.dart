import 'dart:convert';

import 'package:aad_oauth/aad_oauth.dart';
import 'package:aad_oauth/model/config.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get_connect/http/src/status/http_status.dart';
import 'package:http/http.dart' as http;
import 'package:mobx/mobx.dart';

import '../../../../core/base/model/base_viewmodel.dart';
import '../../../../core/constants/enums/preferences_keys_enum.dart';
import '../../../../core/constants/navigation/navigation_constants.dart';
import '../../../../core/constants/network/network_constants.dart';
import '../../../../core/init/cache/locale_manager.dart';
import '../../../../core/init/navigation/navigation_service.dart';
import '../../../../product/enum/esd_url_enum.dart';
import '../../../../product/enum/moc_url_enum.dart';
import '../../../esd_app/home/model/sign_in_safety_tour_model.dart';
import '../model/graph_response.dart';
import '../model/sign_in_response.dart';
import '../model/sign_in_response_moc.dart';

part 'login_via_azure_view_model.g.dart';

class LoginViaAzureViewModel = _LoginViaAzureViewModelBase
    with _$LoginViaAzureViewModel;

abstract class _LoginViaAzureViewModelBase with Store, BaseViewModel {
  @override
  void setContext(BuildContext context) => this.context = context;
  @override
  void init() {
    super.init();
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  late TextEditingController emailController;
  late TextEditingController passwordController;

  GlobalKey<FormState> formState = GlobalKey();
  GlobalKey<ScaffoldState> scaffoldState = GlobalKey();

  @observable
  bool isLoading = false;

  @observable
  bool isLockOpen = true;

  @observable
  String userEmail = "";

  @observable
  bool isVisible = true;

  @observable
  int currentTabIndex = 0;

  @action
  void setUserEmail(String email) {
    userEmail = email;
  }

  @action
  void changeVisibility() {
    isVisible = !isVisible;
  }

  @action
  void changeCurrentTabIndex(int val) {
    currentTabIndex = val;
  }

  @action
  void isLockStateChange() {
    isLockOpen = !isLockOpen;
  }

  @action
  void isLoadingChange() {
    isLoading = !isLoading;
  }

  final dio = Dio(
    BaseOptions(
      baseUrl: NetworkConstants.BASE_URL_TEMPLATE,
      headers: {"Content-Type": "application/json-patch+json"},
    ),
  );
  final dio2 = Dio(
    BaseOptions(
      baseUrl: NetworkConstants.BASE_URL_TEMPLATE,
      headers: {"Content-Type": "application/json-patch+json"},
    ),
  );
  static final Config config = new Config(
    //arf-aws
    // tenant: "58d32a83-95a1-4062-8a76-25689bc3e158",
    // clientId: "66d55d0c-2b44-4fcd-9943-5d9c58e420ff",
    //template
    tenant: "e8ddc5d0-e92a-43c0-82d4-92fa86b23294",
    clientId: "33236642-a8b8-4adc-b97e-796e555be95d",
    scope: "openid profile offline_access User.read",
    redirectUri: "https://login.microsoftonline.com/common/oauth2/nativeclient",
    isB2C: false,
    domainHint: "consumers",
  );

  Future<String?> signIn(String email) async {
    // Kullanıcı mobilde mailini girdikten sonra girdiği o adresin microsoft login ekranına otomatik girilmiş aktarılması için alttaki config.loginHint = email gerekli.
    config.loginHint = email;
    final AadOAuth oauth = new AadOAuth(config);

    await oauth.logout();
    await oauth.login().then((value) => isLoadingChange());

    final String accessToken = (await oauth.getAccessToken()) ?? "";
    LocaleManager.instance
        .setStringValue(PreferencesKeys.ACCESSTOKEN_AZUREAD, accessToken);

    final graphResponse = await http
        .get(Uri.parse(NetworkConstants.MS_GRAPH_USER_INFO_URL), headers: {
      "Authorization": "Bearer " + "$accessToken",
      "Content-Type": "application/json"
    });
    print(graphResponse.body);
    // Get user credentials from MS Graph
    switch (graphResponse.statusCode) {
      case HttpStatus.ok:
        final GraphResponse graphResponseJson =
            GraphResponse.fromJson(json.decode(graphResponse.body));
        // Save USER_MAIL to cache
        await LocaleManager.instance.setStringValue(PreferencesKeys.USER_MAIL,
            graphResponseJson.userPrincipalName.toString());
        await LocaleManager.instance.setStringValue(PreferencesKeys.USER_NAME,
            graphResponseJson.displayName.toString());

        //signIn to ESD
        final response = await dio.post(
          ESDUrls.SignInMobile.rawValue,
          data: json.encode(SignInModel(
                  userNameOrEmailAddress: LocaleManager.instance
                      .getStringValue(PreferencesKeys.USER_MAIL),
                  rememberClient: true)
              .toJson()),
        );
        final response2 = await dio2.post(
          MOCUrls.SignInMobile.rawValue,
          data: json.encode(SignInModel(
                  userNameOrEmailAddress: LocaleManager.instance
                      .getStringValue(PreferencesKeys.USER_MAIL),
                  rememberClient: true)
              .toJson()),
        );
        switch (response2.statusCode) {
          case HttpStatus.ok:
            final SignInResponseMoc mocSignInResponse =
                SignInResponseMoc.fromJson(response2.data["result"]);
            if (mocSignInResponse.accessToken!.isNotEmpty) {
              // save azure and esd token to cache

              await LocaleManager.instance.setStringValue(
                  PreferencesKeys.ACCESSTOKEN_MOC,
                  mocSignInResponse.accessToken!);
              await LocaleManager.instance.setIntValue(
                  PreferencesKeys.MOC_TOKEN_EXPIRE_TIME,
                  mocSignInResponse.expireInSeconds ?? 0);
            }
        }
        switch (response.statusCode) {
          case HttpStatus.ok:
            final SignInResponse esdSignInResponse =
                SignInResponse.fromJson(response.data["result"]);
            if (esdSignInResponse.accessToken!.isNotEmpty) {
              // save azure and esd token to cache

              await LocaleManager.instance.setStringValue(
                  PreferencesKeys.ACCESSTOKEN_ESD,
                  esdSignInResponse.accessToken!);
              await LocaleManager.instance.setIntValue(
                  PreferencesKeys.ESD_TOKEN_EXPIRE_TIME,
                  esdSignInResponse.expireInSeconds ?? 0);

              isLoadingChange();
              await NavigationService.instance
                  .navigateToPageClear(NavigationConstants.HOME_VIEW);
            }
        }
    }
  }
}
