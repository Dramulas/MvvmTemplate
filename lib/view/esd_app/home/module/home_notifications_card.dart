import '../../../../core/extensions/context_extension.dart';
import '../../../../core/init/theme/light/color_scheme_light.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeNotificationCard extends StatelessWidget {
  final int notificationCount;
  final String? title;
  final String? subtitle;
  final Color? gradientStartColor;
  final Color? gradientEndColor;
  final double? height;
  final double? width;
  final Widget? vectorBottom;
  final Widget? vectorTop;
  final Function? onTap;
  final String? tag;
  const HomeNotificationCard(
      {Key? key,
      this.title,
      this.subtitle,
      this.gradientStartColor,
      this.gradientEndColor,
      this.height,
      this.width,
      this.vectorBottom,
      this.vectorTop,
      this.onTap,
      this.tag,
      required this.notificationCount})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: 0.8,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () => onTap!(),
          borderRadius: BorderRadius.circular(26),
          child: Ink(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(26),
              gradient: LinearGradient(
                colors: [
                  gradientStartColor ?? ColorSchemeLight.instance!.templateBlue,
                  gradientEndColor ?? Color(0xff4E81EB),
                ],
                begin: Alignment.bottomLeft,
                end: Alignment.topRight,
              ),
            ),
            child: Container(
              height: 176.w,
              width: 305.w,
              child: Stack(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        left: 24.w, top: 24.h, bottom: 24.h, right: 6.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Hero(
                              tag: tag ?? '',
                              child: Material(
                                color: Colors.transparent,
                                child: Text(
                                  title!,
                                  style: TextStyle(
                                    fontSize: 16.w,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 5.h,
                            ),
                            subtitle != null
                                ? Text(
                                    subtitle!,
                                    style: TextStyle(
                                      fontSize: 14.w,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  )
                                : Container(),
                          ],
                        ),
                        Row(
                          children: [
                            Stack(
                              alignment: Alignment.topRight,
                              children: [
                                Icon(
                                  Icons.inbox_outlined,
                                  size: 32.w,
                                ),
                                CircleAvatar(
                                  radius: 8,
                                  backgroundColor: context.colors.background
                                      .withOpacity(0.8),
                                  foregroundColor: Colors.black,
                                  child: Text(
                                    notificationCount.toString(),
                                    style: TextStyle(fontSize: 12),
                                  ),
                                )
                              ],
                            ),
                            // SizedBox(width: 24.w),
                            // SvgAsset(
                            //   color: Colors.black54,
                            //   assetName: AssetName.chart,
                            //   height: 24.w,
                            //   width: 24.w,
                            // ),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
