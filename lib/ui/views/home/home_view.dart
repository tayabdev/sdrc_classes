import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sdrc_classes/ui/views/auth/signin/signin_view.dart';
import 'package:sdrc_classes/ui/views/home/home_view_model.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  final String name = 'Ali';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<HomeViewModel>(
        builder: (context, homeViewModel, _) {
          return Center(
              child: IconButton(
                  onPressed: () {
                    print('Trying to logout.....');
                    try {
                      if (firebaseAuth.currentUser != null) {
                        firebaseAuth.signOut();
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            return SigninView();
                          },
                        ));
                      }
                    } catch (e) {
                      print('Failed to Logout the user');
                    }
                  },
                  icon: const Icon(
                    Icons.power_settings_new_outlined,
                    color: Colors.red,
                  )));
        },
      ),
    );
  }
}
