import '../../../../core/init/theme/light/color_scheme_light.dart';
import 'package:flutter/material.dart';

import '../../../../core/extensions/context_extension.dart';

class OnBoardCircle extends StatelessWidget {
  const OnBoardCircle(
      {Key? key, required this.isSelected, required this.currentIndex})
      : super(key: key);

  final bool isSelected;
  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.paddingLowAll,
      child: CircleAvatar(
        backgroundColor: ColorSchemeLight.instance!.templateBlue
            .withOpacity(isSelected ? 1 : 0.2),
        radius: isSelected ? context.width * 0.024 : context.width * 0.012,
        child: AnimatedOpacity(
          duration: context.durationLow,
          opacity: isSelected ? 1 : 0,
          child: Text(currentIndex.toString()),
        ),
      ),
    );
  }
}
