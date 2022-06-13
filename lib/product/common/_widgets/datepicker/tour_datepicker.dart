import 'package:date_time_picker/date_time_picker.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../../../core/extensions/context_extension.dart';
import 'package:flutter/material.dart';

import '../../../../view/safety_tour_app/model/tour_model.dart';

class TourDatePicker extends StatelessWidget {
  const TourDatePicker({
    Key? key,
    required TextEditingController datePickerController,
    required this.tour,
  })  : _datePickerController = datePickerController,
        super(key: key);

  final TextEditingController _datePickerController;
  final TourModel tour;

  @override
  Widget build(BuildContext context) {
    return DateTimePicker(
      validator: (val) {
        if (val == null) {
          return "Tur Tarihi Boş Bırakılamaz.";
        }
        return null;
      },
      cursorColor: Colors.blue,
      decoration: InputDecoration(
        labelText: "Tur Tarihi",
        labelStyle: TextStyle(fontSize: 16),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: Icon(Icons.date_range_outlined),
      ),
      type: DateTimePickerType.date,
      controller: _datePickerController,
      firstDate: DateTime(2000),
      calendarTitle: "Tur Tarihi",
      lastDate: DateTime(2100),
      icon: Icon(Icons.event),
      style: context.textTheme.bodyText2,
      onChanged: (val) {
        String formattedDate = DateFormat('yyyy-mm-dd')
            .format(DateTime.parse(_datePickerController.text));
        tour.tourDate = DateTime.parse(formattedDate);
      },
    );
  }
}
