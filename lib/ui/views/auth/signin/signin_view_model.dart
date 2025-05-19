import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sdrc_classes/core/service/auth/auth_service.dart';

class SigninViewModel extends ChangeNotifier {
  AuthService authService = AuthService();

  Future<void> loginUser(
      String email, String password, BuildContext context) async {
    try {
      authService.lginUser(email, password);
      notifyListeners();
    } catch (e) {
      print('=++++++++++Failed+++++++++');
      if (context.mounted) {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text('FSignin Failed'),
              content: Text('SignIn failed due to $e'),
            );
          },
        );
      }
    } finally {
      if (context.mounted) {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text('BSignin Failed'),
              content: Text('SignIn failed due to '),
            );
          },
        );
      }
    }
  }
}
