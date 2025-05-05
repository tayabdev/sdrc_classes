import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sdrc_classes/ui/views/auth/signup/signup_view.dart';
import 'package:sdrc_classes/ui/views/home/home_view.dart';

class SigninView extends StatefulWidget {
  static const String routeName = "/signin-view/";
  static Route route() {
    return MaterialPageRoute(
        builder: (context) {
          return SigninView();
        },
        settings: RouteSettings(name: routeName));
  }

  const SigninView({super.key});

  @override
  State<SigninView> createState() => SigninViewState();
}

class SigninViewState extends State<SigninView> {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  SizedBox mySizedBox = const SizedBox(height: 20.0);
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void loginUser({required String email, required String password}) async {
    try {
      UserCredential userCredential = await firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);
      print(userCredential.toString());
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
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
                    try {
                      loginUser(
                          email: emailController.text,
                          password: passwordController.text);
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return HomeView();
                        },
                      ));
                    } catch (e) {
                      print('Failed to Login');
                    }
                  },
                  child: const Text('sign in')),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const Text('Dont\'t have an account?'),
                  TextButton(
                      onPressed: () {
                        Navigator.pushNamedAndRemoveUntil(
                            context, SignupView.routeName, (route) => false);
                      },
                      child: const Text('signup')),
                ],
              )
            ],
          ),
        ),
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
