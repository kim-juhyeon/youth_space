import 'package:flutter/material.dart';

class ChatProvider with ChangeNotifier {
  List<String> chatData = [];

  void addChat(String chat) {
    chatData.add(chat);
    notifyListeners();
  }
}
