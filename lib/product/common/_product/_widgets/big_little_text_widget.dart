import '../../../../core/components/text/auto_locale.text.dart';
import 'package:flutter/material.dart';

Widget buildLittleTextWidget(String? title) {
  if (title == null) {
    return Center(
      child: CircularProgressIndicator(),
    );
  }
  return AutoLocaleText(
    value: title,
    style: TextStyle(fontSize: 12, fontWeight: FontWeight.normal),
  );
}

Widget buildBiggerDataTextWidget(dynamic data) {
  var finalResult = "";
  if (data is List) {
    data.forEach((dynamic element) {
      finalResult += element['name'] + ", ";
    });
  }

  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: AutoLocaleText(
      value: data is List ? finalResult : data,
      style: TextStyle(
        fontSize: 16,
      ),
    ),
  );
}
