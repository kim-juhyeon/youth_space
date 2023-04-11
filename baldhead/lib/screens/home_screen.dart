import 'package:flutter/material.dart';

import 'home_screen/home_imgview.dart';
import 'home_screen/home_module/switch.dart';
import 'home_screen/home_wiget.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double imageWidth = screenWidth;

    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            backgroundColor: Colors.white,
            title: Text(
              '대머리청년',
              style: TextStyle(color: Colors.black),
            ),
            floating: true,
          ),
          SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: 12.0),
            sliver: SliverList(
              delegate: SliverChildListDelegate([
                ImgView(
                  imageWidth: imageWidth,
                ),
                SizedBox(height: 15.0),
                SwitchHome(),
                OthersWiget(),
                SizedBox(height: 20.0),
              ]),
            ),
          ),
        ],
      ),
    );
  }
}
