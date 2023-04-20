// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';

// class Sharescreen extends StatefulWidget {
//   @override
//   _SharescreenState createState() => _SharescreenState();
// }

// class _SharescreenState extends State<Sharescreen> {
//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;
//   final CollectionReference _shareCollection =
//       FirebaseFirestore.instance.collection('shares');

//   Stream<QuerySnapshot> _getSharesStream() async* {
//     final currentUser = FirebaseAuth.instance.currentUser;
//     final userName = await FirebaseFirestore.instance
//         .collection('users')
//         .doc(currentUser!.uid)
//         .get()
//         .then((doc) => doc.get('name'));
//     yield* _shareCollection.where('userName', isEqualTo: userName).snapshots();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Shares'),
//       ),
//       body: StreamBuilder<QuerySnapshot>(
//         stream: _getSharesStream(),
//         builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
//           if (!snapshot.hasData) {
//             return CircularProgressIndicator();
//           }
//           final shares = snapshot.data!.docs;
//           return Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               SizedBox(
//                 height: 10.0,
//               ),
//               Text(
//                 'Name:',
//                 style: TextStyle(
//                     fontWeight: FontWeight.bold, fontSize: 16.0),
//               ),
//               // ...
//             ],
//           );
//         },
//       ),
//     );
//   }
// }
