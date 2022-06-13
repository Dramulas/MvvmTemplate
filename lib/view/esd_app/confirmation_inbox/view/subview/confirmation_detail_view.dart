import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/base/view/base_view.dart';
import '../../../../../core/constants/image/image_constants.dart';
import '../../../../../core/extensions/context_extension.dart';
import '../../../../../core/init/navigation/navigation_service.dart';
import '../../model/bypass_form_model.dart';
import '../../module/approve_button.dart';
import '../../module/build_details_column.dart';
import '../../viewmodel/subviewmodel/confirmation_detail_view_model.dart';

class ConfirmationDetailView extends StatelessWidget {
  const ConfirmationDetailView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ByPassFormModel model =
        ModalRoute.of(context)!.settings.arguments as ByPassFormModel;
    return BaseView<ConfirmationDetailViewModel>(
      viewModel: ConfirmationDetailViewModel(),
      onModelReady: (ConfirmationDetailViewModel model) {
        model.setContext(context);
        model.init();
      },
      onPageBuilder:
          (BuildContext context, ConfirmationDetailViewModel viewModel) =>
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
                                            "Onaylandı!",
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
          child: ApproveButton(viewModel: viewModel, model: model),
        ),
      ),
    );
  }

  Column buildColumn(BuildContext context,
      ConfirmationDetailViewModel viewModel, ByPassFormModel model) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        BuildDetailsColumn(model: model),
      ],
    );
  }

  Row buildRow(BuildContext context, ConfirmationDetailViewModel viewModel,
      ByPassFormModel model) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        ApproveButton(viewModel: viewModel, model: model),
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
