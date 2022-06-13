import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../../../../core/base/view/base_view.dart';
import '../../../../core/components/button/rectangular_round_button.dart';
import '../../../../core/extensions/context_extension.dart';
import '../../../../product/common/_product/_constants/image_path_svg.dart';
import '../../../../product/common/_widgets/constant_widgets/widget._functions.dart';
import '../../../safety_tour_app/components/tour_list_view_common.dart';
import '../model/bypass_form_model.dart';
import '../service/confirmation_inbox_service.dart';
import '../viewmodel/confirmation_inbox_view_model.dart';

class ConfirmationInboxView extends StatefulWidget {
  const ConfirmationInboxView({Key? key}) : super(key: key);

  @override
  _ConfirmationInboxViewState createState() => _ConfirmationInboxViewState();
}

class _ConfirmationInboxViewState extends State<ConfirmationInboxView> {
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
    // List<ByPassFormModel>? data = <ByPassFormModel>[
    //   ByPassFormModel(
    //     actionPlan: "Action Plan 1",
    //     alarmSet: "Alarm Set 1",
    //     biifNo: "BIIF No. 1",
    //     boundEquipmentId: 0,
    //     boundEquipmentName: "Bound Equipment 1",
    //     boundEquipmentTypeName: "Bound Equipment Type 1",
    //     byPassCause:
    //         "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque tincidunt felis enim, sed commodo ante mollis ac. Quisque ornare enim nec urna bibendum varius. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Ut quis iaculis felis. Phasellus luctus semper velit. In mattis mauris eget enim elementum venenatis. Pellentesque tristique odio vitae eros vulputate tristique. Fusce dapibus lorem et urna pharetra, mollis vestibulum diam luctus. Aliquam ut diam ut metus aliquet molestie.",
    //     byPassCompletedDate: "By Pass Completed Date 1",
    //     byPassFormCreatedDate: "By Pass Form Created Date 1",
    //     byPassFormStatus: "By Pass Form Status 1",
    //     byPassFormTimePassed: "By Pass Form Time Passed 1",
    //     byPassStartDate: "By Pass Start Date 1",
    //     byPassSystemCompletedDate: "By Pass System Completed Date 1",
    //     estimatedByPassTime: 10,
    //     explanationsOpinions: "Explanations/Opinions 1",
    //     function: "Function 1",
    //     id: 1,
    //     measurementToolId: 1,
    //     measurementToolName: "Measurement Tool 1",
    //     mosByPassSwitchTagNo: "MOS By Pass Switch Tag No. 1",
    //     parametersToBeFollowed: "Parameters To Be Followed 1",
    //     peopleDoByPassIds: [0, 1],
    //     peopleDoByPassNames: "People Do By Pass 1; People Do By Pass 2",
    //     posByPassSwitchTagNo: "POS By Pass Switch Tag No. 1",
    //     potentialDangerAndOutcome: "Potential Danger And Outcome 1",
    //     refineryId: 1,
    //     refineryName: "Refinery 1",
    //     safetySystemExplanation: "Safety System Explanation 1",
    //     safetySystemSubTypeId: 1,
    //     safetySystemSubTypeName: "Safety System Sub Type 1",
    //     safetySystemTypeId: 1,
    //     safetySystemTypeName: "Safety System Type 1",
    //     sectionId: 1,
    //     sectionName: "Section 1",
    //     silLevel: 1,
    //     tripParameterTagNo: "Trip Parameter Tag No. 1",
    //     tripSet: "Trip Set 1",
    //     unitId: 1,
    //     unitName: "Unit 1",
    //     userCreatedFormName: "User Created Form Name 1",
    //     voting: "Voting 1",
    //     verballyInformedPeopleNames: "Verbally Informed People Names 1",
    //     unitsToBeEffectedInUrgentSituationsNames:
    //         "Units To Be EffectedInUrgentSituationsNames 1",
    //   ),
    // ];
    return BaseView<ConfirmationInboxViewModel>(
      viewModel: ConfirmationInboxViewModel(),
      onModelReady: (ConfirmationInboxViewModel model) {
        model.setContext(context);
        model.init();
      },
      onPageBuilder:
          (BuildContext context, ConfirmationInboxViewModel viewModel) =>
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
                    child: FutureBuilder<List<ByPassFormModel>?>(
                        future: ConfirmationInboxService.instance!
                            .getConfirmationItems(),
                        builder: (context, snapshot) {
                          if (snapshot.hasError) {
                            return buildNoDataColumn(
                                SVGImagePaths.instance!.errorGettingDataByPass,
                                "Oturum süreniz dolmuştur. Lütfen tekrar giriş yapınız.");
                          } else if (snapshot.hasData) {
                            if (snapshot.data!.isEmpty) {
                              return buildNoDataColumn(
                                SVGImagePaths.instance!.noDataToConfirm,
                                "Bekleyen bypass formu bulunmamaktadır.",
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
                            return buildCPI(context);
                          } else {
                            return buildNoDataColumn(
                                SVGImagePaths.instance!.noDataToConfirm,
                                "Onaylanacak bypass bulunmamaktadır.");
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
      List<ByPassFormModel>? data, ConfirmationInboxViewModel viewModel) {
    return ListView.builder(
        itemCount: data?.length ?? 0,
        itemBuilder: (context, index) {
          if (data?.isEmpty ?? true) {
            return buildNoDataColumn(SVGImagePaths.instance!.noDataToConfirm,
                "Bekleyen bypass formu bulunmamaktadır.");
          }
          return buildSlidable(data ?? [], index, viewModel, context);
        });
  }

  Slidable buildSlidable(List<ByPassFormModel> data, int index,
      ConfirmationInboxViewModel viewModel, BuildContext context) {
    return Slidable(
      controller: _slidableController,
      key: Key(
        data[index].id.toString(),
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
              viewModel.navigateToConfirmationDetailView(
                data[index],
              );
            },
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(vertical: context.height * 0.022),
          height: double.maxFinite,
          child: IconSlideAction(
            closeOnTap: true,
            color: Colors.green,
            icon: Icons.check_circle_outlined,
            onTap: () async => viewModel.approveByPass(data[index], context),
          ),
        ),
      ],
      child: Padding(
        padding: context.paddingLowAll,
        child: buildColumn(data[index], viewModel),
      ),
    );
  }

  GestureDetector buildColumn(
      ByPassFormModel item, ConfirmationInboxViewModel viewModel) {
    return GestureDetector(
        onTap: () async {
          await viewModel.navigateToConfirmationDetailView(item);
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
                                .navigateToConfirmationDetailView(item);
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
      AsyncSnapshot<List<ByPassFormModel>?> snapshot, int index) {
    return Text(
      snapshot.data![index].byPassCause!.length > 20
          ? snapshot.data![index].byPassCause!.substring(0, 20) + "..."
          : snapshot.data![index].byPassCause!,
      style: TextStyle(
        fontSize: 12,
        color: Colors.white,
      ),
    );
  }
}

Padding buildLeftColumnConfirmation(
    ByPassFormModel item, BuildContext context) {
  return Padding(
    padding: EdgeInsets.all(8.0.w),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          item.refineryName ?? '',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 21.sm,
          ),
        ),
        SizedBox(height: 5),
        Text(item.sectionName ?? '',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 12.sm,
            )),
        buildText(item.safetySystemTypeName ?? ""),
        Text(
          "By-Pass No: " + item.id.toString(),
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 12.sm,
          ),
        ),
      ],
    ),
  );
}

Column buildRightColumnConfirmation(
    ByPassFormModel item, BuildContext context) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      SizedBox(height: 15.h),
      buildByPassFormCreatedDate(item),
      SizedBox(height: 5.h),
      buildByPassFormStatus(item),
      SizedBox(height: 5.h),
      //buildTextHeader("Onay Sırası"),
      buildTextHeader(item.order ?? ""),
    ],
  );
}

RectangularRoundButton buildByPassFormStatus(ByPassFormModel item) {
  return RectangularRoundButton(
    child: Text(
      item.tripParameterTagNo ?? "",
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

RectangularRoundButton buildByPassFormCreatedDate(ByPassFormModel item) {
  return RectangularRoundButton(
    child: Text(
      item.byPassStartDate ?? "",
      textAlign: TextAlign.start,
      style: TextStyle(
        fontSize: 8.sp,
        color: Colors.white,
      ),
    ),
    padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.w),
    borderRadius: 5.r,
    borderWidth: 0,
    buttonColor: Colors.blueGrey.shade900,
  );
}
