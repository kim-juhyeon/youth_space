import 'package:flutter/material.dart';
import 'package:baldhead/repositories/space_repository.dart';
// import 'package:baldhead/screens/detail_screen.dart';
import 'package:baldhead/models/space.dart';

class ListScreen extends StatelessWidget {
  ListScreen({Key? key}) : super(key: key);

  final List<Space> spaces = SpaceRepository().getSpaces();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: false,
        title: const Text(
          '어느 청년공간으로 가볼까요?',
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 28, 28, 28)),
        ),
        toolbarHeight: 120.0,
      ),
      body: ListView.separated(
        padding: const EdgeInsets.only(top: 13.0),
        itemCount: spaces.length,
        itemBuilder: (context, index) {
          return SpaceTile(space: spaces[index]);
        },
        separatorBuilder: (BuildContext context, int index) => const Divider(),
      ),
    );
  }
}

class SpaceTile extends StatelessWidget {
  final Space space;
  const SpaceTile({super.key, required this.space});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      dense: true, //listtitle의 밀집여부
      visualDensity: const VisualDensity(vertical: 4),
      // tileColor: Colors.amber,
      title: Text(
        space.title,
        style: const TextStyle(fontSize: 15.0),
      ),
      subtitle: Text(
        space.subtitle,
        style: const TextStyle(color: Color.fromARGB(255, 184, 184, 184)),
      ),
      leading: Image.asset(space.image),
      trailing: const Icon(
        //title,subtiltle의 간격조절
        Icons.arrow_forward_ios,
        size: 16,
        color: Color.fromARGB(255, 201, 201, 201),
      ),
      onTap: () {
        Navigator.of(context).pushNamed(
          '/detail',
          arguments: space,
        );
      },
    );
  }
}

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       // appBar:
//       // AppBar(
//       //   title: Text('어느 청년공간으로 가볼까?'),
//       // ),
//       body: CustomScrollView(
//         slivers: [
//           const SliverAppBar(
//             // https://www.youtube.com/watch?v=I26rzdjqVXA
//             centerTitle: false,
//             floating: false,
//             expandedHeight: 200.0,
//             flexibleSpace: FlexibleSpaceBar(
//               title: Text(
//                 '어느 청년공간으로 갈까?',
//                 style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
//               ),
//             ),
//           ),
//           SliverFillRemaining(
//             child: ListView.builder(
//             itemCount: spaces.length,
//             itemBuilder: (context, index) {
//               return SpaceTile(space: spaces[index]);
//             },
//           ))
//         ],
//       ),
//     );
//   }
// }
