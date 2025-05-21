import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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
        builder: (context, viewModel, child) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                viewModel.isLoading == true
                    ? const CircularProgressIndicator()
                    : IconButton(
                        onPressed: () {
                          viewModel.createNote();
                        },
                        icon: const Icon(
                          Icons.note_add_sharp,
                          size: 50.0,
                        )),
                viewModel.isLoading == true
                    ? const CircularProgressIndicator()
                    : IconButton(
                        onPressed: () {
                          viewModel.deleteNote();
                        },
                        icon: const Icon(
                          Icons.delete_forever_outlined,
                          color: Colors.red,
                          size: 50.0,
                        )),
                IconButton(
                    onPressed: () {
                      viewModel.readNotes();
                    },
                    icon: const Icon(
                      Icons.book_rounded,
                      size: 50.0,
                    ))
              ],
            ),
          );
        },
      ),
    );
  }
}
