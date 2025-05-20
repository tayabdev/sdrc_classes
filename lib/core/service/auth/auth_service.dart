import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  // we will authenticate user--login/signup...
  // Create User
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  Future<void> createUser(String email, String password) async {
    UserCredential userCredential = await firebaseAuth
        .createUserWithEmailAndPassword(email: email, password: password);

    if (userCredential.user != null) {
      print(userCredential.user!.uid);
      print('=======================');
      print(userCredential.user);
    }

    // try {

    // } catch (e) {
    //   print('An error has occured $e');
    // }
  }

  Future<void> lginUser(String email, String password) async {
    await firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password);
  }

// Signout user
  Future<void> signOut() async {
    try {
      await firebaseAuth.signOut();
    } catch (e) {
      print(e);
    }
  }
}
