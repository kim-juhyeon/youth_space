import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'dialog_screen.dart';

class Sharescreen extends StatefulWidget {
  const Sharescreen({super.key});

  @override
  _SharescreenState createState() => _SharescreenState();
}

class _SharescreenState extends State<Sharescreen> {
  final CollectionReference _shareCollection =
      FirebaseFirestore.instance.collection('shares');

  bool _showingDialog = false;

  void _showDialog() {
    if (_showingDialog) {
      return;
    }
    setState(() {
      _showingDialog = true;
    });
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialogcreat(onExitPressed: () {
          setState(() {
            _showingDialog = false;
          });
          Navigator.of(context).pop();
        });
      },
    ).then((_) {
      setState(() {
        _showingDialog = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('bald'),
        backgroundColor: Colors.lightGreen[400],
      ),
      body: StreamBuilder<QuerySnapshot>(
          stream: _shareCollection
              .where('userId',
                  isEqualTo: FirebaseAuth.instance.currentUser!.uid)
              .snapshots(),
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
                    ],
                  ),
                );
              },
            );
          }),
      floatingActionButton: Stack(
        children: [
          FloatingActionButton(
            onPressed: () {
              if (_showingDialog) {
                Navigator.of(context).pop();
              } else {
                _showDialog();
              }
            },
            child: _showingDialog ? Icon(Icons.close) : Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}
