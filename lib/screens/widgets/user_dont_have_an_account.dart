import 'package:chat_with_flutter/adabtiveWidget/adabtiveEmptyButton.dart';
import 'package:flutter/material.dart';
import '../register.dart';

class user_dont_have_an_account extends StatelessWidget {
  const user_dont_have_an_account({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Don\'t have an account?',
          style: TextStyle(
            color: Colors.grey.withOpacity(.7),
            fontWeight: FontWeight.bold,
          ),
        ),
        adabtiveEmptyButton(
          on_tap: () => Navigator.of(context).pushReplacementNamed(
            registerPage.id,
          ),
          widget: Text("Sign up"),
        ),
      ],
    );
  }
}
