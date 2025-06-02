import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sdrc_classes/ui/views/add_data/add_data_view_model.dart';

class AddDataView extends StatelessWidget {
  AddDataView({super.key});
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController bioController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Add User data'),
        ),
        body: Consumer<AddDataViewModel>(
          builder: (context, viewModel, child) {
            return Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: 20.0,
                children: [
                  TextField(
                    controller: nameController,
                    decoration: InputDecoration(
                        hintText: 'Enter your name',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20))),
                  ),
                  TextField(
                    controller: emailController,
                    decoration: InputDecoration(
                        hintText: 'Enter your email',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20))),
                  ),
                  TextField(
                    controller: bioController,
                    decoration: InputDecoration(
                        hintText: 'Enter your bio',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20))),
                  ),
                  OutlinedButton(
                      onPressed: () async {
                        viewModel.addUserData(
                          nameController.text.trim(),
                          emailController.text.trim(),
                          bioController.text.trim(),
                        );
                      },
                      child: Text('Submit'))
                ],
              ),
            );
          },
        ));
  }
}
