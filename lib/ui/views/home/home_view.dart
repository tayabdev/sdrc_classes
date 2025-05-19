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
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                  onPressed: () {
                    print('Trying to logout.....');
                    try {
                      if (firebaseAuth.currentUser != null) {
                        homeViewModel.signOut(context);
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
                  icon: Icon(
                    Icons.power_settings_new_outlined,
                    color: Colors.red,
                    size: 80,
                  )),
              IconButton(
                  onPressed: () {
                    print('Trying to Add hard coded data.....');
                    homeViewModel.createUser();
                  },
                  icon: const Icon(
                    Icons.add,
                    size: 80.0,
                    color: Colors.lightGreenAccent,
                  )),
              IconButton(
                  onPressed: () {
                    print('Trying to Read hard coded data.....');
                    homeViewModel.readData();
                  },
                  icon: const Icon(
                    Icons.download,
                    size: 80.0,
                    color: Colors.lightGreenAccent,
                  )),
              IconButton(
                  onPressed: () {
                    print('Trying to update hard coded data.....');
                    homeViewModel.updateUserData();
                  },
                  icon: const Icon(
                    Icons.security_update_good_rounded,
                    size: 80.0,
                    color: Colors.lightBlue,
                  )),
              IconButton(
                  onPressed: () {
                    print('Trying to delete hard coded data.....');
                    homeViewModel.deleteUserData();
                  },
                  icon: const Icon(
                    Icons.close,
                    size: 80.0,
                    color: Colors.red,
                  ))
            ],
          ));
        },
      ),
    );
  }
}
