
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/base/view/base_view.dart';
import '../../../../core/constants/navigation/navigation_constants.dart';
import '../../../../core/init/navigation/navigation_service.dart';
import '../../model/moc_closing_approvals_model.dart';
import '../../model/moc_form_model.dart';
import '../../model/moc_technical_opinion_acceptance_model.dart';
import '../../service/moc_closing_moc_form_service.dart';
import '../../service/moc_form_service.dart';
import '../../service/moc_technical_opinion_acceptance_service.dart';
import '../module/moc_home_app_small_card.dart';
import '../service/moc_home_service.dart';
import '../viewmodel/moc_home_view_model.dart';

class MocHomeView extends StatefulWidget {
  MocHomeView({Key? key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<MocHomeView> {
  int mocFormsLength = 0;
  int technicalOpinionsLength = 0;
  int technicalAcceptancesLength = 0;
  int closingMocFormsLength = 0;

  Future<int> getItemsLength() async {
    final List<MocFormModel>? items =
        await MocFormService.instance!.getConfirmationItems();
    mocFormsLength = items!.length;
    return mocFormsLength;
  }

  Future<int> getTechnicalOpinionsLength() async {
    final List<TechnicalOAModel>? items =
        await TechnicalOpinionAcceptanceService.instance!
            .getTechnicalOpinionItems();
    technicalOpinionsLength = items!.length;
    return technicalOpinionsLength;
  }

  Future<int> getTechnicalAcceptancesLength() async {
    final List<TechnicalOAModel>? items =
        await TechnicalOpinionAcceptanceService.instance!
            .getTechnicalAcceptanceItems();
    technicalAcceptancesLength = items!.length;
    return technicalAcceptancesLength;
  }

  Future<int> getClosingMocFormsLength() async {
    final List<ClosingMocFormModel>? items =
        await ClosingMocFormService.instance!.getClosingMocFormItems();
    closingMocFormsLength = items!.length;
    return closingMocFormsLength;
  }

  @override
  Widget build(BuildContext context) {
    getItemsLength().then((value) => {
          Future.delayed(
            Duration(milliseconds: 0),
            () {
              if (this.mounted) {
                setState(() {
                  mocFormsLength = value;
                });
              }
            },
          )
        });
    getTechnicalOpinionsLength().then((value) => {
          () {
            if (this.mounted) {
              setState(() {
                technicalOpinionsLength = value;
              });
            }
          },
        });
    getTechnicalAcceptancesLength().then((value) => {
          Future.delayed(
            Duration(milliseconds: 0),
            () {
              if (this.mounted) {
                setState(() {
                  technicalAcceptancesLength = value;
                });
              }
            },
          )
        });
    getClosingMocFormsLength().then((value) => {
          Future.delayed(
            Duration(milliseconds: 0),
            () {
              if (this.mounted) {
                setState(() {
                  closingMocFormsLength = value;
                });
              }
            },
          )
        });
    return BaseView<MocHomeModel>(
        viewModel: MocHomeModel(),
        onModelReady: (MocHomeModel model) {
          model.setContext(context);
          model.init();
        },
        onPageBuilder: (BuildContext context, MocHomeModel viewModel) =>
            Scaffold(
              appBar: AppBar(
                backgroundColor: Color.fromARGB(255, 64, 115, 158),
                iconTheme: IconThemeData(color: Colors.white),
                elevation: 0,
              ),
              body: SafeArea(
                child: Stack(
                  children: [
                    ListView(
                      physics: BouncingScrollPhysics(),
                      children: [
                        SizedBox(height: 16.h),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8.w),
                          child: GridView(
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 1,
                              crossAxisSpacing: 10.w,
                              mainAxisExtent: 100.w,
                              mainAxisSpacing: 20.w,
                            ),
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            children: [
                              MocHomeAppSmallCard(
                                  notificationCount: mocFormsLength,
                                  title: "Onayımda Bekleyen MOC Formları",
                                  subtitle: '',
                                  onTap: () async {
                                    await NavigationService.instance
                                        .navigateToPage(
                                            NavigationConstants.MOC_FORM_VIEW);
                                  },
                                  headColor: Color.fromARGB(255, 39, 60, 117),
                                  gradientStartColor: Colors.white,
                                  gradientEndColor: Colors.white),
                              MocHomeAppSmallCard(
                                  notificationCount: technicalOpinionsLength,
                                  title: "Teknik Görüşler",
                                  subtitle: '',
                                  onTap: () async {
                                    await NavigationService.instance
                                        .navigateToPage(NavigationConstants
                                            .TECH_OPINION_VIEW);
                                  },
                                  headColor: Color.fromARGB(255, 39, 60, 117),
                                  // headColor: Color.fromARGB(255, 68, 189, 50),
                                  gradientStartColor: Colors.white,
                                  gradientEndColor: Colors.white),
                              MocHomeAppSmallCard(
                                  notificationCount: technicalAcceptancesLength,
                                  title: "Teknik Onaylar",
                                  subtitle: '',
                                  onTap: () async {
                                    await NavigationService.instance
                                        .navigateToPage(NavigationConstants
                                            .TECH_ACCEPTANCE_VIEW);
                                  },
                                  headColor: Color.fromARGB(255, 39, 60, 117),
                                  // headColor: Color.fromARGB(255, 232, 65, 24),
                                  gradientStartColor: Colors.white,
                                  gradientEndColor: Colors.white),
                              MocHomeAppSmallCard(
                                  notificationCount: closingMocFormsLength,
                                  title: "Kapanış Onayları",
                                  subtitle: '',
                                  onTap: () async {
                                    await NavigationService.instance
                                        .navigateToPage(NavigationConstants
                                            .CLOSING_MOC_FORM_VIEW);
                                  },
                                  headColor: Color.fromARGB(255, 39, 60, 117),
                                  // headColor: Color.fromARGB(255, 232, 65, 24),
                                  gradientStartColor: Colors.white,
                                  gradientEndColor: Colors.white),
                            ],
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
