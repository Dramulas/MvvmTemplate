import '../../../../../../core/extensions/context_extension.dart';
import '../../../../model/finding_model.dart';
import 'package:flutter/material.dart';

class ActionsMustBeTakenTextFormField extends StatelessWidget {
  const ActionsMustBeTakenTextFormField({
    Key? key,
    required TextEditingController controllerActionMustBeTaken,
    required this.finding,
  })  : _controllerActionMustBeTaken = controllerActionMustBeTaken,
        super(key: key);

  final TextEditingController _controllerActionMustBeTaken;
  final FindingModel finding;

  @override
  Widget build(BuildContext context) => TextFormField(
        validator: (val) {
          if (val != null && val.isEmpty) {
            return "Lütfen alınması gereken aksiyonlar alanını doldurunuz.";
          }
        },
        style: context.textTheme.bodyText2!.copyWith(fontSize: 12),
        controller: _controllerActionMustBeTaken,
        keyboardType: TextInputType.multiline,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        maxLines: 5,
        decoration: InputDecoration(
          labelText: "Alınması Gereken Aksiyonlar",
          floatingLabelBehavior: FloatingLabelBehavior.always,
          labelStyle: context.textTheme.headline6,
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
          finding.actionsShouldBeTaken = _controllerActionMustBeTaken.text;
        },
        onChanged: (val) {
          finding.actionsShouldBeTaken = _controllerActionMustBeTaken.text;
        },
      );
}
