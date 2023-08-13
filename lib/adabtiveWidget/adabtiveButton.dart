import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

class adabtiveButton extends StatelessWidget {
  const adabtiveButton({
    super.key,
    required this.height,
    required this.label,
    required this.on_tap,
    required this.width,
    required this.colorText,
    required this.colorButton,
  });
  final double height;
  final double width;
  final String label;
  final Color colorText;
  final Color colorButton;
  final void Function() on_tap;

  @override
  Widget build(BuildContext context) {
    if (getOs() == 'android') {
      return InkWell(
        onTap: on_tap,
        borderRadius: BorderRadius.circular(30),
        child: Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
            color: colorButton,
            borderRadius: BorderRadius.circular(23),
          ),
          child: Center(
            child: Text(
              label,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                color: colorText,
              ),
            ),
          ),
        ),
      );
    } else {
      return CupertinoButton(
        color: colorButton,
        onPressed: on_tap,
        borderRadius: BorderRadius.circular(23),
        child: Text(
          label,
          style: TextStyle(
            fontWeight: FontWeight.w600,
            color: colorText,
          ),
        ),
      );
    }
  }
}
