import 'package:flutter/material.dart';

import 'home_screen/home_imgview.dart';
import 'home_screen/home_wiget.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double imageWidth = screenWidth;

    return Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(
        horizontal: 6.0,
      ),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text(
            '대머리청년',
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ImgView(
              imageWidth: imageWidth,
            ),
            SizedBox(height: 15.0),
            Text(
              '청년공간',
            ),
            SizedBox(height: 10.0),
            OthersWiget(),
            SizedBox(height: 20.0),
            Text(
              '청년공간',
              style: TextStyle(fontSize: 12.0),
            ),
            SizedBox(height: 50.0),
          ],
        ),
      ),
    );
  }
}
