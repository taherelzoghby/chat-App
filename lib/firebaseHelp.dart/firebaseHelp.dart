import 'package:firebase_auth/firebase_auth.dart';

//sign in method
Future<void> signInUser(String email, String password) async {
  // ignore: unused_local_variable
  UserCredential credential = await FirebaseAuth.instance
      .signInWithEmailAndPassword(email: email, password: password);
}

//create user method
Future<void> createUser(String email, String password) async {
  // ignore: unused_local_variable
  UserCredential credential =
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
    email: email,
    password: password,
  );
}
