import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ChatProvider with ChangeNotifier {
  Stream<List<String>> get chatDataStream => FirebaseFirestore.instance
      .collection('chat')
      .orderBy('timestamp', descending: true)
      .snapshots()
      .map((snapshot) =>
          snapshot.docs.map((doc) => doc.data()['message'] as String).toList())
      .cast<List<String>>();

  void addChat(String chat) {
    FirebaseFirestore.instance.collection('chat').add({
      'message': chat,
      'timestamp': Timestamp.now(),
    });
  }
}
