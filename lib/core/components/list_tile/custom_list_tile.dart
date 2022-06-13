import 'package:flutter/material.dart';

class CustomListTile extends StatelessWidget {
  final IconData leadingIcon;
  final BuildContext context;
  final String title;
  final TextStyle titleStyle;
  final TextStyle subtitleStyle;
  final String subtitle;
  final Color tileColor;
  const CustomListTile({
    Key? key,
    required this.leadingIcon,
    required this.title,
    required this.subtitle,
    required this.tileColor,
    required this.titleStyle,
    required this.subtitleStyle,
    required this.context,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(leadingIcon),
      title: Text(title, style: titleStyle),
      subtitle: Text(subtitle, style: subtitleStyle),
      tileColor: tileColor,
    );
  }
}
