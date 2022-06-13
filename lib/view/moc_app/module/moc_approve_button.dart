import 'dart:io';
import 'package:template_mobile/core/init/cache/locale_manager.dart';
import 'package:template_mobile/view/esd_app/home/model/sign_in_safety_tour_model.dart';
import 'package:template_mobile/view/moc_app/model/approve_moc_form_model.dart';
import 'package:template_mobile/view/moc_app/model/moc_form_model.dart';
import 'package:flutter/material.dart';
import '../../authenticate/login/model/sign_in_response.dart';
import '../service/moc_form_service.dart';
import '../view/moc_form_view.dart';
import '../viewmodel/subviewmodel/moc_form_detail_view_model.dart';

class ApproveButton extends StatefulWidget {
  final MocFormModel model;
  final MocFormDetailViewModel viewModel;
  const ApproveButton({
    Key? key,
    required this.viewModel,
    required this.model,
  }) : super(key: key);

  @override
  _ApproveButtonState createState() => _ApproveButtonState();
}

class _ApproveButtonState extends State<ApproveButton> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
        fixedSize: MaterialStateProperty.all(Size(160, 60)),
        backgroundColor:
            MaterialStateProperty.all(Color.fromARGB(255, 64, 115, 158)),
        foregroundColor: MaterialStateProperty.all(Colors.white),
        // shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        //   RoundedRectangleBorder(
        //     borderRadius: BorderRadius.circular(8.0),
        //   ),
        // ),
      ),
      onPressed: () async {
        widget.viewModel.changeIsApproveClicked();
        widget.viewModel.changeShowCPI();
        final response =
            await MocFormService.instance!.approveMocForm(ApproveMocFormModel(
          mocFormId: widget.model.mocFormId,
        ));
        if (response.statusCode == HttpStatus.ok) {
          print("basari");
          Future.delayed(Duration(seconds: 3))
              .then((value) => widget.viewModel.changeShowCPI())
              .then((value) => widget.viewModel.changeIsSuccessfull())
              .then((value) => Future.delayed(Duration(seconds: 1))
                  .then((value) => widget.viewModel.changeIsApproveClicked())
                  .then((value) => widget.viewModel.changeIsSuccessfull()))
              .then((value) => Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => MocFormView()),
                  (route) => route.isFirst));
        } else {
          print("hata");
          Future.delayed(Duration(seconds: 3))
              .then((value) => widget.viewModel.changeShowCPI())
              .then((value) => widget.viewModel.changeShowApprovedText())
              .then((value) => Future.delayed(Duration(seconds: 1))
                  .then((value) => widget.viewModel.changeShowApprovedText())
                  .then((value) => widget.viewModel.changeIsApproveClicked()))
              .then((value) => Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => MocFormView()),
                  (route) => route.isFirst));
        }
      },
      child: Text("ONAYLA",
          style: TextStyle(
            letterSpacing: 2,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          )),
    );
  }
}
