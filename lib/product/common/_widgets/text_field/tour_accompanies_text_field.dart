import '../../../../core/extensions/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../view/safety_tour_app/model/tour_model.dart';

class TourAccompaniesTextField extends StatelessWidget {
  const TourAccompaniesTextField({
    Key? key,
    required TextEditingController controllerTourAccompaniers,
    required this.tour,
  })  : _controllerTourAccompaniers = controllerTourAccompaniers,
        super(key: key);

  final TextEditingController _controllerTourAccompaniers;
  final TourModel tour;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
          labelText: "Tura Eşlik Edenler",
          floatingLabelBehavior: FloatingLabelBehavior.always,
          labelStyle: TextStyle(fontSize: 16.sp)),
      focusNode: FocusNode(canRequestFocus: false),
      controller: _controllerTourAccompaniers,
      keyboardType: TextInputType.multiline,
      maxLines: 2,
      onSaved: (val) {
        tour.tourAccompaniers = _controllerTourAccompaniers.text;
      },
      onChanged: (val) {
        tour.tourAccompaniers = _controllerTourAccompaniers.text;
      },
      style: context.textTheme.headline6!.copyWith(fontSize: 12),
    );
  }
}
