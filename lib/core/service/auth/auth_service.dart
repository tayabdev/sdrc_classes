import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  // we will authenticate user--login/signup...
  // Create User

  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  Future<void> createUser(String email, String password) async {
    try {
      firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
    } catch (e) {
      print('An error has occured $e');
    }
  }
}
