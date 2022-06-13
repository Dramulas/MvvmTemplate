import 'package:template_mobile/view/moc_app/model/moc_technical_opinion_acceptance_model.dart';
import 'package:template_mobile/view/moc_app/service/moc_technical_opinion_acceptance_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import '../../../../core/base/view/base_view.dart';
import '../../../../core/components/button/rectangular_round_button.dart';
import '../../../../core/extensions/context_extension.dart';
import '../../../../product/common/_product/_constants/image_path_svg.dart';
import '../../../../product/common/_widgets/constant_widgets/widget._functions.dart';
import '../viewmodel/moc_technical_opinion_view_model.dart';

class TechnicalOpinionView extends StatefulWidget {
  const TechnicalOpinionView({Key? key}) : super(key: key);

  @override
  _TechnicalOpinionViewState createState() => _TechnicalOpinionViewState();
}

class _TechnicalOpinionViewState extends State<TechnicalOpinionView> {
  late final SlidableController _slidableController;

  @override
  void dispose() {
    super.dispose();
    _slidableController.activeState?.close();
  }

  @override
  void initState() {
    super.initState();
    _slidableController = SlidableController();
  }

  @override
  Widget build(BuildContext context) {
    return BaseView<TechnicalOpinionViewModel>(
      viewModel: TechnicalOpinionViewModel(),
      onModelReady: (TechnicalOpinionViewModel model) {
        model.setContext(context);
        model.init();
      },
      onPageBuilder:
          (BuildContext context, TechnicalOpinionViewModel viewModel) =>
              Scaffold(
        appBar: AppBar(
          elevation: 0,
        ),
        body: SafeArea(
          child: RefreshIndicator(
            onRefresh: () async {
              setState(() {});
            },
            child: Builder(builder: (BuildContext context) {
              return Column(
                // mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  // Expanded(
                  //   flex: 1,
                  //   child: Padding(
                  //     padding: EdgeInsets.symmetric(horizontal: 68.w),
                  //     child: Hero(
                  //       tag: "templateLogo",
                  //       child: Image.asset(ImageConstants.instance!
                  //           .toPng("800pxlogo_of_template1")),
                  //     ),
                  //   ),
                  // ),
                  Expanded(
                    child: FutureBuilder<List<TechnicalOAModel>?>(
                        future: TechnicalOpinionAcceptanceService.instance!
                            .getTechnicalOpinionItems(),
                        builder: (context, snapshot) {
                          if (snapshot.hasError) {
                            return buildNoDataColumn(
                                SVGImagePaths.instance!.errorGettingDataByPass,
                                "Oturum süreniz dolmuştur. Lütfen tekrar giriş yapınız.");
                          } else if (snapshot.hasData) {
                            if (snapshot.data!.isEmpty) {
                              return buildNoDataColumn(
                                SVGImagePaths.instance!.noDataToConfirm,
                                "Bekleyen Teknik Görüş Formu Bulunmamaktadır.",
                              );
                              // return buildListViewBuilder(data, viewModel); // yukaridaki data açılırsa kullanılacak
                            } else {
                              return buildListViewBuilder(
                                snapshot.data,
                                viewModel,
                              );
                            }
                          } else if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            print('State is Waiting');
                            return buildCPI(context);
                          } else {
                            return buildNoDataColumn(
                                SVGImagePaths.instance!.noDataToConfirm,
                                "Onaylanacak Teknik Görüş Formu Bulunmamaktadır.");
                          }
                        }),
                  ),
                ],
              );
            }),
          ),
        ),
      ),
    );
  }

  ListView buildListViewBuilder(
      List<TechnicalOAModel>? data, TechnicalOpinionViewModel viewModel) {
    return ListView.builder(
        itemCount: data?.length ?? 0,
        itemBuilder: (context, index) {
          if (data?.isEmpty ?? true) {
            return buildNoDataColumn(SVGImagePaths.instance!.noDataToConfirm,
                "Bekleyen Teknik Görüş Formu Bulunmamaktadır.");
          }
          return buildSlidable(data ?? [], index, viewModel, context);
        });
  }

  Slidable buildSlidable(List<TechnicalOAModel> data, int index,
      TechnicalOpinionViewModel viewModel, BuildContext context) {
    return Slidable(
      controller: _slidableController,
      key: Key(
        data[index].techOAId.toString(),
      ),
      actionPane: SlidableStrechActionPane(),
      actionExtentRatio: 0.15,
      closeOnScroll: true,
      secondaryActions: [
        Container(
          padding: EdgeInsets.symmetric(vertical: context.height * 0.022),
          height: double.maxFinite,
          child: IconSlideAction(
            closeOnTap: true,
            color: Colors.grey[400],
            icon: Icons.more_horiz,
            foregroundColor: Colors.white70,
            onTap: () {
              viewModel.navigateToTechnicalOpinionDetailView(
                data[index],
              );
            },
          ),
        ),
        // Container(
        //   padding: EdgeInsets.symmetric(vertical: context.height * 0.022),
        //   height: double.maxFinite,
        //   child: IconSlideAction(
        //     closeOnTap: true,
        //     color: Colors.green,
        //     icon: Icons.check_circle_outlined,
        //     onTap: () async => viewModel.approveMoc(data[index], context),
        //   ),
        // ),
      ],
      child: Padding(
        padding: context.paddingLowAll,
        child: buildColumn(data[index], viewModel),
      ),
    );
  }

  GestureDetector buildColumn(
      TechnicalOAModel item, TechnicalOpinionViewModel viewModel) {
    return GestureDetector(
        onTap: () async {
          await viewModel.navigateToTechnicalOpinionDetailView(item);
        },
        child: Card(
          color: context.colors.surface,
          elevation: 3,
          margin: context.paddingLowAll,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(context.normalValue)),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: EdgeInsets.all(context.lowValue),
                    width: 140.w,
                    child: buildLeftColumnConfirmation(item, context),
                  ),
                  Container(
                    padding: EdgeInsets.all(context.lowValue),
                    width: 120.w,
                    child: buildRightColumnConfirmation(item, context),
                  ),
                  Container(
                    child: Column(
                      children: [
                        IconButton(
                          onPressed: () async {
                            await viewModel
                                .navigateToTechnicalOpinionDetailView(item);
                          },
                          icon: Icon(Icons.keyboard_arrow_right,
                              color: Colors.black, size: 30.0.w),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ],
          ),
        ));
  }

  Center buildCPI(BuildContext context) {
    return Center(
      child: CircularProgressIndicator.adaptive(),
    );
  }

  Text buildListTileTitle(
      AsyncSnapshot<List<TechnicalOAModel>?> snapshot, int index) {
    return Text(
      snapshot.data![index].changeRequestExplanation!.length > 20
          ? snapshot.data![index].changeRequestExplanation!.substring(0, 20) +
              "..."
          : snapshot.data![index].changeRequestExplanation!,
      style: TextStyle(
        fontSize: 12,
        color: Colors.white,
      ),
    );
  }
}

Padding buildLeftColumnConfirmation(
    TechnicalOAModel item, BuildContext context) {
  return Padding(
    padding: EdgeInsets.all(8.0.w),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          item.companyName ?? '',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 21.sm,
          ),
        ),
        SizedBox(height: 5),
        Text(item.unitName ?? '',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 12.sm,
            )),
        // Text(
        //   item.mocNo.toString(),
        //   style: TextStyle(
        //     fontWeight: FontWeight.bold,
        //     fontSize: 12.sm,
        //   ),
        // ),
      ],
    ),
  );
}

Column buildRightColumnConfirmation(
    TechnicalOAModel item, BuildContext context) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      SizedBox(height: 5.h),
      // buildCreatedDate(item),
      SizedBox(height: 5.h),
      buildStatus(item),
      SizedBox(height: 5.h),
      //buildTextHeader("Onay Sırası"),
    ],
  );
}

RectangularRoundButton buildStatus(TechnicalOAModel item) {
  return RectangularRoundButton(
    child: Text(
      item.mocNo ?? "",
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 7.sp,
        color: Colors.white,
      ),
    ),
    padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.w),
    borderRadius: 5.r,
    borderWidth: 0,
    buttonColor: Colors.blueGrey.shade500,
  );
}

// RectangularRoundButton buildCreatedDate(TechnicalOAModel item) {
//   return RectangularRoundButton(
//     child: Text(
//       item. ?? "",
//       textAlign: TextAlign.start,
//       style: TextStyle(
//         fontSize: 8.sp,
//         color: Colors.white,
//       ),
//     ),
//     padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.w),
//     borderRadius: 5.r,
//     borderWidth: 0,
//     buttonColor: Colors.blueGrey.shade900,
//   );
// }
