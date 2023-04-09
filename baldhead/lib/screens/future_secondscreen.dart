import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:baldhead/models/space.dart';
import 'package:xml/xml.dart';

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

    final boyspace = spaces.map((node) {
      final spcName = node.findElements('spcName').single.text;
      final address = node.findElements('address').single.text;
      final spcTime = node.findElements('spcTime').single.text;
      final homepage = node.findElements('homepage').single.text;
      final telNo = node.findElements('telNo').single.text;
      final spcCost = node.findElements('spcCost').single.text;
      //불러온 데이터에 noise가 껴있음;;
      final foodYn =
          node.findElements('foodYn').single.text.replaceAll(']]>', '').trim();
      final addFacilCost = node.findElements('addFacilCost').single.text;

      return {
        'spcName': spcName,
        'address': address,
        'spcTime': spcTime,
        'homepage': homepage,
        'telNo': telNo,
        'spcCost': spcCost,
        'foodYn': foodYn,
        'addFacilCost': addFacilCost,
      };
    }).toList();

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
                    child: Image.asset(widget.space.image, fit: BoxFit.cover),
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
                          children: const [
                            Icon(Icons.heart_broken),
                            Icon(Icons.pause_presentation),
                          ],
                        ),
                      )
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
                            Text('공간 요금'),
                            Text(
                                matchingSpace?['spcCost'] ?? 'Default Address'),
                          ],
                        ),
                        Column(
                          children: [
                            Icon(Icons.abc),
                            Text(matchingSpace?['foodYn'] ?? 'Default Address'),
                          ],
                        ),
                        Column(
                          children: [
                            Icon(Icons.abc),
                            Text(matchingSpace?['foodYn'] ?? 'Default Address'),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: 60,
                    child: const Divider(
                      color: Colors.blue,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(10),
                  ),
                  Container(
                    child: Column(children: [
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.2,
                              child: Text('운영시간'),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.8,
                              child: Text(matchingSpace?['spcTime'] ??
                                  'Default Address'),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.2,
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.8,
                            ),
                          ],
                        ),
                      )
                    ]),
                  )
                ],
              );
            } else {
              return Center(
                child: Text('Error loading data'),
              );
            }
          },
        ),
      ),
    );
  }
}
