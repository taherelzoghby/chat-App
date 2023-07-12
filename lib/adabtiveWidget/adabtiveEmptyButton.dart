import 'package:chat_with_flutter/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class adabtiveEmptyButton extends StatelessWidget {
  const adabtiveEmptyButton({
    super.key,
    required this.on_tap,
    required this.widget,
  });
  final void Function() on_tap;
  final Widget widget;
  @override
  Widget build(BuildContext context) {
    if (getOs() == 'android') {
      return TextButton(
        onPressed: on_tap,
        child: widget,
      );
    } else {
      return CupertinoButton(
        onPressed: on_tap,
        child: widget,
      );
    }
  }
}
