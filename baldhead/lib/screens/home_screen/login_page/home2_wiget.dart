import 'package:baldhead/screens/home_screen/login_page/square_tile.dart';
import 'package:flutter/material.dart';

class OthersWiget2 extends StatelessWidget {
  const OthersWiget2({Key? key}) : super(key: key);

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
              child: SquareTile(imagePath: 'assets/images/suit.png'),
            ),
            Text(
              '대여',
              style: TextStyle(fontSize: 12.0),
            ),
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SquareTile(imagePath: 'assets/images/rice.png'),
            Text(
              '가성비 밥집',
              style: TextStyle(
                fontSize: 12.0,
              ),
            ),
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SquareTile(imagePath: 'assets/images/baldmoney.png'),
            Text(
              '정보',
              style: TextStyle(fontSize: 12.0),
            ),
          ],
        ),
      ],
    );
  }
}
