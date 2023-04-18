import 'package:baldhead/screens/view/sharepage/dialog_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Sharescreen extends StatefulWidget {
  final String title;
  final String category;
  final String people;
  final String description;

  const Sharescreen({
    required this.title,
    required this.category,
    required this.people,
    required this.description,
    Key? key,
  }) : super(key: key);

  @override
  _SharescreenState createState() => _SharescreenState();
}

class _SharescreenState extends State<Sharescreen> {
  //bool값으로 상태를 정리
  bool _showingDialog = false;

  void _showDialog() {
    setState(() {
      _showingDialog = true;
    });
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialogcreat();
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
        title: Text('대머리'),
        backgroundColor: Colors.lightGreen[400],
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '제목 : ${widget.title}',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Text(
              '카테고리:${widget.category}',
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(
              height: 10.0,
            ),
            Text(
              '사람: ${widget.people}',
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(
              height: 10.0,
            ),
            Text(
              '설명: ${widget.description}',
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(
              height: 10.0,
            ),
            StreamBuilder<QuerySnapshot>(
                stream:
                    FirebaseFirestore.instance.collection('users').snapshots(),
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (!snapshot.hasData) {
                    return CircularProgressIndicator();
                  }
                  final users = snapshot.data!.docs;
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        'Name:',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16.0),
                      ),
                      ListView.builder(
                        shrinkWrap: true,
                        itemCount: users.length,
                        itemBuilder: (context, index) {
                          final name = users[index]['name'];
                          return Text(
                            name,
                            style: TextStyle(fontSize: 16.0),
                          );
                        },
                      )
                    ],
                  );
                }),
          ],
        ),
      ),
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
