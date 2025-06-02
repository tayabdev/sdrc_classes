import 'package:flutter/material.dart';
import 'package:sdrc_classes/core/service/add_data_service/add_data_service.dart';

class AddDataViewModel extends ChangeNotifier {
  AddDataService addDataService = AddDataService();

  Future<void> addUserData(String name, String email, String bio) async {
    addDataService.submitUserData(name, email, bio);
  }
}
