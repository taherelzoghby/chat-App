import 'package:chat_with_flutter/screens/widgets/user_dont_have_an_account.dart';
import '../constants.dart';
import '../firebaseHelp.dart/firebaseHelp.dart';
import 'chatPage.dart';
import 'widgets/customButton.dart';
import 'widgets/customTextFormField.dart';
import 'widgets/showSnack.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../adabtiveWidget/adabtiveCircularIndicator.dart';

class loginPage extends StatefulWidget {
  static String id = 'loginPage';
  const loginPage({super.key});

  @override
  State<loginPage> createState() => _loginPageState();
}

class _loginPageState extends State<loginPage> {
  //unique global key for form
  final _key = GlobalKey<FormState>();
  //email and password fields
  String email = '';
  String password = '';
  String name = '';
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    //screen height
    double height = MediaQuery.of(context).size.height;
    //screen width
    double width = MediaQuery.of(context).size.width;
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        if (getOs() == 'android') {
          if (constraints.maxWidth <= 500) {
            return Scaffold(
              body: SafeArea(
                child: ModalProgressHUD(
                  progressIndicator: adabtiveCircularIndicator(),
                  inAsyncCall: isLoading,
                  child: Form(
                    key: _key,
                    child: ListView(
                      children: [
                        //space
                        SizedBox(height: height * .18),
                        Text(
                          'Login',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        //name
                        customTextField(
                          hint: 'Name',
                          on_changed: (String value) => name = value,
                        ),
                        //email
                        customTextField(
                          hint: 'Email',
                          on_changed: (String value) => email = value,
                        ),
                        //password
                        customTextField(
                          hint: 'Password',
                          on_changed: (String value) => password = value,
                        ),
                        //login button
                        customButton(
                          height: height,
                          on_tap: signIn,
                          label: 'Login',
                          width: width,
                        ),
                        //user don't have an account?
                        user_dont_have_an_account(),
                      ],
                    ),
                  ),
                ),
              ),
            );
          } else {
            return Scaffold(
              body: SafeArea(
                child: ModalProgressHUD(
                  progressIndicator: adabtiveCircularIndicator(),
                  inAsyncCall: isLoading,
                  child: Form(
                    key: _key,
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            'Login',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: width * .5,
                          child: ListView(
                            children: [
                              SizedBox(height: height * .15),
                              //name
                              customTextField(
                                hint: 'Name',
                                on_changed: (String value) => name = value,
                              ),
                              SizedBox(height: height * .05),
                              //email
                              customTextField(
                                hint: 'Email',
                                on_changed: (String value) => email = value,
                              ),
                              SizedBox(height: height * .05),
                              //password
                              customTextField(
                                hint: 'Password',
                                on_changed: (String value) => password = value,
                              ),
                              SizedBox(height: height * .05),
                              //login button
                              customButton(
                                height: height,
                                on_tap: signIn,
                                label: 'Login',
                                width: width,
                              ),
                              SizedBox(height: height * .05),
                              //user don't have an account?
                              FittedBox(
                                fit: BoxFit.scaleDown,
                                child: user_dont_have_an_account(),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          }
        } else {
          if (constraints.maxWidth <= 500) {
            return CupertinoPageScaffold(
              child: SafeArea(
                child: ModalProgressHUD(
                  progressIndicator: adabtiveCircularIndicator(),
                  inAsyncCall: isLoading,
                  child: Form(
                    key: _key,
                    child: ListView(
                      children: [
                        //space
                        SizedBox(height: height * .18),
                        Text(
                          'Login',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        //name
                        customTextField(
                          hint: 'Name',
                          on_changed: (String value) => name = value,
                        ),
                        //email
                        customTextField(
                          hint: 'Email',
                          on_changed: (String value) => email = value,
                        ),
                        //password
                        customTextField(
                          hint: 'Password',
                          on_changed: (String value) => password = value,
                        ),
                        //login button
                        customButton(
                          height: height,
                          on_tap: signIn,
                          label: 'Login',
                          width: width,
                        ),
                        //user don't have an account?
                        user_dont_have_an_account(),
                      ],
                    ),
                  ),
                ),
              ),
            );
          } else {
            return CupertinoPageScaffold(
              child: SafeArea(
                child: ModalProgressHUD(
                  progressIndicator: adabtiveCircularIndicator(),
                  inAsyncCall: isLoading,
                  child: Form(
                    key: _key,
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            'Login',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: width * .5,
                          child: ListView(
                            children: [
                              SizedBox(height: height * .15),
                              //name
                              customTextField(
                                hint: 'Name',
                                on_changed: (String value) => name = value,
                              ),
                              SizedBox(height: height * .05),
                              //email
                              customTextField(
                                hint: 'Email',
                                on_changed: (String value) => email = value,
                              ),
                              SizedBox(height: height * .05),
                              //password
                              customTextField(
                                hint: 'Password',
                                on_changed: (String value) => password = value,
                              ),
                              SizedBox(height: height * .05),
                              //login button
                              customButton(
                                height: height,
                                on_tap: signIn,
                                label: 'Login',
                                width: width,
                              ),
                              SizedBox(height: height * .05),
                              //user don't have an account?
                              FittedBox(
                                fit: BoxFit.scaleDown,
                                child: user_dont_have_an_account(),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          }
        }
      },
    );
  }

//signIn method
  signIn() async {
    if (_key.currentState!.validate()) {
      setState(() => isLoading = true);
      try {
        await Service().signInUser(email, password);
        showSnack(context, 'Register Success');
        Navigator.of(context).pushReplacementNamed(
          chatPage.id,
          arguments: {'name': name, kId: email},
        );
      } on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {
          showSnack(context, 'No user found for that email');
        } else if (e.code == 'wrong-password') {
          showSnack(context, 'Wrong password provided for that user');
        }
      } catch (e) {
        showSnack(context, '$e');
      }
      setState(() => isLoading = false);
    }
  }
}
