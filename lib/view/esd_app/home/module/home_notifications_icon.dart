import '../../../../core/extensions/context_extension.dart';
import '../../../../core/init/theme/light/color_scheme_light.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeNotificationIcon extends StatelessWidget {
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
  const HomeNotificationIcon(
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          child: Stack(
            alignment: Alignment.topRight,
            children: [
              Icon(
                Icons.notifications_outlined,
                size: 32.w,
              ),
              CircleAvatar(
                radius: 8,
                backgroundColor: Colors.black,
                foregroundColor: Color.fromARGB(255, 255, 255, 255),
                child: Text(
                  notificationCount.toString(),
                  style: TextStyle(fontSize: 12),
                ),
              )
            ],
          ),
          onTap: () {
            // showPopover(
            //   context: context,
            //   transitionDuration: const Duration(milliseconds: 150),
            //   bodyBuilder: (context) => const ListItems(),
            //   onPop: () => print('Popover was popped!'),
            //   direction: PopoverDirection.top,
            //   width: 200,
            //   height: 400,
            //   arrowHeight: 15,
            //   arrowWidth: 30,
            // );
          },
        ),
        // SizedBox(width: 24.w),
        // SvgAsset(
        //   color: Colors.black54,
        //   assetName: AssetName.chart,
        //   height: 24.w,
        //   width: 24.w,
        // ),
      ],
    );
  }
}
