import '../../../../../product/common/_widgets/constant_widgets/widget._functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/base/view/base_view.dart';
import '../../../../../core/constants/navigation/navigation_constants.dart';
import '../../../../../core/extensions/context_extension.dart';
import '../../../../../core/init/navigation/navigation_service.dart';
import '../../../../../product/common/_product/_constants/image_path_svg.dart';
import '../../../../../product/common/_widgets/title_widget.dart';
import '../../../model/tour_model.dart';
import '../viewmodel/planned_tour_list_view_model.dart';

class PlannedTourListView extends StatefulWidget {
  @override
  _PlannedTourListViewState createState() => _PlannedTourListViewState();
}

class _PlannedTourListViewState extends State<PlannedTourListView> {
  @override
  Widget build(BuildContext context) {
    return BaseView<PlannedTourListViewModel>(
      viewModel: PlannedTourListViewModel(),
      onModelReady: (PlannedTourListViewModel model) {
        model.setContext(context);
        model.init();
      },
      onPageBuilder:
          (BuildContext context, PlannedTourListViewModel viewModel) =>
              Scaffold(
                  body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(left: 16.w, top: 25.h),
          child: RefreshIndicator(onRefresh: () async {
            await NavigationService.instance
                .navigateToPageClear(NavigationConstants.TOURS_HOME_VIEW);
          }, child: Builder(
            builder: (BuildContext context) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(
                    child: TitleWidget(title: "Planlı", subtitle: 'Turlar'),
                  ),
                  Expanded(
                    flex: 6,
                    child: FutureBuilder(
                      future: viewModel.getPlannedTours(),
                      builder:
                          (context, AsyncSnapshot<List<TourModel>?> snapshot) {
                        if (snapshot.hasError) {
                          return buildTokenExpiredPadding(context);
                        } else if (snapshot.hasData) {
                          return buildListView(snapshot.data ?? [], viewModel);
                        }
                        return Center(
                          child: CircularProgressIndicator.adaptive(),
                        );
                      },
                    ),
                  ),
                ],
              );
            },
          )),
        ),
      )),
    );
  }

  Widget buildListView(
      List<TourModel> tours, PlannedTourListViewModel viewModel) {
    if (tours.isEmpty) {
      return buildNoDataColumn(SVGImagePaths.instance!.noData,
          "Henüz eklenmiş bir planlı tur kaydı bulunmamaktadır.");
    }
    return buildCards(tours, viewModel);
  }

  Card buildCard(TourModel tour, PlannedTourListViewModel viewModel) {
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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: context.paddingNormalAll,
                  width: 150.w,
                  child: buildLeftColumn(tour),
                ),
                Container(
                  padding: context.paddingNormalAll,
                  width: 120.w,
                  child: buildRightColumn(tour),
                ),
                Container(
                  child: Column(
                    children: [
                      IconButton(
                        onPressed: () async {
                          await viewModel.navigateToPlannedTourDetailView(tour);
                        },
                        icon: Icon(Icons.keyboard_arrow_right,
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

  ListView buildCards(
      List<TourModel> tours, PlannedTourListViewModel viewModel) {
    return ListView.builder(
      padding: context.paddingLowAll,
      itemCount: tours.length,
      itemBuilder: (context, index) {
        return buildCard(tours[index], viewModel);
      },
    );
  }
}
