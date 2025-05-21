import 'package:cloud_firestore/cloud_firestore.dart';

class NotesService {
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  Future<void> createNote() async {
    print('Creating notes....');
    await firebaseFirestore.collection('notes').doc().set({
      "titel": "Develop Frontend",
      "Description": 'Complete UI using Flutter from provided Figma',
      'dateCreated': DateTime.now(),
    });
    print('Notes Created!');
  }

  Future<void> deleteNote() async {
    await firebaseFirestore
        .collection('notes')
        .doc('iMBiWpWPutByrcf1nP6q')
        .delete();
  }

  Future<void> readNotes() async {
    await firebaseFirestore.collection('notes').get().then((snapshot) {
      for (var doc in snapshot.docs) {
        print(doc.data());
      }
      // return value.size;
    });
  }
}
