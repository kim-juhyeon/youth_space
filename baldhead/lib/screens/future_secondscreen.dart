import 'package:baldhead/screens/view/gesture_screen.dart';
import 'package:baldhead/screens/view/row_creen.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:baldhead/models/space.dart';
import 'package:flutter/services.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:xml/xml.dart';

import '../models/xml_parse.dart';

class DetailScreen extends StatefulWidget {
  final Space space;
  DetailScreen({
    required this.space,
    Key? key,
  }) : super(key: key);

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  Future<List<Map<String, String>>>? _spaces;

  Future<List<Map<String, String>>> boy_space() async {
    var result = await Dio().get(
      "https://www.youthcenter.go.kr/opi/wantedSpace.do?pageIndex=1&display=28&pageType=1&srchAreaCpvn=003002001&openApiVlak=687a1e8788e29f1525bf4c18", // 비밀
    );
    final spaceXml = result.data.toString();
    final document = XmlDocument.parse(spaceXml);
    final spaces = document.findAllElements('space');
    XmlParse xmlParse = XmlParse(); // Create an instance of the XmlParse class
    final boyspace =
        xmlParse.parseSpaces(spaces); // Call the parseSpaces method

    return boyspace;
  }

  @override
  void initState() {
    super.initState();
    _spaces = boy_space();
  }

  Map<String, String>? findMatchingSpace(List<Map<String, String>> spaces) {
    for (var fetchedSpace in spaces) {
      if (fetchedSpace['spcName'] == widget.space.title) {
        return fetchedSpace;
      }
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: FutureBuilder<List<Map<String, String>>>(
          future: _spaces,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasData) {
              final matchingSpace = findMatchingSpace(snapshot.data!);
              return Column(
                children: [
                  SizedBox(
                    width: 400,
                    height: 200,
                    child: Image.asset(widget.space.image1, fit: BoxFit.cover),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.all(10),
                        width: MediaQuery.of(context).size.width * 0.8,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.space.title,
                              style: TextStyle(fontSize: 20),
                            ),
                            Text(
                              matchingSpace?['address'] ?? 'Default Address',
                              style: TextStyle(fontSize: 12),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(10),
                        width: MediaQuery.of(context).size.width * 0.2,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Clipboard.setData(
                                  ClipboardData(
                                    text: matchingSpace?['telNo'] ?? 'Default',
                                  ),
                                );
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: Text('전화번호가 복사 되었습니다.'),
                                      content: Text('대머리청년을 찾아 주셔서 감사합니다.'),
                                      actions: [
                                        TextButton(
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                          child: Text('복사'),
                                        )
                                      ],
                                    );
                                  },
                                );
                              },
                              child: FaIcon(FontAwesomeIcons.phone),
                            ),
                            Gesture_Screen(
                              matchingSpace: matchingSpace,
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.all(20),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 50),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          children: [
                            FaIcon(FontAwesomeIcons.building),
                            Padding(padding: EdgeInsets.all(10)),
                            Text('공간 요금'),
                            Text(
                              matchingSpace?['spcCost'] ?? 'Default Address',
                              style: TextStyle(fontSize: 12),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            FaIcon(FontAwesomeIcons.droplet),
                            Padding(padding: EdgeInsets.all(10)),
                            Text(
                              matchingSpace?['foodYn'] ?? 'Default Address',
                              style: TextStyle(fontSize: 12),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: 30,
                    child: const Divider(
                      color: Colors.blue,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(10),
                  ),
                  RowScreen(
                    matchingSpace: matchingSpace,
                  ),
                ],
              );
            } else {
              return Center(child: Text('No data found'));
            }
          },
        ),
      ),
    );
  }
}
