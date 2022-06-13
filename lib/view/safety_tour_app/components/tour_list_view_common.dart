import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/components/button/rectangular_round_button.dart';
import '../../../core/init/theme/light/color_scheme_light.dart';
import '../model/tour_model.dart';

SvgPicture buildSvgPicture(String path) => SvgPicture.asset(path);

RectangularRoundButton buildTourDateRoundButton(TourModel tour) {
  return RectangularRoundButton(
    child: Text(
      DateFormat.yMMMMEEEEd("tr").format(tour.tourDate!),
      textAlign: TextAlign.start,
      style: TextStyle(
        fontSize: 8.sp,
        color: Colors.white,
      ),
    ),
    padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.w),
    borderRadius: 5.r,
    borderWidth: 0,
    buttonColor: Colors.blueGrey.shade600,
  );
}

Container buildTextHeader(String value) {
  return Container(
    alignment: Alignment.center,
    child: Text(
      value,
      style: TextStyle(
          fontSize: 10.sm,
          decorationColor: Colors.blueGrey.shade900,
          fontWeight: FontWeight.w600),
    ),
  );
}

Container buildText(String? value) {
  return Container(
    alignment: Alignment.center,
    child: Text(
      value ?? '-',
      style: TextStyle(
          fontSize: 9.sp,
          decorationColor: Colors.blueGrey.shade600,
          fontWeight: FontWeight.w600),
    ),
  );
}

List<Icon> getStarRating(int rating, Color color) {
  final List<Icon> ratingIcons = [];
  for (int i = 0; i < 10; i = i + 2) {
    //5-start rating.
    if (i <= rating - 1) {
      ratingIcons.add(Icon(
        Icons.star,
        size: 13,
        color: color,
      ));
    } else {
      ratingIcons.add(Icon(
        Icons.star_border,
        color: color,
        size: 13,
      ));
    }
  }

  return ratingIcons;
}

AppBar buildAppBar(BuildContext context, String title) {
  return AppBar(
      centerTitle: true,
      title: Text(
        title,
        style: TextStyle(
          color: ColorSchemeLight.instance!.appBarTitleColor,
        ),
      ));
}
