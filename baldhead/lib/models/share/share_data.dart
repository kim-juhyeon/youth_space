import 'package:baldhead/models/share/share_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ItemProvider with ChangeNotifier {
  //item레파지토리 또는 shareReference 파이어베이스화 하여 불러오는것
  late CollectionReference shareReference;
  List<Item> items = [];
  List<Item> searchItem = [];

  ItemProvider({reference}) {
    shareReference =
        reference ?? FirebaseFirestore.instance.collection('shares');
  }

  Future<void> fetchItems() async {
    items = await shareReference.get().then((QuerySnapshot results) {
      return results.docs.map((DocumentSnapshot document) {
        return Item.fromeSnapshot(document);
      }).toList();
    });
    notifyListeners();
  }

  Future<void> search(String query) async {
    final results = items
        .where(
            (item) => item.category.toLowerCase().contains(query.toLowerCase()))
        .toList();
    searchItem.clear();
    searchItem.addAll(results);
    notifyListeners();
  }

  // List<Map<String, dynamic>> _shares = [];
  // List<Map<String, dynamic>> _filteredShares = [];

  // List<Map<String, dynamic>> get shares => _shares;
  // List<Map<String, dynamic>> get filteredShares => _filteredShares;

//   get length => null;
// //_shares 목록에 대한 모든 수정 사항이 자동으로 전파
//   void addShare(Map<String, dynamic> share) {
//     _shares.add(share);
//     _shareCollection.add(share);
//     notifyListeners();
//   }

//   void fetchShares() async {
//     try {
//       final snapshot = await _shareCollection.get();
//       _shares = snapshot.docs
//           .map((doc) => doc.data() as Map<String, dynamic>)
//           .toList();
//     } catch (e) {
//       print('Error feching shares: $e');
//     }
//     //Firestore 데이터베이스에서 가져온 공유 데이터로 업데이트
//     notifyListeners();
//   }

//   void searchShares(String query) {
//     if (query.isEmpty) {
//       _filteredShares = _shares;
//     } else {
//       _filteredShares = _shares
//           .where((share) => share['category'].toLowerCase().contains(query))
//           .toList();
//     }
//     notifyListeners();
//   }
}
