import '../../../../core/extensions/context_extension.dart';
import 'package:flutter/material.dart';

class HomeAppContainer extends StatelessWidget {
  final String appName;
  final VoidCallback onTap;

  const HomeAppContainer({
    Key? key,
    required this.appName,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
            width: 2,
            color: context.colors.onPrimary,
            style: BorderStyle.solid),
        borderRadius: BorderRadius.circular(20),
        color: context.colors.background,
      ),
      margin: EdgeInsets.all(8),
      padding: EdgeInsets.all(8.0),
      width: MediaQuery.of(context).size.width * 0.4,
      height: MediaQuery.of(context).size.height * 0.12,
      child: InkWell(
        onTap: onTap,
        child: Center(
          child: Text(
            appName,
            style: heading2.copyWith(color: Color(0xff222222)),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}

TextStyle heading2 = TextStyle(
  fontSize: 12,
  fontWeight: FontWeight.w700,
);
