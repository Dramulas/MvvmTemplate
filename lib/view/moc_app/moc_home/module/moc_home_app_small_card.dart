import 'package:footer/footer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MocHomeAppSmallCard extends StatelessWidget {
  final String? title;
  final String? subtitle;
  final Color? gradientStartColor;
  final Color? gradientEndColor;
  final Color? headColor;

  final double? height;
  final double? width;
  final Widget? vectorBottom;
  final Widget? vectorTop;
  final double? borderRadius;
  final Widget? icon;
  final VoidCallback? onTap;
  final int notificationCount;

  const MocHomeAppSmallCard(
      {Key? key,
      this.title,
      this.subtitle,
      this.gradientStartColor,
      this.gradientEndColor,
      this.headColor,
      this.height,
      this.width,
      this.vectorBottom,
      this.vectorTop,
      this.borderRadius,
      this.icon,
      this.onTap,
      required this.notificationCount})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: InkWell(
        borderRadius: BorderRadius.circular(20),
        onTap: onTap ?? () {},
        child: Ink(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 4,
                blurRadius: 7,
                offset: Offset(2, 2), // changes position of shadow
              ),
            ],
            borderRadius: BorderRadius.circular(20),
            gradient: LinearGradient(
              colors: [
                gradientStartColor ?? Colors.white,
                gradientEndColor ?? Colors.white,
              ],
              begin: Alignment.bottomLeft,
              end: Alignment.topRight,
            ),
          ),
          child: SizedBox(
            child: Stack(
              children: [
                Container(
                  height: 20,
                  width: 100,
                  child: Text(
                    subtitle!,
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  decoration: new BoxDecoration(
                      color: headColor,
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10))),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10.w, top: 30.w, bottom: 20.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        title!,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16.w,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(
                        height: 2,
                      ),
                    ],
                  ),
                ),
                if (this.notificationCount > 0)
                  Footer(
                    alignment: Alignment.bottomCenter,
                    backgroundColor: Colors.white30.withOpacity(0.1),
                    child: Text(
                      'Bekleyen ' + '$notificationCount' + ' Bildirim',
                      style: TextStyle(
                        color: Color.fromARGB(255, 194, 54, 22),
                        fontSize: 9.w,
                        fontWeight: FontWeight.w300,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
