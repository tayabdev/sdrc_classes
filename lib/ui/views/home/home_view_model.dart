import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class HomeViewModel extends ChangeNotifier {
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  Future<void> createUser() async {
    // Define some definate name
    await firebaseFirestore.collection('users').doc('user_456').set(
      {'name': 'user_456_name', 'age': 100},
    );

    // Add a random id to the document
    // await firebaseFirestore.collection('users').add({
    //   'name': 'Tayab',
    //   'age': 23,
    // });
  }

  Future<void> readData() async {
    QuerySnapshot querySnapshot =
        await firebaseFirestore.collection('users').get();

    for (var element in querySnapshot.docs) {
      print(element.data());
    }

    // print(documentSnapshot.data());
  }

  Future<void> updateUserData() async {
    firebaseFirestore
        .collection('users')
        .doc('ZqL8rNJpTTQdhgUgteMQ4AWZkA72')
        .update({'age': 88});
  }

  Future<void> deleteUserData() async {
    firebaseFirestore
        .collection('users')
        .doc('ZqL8rNJpTTQdhgUgteMQ4AWZkA72')
        .delete();
  }

//========================//
  // Variable
  bool isRememberMe = true;

// Function to Toggle the Remember Me Tick Icon
  void toggleRememberMe() {
    // Toggleing Logic
    isRememberMe = !isRememberMe;
    // Notifies Listeners
    notifyListeners();
  }
}
