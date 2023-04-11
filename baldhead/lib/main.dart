import 'package:baldhead/screens/future_secondscreen.dart';
import 'package:flutter/material.dart';
import 'package:baldhead/screens/list_screen.dart';

import 'models/space.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '대머리청년',
      initialRoute: '/home',
      routes: {
        '/home': (context) => HomeScreen(),
        '/list': (context) => ListScreen(),
        '/detail': (context) {
          //새화면 DetailScreen으로 이동할 때 경로에 전달 된 인수에 엑세스할 수 있게 ModalRoute 위젯이용
          final args = ModalRoute.of(context)?.settings.arguments as Space;
          //DetailScreen에서 space 매개변수를 받아 정보를 표시 할 수 있음
          return DetailScreen(space: args);
        },
      },
    );
  }
}
