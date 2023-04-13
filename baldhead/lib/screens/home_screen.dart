import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'home_screen/home_imgview.dart';
import 'home_screen/home_module/switch.dart';
import 'home_screen/home_wiget.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  final user = FirebaseAuth.instance.currentUser!;

  void signUserOut() {
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double imageWidth = screenWidth;

    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            backgroundColor: Colors.white,
            centerTitle: true,
            title: Text(
              '대머리청년',
              style: TextStyle(
                  color: Colors.green,
                  fontSize: 25,
                  fontWeight: FontWeight.bold),
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
                SizedBox(height: 20.0),
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
