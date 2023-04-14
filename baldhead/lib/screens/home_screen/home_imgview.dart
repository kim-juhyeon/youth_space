import 'package:flutter/material.dart';

class ImgView extends StatefulWidget {
  final double imageWidth;

  const ImgView({Key? key, required this.imageWidth}) : super(key: key);

  @override
  _ImgViewState createState() => _ImgViewState();
}

//_imgViewState별도로 위제 정리 필요 (수정!)
class _ImgViewState extends State<ImgView> {
  int _currentPage = 0;

  AnimatedContainer _buildDots({
    int? index,
  }) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200), //200밀리초로 변경시간을 늘림
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(50),
        ),
        color: Color.fromARGB(255, 20, 118, 69),
      ),
      margin: const EdgeInsets.only(right: 5),
      height: 10,
      curve: Curves.easeIn,
      width: _currentPage == index ? 20 : 10,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      child: Column(
        children: [
          Expanded(
            child: PageView(
              scrollDirection: Axis.horizontal,
              onPageChanged: (int page) {
                setState(() {
                  _currentPage = page;
                });
              },
              children: [
                Image.asset(
                  'assets/images/ad/image1.png',
                  width: widget.imageWidth,
                  height: double.infinity,
                  fit: BoxFit.cover,
                ),
                Image.asset(
                  'assets/images/ad/image2.png',
                  width: widget.imageWidth,
                  height: double.infinity,
                  fit: BoxFit.cover,
                ),
                Image.asset(
                  'assets/images/ad/image4.png',
                  width: widget.imageWidth,
                  height: double.infinity,
                  fit: BoxFit.cover,
                ),
                Image.asset(
                  'assets/images/ad/image5.png',
                  width: widget.imageWidth,
                  height: double.infinity,
                  fit: BoxFit.cover,
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          //나중에 page index(lenght)에 따라 children 값이 변경해야 함(수정필요)
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List<Widget>.generate(
              4,
              (int index) => _buildDots(index: index),
            ),
          ),
        ],
      ),
    );
  }
}
