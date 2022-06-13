import '../common/custom_theme.dart';
import 'package:flutter/material.dart';

class CustomCheckbox extends StatefulWidget {
  final VoidCallback changeIsChecked;
  final bool isChecked;

  CustomCheckbox(
      {Key? key, required this.changeIsChecked, required this.isChecked})
      : super(key: key);
  @override
  _CustomCheckboxState createState() => _CustomCheckboxState();
}

class _CustomCheckboxState extends State<CustomCheckbox> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.changeIsChecked,
      child: Container(
        decoration: BoxDecoration(
          color: widget.isChecked ? primaryBlue : Colors.transparent,
          borderRadius: BorderRadius.circular(4.0),
          border:
              widget.isChecked ? null : Border.all(color: textGrey, width: 1.5),
        ),
        width: 20,
        height: 20,
        child: widget.isChecked
            ? Icon(
                Icons.check,
                size: 20,
                color: Colors.white,
              )
            : null,
      ),
    );
  }
}
