import 'package:flutter/material.dart';
import 'package:sdrc_classes/ui/views/auth/signin/signin_view.dart';
import 'package:sdrc_classes/ui/views/auth/signup/signup_view.dart';

class RouteGenerator {
  static Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case SignupView.routeName:
        return SignupView.route();
      case SigninView.routeName:
        return SigninView.route();

      default:
        return MaterialPageRoute(
          builder: (context) {
            return const Scaffold(
              body: Center(
                child: Text('Error'),
              ),
            );
          },
        );
    }
  }
}
