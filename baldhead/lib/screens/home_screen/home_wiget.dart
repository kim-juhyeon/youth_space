import 'package:baldhead/screens/home_screen/login_page/square_tile.dart';
import 'package:flutter/material.dart';

class OthersWiget extends StatelessWidget {
  const OthersWiget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed(
                  '/list',
                );
              },
              child: SquareTile(imagePath: 'assets/images/spot.png'),
            ),
            Text(
              '청년공간',
              style: TextStyle(fontSize: 12.0),
            ),
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SquareTile(imagePath: 'assets/images/library.png'),
            Text(
              '도서관',
              style: TextStyle(
                fontSize: 12.0,
              ),
            ),
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SquareTile(imagePath: 'assets/images/tree.png'),
            Text(
              '공원',
              style: TextStyle(fontSize: 12.0),
            ),
          ],
        ),
      ],
    );
  }
}
