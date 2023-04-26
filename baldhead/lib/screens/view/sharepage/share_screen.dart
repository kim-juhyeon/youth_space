import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'dialog_screen.dart';
import 'package:provider/provider.dart';

// Define a class to hold the application state
class ShareData extends ChangeNotifier {
  final CollectionReference _shareCollection =
      FirebaseFirestore.instance.collection('shares');

  List<Map<String, dynamic>> _shares = [];

  List<Map<String, dynamic>> get shares => _shares;
//_shares 목록에 대한 모든 수정 사항이 자동으로 전파
  void addShare(Map<String, dynamic> share) {
    _shares.add(share);
    _shareCollection.add(share);
    notifyListeners();
  }

  void fetchShares() async {
    final snapshot = await _shareCollection.get();
    _shares =
        snapshot.docs.map((doc) => doc.data() as Map<String, dynamic>).toList();
    notifyListeners();
  }
}

class Sharescreen extends StatelessWidget {
  const Sharescreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ShareData()..fetchShares(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('모임'),
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
  const ShareList({super.key});

  @override
  Widget build(BuildContext context) {
    final shareData = Provider.of<ShareData>(context);
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: shareData.shares.length,
            itemBuilder: (context, index) {
              final share = shareData.shares[index];
              return ListTile(
                title: Text('제목: ${share['title']}'),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('항목: ${share['category']}'),
                    Text('인원: ${share['people']}'),
                    Text('설명: ${share['description']}'),
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
