import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  _AuthPageState createState() => _AuthPageState();
}

//이전 페이지를 스택에서 제거하고, 새 페이지가 새로운 라우트가 되므로, 이전 페이지의 정보가 노출되는 것을 방지할 수 있음.
//authStateChanges() 메서드는 인증 상태 변경 이벤트를 감지한다.
class _AuthPageState extends State<AuthPage> {
  @override
  void initState() {
    super.initState();
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        Navigator.pushReplacementNamed(context, '/login');
      } else {
        Navigator.pushReplacementNamed(context, '/name');
      }
    });
  }

//원래는 해당페이지는 home 으로 쓰이면 좋을 것 같다.. 아니면 로딩의 이미지를 꾸며 보는것도 시도해 볼 수 있을 것 같다.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
