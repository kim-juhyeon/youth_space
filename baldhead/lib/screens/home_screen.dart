import 'package:baldhead/screens/home_screen/login_page/home2_wiget.dart';
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
              delegate: SliverChildListDelegate(
                [
                  ImgView(
                    imageWidth: imageWidth,
                  ),
                  SizedBox(height: 30.0),
                  Center(child: SwitchHome()),
                  OthersWiget(),
                  OthersWiget2(),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                // code for current location icon
              },
            ),
            IconButton(
              icon: Icon(Icons.home),
              onPressed: () {
                // code for home icon
              },
            ),
          ],
        ),
      ),
    );
  }
}
