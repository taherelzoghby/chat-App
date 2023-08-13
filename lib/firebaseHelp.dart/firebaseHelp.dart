import 'package:firebase_auth/firebase_auth.dart';

class Service {
  //sign in method
  Future<void> signInUser(String email, String password) async {
    // ignore: unused_local_variable
    UserCredential credential = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);
    print("success");
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
}
