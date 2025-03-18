import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sdrc_classes/ui/views/home/home_view_model.dart';

class HomeView extends StatelessWidget {
  HomeView({super.key});
  final String name = 'Ali';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<HomeViewModel>(
        builder: (context, homeViewModel, _) {
          return Center(
            child: CheckboxListTile(
                title: const Text('Remember Me'),
                value: homeViewModel.isRememberMe,
                onChanged: (value) {
                  homeViewModel.toggleRememberMe();
                  // homeViewModel.isRememberMe = !homeViewModel.isRememberMe;
                  // value = homeViewModel.isRememberMe;

                  // print("This is string $name");
                  // print('✅ ${homeViewModel.isRememberMe}');
                  // print('☑️ $value');
                }),
          );
        },
      ),
    );
  }
}
