import 'package:flutter/material.dart';
import 'package:baldhead/repositories/space_repository.dart';
import 'package:baldhead/models/space.dart';

class ListScreen extends StatelessWidget {
  ListScreen({Key? key}) : super(key: key);

  final List<Space> spacesList = SpaceRepository().getSpaces();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: const Text(
              '어느 청년공간으로 가볼까요?',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 28, 28, 28)),
            ),
            toolbarHeight: 80.0,

            pinned: false, //ture일 경우 상단의 고정
            floating: true, // 스크롤 위로 올리면 다시 나타납니다.
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return Column(
                  children: [
                    SpaceTile(space: spacesList[index]),
                    //길이의 index 크면 diver를 구분 짓는다. 마지막 항목에는 구분선이 없는 것을 확인 할 ㅜㅅ 있음
                    if (index < spacesList.length - 1)
                      Divider(
                        color: Colors.green,
                      ),
                  ],
                );
              },
              childCount: spacesList.length,
            ),
          ),
        ],
      ),
    );
  }
}

class SpaceTile extends StatelessWidget {
  final Space space;
  const SpaceTile({Key? key, required this.space}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      dense: true,
      visualDensity: const VisualDensity(vertical: 4),
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
