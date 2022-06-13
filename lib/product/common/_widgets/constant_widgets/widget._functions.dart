import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/navigation/navigation_constants.dart';
import '../../../../core/extensions/context_extension.dart';
import '../../../../core/init/navigation/navigation_service.dart';
import '../../../../view/safety_tour_app/components/tour_list_view_common.dart';
import '../../_product/_constants/image_path_svg.dart';

Widget addVerticalSpace(double height) {
  return SizedBox(height: height);
}

Widget addHorizontalSpace(double width) {
  return SizedBox(width: width);
}

Widget addEmptyWidget() {
  return const SizedBox(height: 0, width: 0);
}

void showSnackBarMessage(
    {required BuildContext context, required String message}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      elevation: 10,
      duration: const Duration(seconds: 2),
      content: Text(
        message,
        style: const TextStyle(color: Colors.white),
      ),
      backgroundColor: Colors.blueGrey,
    ),
  );
}

Column buildNoDataColumn(String svgPath, String description) {
  return Column(
    mainAxisSize: MainAxisSize.min,
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Spacer(
        flex: 2,
      ),
      buildEmptyDataSVG(svgPath),
      Spacer(
        flex: 2,
      ),
      buildNoDataText(description),
      Spacer(
        flex: 4,
      ),
    ],
  );
}

Padding buildTokenExpiredPadding(BuildContext context) {
  // LocaleManager.instance.clearAllSaveFirst();
  return Padding(
    padding: context.paddingLowAll,
    child: buildSessionExpiredTextButton(
      SVGImagePaths.instance!.errorGettingDataByPass,
      Wrap(
        children: [
          Text(
            "Oturum süreniz dolmuştur. Lütfen tekrar ",
            style: context.textTheme.bodyText1,
            textAlign: TextAlign.center,
          ),
          InkWell(
            onTap: () {
              NavigationService.instance.navigateToPageClear(
                  NavigationConstants.LOGIN_VIA_AZURE_VIEW);
            },
            child: Text("giriş yapınız.",
                style: context.textTheme.bodyText1!
                    .copyWith(color: context.colors.onSurface)),
          )
        ],
      ),
    ),
  );
}

Expanded buildNoDataText(String description) {
  return Expanded(
    flex: 4,
    child: Text(
      description,
      style: TextStyle(fontSize: 16),
      textAlign: TextAlign.center,
    ),
  );
}

Column buildSessionExpiredTextButton(String svgPath, Widget description) {
  return Column(
    mainAxisSize: MainAxisSize.min,
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Spacer(
        flex: 2,
      ),
      buildEmptyDataSVG(svgPath),
      Spacer(
        flex: 2,
      ),
      description,
      Spacer(
        flex: 4,
      ),
    ],
  );
}

Expanded buildEmptyDataSVG(String svgPath) {
  return Expanded(
    flex: 12,
    child: Padding(
      padding: EdgeInsets.only(top: 32.h, left: 32.w, right: 32.w),
      child: buildSvgPicture(svgPath),
    ),
  );
}

Column buildLeftColumn(dynamic tour) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        tour.fieldName ?? '',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 21.sm,
        ),
      ),
      SizedBox(height: 5),
      Text(tour.locationName ?? '',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 12.sm,
          )),
      buildTextHeader("Ekip üyeleri"),
      buildText(tour.tourTeamMembers ?? ""),
    ],
  );
}

Column buildRightColumn(dynamic tour) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      buildTourDateRoundButton(tour),
      SizedBox(height: 10.h),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: getStarRating(
            tour.fieldOrganizationOrderScore ?? 0, Colors.blueGrey.shade900),
      ),
      SizedBox(height: 10.h),
      buildTextHeader("Eşlik edenler"),
      buildText(tour.tourAccompaniers ?? ""),
    ],
  );
}
