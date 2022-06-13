import '../../../../../../core/extensions/context_extension.dart';
import '../../../../model/finding_model.dart';
import 'package:flutter/material.dart';

class ObservationsTextFormField extends StatelessWidget {
  const ObservationsTextFormField({
    Key? key,
    required TextEditingController controllerObservations,
    required this.finding,
  })  : _controllerObservations = controllerObservations,
        super(key: key);

  final TextEditingController _controllerObservations;
  final FindingModel finding;

  @override
  Widget build(BuildContext context) => TextFormField(
        validator: (val) {
          if (val!.isEmpty) {
            return "Gözlemler alanını doldurunuz.";
          }
        },
        style: context.textTheme.bodyText2!.copyWith(fontSize: 12),
        controller: _controllerObservations,
        keyboardType: TextInputType.multiline,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        maxLines: 5,
        decoration: InputDecoration(
          labelText: "Gözlemler",
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
          // setState(() {
          finding.observations = _controllerObservations.text;
          // });
        },
        onChanged: (val) {
          finding.observations = _controllerObservations.text;
        },
      );
}
