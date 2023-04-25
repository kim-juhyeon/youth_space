import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'dialog_screen.dart';

class Sharescreen extends StatefulWidget {
  const Sharescreen({Key? key}) : super(key: key);

  @override
  _SharescreenState createState() => _SharescreenState();
}

class _SharescreenState extends State<Sharescreen> {
  final CollectionReference _shareCollection =
      FirebaseFirestore.instance.collection('shares');

  void _showDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialogcreat(onExitPressed: () {
          Navigator.of(context).pop();
        });
      },
    );
  }

  Future<String> getUserName(String userId) async {
    try {
      print('Getting user for ID $userId');
      DocumentSnapshot userSnapshot = await FirebaseFirestore.instance
          .collection('users')
          .doc(userId)
          .get();
      if (userSnapshot.exists) {
        String name =
            (userSnapshot.data() as Map<String, dynamic>)['name'] ?? 'gg';

        print('Got name "$name" for user ID $userId');
        return name;
      } else {
        throw Exception('User not found for ID $userId');
      }
    } catch (e, stackTrace) {
      print('Error getting user name: $e');
      print(stackTrace);
      return 'name';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('bald'),
        backgroundColor: Colors.lightGreen[400],
      ),
      body: StreamBuilder<QuerySnapshot>(
          stream: _shareCollection.snapshots(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (!snapshot.hasData) {
              return CircularProgressIndicator();
            }
            final shares = snapshot.data!.docs;
            return ListView.builder(
              itemCount: shares.length,
              itemBuilder: (context, index) {
                final share = shares[index];
                return ListTile(
                  title: Text('Title: ${share['title']}'),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Category: ${share['category']}'),
                      Text('People: ${share['people']}'),
                      Text('Description: ${share['description']}'),
                      FutureBuilder<String>(
                        future: share['userId'] != null
                            ? getUserName(share['userId'])
                            : Future.value(''),
                        builder: (BuildContext context,
                            AsyncSnapshot<String> snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return CircularProgressIndicator();
                          } else if (snapshot.hasError) {
                            return Text('Error: ${snapshot.error}');
                          } else {
                            return Text('Name : ${snapshot.data}');
                          }
                        },
                      )
                    ],
                  ),
                );
              },
            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: _showDialog,
        child: Icon(Icons.add),
      ),
    );
  }
}
