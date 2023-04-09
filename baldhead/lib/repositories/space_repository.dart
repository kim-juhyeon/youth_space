import 'package:baldhead/models/space.dart';

class SpaceRepository {
  final List<Space> _dummySpaces = [
    Space(
        title: '마포청년나루',
        subtitle: '서울 마포구',
        description: '',
        image: 'images/processed/list_img_01_80.png'),
    Space(
        title: '강북청년창업마루',
        subtitle: '서울 강북구',
        description: '',
        image: 'images/processed/list_img_02_80.png'),
    Space(
        title: '청년재단',
        subtitle: '서울 종로구',
        description: '',
        image: 'images/processed/list_img_03_80.png'),
    Space(
        title: '청년활동공간 청춘삘딩',
        subtitle: '서울 금천구',
        description: '',
        image: 'images/processed/list_img_04_80.png'),
    Space(
        title: '서울청년센터 성동 오랑',
        subtitle: '서울 성동구',
        description: '',
        image: 'images/processed/list_img_05_80.png'),
    Space(
        title: '서울청년센터 광진 오랑',
        subtitle: '서울 광진구',
        description: '',
        image: 'images/processed/list_img_06_80.png'),
    Space(
        title: '구로 청년공간 청년이룸',
        subtitle: '서울 구로구',
        description: '',
        image: 'images/processed/list_img_07_80.png'),
    Space(
        title: '서울청년센터 마포 오랑',
        subtitle: '서울 마포구',
        description: '',
        image: 'images/processed/list_img_08_80.png'),
    Space(
        title: '서울 청년센터 동대문오랑',
        subtitle: '서울 동대문구',
        description: '',
        image: 'images/processed/list_img_09_80.png'),
    Space(
        title: '서울청년센터 관악오랑 청년문화공간 신림동쓰리룸',
        subtitle: '서울 관악구',
        description: '',
        image: 'images/processed/list_img_10_80.png'),
    Space(
        title: '삼양청년회관',
        subtitle: '서울 강북구',
        description: '',
        image: 'images/processed/list_img_02_80.png'),
  ];

  List<Space> getSpaces() {
    return _dummySpaces;
  }
}
