// lib/ui/views/auth/signup/signup_view.dart

import 'package:flutter/material.dart';

// ignore: must_be_immutable
class SignupView extends StatelessWidget {
  SignupView({super.key});
  SizedBox mySizedBox = const SizedBox(height: 20.0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AuthCustomTextField(
                hintText: 'User Name',
                isPasswordFieldl: false,
              ),
              // TextField(
              //   decoration: InputDecoration(
              //     hintText: 'User Name',
              //     border: OutlineInputBorder(
              //         borderRadius: BorderRadius.circular(20.0)),
              //   ),
              // ),
              mySizedBox,
              AuthCustomTextField(
                hintText: 'Email',
                isPasswordFieldl: false,
              ),
              // TextField(
              //   decoration: InputDecoration(
              //     hintText: 'Email',
              //     border: OutlineInputBorder(
              //         borderRadius: BorderRadius.circular(20.0)),
              //   ),
              // ),
              mySizedBox,
              AuthCustomTextField(
                hintText: 'Phone',
                isPasswordFieldl: false,
              ),
              // TextField(
              //   decoration: InputDecoration(
              //     hintText: 'Phone',
              //     border: OutlineInputBorder(
              //         borderRadius: BorderRadius.circular(20.0)),
              //   ),
              // ),
              mySizedBox,
              AuthCustomTextField(
                hintText: 'Password',
                isPasswordFieldl: true,
              ),
              // TextField(
              //   obscureText: true,
              //   decoration: InputDecoration(
              //     suffixIcon: const Icon(Icons.remove_red_eye),
              //     hintText: 'Password',
              //     border: OutlineInputBorder(
              //         borderRadius: BorderRadius.circular(20.0)),
              //   ),
              // ),
              mySizedBox,
              AuthCustomTextField(
                hintText: 'Confirm password',
                isPasswordFieldl: true,
              ),
              // TextField(
              //   obscureText: true,
              //   decoration: InputDecoration(
              //     suffixIcon: const Icon(Icons.remove_red_eye),
              //     hintText: 'Confirm password',
              //     border: OutlineInputBorder(
              //         borderRadius: BorderRadius.circular(20.0)),
              //   ),
              // ),
              ElevatedButton(onPressed: () {}, child: const Text('Sign in'))
              /*
              
              YouStarButton(onPress: (){}, child: ),
              */
            ],
          ),
        ),
      ),
    );
  }
}

class AuthCustomTextField extends StatelessWidget {
  final String hintText;
  // final Icon suffixIcon;
  final bool isPasswordFieldl;
  const AuthCustomTextField(
      {super.key,
      required this.hintText,
      // required this.suffixIcon,
      required this.isPasswordFieldl});

  @override
  Widget build(BuildContext context) {
    return TextField(
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
