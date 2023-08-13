import '../constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class adabtiveTextField extends StatelessWidget {
  const adabtiveTextField({
    super.key,
    required this.hint,
    required this.textController,
    required this.suffixIcon,
  });
  final String hint;
  final TextEditingController textController;
  final Widget suffixIcon;
  @override
  Widget build(BuildContext context) {
    if (getOs() == "android") {
      return TextField(
        maxLength: 10,
        minLines: 1,
        controller: textController,
        decoration: InputDecoration(
          fillColor: Colors.grey.withOpacity(.1),
          filled: true,
          hintText: hint,
          suffixIcon: suffixIcon,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide(
              color: sColor.withOpacity(.4),
              width: 0,
            ),
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide(
              color: sColor.withOpacity(.4),
              width: 0,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide(
              color: sColor.withOpacity(.4),
              width: 0,
            ),
          ),
        ),
      );
    } else {
      return CupertinoTextField(
        controller: textController,
        placeholder: 'Type a message',
        maxLines: 10,
        minLines: 1,
        suffix: suffixIcon,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: tColor.withOpacity(.1),
        ),
      );
    }
  }
}
