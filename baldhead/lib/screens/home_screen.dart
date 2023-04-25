import 'package:baldhead/screens/home_screen/login_page/home2_wiget.dart';
import 'package:baldhead/screens/view/sharepage/share_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'home_screen/home_imgview.dart';
import 'home_screen/home_module/switch.dart';
import 'home_screen/home_wiget.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final user = FirebaseAuth.instance.currentUser!;
  final scrollController = ScrollController();
  double pullHeight = 0;
  double contentHeight =
      100; // Adjust this value based on your desired trigger point
  double scrollVelocity = 2.4;

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
              icon: FaIcon(Icons.group_add),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Sharescreen(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
