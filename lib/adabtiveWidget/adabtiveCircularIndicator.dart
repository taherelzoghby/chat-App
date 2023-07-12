import 'package:chat_with_flutter/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class adabtiveCircularIndicator extends StatelessWidget {
  const adabtiveCircularIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    if (getOs() == 'android') {
      return CircularProgressIndicator();
    } else {
      return CupertinoActivityIndicator();
    }
  }
}
