import 'package:template_mobile/view/moc_app/model/moc_form_model.dart';
import 'package:flutter/material.dart';
import 'package:template_mobile/view/moc_app/model/approve_moc_form_model.dart';
import '../service/moc_form_service.dart';
import '../view/moc_form_view.dart';
import '../viewmodel/subviewmodel/moc_form_detail_view_model.dart';

class RejectButton extends StatefulWidget {
  final MocFormModel model;
  final MocFormDetailViewModel viewModel;
  const RejectButton({
    Key? key,
    required this.viewModel,
    required this.model,
  }) : super(key: key);

  @override
  _RejectButtonState createState() => _RejectButtonState();
}

class _RejectButtonState extends State<RejectButton> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
        fixedSize: MaterialStateProperty.all(Size(160, 60)),
        backgroundColor: MaterialStateProperty.all(Colors.red),
        foregroundColor: MaterialStateProperty.all(Colors.white),
        // shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        //     RoundedRectangleBorder(
        //         borderRadius: BorderRadius.circular(18.0),
        //         side: BorderSide(color: Colors.red)))
      ),
      onPressed: () async {
        widget.viewModel.changeIsRejectClicked();
        widget.viewModel.changeShowCPI();

        await MocFormService.instance!.rejectMocForm(ApproveMocFormModel(
          mocFormId: widget.model.mocFormId,
        ));
        Future.delayed(Duration(seconds: 3))
            .then((value) => widget.viewModel.changeShowCPI())
            .then((value) => widget.viewModel.changeShowRejectedText())
            .then((value) => Future.delayed(Duration(seconds: 1))
                .then((value) => widget.viewModel.changeShowRejectedText())
                .then((value) => widget.viewModel.changeIsRejectClicked()))
            .then((value) => Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => MocFormView()),
                (route) => route.isFirst));
        setState(() {});
      },
      child: Text("REDDET",
          style: TextStyle(
            letterSpacing: 2,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          )),
    );
  }
}
