import 'package:flutter/material.dart';
import 'package:flutter_web_browser/flutter_web_browser.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Gesture_Screen extends StatelessWidget {
  final Map<String, String>? matchingSpace;
  const Gesture_Screen({required this.matchingSpace, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0),
      child: GestureDetector(
        onTap: () {
          showDialog(
            context: context,
            builder: (BuildContext contex) {
              return AlertDialog(
                title: Text('청년공간 홈페이지입니다.'),
                content: Text('홈페이지로 들어갑니다~ 꽉 잡으세요.'),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text('취소'),
                  ),
                  TextButton(
                    onPressed: () async {
                      final url = matchingSpace?['homepage'] ?? 'url을 확인해보세요';
                      await FlutterWebBrowser.openWebPage(
                          url: url,
                          customTabsOptions: CustomTabsOptions(
                            colorScheme: CustomTabsColorScheme.dark,
                            showTitle: true,
                            urlBarHidingEnabled: true,
                          ));
                      Navigator.of(context).pop();
                    },
                    child: Text('이동'),
                  ),
                ],
              );
            },
          );
        },
        child: FaIcon(FontAwesomeIcons.houseChimney),
      ),
    );
  }
}
