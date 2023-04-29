import 'package:baldhead/models/share/share_data.dart';
import 'package:flutter/material.dart';
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
          title: TextField(
            controller: _searchController,
            decoration: InputDecoration(
              hintText: '찾고 싶은 모임은?',
              border: InputBorder.none,
              hintStyle: TextStyle(color: Colors.white54),
            ),
            style: TextStyle(color: Colors.white),
            onChanged: (value) {
              final searchData =
                  Provider.of<ItemProvider>(context, listen: false);
              //searchData.searchShares(value);
            },
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

    return FutureBuilder(
      future: itemProvider.fetchItems(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }

        return Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: itemProvider.items.length,
                itemBuilder: (context, index) {
                  final item = itemProvider.items[index];
                  return ListTile(
                    title: Text('제목: ${item.title}'),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('항목: ${item.category}'),
                        Text('인원: ${item.people}'),
                        Text('설명: ${item.description}'),
                        ElevatedButton(onPressed: () {}, child: Text('참여하기')),
                        SizedBox(height: 10),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        );
      },
    );
  }
}
