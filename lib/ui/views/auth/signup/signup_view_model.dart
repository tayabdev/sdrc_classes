// lib/ui/views/auth/signup/signup_view_model.dart

import 'package:flutter/material.dart';
import 'package:sdrc_classes/core/service/auth/auth_service.dart';

class SignupViewModel extends ChangeNotifier {
  AuthService authService = AuthService();

  Future<void> createUser(String email, String password) async {
    authService.createUser(email, password);
    notifyListeners();
  }
}
