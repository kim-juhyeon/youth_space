import 'package:baldhead/screens/view/sharepage/share_screen.dart';
import 'package:flutter/material.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  _FirstScreenState createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  String _title = '';
  String _category = '책 읽기';

  void _submit() {
    // Handle submission of new task
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightGreen[400],
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Sharescreen()));
            },
            child: Text(
              '완료',
              style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextFormField(
              decoration: InputDecoration(
                hintText: 'Enter title',
              ),
              onChanged: (value) {
                setState(() {
                  _title = value;
                });
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: DropdownButtonFormField<String>(
              decoration: InputDecoration(
                hintText: '카테고리 선택',
              ),
              value: _category,
              onChanged: (value) {
                setState(() {
                  _category = value!;
                });
              },
              items: [
                DropdownMenuItem(
                  value: '책 읽기',
                  child: Text('책 읽기'),
                ),
                DropdownMenuItem(
                  value: '스터디',
                  child: Text('스터디'),
                ),
                DropdownMenuItem(
                  value: '취미 공유',
                  child: Text('취미공유'),
                ),
              ],
              icon: Icon(Icons.category),
            ),
          ),
        ],
      ),
    );
  }
}
