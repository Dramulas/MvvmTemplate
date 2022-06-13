import 'dart:io';
import 'package:flutter/material.dart';
import '../model/approve_closing_moc_form_model.dart';
import '../model/moc_closing_approvals_model.dart';
import '../service/moc_closing_moc_form_service.dart';
import '../view/moc_closing_moc_form_view.dart';
import '../viewmodel/subviewmodel/moc_closing_moc_form_detail_view_model.dart';

class ApproveClosingMocFormButton extends StatefulWidget {
  final ClosingMocFormModel model;
  final ClosingMocFormDetailViewModel viewModel;
  const ApproveClosingMocFormButton({
    Key? key,
    required this.viewModel,
    required this.model,
  }) : super(key: key);

  @override
  _ApproveClosingMocFormButtonState createState() =>
      _ApproveClosingMocFormButtonState();
}

class _ApproveClosingMocFormButtonState
    extends State<ApproveClosingMocFormButton> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
        fixedSize: MaterialStateProperty.all(Size(320, 60)),
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
        final response = await ClosingMocFormService.instance!
            .approveClosingMocForm(ApproveClosingMocFormModel(
                mocFormId: widget.model.mocFormId, notes: widget.model.notes));
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
                  MaterialPageRoute(builder: (context) => ClosingMocFormView()),
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
                  MaterialPageRoute(builder: (context) => ClosingMocFormView()),
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
