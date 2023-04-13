class OnboardingContents {
  final String title;
  final String image;
  final String desc;

  OnboardingContents({
    required this.title,
    required this.image,
    required this.desc,
  });
}

List<OnboardingContents> contents = [
  OnboardingContents(
    title: "Space",
    image: "assets/images/image1.png",
    desc: "청년들이 자유롭게 공부 할 수 있는 \n공간을 제공합니다.",
  ),
  OnboardingContents(
    title: "Chatting",
    image: "assets/images/image2.png",
    desc: "독서 or 취향을 공유 하는 Study를 참여해보세요",
  ),
  OnboardingContents(
    title: "Connect",
    image: "assets/images/image3.png",
    desc: "현재 위치해 있는 무료 서비스를 이용해 보세요",
  ),
];
