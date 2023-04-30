import 'package:cloud_firestore/cloud_firestore.dart';

class Item {
  late String id;
  late String userId;
  late String category;
  late String description;
  late String people;
  late String title;

  Item({
    required this.id,
    required this.userId,
    required this.category,
    required this.description,
    required this.people,
    required this.title,
  });

  Item.fromeSnapshot(DocumentSnapshot snapshot) {
    Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;
    id = snapshot.id;
    userId = data['userId'];
    category = data['category'];
    description = data['description'];
    people = data['people'];
    title = data['title'];
  }
}
