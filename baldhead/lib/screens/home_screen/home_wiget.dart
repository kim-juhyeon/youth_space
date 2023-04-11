import 'package:flutter/material.dart';

class OthersWiget extends StatelessWidget {
  const OthersWiget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          width: 120.0,
          height: 100.0,
          color: Colors.grey[200],
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pushNamed(
                    '/list',
                  );
                },
                child: Image.network(
                  'https://www.youthcenter.go.kr/framework/filedownload/getImage.do?filePathName=K43kYCzEpw54N3DsTLz6bMJZMca8Uq8sm0M%2BVQDeGmh8mVbzFxJ0ijFDwsDszYPpQtJOjEOsMDzAQ5%2BDj5tJ3A%3D%3D',
                  width: 90.0,
                  height: 70.0,
                ),
              ),
              Text(
                '청년공간',
                style: TextStyle(fontSize: 12.0),
              ),
            ],
          ),
        ),
        Container(
          width: 120.0,
          height: 100.0,
          color: Colors.grey[200],
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.network(
                'https://www.visitbusan.net/uploadImgs/files/cntnts/20211130150655790_wufrotr',
                width: 90.0,
                height: 70.0,
              ),
              Text(
                '도서관',
                style: TextStyle(
                  fontSize: 12.0,
                ),
              ),
            ],
          ),
        ),
        Container(
          width: 120.0,
          height: 100.0,
          color: Colors.grey[200],
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.network(
                'https://www.ksponco.or.kr/olympicpark/img/sub/s1_01_pic01.jpg',
                width: 90.0,
                height: 70.0,
              ),
              Text(
                '공원',
                style: TextStyle(fontSize: 12.0),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
