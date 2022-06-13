import '../../../../../../core/extensions/context_extension.dart';

import '../../../../model/finding_model.dart';
import 'package:flutter/material.dart';

class ActionsTakenInFieldTextFormField extends StatelessWidget {
  const ActionsTakenInFieldTextFormField({
    Key? key,
    required TextEditingController controllerActionMustBeTakenInField,
    required this.finding,
  })  : _controllerActionMustBeTakenInField =
            controllerActionMustBeTakenInField,
        super(key: key);

  final TextEditingController _controllerActionMustBeTakenInField;
  final FindingModel finding;

  @override
  Widget build(BuildContext context) => TextFormField(
        validator: (val) {
          if (val!.isEmpty) {
            return "Lütfen sahada alınması gereken aksiyonlar alanını doldurunuz.";
          }
        },
        style: context.textTheme.bodyText2!.copyWith(fontSize: 12),
        controller: _controllerActionMustBeTakenInField,
        keyboardType: TextInputType.multiline,
        maxLines: 5,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        decoration: InputDecoration(
          labelText: "Sahada Alınması Gereken Aksiyonlar",
          labelStyle: context.textTheme.headline6,
          floatingLabelBehavior: FloatingLabelBehavior.always,
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
          finding.actionsTakenRightInTheField =
              _controllerActionMustBeTakenInField.text;
        },
        onChanged: (val) {
          finding.actionsTakenRightInTheField =
              _controllerActionMustBeTakenInField.text;
        },
      );
}
