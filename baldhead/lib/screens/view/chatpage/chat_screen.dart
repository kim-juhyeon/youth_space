import 'package:baldhead/models/%08chat/chat_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChatScreen extends StatefulWidget {
  final Function(String) onChatAdded;

  ChatScreen({super.key, required this.onChatAdded});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  var _userEnterMessage = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('채팅'),
        backgroundColor: Colors.green,
      ),
      body: Column(
        children: [
          Expanded(
            child: StreamBuilder<List<String>>(
              stream: Provider.of<ChatProvider>(context).chatDataStream,
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return Center(child: CircularProgressIndicator());
                }
                final chatData = snapshot.data!;
                return ListView.builder(
                  reverse: true,
                  itemCount: chatData.length,
                  itemBuilder: (context, index) {
                    final chat = chatData[index];
                    return ListTile(title: Text(chat));
                  },
                );
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
