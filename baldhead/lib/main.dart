// ignore: unused_import
import 'package:baldhead/screens/detail_screen.dart';
import 'package:baldhead/screens/list_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Book List App',
        initialRoute: '/',
        routes: {
          '/': (context) => ListScreen(),
          'detail': (context) => const DetailScreen(),
        },
        theme: ThemeData(
          scaffoldBackgroundColor: const Color.fromARGB(255, 255, 255, 255),
          appBarTheme: const AppBarTheme(
            color: Color.fromARGB(255, 255, 255, 255),
          ),
        ));
  }
  /*"asdsafasf"sdsd되고 있는건가요?*/
}
