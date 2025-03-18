import 'package:flutter/material.dart';

class HomeViewModel extends ChangeNotifier {
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
