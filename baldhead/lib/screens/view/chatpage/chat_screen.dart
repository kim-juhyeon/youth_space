import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  final List<String> chatData;
  final Function(String) onChatAdded;

  ChatScreen(
      {super.key,
      required this.chatData,
      required this.onChatAdded,
      required List<String> chatdata});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  var _userEnterMessage = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Chat')),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: widget.chatData.length,
              itemBuilder: (context, index) {
                final chat = widget.chatData[index];
                return ListTile(title: Text(chat));
              },
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 16),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    onSubmitted: (value) {
                      widget.onChatAdded(value);
                    },
                    decoration: InputDecoration(hintText: '메시지를 입력하세요.'),
                    onChanged: (value) {
                      setState(() {
                        _userEnterMessage = value;
                      });
                    },
                  ),
                ),
                Expanded(
                  child: IconButton(
                    onPressed: _userEnterMessage.trim().isEmpty ? null : () {},
                    icon: Icon(Icons.send),
                    color: Colors.blue,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
