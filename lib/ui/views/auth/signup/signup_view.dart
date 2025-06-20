import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sdrc_classes/ui/views/auth/signin/signin_view.dart';
import 'package:sdrc_classes/ui/views/auth/signup/signup_view_model.dart';

class SignupView extends StatefulWidget {
  static const String routeName = "/signup-view/";
  static Route route() {
    return MaterialPageRoute(
        builder: (context) {
          return const SignupView();
        },
        settings: const RouteSettings(name: routeName));
  }

  const SignupView({super.key});

  @override
  State<SignupView> createState() => SignupViewState();
}

class SignupViewState extends State<SignupView> {
  // Instances
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  // Variables
  SizedBox mySizedBox = const SizedBox(height: 20.0);
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Consumer<SignupViewModel>(
        builder: (context, viewModel, child) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  mySizedBox,
                  AuthCustomTextField(
                    controller: emailController,
                    hintText: 'Email',
                    isPasswordFieldl: false,
                  ),
                  mySizedBox,
                  mySizedBox,
                  AuthCustomTextField(
                    controller: passwordController,
                    hintText: 'Password',
                    isPasswordFieldl: true,
                  ),
                  mySizedBox,
                  ElevatedButton(
                      onPressed: () {
                        print('Regsistering User.....');
                        viewModel.createUser(
                            emailController.text, passwordController.text);
                      },
                      child: const Text('Sign up')),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const Text('Already have an account?'),
                      TextButton(
                          onPressed: () {
                            Navigator.pushNamedAndRemoveUntil(context,
                                SigninView.routeName, (route) => false);
                          },
                          child: const Text('signin')),
                    ],
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class AuthCustomTextField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;

  final bool isPasswordFieldl;
  const AuthCustomTextField(
      {super.key,
      required this.controller,
      required this.hintText,
      required this.isPasswordFieldl});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        suffixIcon: isPasswordFieldl == true
            ? IconButton(onPressed: () {}, icon: Icon(Icons.remove_red_eye))
            : SizedBox(),
        hintText: hintText,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
      ),
    );
  }
}
