import 'package:baldhead/models/share/share_data.dart';
import 'package:baldhead/screens/view/chatpage/chat_screen.dart';
import 'package:flutter/material.dart';

import '../../../models/chat/chat_data.dart';
import 'dialog_screen.dart';
import 'package:provider/provider.dart';

class Sharescreen extends StatefulWidget {
  const Sharescreen({Key? key}) : super(key: key);

  @override
  State<Sharescreen> createState() => _SharescreenState();
}

class _SharescreenState extends State<Sharescreen> {
  final _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ItemProvider()..fetchItems(),
      child: Scaffold(
        appBar: AppBar(
          title: Consumer<ItemProvider>(
            builder: (context, itemProvider, _) => TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: '항목을 입력해주세요.',
                border: InputBorder.none,
                hintStyle: TextStyle(color: Colors.white54),
              ),
              style: TextStyle(color: Colors.white),
              onChanged: (value) {
                itemProvider.search(value);
              },
            ),
          ),
          backgroundColor: Colors.lightGreen[400],
        ),
        body: ShareList(),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return Dialogcreat(onExitPressed: () {
                  Navigator.of(context).pop();
                });
              },
            );
          },
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}

class ShareList extends StatelessWidget {
  const ShareList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final itemProvider = Provider.of<ItemProvider>(context);

    return itemProvider.items.isEmpty
        ? Center(child: CircularProgressIndicator())
        : Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: itemProvider.searchItem.isEmpty
                      ? itemProvider.items.length
                      : itemProvider.searchItem.length,
                  itemBuilder: (context, index) {
                    final item = itemProvider.searchItem.isEmpty
                        ? itemProvider.items[index]
                        : itemProvider.searchItem[index];
                    return ListTile(
                      title: Text('제목: ${item.title}'),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('항목: ${item.category}'),
                          Text('인원: ${item.people}'),
                          Text('설명: ${item.description}'),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ChatScreen(
                                    chatdata: Provider.of<ChatProvider>(context)
                                        .chatData,
                                    onChatAdded: (chat) =>
                                        Provider.of<ChatProvider>(context,
                                                listen: false)
                                            .addChat(chat),
                                    chatData: [],
                                  ),
                                ),
                              );
                            },
                            child: Text('참여'),
                          ),
                          SizedBox(height: 10),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          );
  }
}
