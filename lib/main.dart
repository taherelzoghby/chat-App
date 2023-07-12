import 'package:chat_with_flutter/constants.dart';
import 'package:chat_with_flutter/firebase_options.dart';
import 'package:chat_with_flutter/screens/chatPage.dart';
import 'package:chat_with_flutter/screens/login.dart';
import 'package:chat_with_flutter/screens/register.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    if (getOs() == 'android') {
      return MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
          useMaterial3: true,
          textTheme: GoogleFonts.poppinsTextTheme(),
        ),
        home: registerPage(),
        routes: {
          loginPage.id: (context) => loginPage(),
          registerPage.id: (context) => registerPage(),
          chatPage.id: (context) => chatPage(),
        },
      );
    } else {
      return CupertinoApp(
        title: 'Chat',
        debugShowCheckedModeBanner: false,
        theme: CupertinoThemeData(),
        home: registerPage(),
        routes: {
          loginPage.id: (context) => loginPage(),
          registerPage.id: (context) => registerPage(),
          chatPage.id: (context) => chatPage(),
        },
      );
    }
  }
}
