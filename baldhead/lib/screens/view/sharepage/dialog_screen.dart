import 'package:baldhead/screens/view/sharepage/mkdir_first_screen.dart';
import 'package:flutter/material.dart';

//차후에 당근마켓 처럼 위젯을 만들 필요있음
class Dialogcreat extends StatelessWidget {
  const Dialogcreat({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      backgroundColor: Colors.lightGreen[40],
      child: SizedBox(
        height: 150,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              "방을 만드시겠습니까?",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => FirstScreen(),
                      ),
                    );
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                      Color.fromARGB(255, 56, 208, 18),
                    ),
                  ),
                  child: Text(
                    "예",
                    style: TextStyle(
                      color: Color.fromARGB(255, 254, 254, 254),
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    // Handle 'No' button tap
                    Navigator.of(context).pop(); // Close dialog
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                      Color.fromARGB(255, 241, 226, 241),
                    ),
                  ),
                  child: Text(
                    "아니오",
                    style: TextStyle(
                      color: Color.fromARGB(255, 255, 255, 255),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
