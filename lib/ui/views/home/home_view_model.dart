import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sdrc_classes/core/service/auth/auth_service.dart';
import 'package:sdrc_classes/core/service/notes_service/notes_service.dart';

class HomeViewModel extends ChangeNotifier {
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  AuthService authService = AuthService();
  NotesService notesService = NotesService();
  bool isLoading = false;

// Create Notes
  Future<void> createNote() async {
    isLoading = true;
    notifyListeners();
    // Future.delayed(const Duration(seconds: 3));

    await notesService.createNote();
    isLoading = false;
    notifyListeners();
  }

// Delete Notes
  Future<void> deleteNote() async {
    isLoading = true;
    notifyListeners();
    await notesService.deleteNote();
    isLoading = false;
    notifyListeners();
  }

// Read Notes

  Future<void> readNotes() async {
    await notesService.readNotes();
  }
}
