import 'package:flutter/material.dart';

class ImgView extends StatelessWidget {
  final double imageWidth;
  const ImgView({super.key, required this.imageWidth});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      child: PageView(
        scrollDirection: Axis.horizontal,
        //crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(
            'https://www.youthcenter.go.kr/framework/filedownload/richEditDownload.do?filePathName=L2F0dGFjaG1lbnQveW91dGhjZW50ZXIvcmljaGVkaXQvMjAyMy8wNC8xMS8yMDIzMDQxMTA5MjA1MzUwNC5wbmc=',
            width: imageWidth,
            height: double.infinity,
            fit: BoxFit.cover,
          ),
          Image.network(
            'https://www.youthcenter.go.kr/framework/filedownload/richEditDownload.do?filePathName=L2F0dGFjaG1lbnQveW91dGhjZW50ZXIvcmljaGVkaXQvMjAyMy8wNC8xMC8yMDIzMDQxMDExMTMzNDA5OS5qcGc=',
            width: imageWidth,
            height: double.infinity,
            fit: BoxFit.cover,
          ),
          Image.network(
            'https://www.youthcenter.go.kr/framework/filedownload/getImage.do?filePathName=z5VpaHt9JBV54fwiQTLnrmKLnNao2Us55r%2Br4ff6IUHkEdL6z3REeGfuEnt88CMBLZorX7hKHtT1wNFH60sqag%3D%3D',
            width: imageWidth,
            height: double.infinity,
            fit: BoxFit.cover,
          ),
          Image.network(
            'https://www.kua.go.kr/common/directStaticImgView.do?filePath=GDo9Er9fb6byzHwxCsVmD8FS%2BJRfR93YpwwV0Y19AXc%3D&fileName=5W0EsmhihI7p92vvTZ4yV5wHxwqvWoxweGbfsbB61w6lA36wpwNx1F7u5JLAbbMm%2F%2FfYPHRfS5zdzVxkgZ5tiA%3D%3D&oriFileName=FwJklRIh5CCBnP2it4JRRQ%3D%3D',
            width: imageWidth,
            height: double.infinity,
            fit: BoxFit.cover,
          ),
        ],
      ),
    );
  }
}
