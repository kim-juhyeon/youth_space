import 'package:baldhead/screens/future_secondscreen.dart';
import 'package:baldhead/screens/view/loginpage/auth_page/login_auth.dart';
import 'package:baldhead/screens/view/loginpage/login_screen.dart';
import 'package:baldhead/screens/view/onboarding/onboarding_screen.dart';
import 'package:flutter/material.dart';
import 'package:baldhead/screens/list_screen.dart';

import 'models/space.dart';
import 'screens/home_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
        '/auth': (context) => AuthPage(),
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
