import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('대머리청년'),
      ),
      body: Column(
        children: [
          Image.asset('images/raw/list_img_01.jpeg'),
          const Padding(
            padding: EdgeInsets.all(20),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                width: MediaQuery.of(context).size.width * 0.8,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'title',
                      style: TextStyle(fontSize: 18),
                    ),
                    Text(
                      'subtitle',
                      style: TextStyle(fontSize: 10),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.all(10),
                width: MediaQuery.of(context).size.width * 0.2,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: const [
                    Icon(Icons.heart_broken),
                    Icon(Icons.pause_presentation),
                  ],
                ),
              )
            ],
          ),
          const Padding(
            padding: EdgeInsets.all(20),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: const [
                    Icon(Icons.abc),
                    Text('전화'),
                  ],
                ),
                Column(
                  children: const [
                    Icon(Icons.abc),
                    Text('전화'),
                  ],
                ),
                Column(
                  children: const [
                    Icon(Icons.abc),
                    Text('전화'),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.9,
            height: 60,
            child: const Divider(
              color: Colors.blue,
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(10),
          ),
          Container(
            child: Column(children: [
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.2,
                      child: const Text('asdsad'),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.8,
                      child: const Text('asdsad'),
                    ),
                  ],
                ),
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.2,
                      child: const Text('asdsad'),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.8,
                      child: const Text('asdsad'),
                    ),
                  ],
                ),
              )
            ]),
          )
        ],
      ),
    );
  }
}
