import '../../../../model/finding_model.dart';
import 'package:flutter/material.dart';

class FieldManagerStatementsTextFormField extends StatefulWidget {
  const FieldManagerStatementsTextFormField(
      {Key? key,
      required TextEditingController controllerFieldManagerStatements,
      required this.finding,
      required this.isAuthorized})
      : _controllerFieldManagerStatements = controllerFieldManagerStatements,
        super(key: key);

  final TextEditingController _controllerFieldManagerStatements;
  final FindingModel finding;
  final bool isAuthorized;

  @override
  _FieldManagerStatementsTextFormFieldState createState() =>
      _FieldManagerStatementsTextFormFieldState();
}

class _FieldManagerStatementsTextFormFieldState
    extends State<FieldManagerStatementsTextFormField> {
  @override
  Widget build(BuildContext context) => TextFormField(
        readOnly: widget.isAuthorized,
        enabled: widget.isAuthorized,
        controller: widget._controllerFieldManagerStatements,
        keyboardType: TextInputType.multiline,
        maxLines: 5,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        decoration: InputDecoration(
          fillColor: Colors.white,
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.black26, width: 2.0),
            borderRadius: BorderRadius.circular(5),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.black26, width: 2.0),
            borderRadius: BorderRadius.circular(5),
          ),
        ),
        onSaved: (val) {
          // setState(() {
          widget.finding.fieldResponsibleExplanation =
              widget._controllerFieldManagerStatements.text;
          // });
        },
        onChanged: (val) {
          widget.finding.fieldResponsibleExplanation =
              widget._controllerFieldManagerStatements.text;
        },
      );
}
