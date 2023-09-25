// ignore_for_file: public_member_api_docs

import 'package:firedart/firedart.dart';

class FirebaseClient {
  FirebaseClient._internal();

  static const FirebaseClient? _instance = null;

  static FirebaseClient get instance {
    return _instance ?? FirebaseClient._internal();
  }

  Future<void> connect() async {
    if (Firestore.initialized) return;
    try {
      if (!Firestore.initialized) {
        Firestore.initialize('book-app-api-41e9e');
      }
    } catch (error) {
      print('Failed to connect to firebase $error');
    }
  }
}
