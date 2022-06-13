import '../../../../core/extensions/context_extension.dart';
import '../../../../product/common/_product/_constants/image_path_svg.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/base/view/base_view.dart';
import '../../../../core/constants/navigation/navigation_constants.dart';
import '../../../../core/init/navigation/navigation_service.dart';
import '../../../../product/common/_widgets/constant_widgets/widget._functions.dart';
import '../../../../product/common/_widgets/title_widget.dart';
import '../../model/tour_model.dart';
import '../service/unplanned_tour_service.dart';
import '../viewmodel/unplanned_tour_list_view_model.dart';

class UnPlannedTourListView extends StatefulWidget {
  @override
  _UnPlannedTourListViewState createState() => _UnPlannedTourListViewState();
}

class _UnPlannedTourListViewState extends State<UnPlannedTourListView> {
  bool isTokenExpired = false;
  @override
  Widget build(BuildContext context) {
    return BaseView<UnPlannedTourListViewModel>(
      viewModel: UnPlannedTourListViewModel(),
      onModelReady: (UnPlannedTourListViewModel model) {
        model.setContext(context);
        model.init();
      },
      onPageBuilder:
          (BuildContext context, UnPlannedTourListViewModel viewModel) =>
              Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.miniEndFloat,
        floatingActionButton: FloatingActionButton.extended(
          icon: Icon(Icons.add_outlined),
          elevation: 10,
          onPressed: viewModel.navigateToAddUnplannedTourView,
          label: Text("Tur Oluştur"),
        ),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.only(left: 16.w, top: 25.w),
            child: RefreshIndicator(
              onRefresh: () async {
                await NavigationService.instance.navigateToPageClear(
                  NavigationConstants.TOURS_HOME_VIEW,
                  data: 1,
                );
              },
              child: Builder(
                builder: (BuildContext context) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Expanded(
                          child: TitleWidget(
                              title: "Plansız", subtitle: 'Turlar')),
                      Expanded(
                        flex: 6,
                        child: FutureBuilder(
                          future: UnPlannedTourService.instance!
                              .getUnplannedTours(),
                          builder: (context,
                              AsyncSnapshot<List<TourModel>?> snapshot) {
                            if (snapshot.hasError) {
                              return buildTokenExpiredPadding(context);
                            } else if (snapshot.hasData) {
                              return buildListView(snapshot.data!, viewModel);
                            } else {
                              return Center(
                                  child: CircularProgressIndicator.adaptive());
                            }
                          },
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildListView(
      List<TourModel> tours, UnPlannedTourListViewModel viewModel) {
    if (tours.isEmpty) {
      return buildNoDataColumn(SVGImagePaths.instance!.noData,
          "Henüz eklenmiş bir plansız tur kaydı bulunmamaktadır.");
    }
    return buildListViewSeperated(tours, viewModel);
  }

  ListView buildListViewSeperated(
      List<TourModel> tours, UnPlannedTourListViewModel viewModel) {
    return ListView.builder(
      padding: context.paddingLowAll,
      dragStartBehavior: DragStartBehavior.down,
      itemCount: tours.length,
      itemBuilder: (context, index) {
        return buildColumn(tours[index], viewModel);
      },
    );
  }

  Widget buildColumn(TourModel tour, UnPlannedTourListViewModel viewModel) {
    return Card(
      elevation: 3,
      margin: EdgeInsets.symmetric(vertical: context.normalValue),
      color: context.colors.surface,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.r),
      ),
      child: Padding(
        padding: context.paddingLowAll,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  padding: context.paddingNormalAll,
                  width: 150.w,
                  child: buildLeftColumn(tour),
                ),
                Container(
                  padding: context.paddingLowAll,
                  width: 120.w,
                  child: buildRightColumn(tour),
                ),
                Container(
                  child: Column(
                    children: [
                      IconButton(
                        onPressed: () async {
                          await viewModel
                              .navigateToUnplannedTourDetailView(tour);
                        },
                        icon: Icon(Icons.keyboard_arrow_right,
                            // ignore: deprecated_member_use
                            color: context.colors.primaryVariant, size: 30.0.w),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
