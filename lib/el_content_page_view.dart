import 'package:flutter/material.dart';

class ELContentPageView extends StatefulWidget {
  ///pageview的内容
  final List<Widget> contents;

  ///被选中页面的下标
  final int selectedIndex;
  final Function(int selectedIndex) selectedBlock;
  const ELContentPageView(
      {Key? key,
      required this.contents,
      required this.selectedIndex,
      required this.selectedBlock})
      : super(key: key);

  @override
  ELContentPageViewState createState() => ELContentPageViewState();
}

class ELContentPageViewState extends State<ELContentPageView> {
  late PageController pageController;
  @override
  void initState() {
    super.initState();
    pageController =
        PageController(initialPage: widget.selectedIndex, keepPage: true);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      child: PageView(
        scrollDirection: Axis.horizontal,
        reverse: false,
        controller: pageController,
        pageSnapping: true,
        children: widget.contents,
        onPageChanged: (index) {
          widget.selectedBlock(index);
          // print(index);
        },
      ),
    );
  }

  void jumpt(int index) {
    if (pageController.hasClients) {
      pageController.jumpToPage(index);
    }
  }
}

