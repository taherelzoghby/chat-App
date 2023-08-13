import 'package:chat_with_flutter/adabtiveWidget/adabtiveEmptyButton.dart';
import 'package:flutter/material.dart';
import '../login.dart';

class user_have_an_account extends StatelessWidget {
  const user_have_an_account({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Already have an account?',
          style: TextStyle(
            color: Colors.grey.withOpacity(.7),
            fontWeight: FontWeight.bold,
          ),
        ),
        adabtiveEmptyButton(
          on_tap: () => Navigator.of(context).pushReplacementNamed(
            loginPage.id,
          ),
          widget: Text('Sign In'),
        ),
      ],
    );
  }
}
