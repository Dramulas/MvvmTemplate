import '../../constants/image/image_constants.dart';
import 'package:flutter/material.dart';

class TemplateLogo extends StatelessWidget {
  final double horizontalPadding;
  final String heroTag;
  final String imageName;
  const TemplateLogo({
    Key? key,
    required this.horizontalPadding,
    required this.heroTag,
    required this.imageName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
      child: Hero(
        tag: heroTag,
        child: Image.asset(ImageConstants.instance!.toPng(imageName)),
      ),
    );
  }
}
