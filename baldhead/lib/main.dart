import 'package:baldhead/screens/future_secondscreen.dart';
import 'package:baldhead/screens/view/loginpage/login_screen.dart';
import 'package:baldhead/screens/view/onboarding/onboarding_screen.dart';
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
      title: 'bald young man',
      initialRoute: '/onboarding',
      routes: {
        '/onboarding': (context) => OnboardingScreen(),
        '/login': (context) => LoginPage(),
        '/home': (context) => HomeScreen(),
        '/list': (context) => ListScreen(),
        '/detail': (context) {
          final args = ModalRoute.of(context)?.settings.arguments as Space;
          return DetailScreen(space: args);
        },
      },
    );
  }
}
