// import 'package:dio/dio.dart';
// import 'package:flutter/material.dart';
// import 'package:baldhead/models/space.dart';
// import 'package:xml/xml.dart';

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
//boy_space 메서드 내에서 'setState'가 호출되어 '_spaces'변수를
//'boyspace'데이터 로업데이트 합니다. setstate가 호출되면 빌드가 다시 호출 _spaces 데이터를 사용하여 화면에 콘탠츠를 표시합니다.
    setState(() {
      _spaces = boyspace;
    });
  }

//DetailScreen 위젯이 생성되고 initStat가 호출 (boy_space가 초기에 불러와야함 Dio를 불러오기 때문)
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
    return {}; //
  }

  @override
  Widget build(BuildContext context) {
    final matchingSpace = findMatchingSpace();
    //widget.spaces.firstWhere((s) => s['spcName'] == widget.space.title);
    //final args = ModalRoute.of(context)?.settings.arguments
    //as Space; // find the matching space
    return Scaffold(
      body: SafeArea(
        child: Column(
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
                        //(matchingSpace['address']
                        matchingSpace['address'] ?? 'Default Address',
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
                      Text(matchingSpace['spcCost'] ?? 'Default Address'),
                    ],
                  ),
                  Column(
                    children: [
                      Icon(Icons.abc),
                      Text(matchingSpace['foodYn'] ?? 'Default Address'),
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
              child: Column(
                children: [
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
                          child: Text(
                              matchingSpace['spcTime'] ?? 'Default Address'),
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
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
