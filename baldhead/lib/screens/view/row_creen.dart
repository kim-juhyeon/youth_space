import 'package:flutter/material.dart';

class RowScreen extends StatelessWidget {
  final Map<String, String>? matchingSpace;
  const RowScreen({Key? key, this.matchingSpace}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.2,
                child: Text('운영시간'),
              ),
              Expanded(
                child: Text(
                  matchingSpace?['spcTime'] ?? 'Default Address',
                  style: TextStyle(fontSize: 12),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 10,
            horizontal: 10,
          ),
          child: Row(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.2,
                child: Text('장소정보'),
              ),
              Expanded(
                child: Text(
                  matchingSpace?['majorForm'] ?? 'Default Address',
                  style: TextStyle(fontSize: 12),
                ),
              )
            ],
          ),
        ),
      ]),
    );
  }
}
