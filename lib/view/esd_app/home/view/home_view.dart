import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:footer/footer.dart';

import '../../../../core/base/view/base_view.dart';
import '../../../../core/constants/enums/preferences_keys_enum.dart';
import '../../../../core/constants/navigation/navigation_constants.dart';
import '../../../../core/init/cache/locale_manager.dart';
import '../../../../core/init/navigation/navigation_service.dart';
import '../module/home_app_small_card.dart';
import '../viewmodel/home_view_model.dart';

class HomeView extends StatefulWidget {
  HomeView({Key? key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int itemsLength = 0;

  Future<int> getItemsLength() async {
    // final List<ByPassFormModel>? items =
    //     await HomeService.instance!.getConfirmationItems();
    // itemsLength = items!.length;
    return itemsLength;
  }

  @override
  Widget build(BuildContext context) {
    getItemsLength().then((value) => {
          Future.delayed(
            Duration(milliseconds: 0),
            () {
              if (this.mounted) {
                setState(() {
                  itemsLength = value;
                });
              }
            },
          )
        });

    return BaseView<HomeViewModel>(
        viewModel: HomeViewModel(),
        onModelReady: (HomeViewModel model) {
          model.setContext(context);
          model.init();
        },
        onPageBuilder: (BuildContext context, HomeViewModel viewModel) =>
            Scaffold(
              body: SafeArea(
                child: Stack(
                  children: [
                    // Opacity(
                    //   opacity: 0.15,
                    //   child: Center(
                    //     child: Container(
                    //       padding: EdgeInsets.only(top: 90),
                    //       height: MediaQuery.of(context).size.height * 0.8,
                    //       width: MediaQuery.of(context).size.width,
                    //       child: Image.asset(
                    //         'assets/image/logo.png',
                    //         fit: BoxFit.fill,
                    //       ),
                    //     ),
                    //   ),
                    // ),
                    ListView(
                      physics: BouncingScrollPhysics(),
                      children: [
                        Container(
                          decoration: new BoxDecoration(
                              shape: BoxShape.rectangle,
                              color: Color.fromARGB(255, 64, 115, 158),
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(0),
                                  bottomRight: Radius.circular(0))),
                          child: Padding(
                            padding: EdgeInsets.only(
                                left: 20.w,
                                right: 20.w,
                                top: 12.h,
                                bottom: 12.h),
                            child: Column(
                              children: [
                                Image.asset(
                                  'assets/image/logo.png',
                                  width: 200,
                                  height: 80,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Template",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 24.w,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Row(
                                      children: [
                                        IconButton(
                                          enableFeedback: true,
                                          onPressed: () {
                                            NavigationService.instance
                                                .navigateToPage(
                                                    NavigationConstants
                                                        .SETTINGS_VIEW);
                                          },
                                          icon: Icon(
                                            Icons.settings,
                                            size: 24.r,
                                            color: Colors.white,
                                          ),
                                        ),
                                        IconButton(
                                          enableFeedback: true,
                                          onPressed: () {
                                            NavigationService.instance
                                                .navigateToPageClear(
                                                    NavigationConstants
                                                        .LOGIN_VIA_AZURE_VIEW);
                                          },
                                          icon: Icon(
                                            Icons.logout_rounded,
                                            size: 24.r,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                Container(
                                  height: 0,
                                  width: 400,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      // Text(
                                      //   'Merhaba,',
                                      //   style: TextStyle(
                                      //     color: Colors.white,
                                      //     fontSize: 32.w,
                                      //     fontWeight: FontWeight.w700,
                                      //   ),
                                      // ),
                                      // Text(
                                      //   LocaleManager.instance.getStringValue(
                                      //               PreferencesKeys
                                      //                   .USER_NAME) !=
                                      //           null
                                      //       ? LocaleManager.instance
                                      //           .getStringValue(
                                      //               PreferencesKeys.USER_NAME)!
                                      //       : " ",
                                      //   style: TextStyle(
                                      //     color: Colors.white,
                                      //     fontSize: 28.w,
                                      //     fontWeight: FontWeight.w700,
                                      //   ),
                                      // ),
                                      // Text(
                                      //   LocaleManager.instance.getStringValue(
                                      //               PreferencesKeys
                                      //                   .USER_MAIL) !=
                                      //           null
                                      //       ? LocaleManager.instance
                                      //           .getStringValue(
                                      //               PreferencesKeys.USER_MAIL)!
                                      //       : " ",
                                      //   style: TextStyle(
                                      //     color: Colors.white,
                                      //     fontSize: 12.w,
                                      //   ),
                                      // ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        Container(
                          height: 50,
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                width: 1.0,
                                color: Colors.black26,
                              ),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            // child: Row(
                            //   children: [
                            //     Icon(Icons.info, color: Colors.red),
                            //     SizedBox(width: 5),
                            //     Text(
                            //       'Duyurular',
                            //       style: TextStyle(fontWeight: FontWeight.bold),
                            //     ),
                            //     SizedBox(width: 20.0),
                            //     Text(
                            //       'Lorem ipsum dolor sit amet',
                            //       style: TextStyle(fontWeight: FontWeight.bold),
                            //     ),
                            //   ],
                            // ),
                          ),
                        ),
                        SizedBox(height: 16.h),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8.w),
                          child: GridView(
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 10.w,
                              mainAxisExtent: 150.w,
                              mainAxisSpacing: 20.w,
                            ),
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            children: [
                              HomeAppSmallCard(
                                  notificationCount: itemsLength,
                                  title: " ",
                                  subtitle: 'Demo 1',
                                  onTap: () async {
                                    await NavigationService.instance
                                        .navigateToPage(NavigationConstants
                                            .CONFIRMATION_INBOX_VIEW);
                                  },
                                  headColor: Color.fromARGB(255, 39, 60, 117),
                                  gradientStartColor: Colors.white,
                                  gradientEndColor: Colors.white),
                              // HomeAppSmallCard(
                              //     notificationCount: 2,
                              //     title: "Emniyet Turu",
                              //     subtitle: 'ET',
                              //     onTap: () async {
                              //       await NavigationService.instance
                              //           .navigateToPage(NavigationConstants
                              //               .TOURS_HOME_VIEW);
                              //     },
                              //     headColor: Color.fromARGB(255, 68, 189, 50),
                              //     gradientStartColor: Colors.white,
                              //     gradientEndColor: Colors.white),
                              HomeAppSmallCard(
                                  notificationCount: 0,
                                  title: "",
                                  subtitle: 'Demo 2',
                                  onTap: () async {
                                    await NavigationService.instance
                                        .navigateToPage(
                                            NavigationConstants.MOC_HOME_VIEW);
                                  },
                                  headColor: Color.fromARGB(255, 232, 65, 24),
                                  gradientStartColor: Colors.white,
                                  gradientEndColor: Colors.white),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      verticalDirection: VerticalDirection.down,
                      children: [
                        Footer(
                          alignment: Alignment.bottomCenter,
                          backgroundColor: Colors.white30.withOpacity(0.1),
                          child: Text(
                            'Template 2022 © POLARIS',
                            style: TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 12.w),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ));
  }
}
