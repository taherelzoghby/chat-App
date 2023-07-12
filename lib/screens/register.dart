import 'package:chat_with_flutter/adabtiveWidget/adabtiveCircularIndicator.dart';
import 'package:chat_with_flutter/adabtiveWidget/adabtiveEmptyButton.dart';
import 'package:chat_with_flutter/constants.dart';
import 'package:chat_with_flutter/screens/login.dart';
import 'package:chat_with_flutter/screens/widgets/customButton.dart';
import 'package:chat_with_flutter/screens/widgets/customTextFormField.dart';
import 'package:chat_with_flutter/screens/widgets/showSnack.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../firebaseHelp.dart/firebaseHelp.dart';

class registerPage extends StatefulWidget {
  static String id = 'registerPage';
  const registerPage({super.key});

  @override
  State<registerPage> createState() => _registerPageState();
}

class _registerPageState extends State<registerPage> {
  //unique global key for form
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  //email and password fields
  String email = '';
  String password = '';
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
          if (constraints.maxWidth < 550) {
            return Scaffold(
              body: SafeArea(
                child: ModalProgressHUD(
                  inAsyncCall: isLoading,
                  progressIndicator: adabtiveCircularIndicator(),
                  child: Form(
                    key: _key,
                    child: ListView(
                      children: [
                        //space
                        SizedBox(height: height * .2),
                        Text(
                          'Register',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        //email
                        customTextField(
                          hint: 'Email',
                          on_changed: (String value) {
                            email = value;
                          },
                        ),
                        //password
                        customTextField(
                          hint: 'Password',
                          on_changed: (String value) {
                            password = value;
                          },
                        ),
                        //login button
                        customButton(
                          height: height,
                          on_tap: () async {
                            if (_key.currentState!.validate()) {
                              setState(() => isLoading = true);
                              try {
                                await createUser(email, password);
                                showSnack(context, 'Register Success');
                                Navigator.of(context)
                                    .pushReplacementNamed(loginPage.id);
                              } on FirebaseAuthException catch (e) {
                                if (e.code == 'weak-password') {
                                  showSnack(context,
                                      'The password provided is too weak');
                                } else if (e.code == 'email-already-in-use') {
                                  showSnack(context,
                                      'The account already exists for that email');
                                }
                              } catch (e) {
                                showSnack(context, '$e');
                              }
                              setState(() => isLoading = false);
                            }
                          },
                          label: 'Register',
                          width: width,
                        ),
                        //user have an account?
                        Row(
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
                              on_tap: () =>
                                  Navigator.of(context).pushReplacementNamed(
                                loginPage.id,
                              ),
                              widget: Text('Sign In'),
                            ),
                          ],
                        )
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
                  inAsyncCall: isLoading,
                  progressIndicator: adabtiveCircularIndicator(),
                  child: Form(
                    key: _key,
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            'Register',
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
                              //email
                              customTextField(
                                hint: 'Email',
                                on_changed: (String value) {
                                  email = value;
                                },
                              ),
                              SizedBox(height: height * .05),
                              //password
                              customTextField(
                                hint: 'Password',
                                on_changed: (String value) {
                                  password = value;
                                },
                              ),
                              SizedBox(height: height * .05),
                              //login button
                              customButton(
                                height: height,
                                on_tap: () async {
                                  if (_key.currentState!.validate()) {
                                    setState(() => isLoading = true);
                                    try {
                                      await createUser(email, password);
                                      showSnack(context, 'Register Success');
                                      Navigator.of(context)
                                          .pushReplacementNamed(loginPage.id);
                                    } on FirebaseAuthException catch (e) {
                                      if (e.code == 'weak-password') {
                                        showSnack(context,
                                            'The password provided is too weak');
                                      } else if (e.code ==
                                          'email-already-in-use') {
                                        showSnack(context,
                                            'The account already exists for that email');
                                      }
                                    } catch (e) {
                                      showSnack(context, '$e');
                                    }
                                    setState(() => isLoading = false);
                                  }
                                },
                                label: 'Register',
                                width: width,
                              ),
                              SizedBox(height: height * .05),
                              //user have an account?
                              FittedBox(
                                fit: BoxFit.scaleDown,
                                child: Row(
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
                                      on_tap: () => Navigator.of(context)
                                          .pushReplacementNamed(
                                        loginPage.id,
                                      ),
                                      widget: Text('Sign In'),
                                    ),
                                  ],
                                ),
                              ),
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
          if (constraints.maxWidth < 550) {
            return CupertinoPageScaffold(
              child: SafeArea(
                child: ModalProgressHUD(
                  inAsyncCall: isLoading,
                  progressIndicator: adabtiveCircularIndicator(),
                  child: Form(
                    key: _key,
                    child: ListView(
                      children: [
                        //space
                        SizedBox(height: height * .2),
                        Text(
                          'Register',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        //email
                        customTextField(
                          hint: 'Email',
                          on_changed: (String value) {
                            email = value;
                          },
                        ),
                        //password
                        customTextField(
                          hint: 'Password',
                          on_changed: (String value) {
                            password = value;
                          },
                        ),
                        //login button
                        customButton(
                          height: height,
                          on_tap: () async {
                            if (_key.currentState!.validate()) {
                              setState(() => isLoading = true);
                              try {
                                await createUser(email, password);
                                showSnack(context, 'Register Success');
                                Navigator.of(context)
                                    .pushReplacementNamed(loginPage.id);
                              } on FirebaseAuthException catch (e) {
                                if (e.code == 'weak-password') {
                                  showSnack(context,
                                      'The password provided is too weak');
                                } else if (e.code == 'email-already-in-use') {
                                  showSnack(context,
                                      'The account already exists for that email');
                                }
                              } catch (e) {
                                showSnack(context, '$e');
                              }
                              setState(() => isLoading = false);
                            }
                          },
                          label: 'Register',
                          width: width,
                        ),
                        //user have an account?
                        Row(
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
                              on_tap: () =>
                                  Navigator.of(context).pushReplacementNamed(
                                loginPage.id,
                              ),
                              widget: Text('Sign In'),
                            ),
                          ],
                        )
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
                  inAsyncCall: isLoading,
                  progressIndicator: adabtiveCircularIndicator(),
                  child: Form(
                    key: _key,
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            'Register',
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
                              //email
                              customTextField(
                                hint: 'Email',
                                on_changed: (String value) {
                                  email = value;
                                },
                              ),
                              SizedBox(height: height * .05),
                              //password
                              customTextField(
                                hint: 'Password',
                                on_changed: (String value) {
                                  password = value;
                                },
                              ),
                              SizedBox(height: height * .05),
                              //login button
                              customButton(
                                height: height,
                                on_tap: () async {
                                  if (_key.currentState!.validate()) {
                                    setState(() => isLoading = true);
                                    try {
                                      await createUser(email, password);
                                      showSnack(context, 'Register Success');
                                      Navigator.of(context)
                                          .pushReplacementNamed(loginPage.id);
                                    } on FirebaseAuthException catch (e) {
                                      if (e.code == 'weak-password') {
                                        showSnack(context,
                                            'The password provided is too weak');
                                      } else if (e.code ==
                                          'email-already-in-use') {
                                        showSnack(context,
                                            'The account already exists for that email');
                                      }
                                    } catch (e) {
                                      showSnack(context, '$e');
                                    }
                                    setState(() => isLoading = false);
                                  }
                                },
                                label: 'Register',
                                width: width,
                              ),
                              SizedBox(height: height * .05),
                              //user have an account?
                              FittedBox(
                                fit: BoxFit.scaleDown,
                                child: Row(
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
                                      on_tap: () => Navigator.of(context)
                                          .pushReplacementNamed(
                                        loginPage.id,
                                      ),
                                      widget: Text('Sign In'),
                                    ),
                                  ],
                                ),
                              ),
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
}
