import 'package:baldhead/screens/view/sharepage/dialog_screen.dart';
import 'package:flutter/material.dart';

class Sharescreen extends StatefulWidget {
  const Sharescreen({Key? key}) : super(key: key);

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
      body: Container(
        color: Colors.white,
        child: Center(
          child: Text('Share Screen'),
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
