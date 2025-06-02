import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sdrc_classes/ui/views/add_data/add_data_view.dart';
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
      appBar: AppBar(
        title: Text('Home View'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return AddDataView();
                  },
                ));
              },
              icon: Icon(
                Icons.add,
                size: 40.0,
              ))
        ],
      ),
      body: Consumer<HomeViewModel>(
        builder: (context, viewModel, child) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Text('user data will be listed here...')],
            ),
          );
        },
      ),
    );
  }
}
