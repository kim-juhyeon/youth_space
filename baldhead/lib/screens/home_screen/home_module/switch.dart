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
    final MaterialStateProperty<Color?> trackColor =
        MaterialStateProperty.resolveWith<Color?>(
      (Set<MaterialState> states) {
        if (states.contains(MaterialState.selected)) {
          return Colors.amber;
        }
        return null;
      },
    );
    final MaterialStateProperty<Color?> overlayColor =
        MaterialStateProperty.resolveWith<Color?>(
      (Set<MaterialState> states) {
        if (states.contains(MaterialState.selected)) {
          return Colors.amber.withOpacity(0.54);
        }
        if (states.contains(MaterialState.disabled)) {
          return Colors.grey.shade400;
        }
        return null;
      },
    );

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('공통'),
            const SizedBox(width: 8),
            Switch(
              value: light,
              overlayColor: overlayColor,
              trackColor: trackColor,
              thumbColor: const MaterialStatePropertyAll<Color>(Colors.black),
              onChanged: (bool value) {
                setState(() {
                  light = value;
                });
              },
            ),
            const SizedBox(width: 8),
            const Text('3km 반경'),
          ],
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}
