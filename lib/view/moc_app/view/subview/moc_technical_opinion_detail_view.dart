import 'dart:ui';

import 'package:template_mobile/view/moc_app/model/moc_technical_opinion_acceptance_model.dart';
import 'package:template_mobile/view/moc_app/viewmodel/subviewmodel/moc_technical_opinion_detail_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/base/view/base_view.dart';
import '../../../../../core/extensions/context_extension.dart';
import '../../../../../core/init/navigation/navigation_service.dart';
import '../../module/build_moc_technical_opinion_acceptance_details_column.dart';
import '../../module/moc_give_technical_opinion_button.dart';

class TechnicalOpinionDetailView extends StatefulWidget {
  const TechnicalOpinionDetailView({Key? key}) : super(key: key);

  @override
  State<TechnicalOpinionDetailView> createState() =>
      _TechnicalOpinionDetailViewState();
}

class _TechnicalOpinionDetailViewState
    extends State<TechnicalOpinionDetailView> {
  final _controllerComment = TextEditingController();
  late TechnicalOAModel model;

  @override
  Widget build(BuildContext context) {
    TechnicalOAModel model =
        ModalRoute.of(context)!.settings.arguments as TechnicalOAModel;
    return BaseView<TechnicalOpinionDetailViewModel>(
      viewModel: TechnicalOpinionDetailViewModel(),
      onModelReady: (TechnicalOpinionDetailViewModel model) {
        model.setContext(context);
        model.init();
      },
      onPageBuilder:
          (BuildContext context, TechnicalOpinionDetailViewModel viewModel) =>
              Scaffold(
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(height: 32.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  NavigationService.instance.navigatorKey.currentState!.canPop()
                      ? TextButton.icon(
                          icon: Icon(
                            Icons.arrow_back,
                            color: Colors.blue.shade700,
                            size: 24.w,
                          ),
                          onPressed: () => Navigator.pop(context),
                          label: Text(""),
                        )
                      : SizedBox(),
                ],
              ),
              Stack(
                  clipBehavior: Clip.none,
                  alignment: Alignment.center,
                  textDirection: TextDirection.rtl,
                  fit: StackFit.loose,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(0.0.w),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(0.0.w),
                        ),
                        //padding: EdgeInsets.all(5.w),
                        padding: EdgeInsets.only(
                            left: 5.0, top: 2.0, right: 5.0, bottom: 10),
                        child: Container(
                          child: buildColumn(context, viewModel, model),
                        ),
                      ),
                    ),
                    Observer(builder: (_) {
                      return Positioned(
                        bottom: (context.height * 0.5).h,
                        child: Visibility(
                          visible: viewModel.isApproveClicked,
                          child: Center(
                            child: buildBlur(
                              child: viewModel.showCPI
                                  ? Center(
                                      child: SizedBox(
                                        height: 40.0.h,
                                        width: 40.0.w,
                                        child: Transform.scale(
                                          scale: 3,
                                          child: CircularProgressIndicator(
                                            strokeWidth: 3,
                                            valueColor:
                                                AlwaysStoppedAnimation<Color>(
                                              Colors.green,
                                            ),
                                          ),
                                        ),
                                      ),
                                    )
                                  : viewModel.isSuccessfull
                                      ? Container(
                                          padding: EdgeInsets.all(24.w),
                                          child: Text(
                                            "Görüş Bildirildi!",
                                            style: TextStyle(
                                              fontSize: 28,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white,
                                            ),
                                          ),
                                        )
                                      : Container(
                                          padding: EdgeInsets.all(24.w),
                                          child: Text(
                                            "Hata!!",
                                            style: TextStyle(
                                                fontSize: 28,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.red),
                                          ),
                                        ),
                            ),
                          ),
                        ),
                      );
                    }),
                  ]),
            ],
          ),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GiveTechnicalOpinionButton(viewModel: viewModel, model: model),
            ],
          ),
        ),
      ),
    );
  }

  Column buildColumn(BuildContext context,
      TechnicalOpinionDetailViewModel viewModel, TechnicalOAModel model) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        BuildTechnicalOADetailsColumn(
            model: model, controllerComment: _controllerComment),
      ],
    );
  }

  Row buildRow(BuildContext context, TechnicalOpinionDetailViewModel viewModel,
      TechnicalOAModel model) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // ApproveButton(viewModel: viewModel, model: model),
        // RejectButton(viewModel: viewModel, model: model),
      ],
    );
  }

  Widget buildBlur(
          {required Widget child,
          double sigmaX = 10.0,
          double sigmaY = 10.0}) =>
      BackdropFilter(
        filter: ImageFilter.blur(sigmaX: sigmaX, sigmaY: sigmaY),
        child: child,
      );
}
