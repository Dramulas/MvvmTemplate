import 'dart:io';
import 'package:template_mobile/view/moc_app/model/moc_technical_opinion_acceptance_model.dart';
import 'package:template_mobile/view/moc_app/viewmodel/subviewmodel/moc_technical_acceptance_detail_view_model.dart';
import 'package:flutter/material.dart';
import '../model/give_technical_opinion_acceptance_model.dart';
import '../service/moc_technical_opinion_acceptance_service.dart';
import '../view/moc_technical_acceptance_view.dart';

class GiveTechnicalAcceptanceButton extends StatefulWidget {
  final TechnicalOAModel model;
  final TechnicalAcceptanceDetailViewModel viewModel;
  const GiveTechnicalAcceptanceButton({
    Key? key,
    required this.viewModel,
    required this.model,
  }) : super(key: key);

  @override
  _GiveTechnicalAcceptanceButtonState createState() =>
      _GiveTechnicalAcceptanceButtonState();
}

class _GiveTechnicalAcceptanceButtonState
    extends State<GiveTechnicalAcceptanceButton> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
        fixedSize: MaterialStateProperty.all(Size(170, 60)),
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

        final response = await TechnicalOpinionAcceptanceService.instance!
            .giveTechnicalOA(GiveTechnicalOAModel(
                techOAId: widget.model.techOAId,
                techOAComment: widget.model.techOAComment));
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
                      builder: (context) => TechnicalAcceptanceView()),
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
                      builder: (context) => TechnicalAcceptanceView()),
                  (route) => route.isFirst));
        }
      },
      child: Text("Onayla",
          textAlign: TextAlign.center,
          style: TextStyle(
            letterSpacing: 2,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          )),
    );
  }
}
