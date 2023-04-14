import 'package:flutter/material.dart';

class SwitchHome extends StatefulWidget {
  const SwitchHome({Key? key}) : super(key: key);

  @override
  _SwitchHomeState createState() => _SwitchHomeState();
}

class _SwitchHomeState extends State<SwitchHome> {
  bool light = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('공통'),
            const SizedBox(width: 10),
            Switch(
              value: light,
              onChanged: (value) => setState(
                () => light = value,
              ),
            ),
            const SizedBox(width: 10),
            const Text('3km 반경'),
          ],
        ),
      ],
    );
  }
}
