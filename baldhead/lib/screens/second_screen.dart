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
  List<Map<String, String>> _spaces = [];
  void boy_space() async {
    var result = await Dio().get(
      "https://www.youthcenter.go.kr/opi/wantedSpace.do?pageIndex=1&display=28&pageType=1&srchAreaCpvn=003002001&openApiVlak=687a1e8788e29f1525bf4c18", // 비밀
    );
    final spaceXml = result.data.toString();
    final document = XmlDocument.parse(spaceXml);
    final spaces = document.findAllElements('space');
//map 메서드를 통해
    final boyspace = spaces.map((node) {
      final spcName = node.findElements('spcName').single.text;
      final address = node.findElements('address').single.text;
      final spcTime = node.findElements('spcTime').single.text;
      final homepage = node.findElements('homepage').single.text;
      final telNo = node.findElements('telNo').single.text;
      final spcCost = node.findElements('spcCost').single.text;
      final foodYn = node.findElements('foodYn').single.text;
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

    setState(() {
      _spaces = boyspace;
    });
  }

  @override
  void initState() {
    super.initState();
    boy_space();
  }

  Map<String, String> findMatchingSpace() {
    for (var fetchedSpace in _spaces) {
      if (fetchedSpace['spcName'] == widget.space.title) {
        return fetchedSpace;
      }
    }
    return {}; // Return an empty map if no matching space is found
  }

  @override
  Widget build(BuildContext context) {
    final matchingSpace = findMatchingSpace();
    //widget.spaces.firstWhere((s) => s['spcName'] == widget.space.title);
    //final args = ModalRoute.of(context)?.settings.arguments
    //as Space; // find the matching space
    return Scaffold(
      body: Column(
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
                      style: TextStyle(fontSize: 18),
                    ),
                    Text(
                      //(matchingSpace['address']
                      matchingSpace['address'] ?? 'Default Address',
                      style: TextStyle(fontSize: 10),
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
                    Icon(Icons.abc),
                    Text(matchingSpace['addFacilCost'] ?? 'Default Address'),
                  ],
                ),
                Column(
                  children: [
                    Icon(Icons.abc),
                    Text('전화'),
                  ],
                ),
                Column(
                  children: [
                    Icon(Icons.abc),
                    Text(matchingSpace['foodYn'] ?? 'Default Address'),
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
                      child:
                          Text(matchingSpace['spcTime'] ?? 'Default Address'),
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
                      child: Text('q2'),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.8,
                      child: Text('asdsad'),
                    ),
                  ],
                ),
              )
            ]),
          )
        ],
      ),
    );
  }
}
