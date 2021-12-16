import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ELHeaderText extends StatefulWidget {
  ///标题
  final List<String> titles;

  ///标题字体尺寸
  double? fontSize;

  ///标题默认字体颜色
  Color? defaultColor;

  ///标题选中颜色
  Color? selectedColor;

  ///是否显示隔断线
  bool? isShowPartitionLine;

  ///是否显示底部图片
  bool? isShowBottomImage;

  ///图片名称
  String? imageName;

  ///隔断线颜色
  Color? partitionLineColor;

  ///隔断线高度
  double? partitionLineHeight;

  ///标题内边距
  EdgeInsets? padding;

  ///被选中标题的下标
  int selectedIndex;

  final Function(int index) selectedBlock;

  ELHeaderText({
    Key? key,
    required this.titles,
    required this.selectedBlock,
    required this.selectedIndex,
    this.fontSize,
    this.defaultColor,
    this.selectedColor,
    this.isShowPartitionLine,
    this.isShowBottomImage,
    this.imageName,
    this.partitionLineColor,
    this.partitionLineHeight,
    this.padding,
  }) : super(key: key);

  @override
  _ELHeaderTextState createState() => _ELHeaderTextState();
}

class _ELHeaderTextState extends State<ELHeaderText> {
  ScrollController scrollController = ScrollController();
  final double defalutPaddingWidth = 8.0;

  @override
  void initState() {
    super.initState();
    scrollController.addListener(() {
      // print("scrollController.off  ${scrollController.offset}");
    });
  }

  @override
  Widget build(BuildContext context) {
    if (scrollController.hasClients) {
      final size = MediaQuery.of(context).size;
      final screenWidth = size.width;

      var width = 0.0;
      var selectedWidth = 0.0;
      for (var i = 0; i < widget.titles.length; i++) {
        String title = widget.titles[i];

        TextStyle textStyle = TextStyle(fontSize: widget.fontSize ?? 20);
        Size titleSize = boundingTextSize(title, textStyle);

        if (i <= widget.selectedIndex) {
          print("titleSizeWidth  ${titleSize.width}");
          width += (titleSize.width +
              (widget.padding?.left ?? defalutPaddingWidth) +
              (widget.padding?.right ?? defalutPaddingWidth));
        }
        if (i == widget.selectedIndex) {
          selectedWidth = (titleSize.width +
              (widget.padding?.left ?? defalutPaddingWidth) +
              (widget.padding?.right ?? defalutPaddingWidth));
        }
      }
      // print("offset  ${scrollController.offset}");
      // print("width  ${width}");
      // print("selectedWidth  ${selectedWidth}");
      // print("screenWidth/2.0  ${screenWidth / 2.0}");
      // print(
      //     "width - screenWidth/2.0)-selectedWidth+selectedWidth/2.0 ${width - screenWidth / 2.0 - selectedWidth + selectedWidth / 2.0}");
      if (width > screenWidth / 2.0 ||
          ((width <= screenWidth / 2.0) && (scrollController.offset != 0.0))) {
        // print("width-screenWidth/2.0  ${width - screenWidth / 2.0}");
        ///默认需要跳转的偏移量
        double needOffset =
            (width - screenWidth / 2.0) - selectedWidth + selectedWidth / 2.0;
        double paddingWidth = widget.padding?.left ?? defalutPaddingWidth;
        ///当需要隔档线条时候需要跳转的偏移量
        if ((widget.isShowPartitionLine ?? false) == true) {
          needOffset = (width - screenWidth / 2.0) -
              selectedWidth +
              selectedWidth / 2.0 +
              paddingWidth*2 * widget.selectedIndex;
        }

        ///判断左边距离
        if (needOffset <= 0) {
          scrollController.jumpTo(0.0);

          ///判断右边距离
        } else if (needOffset >= scrollController.position.maxScrollExtent) {
          scrollController.jumpTo(scrollController.position.maxScrollExtent);
        } else {
          scrollController.jumpTo(needOffset);
        }
      }
    }
    return ListView.builder(
        scrollDirection: Axis.horizontal,
        controller: scrollController,
        itemCount: widget.titles.length,
        itemBuilder: (context, index) {

          String title = widget.titles[index];
          return GestureDetector(
            behavior: HitTestBehavior.opaque,
            child: Padding(
              padding: widget.padding ??
                  EdgeInsets.fromLTRB(
                      defalutPaddingWidth, 8.0, defalutPaddingWidth, 8.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        title,
                        style: TextStyle(
                            fontSize: widget.fontSize ?? 20,
                            color: widget.selectedIndex == index
                                ? widget.selectedColor ?? Colors.red
                                : widget.defaultColor ?? Colors.black),
                      ),
                      ///当显示隔档线时需要给隔档线和字体一定的距离
                      ((widget.isShowPartitionLine ?? false) == false)
                          ? Container()
                          : (index == widget.titles.length - 1
                              ? Container()
                              : Container(
                                  width: (widget.padding?.left ??
                                      defalutPaddingWidth * 2)-1,
                                )),
                      ((widget.isShowPartitionLine ?? false) == false)
                          ? Container()
                          : (index == widget.titles.length - 1
                              ? Container()
                              : Container(
                                  height: widget.partitionLineHeight ?? 15.0,
                                  width: 1,
                                  color:
                                      widget.partitionLineColor ?? Colors.black,
                                ))
                    ],
                  ),
                  ((widget.isShowBottomImage ?? false) == false)
                      ? Container()
                      : (widget.selectedIndex == index
                          ? Padding(
                              padding: const EdgeInsets.fromLTRB(0, 0, 8, 0),
                              child: Image.asset(widget.imageName ??
                                  "images/account_icon.png"),
                            )
                          : Container())
                ],
              ),
            ),
            onTap: () {
              widget.selectedIndex = index;
              widget.selectedBlock(widget.selectedIndex);
              // setState(() {});
            },
          );
        });
  }

  ///计算文本size
  static Size boundingTextSize(String text, TextStyle style,
      {int maxLines = 2 ^ 31, double maxWidth = double.infinity}) {
    if (text.isEmpty) {
      return Size.zero;
    }
    final TextPainter textPainter = TextPainter(
        textDirection: TextDirection.ltr,
        text: TextSpan(text: text, style: style),
        maxLines: maxLines)
      ..layout(maxWidth: maxWidth);
    return textPainter.size;
  }
}
