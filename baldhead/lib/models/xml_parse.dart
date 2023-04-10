import 'package:xml/xml.dart';

class XmlParse {
  List<Map<String, String>> parseSpaces(
    Iterable<XmlElement> spaces,
  ) {
    final boyspace = spaces.map((node) {
      final spcName = node.findElements('spcName').single.text;
      final address = node.findElements('address').single.text;
      final spcTime = node.findElements('spcTime').single.text;
      final homepage = node.findElements('homepage').single.text;
      final telNo = node.findElements('telNo').single.text;
      final spcCost = node.findElements('spcCost').single.text;
      final majorForm = node.findElements('majorForm').single.text;
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
        'majorForm': majorForm,
      };
    }).toList();

    return boyspace;
  }
}
