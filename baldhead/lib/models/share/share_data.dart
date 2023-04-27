import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ShareData extends ChangeNotifier {
  final CollectionReference _shareCollection =
      FirebaseFirestore.instance.collection('shares');

  List<Map<String, dynamic>> _shares = [];
  List<Map<String, dynamic>> _filteredShares = [];

  List<Map<String, dynamic>> get shares => _shares;
  List<Map<String, dynamic>> get filteredShares => _filteredShares;
//_shares 목록에 대한 모든 수정 사항이 자동으로 전파
  void addShare(Map<String, dynamic> share) {
    _shares.add(share);
    _shareCollection.add(share);
    notifyListeners();
  }

  void fetchShares() async {
    try {
      final snapshot = await _shareCollection.get();
      _shares = snapshot.docs
          .map((doc) => doc.data() as Map<String, dynamic>)
          .toList();
    } catch (e) {
      print('Error feching shares: $e');
    }
    //Firestore 데이터베이스에서 가져온 공유 데이터로 업데이트
    notifyListeners();
  }

  void searchShares(String query) {
    if (query.isEmpty) {
      _filteredShares = _shares;
    } else {
      _filteredShares = _shares
          .where((share) => share['category'].toLowerCase().contains(query))
          .toList();
    }
    notifyListeners();
  }
}
