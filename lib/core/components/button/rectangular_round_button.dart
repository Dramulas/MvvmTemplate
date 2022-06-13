import 'package:flutter/material.dart';

class RectangularRoundButton extends StatelessWidget {
  final bool isElevated;
  final Color elevationShadowColor;
  final Widget child;
  final EdgeInsetsGeometry padding;
  final Color buttonColor;
  final double borderWidth;
  final Color borderColor;
  final double borderRadius;
  final double? width;

  const RectangularRoundButton({
    required this.child,
    required this.buttonColor,
    this.borderWidth = 0,
    this.borderColor = Colors.grey,
    this.width,
    this.borderRadius = 20,
    this.isElevated = false,
    this.elevationShadowColor = Colors.grey,
    this.padding = const EdgeInsets.symmetric(vertical: 14, horizontal: 30),
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      decoration: BoxDecoration(
          border: borderWidth > 0
              ? Border.all(color: borderColor, width: borderWidth)
              : null,
          boxShadow: isElevated
              ? [
                  BoxShadow(
                    color: elevationShadowColor,
                    offset: const Offset(2, 2),
                    blurRadius: 4,
                  )
                ]
              : null,
          borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
          color: buttonColor),
      padding: padding,
      child: child,
    );
  }
}
