// import 'package:flutter/material.dart';
// import 'package:dio/dio.dart';
// import 'package:xml/xml.dart';

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({Key? key}) : super(key: key);

//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   List<Map<String, String>> _spaces = [];

//   void boy_space() async {
//     var result = await Dio().get(
//       "https://www.youthcenter.go.kr/opi/wantedSpace.do?pageIndex=1&display=28&pageType=1&srchAreaCpvn=003002001&openApiVlak=687a1e8788e29f1525bf4c18", // 비밀
//     );
//     final spaceXml = result.data.toString();
//     final document = XmlDocument.parse(spaceXml);
//     final spaces = document.findAllElements('space');
// //map 메서드를 통해
//     final boyspace = spaces.map((node) {
//       final spcName = node.findElements('spcName').single.text;
//       final address = node.findElements('address').single.text;
//       final spcTime = node.findElements('spcTime').single.text;
//       final homepage = node.findElements('homepage').single.text;
//       final telNo = node.findElements('telNo').single.text;
//       final spcCost = node.findElements('spcCost').single.text;
//       final foodYn = node.findElements('foodYn').single.text;

//       return {
//         'address': address,
//         'spcTime': spcTime,
//         'homepage': homepage,
//         'telNo': telNo,
//         'spcCost': spcCost,
//         'foodYn': foodYn,
//       };
//     }).toList();

//     setState(() {
//       _spaces = boyspace;
//     });
//   }

//   @override
//   void initState() {
//     super.initState();
//     boy_space();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('ㅁㄴㅇㅁㄴㅇ'),
//       ),
//       body: ListView.builder(
//         itemCount: _spaces.length,
//         itemBuilder: (BuildContext context, int index) {
//           final space = _spaces[index];
//           return ListTile(
//             title: Text(space['address']!),
//             subtitle: Text(space['homepage']!),
//             trailing: Text(space['foodYn']!),
//           );
//         },
//       ),
//     );
//   }
// }
