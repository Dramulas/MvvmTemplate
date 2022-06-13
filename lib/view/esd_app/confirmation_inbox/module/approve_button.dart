import 'dart:io';

import '../view/confirmation_inbox_view.dart';

import '../model/approve_bypass_model.dart';
import '../model/bypass_form_model.dart';
import '../service/confirmation_inbox_service.dart';
import 'package:flutter/material.dart';
import '../viewmodel/subviewmodel/confirmation_detail_view_model.dart';

class ApproveButton extends StatefulWidget {
  final ByPassFormModel model;
  final ConfirmationDetailViewModel viewModel;
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
        fixedSize: MaterialStateProperty.all(Size(120, 70)),
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
        final response = await ConfirmationInboxService.instance!
            .approveByPassForm(ApproveByPassModel(
                byPassFormId: widget.model.id,
                byPassFormTimeLineItemId:
                    widget.model.byPassFormTimelineItemId));
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
                  MaterialPageRoute(
                      builder: (context) => ConfirmationInboxView()),
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
                  MaterialPageRoute(
                      builder: (context) => ConfirmationInboxView()),
                  (route) => route.isFirst));
        }
      },
      child: Text("ONAYLA",
          textAlign: TextAlign.center,
          style: TextStyle(
            letterSpacing: 2,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          )),
    );
  }
}
