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
  String _people = '5명 내외';
  String _description = '';

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
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Sharescreen(
                      title: _title,
                      category: _category,
                      people: _people,
                      description: _description),
                ),
              );
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
                hintText: '제목',
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
                DropdownMenuItem(
                  value: '맛집탐방',
                  child: Text('맛집탐방'),
                ),
              ],
              icon: Icon(Icons.arrow_forward_ios),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: DropdownButtonFormField<String>(
              decoration: InputDecoration(
                hintText: '인원을 선택하세요',
              ),
              value: _people,
              onChanged: (value) {
                setState(() {
                  _people = value!;
                });
              },
              items: [
                DropdownMenuItem(
                  value: '5명 내외',
                  child: Text('5명 내외'),
                ),
                DropdownMenuItem(
                  value: '8명 내외',
                  child: Text('8명 내외'),
                ),
                DropdownMenuItem(
                  value: '15명 내외',
                  child: Text('15명 내외'),
                ),
              ],
              icon: Icon(Icons.arrow_forward_ios),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
            child: TextFormField(
              decoration: InputDecoration(
                hintText: '설명',
              ),
              onChanged: (value) {
                setState(() {
                  _description = value;
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
