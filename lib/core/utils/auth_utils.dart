import 'package:firebase_auth/firebase_auth.dart';

FirebaseAuth firebaseAuth = FirebaseAuth.instance;

class AuthUtils {
  static String? getCurrentUserId() {
    if (firebaseAuth.currentUser != null) {
      final id = firebaseAuth.currentUser!.uid;
      return id;
    } else {
      return null;
    }
  }
}
