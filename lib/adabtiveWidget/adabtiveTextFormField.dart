import '../constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class adabtiveTextFormField extends StatelessWidget {
  adabtiveTextFormField(
      {super.key,
      required this.label,
      required this.hint,
      required this.on_changed,
      this.valid_r,
      this.suffixWidget,
      required this.obscText});
  final Widget label;
  final String hint;
  bool obscureText = true;
  final void Function(String)? on_changed;
  final String? Function(String?)? valid_r;
  final Widget? suffixWidget;
  final bool obscText;
  @override
  Widget build(BuildContext context) {
    if (getOs() == "android") {
      return TextFormField(
        validator: (v) => valid_r!(v!),
        obscureText: obscText,
        onChanged: on_changed,
        decoration: InputDecoration(
          fillColor: pColor.withOpacity(.3),
          suffixIcon: suffixWidget,
          filled: true,
          label: label,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide(
              color: sColor,
              width: 0,
            ),
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide(
              color: sColor,
              width: 0,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide(
              color: sColor,
              width: 0,
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide(
              color: sColor,
              width: 0,
            ),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide(
              color: sColor,
              width: 0,
            ),
          ),
        ),
      );
    } else {
      return CupertinoTextFormFieldRow(
        placeholder: hint,
        obscureText: obscText,
        onChanged: on_changed,
        validator: (v) => valid_r!(v!),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: tColor.withOpacity(.1),
        ),
      );
    }
  }
}
