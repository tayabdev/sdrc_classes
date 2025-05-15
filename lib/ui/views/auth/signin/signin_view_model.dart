import 'package:flutter/material.dart';
import 'package:sdrc_classes/core/service/auth/auth_service.dart';

class SigninViewModel extends ChangeNotifier {
  AuthService authService = AuthService();

  Future<void> loginUser(String email, String password) async {
    authService.lginUser(email, password);
    notifyListeners();
  }
}
