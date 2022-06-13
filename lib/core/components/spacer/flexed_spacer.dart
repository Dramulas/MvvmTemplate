import 'package:flutter/material.dart';

class FlexedSpacer extends StatelessWidget {
  final int flex;
  const FlexedSpacer({
    Key? key,
    required this.flex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Spacer(
      flex: flex,
    );
  }
}
