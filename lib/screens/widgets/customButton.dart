import '../../adabtiveWidget/adabtiveButton.dart';
import '../../constants.dart';
import 'package:flutter/material.dart';

class customButton extends StatelessWidget {
  const customButton({
    super.key,
    required this.height,
    required this.on_tap,
    required this.label,
    required this.width,
  });

  final double height;
  final double width;
  final String label;
  final void Function() on_tap;
  @override
  Widget build(BuildContext context) {
    bool isLandScape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 45),
      child: adabtiveButton(
        height: isLandScape ? height * .1 : height * .06,
        width: width,
        label: label,
        on_tap: on_tap,
        colorButton: pColor,
        colorText: sColor,
      ),
    );
  }
}
