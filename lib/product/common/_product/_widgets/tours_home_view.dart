import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../core/init/lang/locale_keys.g.dart';
import '../../../../view/safety_tour_app/planned_tours/planned_tours_list/view/planned_tour_list_view.dart';
import '../../../../view/safety_tour_app/unplanned_tours/view/unplanned_tour_list_view.dart';
import '../../settings/view/settings_view.dart';

class ToursHomeView extends StatefulWidget {
  final int? currentIndex;

  const ToursHomeView({Key? key, this.currentIndex}) : super(key: key);
  @override
  _ToursHomeViewState createState() => _ToursHomeViewState();
}

class _ToursHomeViewState extends State<ToursHomeView> {
  int? _currentIndex;

  final List<Widget> _children = [
    PlannedTourListView(),
    UnPlannedTourListView(),
    SettingsView(),
  ];

  @override
  void dispose() {
    super.dispose();
    _currentIndex = null;
  }

  @override
  Widget build(BuildContext context) {
    int? currentIndex = (ModalRoute.of(context)?.settings.arguments as int?);
    // print(LocaleManager.instance
    //     .getIntValue(PreferencesKeys.SAFETY_TOUR_TOKEN_EXPIRE_TIME));

    // final isExpired = (LocaleManager.instance
    //             .getIntValue(PreferencesKeys.SAFETY_TOUR_TOKEN_EXPIRE_TIME) ??
    //         0) >
    //     10;
    // if (isExpired) {
    //   final snackBar = SnackBar(
    //     content: Text(
    //         "Bu uygulamadaki oturum süreniz dolmuştur. Giriş Sayfasına yönlendiriliyorsunuz..."),
    //   );
    //   ScaffoldMessenger.of(context).showSnackBar(snackBar);
    // }
    return Scaffold(
        body: _children[_currentIndex ?? currentIndex ?? 0],
        bottomNavigationBar:
            buildBottomNavBar(_currentIndex ?? currentIndex ?? 0));
  }

  BottomNavigationBar buildBottomNavBar(int _currentIndex) {
    return BottomNavigationBar(
      onTap: onTabTapped,
      currentIndex: _currentIndex,
      elevation: 0,
      items: [
        BottomNavigationBarItem(
          backgroundColor: Colors.white,
          icon: Icon(Icons.list_alt),
          label: LocaleKeys.home_bottom_app_bar_tabs_planned_tours.tr(),
        ),
        BottomNavigationBarItem(
          backgroundColor: Colors.white,
          icon: Icon(Icons.list),
          label: LocaleKeys.home_bottom_app_bar_tabs_unplanned_tours.tr(),
        ),
        // BottomNavigationBarItem(
        //   backgroundColor: Colors.white,
        //   icon: Icon(Icons.person),
        //   label: LocaleKeys.home_bottom_app_bar_tabs_settings.tr(),
        // )
      ],
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}
