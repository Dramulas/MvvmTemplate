import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import 'core/constants/app/app_contansts.dart';
import 'core/constants/enums/preferences_keys_enum.dart';
import 'core/init/cache/locale_manager.dart';
import 'core/init/lang/language_manager.dart';
import 'core/init/navigation/navigation_route.dart';
import 'core/init/navigation/navigation_service.dart';
import 'core/init/notifier/provider_list.dart';
import 'core/init/notifier/theme_notifier.dart';
import 'view/authenticate/login/view/splash_screen.dart';
// import 'package:sentry_flutter/sentry_flutter.dart';

Future<void> main() async {
  await _init();

  runApp(
    MultiProvider(
      providers: [...ApplicationProvider.instance.dependItems],
      child: EasyLocalization(
          child: TemplateApp(),
          supportedLocales: LanguageManager.instance.supportedLocales,
          fallbackLocale: Locale('tr', "TR"),
          path: ApplicationConstants.LANG_ASSET_PATH,
          startLocale: LanguageManager.instance.trLocale),
    ),
  );
}

Future<void> _init() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await LocaleManager.preferencesInit();
}

class TemplateApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        locale: context.locale,
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        home: Authenticate(),
        theme: Provider.of<ThemeNotifier>(context).currentTheme,
        onGenerateRoute: NavigationRoute.instance.generateRoute,
        navigatorKey: NavigationService.instance.navigatorKey,
        navigatorObservers: <NavigatorObserver>[
          RouteObserverCall.routeObserver
        ],
      ),
    );
  }
}

class Authenticate extends StatefulWidget {
  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  late final String? token;
  @override
  void initState() {
    super.initState();
    token = LocaleManager.instance
        .getStringValue(PreferencesKeys.ACCESSTOKEN_AZUREAD);
  }

  @override
  Widget build(BuildContext context) {
    print(token);
    return SplashView(
      token: token ?? '',
    );
  }
}
