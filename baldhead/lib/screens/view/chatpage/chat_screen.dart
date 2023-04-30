import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  final List<String> chatData;
  final Function(String) onChatAdded;

  ChatScreen(
      {super.key,
      required this.chatData,
      required this.onChatAdded,
      required List<String> chatdata});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Chat')),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: chatData.length,
              itemBuilder: (context, index) {
                final chat = chatData[index];
                return ListTile(title: Text(chat));
              },
            ),
          ),
          TextField(
            onSubmitted: (value) {
              onChatAdded(value);
            },
            decoration: InputDecoration(hintText: 'Type a message'),
          ),
        ],
      ),
    );
  }
}
