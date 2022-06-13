import 'package:easy_localization/easy_localization.dart';
import '../../../../core/constants/enums/preferences_keys_enum.dart';
import '../../../../core/init/cache/locale_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../../core/base/view/base_view.dart';
import '../../../../core/extensions/context_extension.dart';
import '../../../../core/extensions/widget_extension.dart';
import '../../../../core/init/lang/language_manager.dart';
import '../../../../core/init/lang/locale_keys.g.dart';
import '../viewmodel/settings_view_model.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<SettingsViewModel>(
      viewModel: SettingsViewModel(),
      onModelReady: (SettingsViewModel model) {
        model.setContext(context);
        model.init();
      },
      onPageBuilder: (BuildContext context, SettingsViewModel viewModel) =>
          Scaffold(
              body: Padding(
        padding: context.paddingLowAll,
        child: CustomScrollView(
          slivers: [
            buildSliverAppBar(context),
            buildCardUser(context, viewModel).toSliver,
            SizedBox(height: MediaQuery.of(context).size.height * 0.01)
                .toSliver,
            // buildCardHeaderProjectSettings(context, viewModel).toSliver,
            buildCardNavigationTour(viewModel, context).toSliver,
            SizedBox(height: MediaQuery.of(context).size.height * 0.05)
                .toSliver,
            // buildAboutProject(context, viewModel).toSliver,
            // SizedBox(
            //   height: 6,
            // ).toSliver,
            buildTextButtonLogout(context, viewModel).toSliver,

            SizedBox(
              height: 24,
            ).toSliver,
            // buildTextButtonGoToHomeView(context, viewModel).toSliver
          ],
        ),
      )),
    );
  }

  TextButton buildTextButtonLogout(
      BuildContext context, SettingsViewModel viewModel) {
    return TextButton.icon(
        style: ButtonStyle(
            shape: MaterialStateProperty.all(StadiumBorder()),
            padding: MaterialStateProperty.all(context.paddingNormalAll),
            backgroundColor: MaterialStateProperty.all(
                context.colors.onSurface.withOpacity(0.9))),
        onPressed: viewModel.logoutApp,
        icon: Icon(Icons.exit_to_app, color: Colors.white),
        label: Text(LocaleKeys.home_setting_exit.tr(),
            style: TextStyle(color: Colors.white)));
  }

  // TextButton buildTextButtonGoToHomeView(
  //     BuildContext context, SettingsViewModel viewModel) {
  //   return TextButton.icon(
  //       style: ButtonStyle(
  //           shape: MaterialStateProperty.all(StadiumBorder()),
  //           padding: MaterialStateProperty.all(context.paddingNormalAll),
  //           backgroundColor: MaterialStateProperty.all(
  //               context.colors.onSurface.withOpacity(0.9))),
  //       onPressed: viewModel.navigateToHomeView,
  //       icon: Icon(Icons.home_outlined),
  //       label: Text("Uygulamalar Sayfasına Dön"));
  // }

  Card buildCardNavigationTour(
      SettingsViewModel viewModel, BuildContext context) {
    return Card(
      color: context.colors.surface,
      child: TextButton(
        onPressed: () {},
        child: ListTile(
          leading: Icon(
            Icons.navigation_outlined,
            color: context.colors.onSurface,
          ),
          onTap: viewModel.navigateToOnBoard,
          title: Text(LocaleKeys.home_setting_appTour.tr()),
          trailing: Icon(
            Icons.keyboard_arrow_right,
            color: context.colors.onSurface,
          ),
        ),
      ),
    );
  }

  Widget buildAboutProject(BuildContext context, SettingsViewModel viewModel) {
    return buildCardHeader(context, viewModel,
        title: LocaleKeys.home_setting_about_title.tr(),
        children: [
          ListTile(
            onTap: viewModel.navigateToContribution,
            leading: Icon(Icons.favorite),
            title: Text(LocaleKeys.home_setting_about_contributions.tr()),
            trailing: IconButton(
                icon: Icon(Icons.keyboard_arrow_right),
                onPressed: viewModel.navigateToContribution),
          ),
          ListTile(
            onTap: viewModel.navigateToFakeContribution,
            leading: Icon(Icons.home),
            title: Text(LocaleKeys.home_setting_about_homepage.tr()),
            trailing: IconButton(
                icon: Icon(Icons.keyboard_arrow_right),
                onPressed: viewModel.navigateToFakeContribution),
          ),
        ]);
  }

  Widget buildCardHeaderProjectSettings(
      BuildContext context, SettingsViewModel viewModel) {
    return buildCardHeader(context, viewModel,
        title: LocaleKeys.home_setting_appSettings.tr(),
        children: [
          // ListTile(
          //   tileColor: Color(0xffF9EEDF),
          //   title: Text(LocaleKeys.home_setting_core_themeTitle.tr()),
          //   trailing: IconButton(
          //     icon: context.watch<ThemeNotifier>().currentThemeEnum ==
          //             AppThemes.LIGHT
          //         ? LottiePathEnum.MOON.toWidget
          //         : LottiePathEnum.SUNNY.toWidget,
          //     onPressed: viewModel.changeAppTheme,
          //   ),
          //   subtitle: Text(LocaleKeys.home_setting_core_themeDesc.tr()),
          // ),
          ListTile(
            tileColor: context.colors.background,
            title: Text(LocaleKeys.home_setting_core_langTitle.tr()),
            trailing: Observer(builder: (_) {
              return DropdownButton<Locale>(
                value: viewModel.appLocale,
                onChanged: viewModel.changeAppLocalization,
                items: [
                  DropdownMenuItem(
                    child: Text("TR"),
                    value: LanguageManager.instance.trLocale,
                  ),
                  DropdownMenuItem(
                    child: Text("EN"),
                    value: LanguageManager.instance.enLocale,
                  ),
                ],
              );
            }),
            subtitle: Text(LocaleKeys.home_setting_core_langDesc.tr()),
          )
        ]);
  }

  Widget buildCardHeader(BuildContext context, SettingsViewModel viewModel,
      {required String title, required List<Widget> children}) {
    return Card(
      color: context.colors.background,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: context.paddingLowAll,
            child: Text(
              title.tr(),
              style: context.textTheme.headline5,
            ),
          ),
          Divider(),
          ...children
        ],
      ),
    );
  }

  Widget buildCardAbout(BuildContext context, SettingsViewModel viewModel) {
    return buildCardHeader(context, viewModel,
        title: LocaleKeys.home_setting_about_title,
        children: [
          ListTile(
            onTap: viewModel.navigateToContribution,
            leading: Icon(
              Icons.favorite,
            ),
            title: Text(LocaleKeys.home_setting_about_contributions.tr()),
            trailing: Icon(Icons.keyboard_arrow_right_outlined),
          ),
          ListTile(
            onTap: viewModel.navigateToFakeContribution,
            leading: Icon(
              Icons.home,
            ),
            title: Text("Home Page"),
            trailing: Icon(Icons.keyboard_arrow_right_outlined),
          )
        ]);
  }

  Card buildCardUser(BuildContext context, SettingsViewModel viewModel) {
    return Card(
      color: context.colors.surface,
      child: Padding(
        padding: context.paddingLowAll,
        child: ListTile(
            leading: Icon(
              Icons.verified_user,
              color: context.colors.onSurface,
            ),
            title: Text("Kullanıcı Bilgileri"),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  LocaleManager.instance
                              .getStringValue(PreferencesKeys.USER_MAIL) !=
                          null
                      ? "Mail: " +
                          LocaleManager.instance
                              .getStringValue(PreferencesKeys.USER_MAIL)!
                      : " ",
                ),
                Text(
                  LocaleManager.instance
                              .getStringValue(PreferencesKeys.USER_MAIL) !=
                          null
                      ? "İsim-Soyisim: " +
                          LocaleManager.instance
                              .getStringValue(PreferencesKeys.USER_NAME)!
                      : " ",
                )
              ],
            )),
        // Row(
        //   children: [
        //     Text(LocaleManager.instance
        //             .getStringValue(PreferencesKeys.USER_NAME) ??
        //         ""),
        //     Column(
        //       children: [
        //         Icon(Icons.verified_user),
        //         Text(LocaleManager.instance
        //                 .getStringValue(PreferencesKeys.USER_MAIL) ??
        //             "")
        //       ],
        //     )
        //   ],
        // ),
      ),
    );
  }

  // NestedScrollView buildNestedScrollView() {
  //   return NestedScrollView(
  //     body: Text("Data"),
  //     headerSliverBuilder: (context, innerBoxIsScrolled) {
  //       return [buildSliverAppBar(context)];
  //     },
  //   );
  // }

  SliverAppBar buildSliverAppBar(BuildContext context) {
    return SliverAppBar(
      elevation: 0,
      pinned: true,
      // ignore: deprecated_member_use
      backgroundColor: context.colors.secondaryVariant,
      expandedHeight: 100,
      flexibleSpace: FlexibleSpaceBar(
        title: Text(
          LocaleKeys.home_setting_title.tr(),
          style: context.textTheme.headline5,
        ),
      ),
    );
  }
}
