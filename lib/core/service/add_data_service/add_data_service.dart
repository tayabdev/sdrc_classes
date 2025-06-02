import 'package:cloud_firestore/cloud_firestore.dart';

class AddDataService {
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  Future<void> submitUserData(String name, String email, String bio) async {
    firebaseFirestore.collection('user_data').doc().set({
      'name': name,
      'email': email,
      'bio': bio,
    });
  }
}
