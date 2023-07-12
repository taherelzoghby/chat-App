import 'package:flutter/material.dart';

import '../../adabtiveWidget/adabtiveTextFormField.dart';

class customTextField extends StatefulWidget {
  customTextField({
    super.key,
    required this.hint,
    required this.on_changed,
  });
  final String hint;
  bool obscureText = true;
  final void Function(String)? on_changed;

  @override
  State<customTextField> createState() => _customTextFieldState();
}

class _customTextFieldState extends State<customTextField> {
  @override
  Widget build(BuildContext context) {
    bool isLandScape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    return Padding(
      padding: isLandScape
          ? EdgeInsets.symmetric(vertical: 8, horizontal: 10)
          : EdgeInsets.symmetric(vertical: 18, horizontal: 14),
      child: adabtiveTextFormField(
        valid_r: (value) {
          if (value!.isEmpty) {
            return '${widget.hint} is Empty';
          }
          return null;
        },
        hint: widget.hint,
        on_changed: widget.on_changed,
        suffixWidget: widget.hint == 'Password'
            ? IconButton(
                onPressed: () =>
                    setState(() => widget.obscureText = !widget.obscureText),
                icon: Icon(
                  widget.obscureText ? Icons.visibility : Icons.visibility_off,
                ),
              )
            : null,
        label: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(widget.hint),
        ),
        obscText: widget.hint == "Email" || widget.hint == "Name"
            ? false
            : widget.obscureText,
      ),
    );
  }
}
