import 'package:el_title_scrolling/el_content_page_view.dart';
import 'package:el_title_scrolling/el_header_scrolling_view.dart';
import 'package:el_title_scrolling/shopping_page.dart';
import 'package:flutter/material.dart';

import 'class_page.dart';
import 'home_page.dart';
import 'my_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: '1'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  List<Widget> contentArrays = [];
  ///局部刷新组件
  GlobalKey<ELContentPageViewState> key = GlobalKey();
  List<String> titles = [
    "关注",
    "快来推荐",
    "热榜",
    "抗压",
    "结束抗压页面",
    "十字铺招待",
    "热榜",
    "抗压",
        "关注",
    "快来推荐",
    "热榜",
    "抗压",
    "结束抗压页面",
    "十字铺招待",
    "热榜",
    "抗压",
  ];

  @override
  void initState() {
    super.initState();
    HomePage homePage = const HomePage();
    ClassPage classPage = const ClassPage();
    ShoppingPage shoppingPage = const ShoppingPage();
    MyPage myPage = const MyPage();
    contentArrays.add(homePage);
    contentArrays.add(classPage);
    contentArrays.add(shoppingPage);
    contentArrays.add(myPage);
    contentArrays.add(homePage);
    contentArrays.add(classPage);
    contentArrays.add(shoppingPage);
    contentArrays.add(myPage);
        contentArrays.add(homePage);
    contentArrays.add(classPage);
    contentArrays.add(shoppingPage);
    contentArrays.add(myPage);
    contentArrays.add(homePage);
    contentArrays.add(classPage);
    contentArrays.add(shoppingPage);
    contentArrays.add(myPage);
  }

  // void _incrementCounter() {
  //   setState(() {
  //     // This call to setState tells the Flutter framework that something has
  //     // changed in this State, which causes it to rerun the build method below
  //     // so that the display can reflect the updated values. If we changed
  //     // _counter without calling setState(), then the build method would not be
  //     // called again, and so nothing would appear to happen.
  //     _counter++;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.

    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Column(
        children: [
          SizedBox(
              height: 50,
              child: ELHeaderText(
                titles: titles,
                isShowBottomImage: false,
                imageName: "images/account_icon.png",
                isShowPartitionLine: true,
                partitionLineColor: Colors.red,
                selectedIndex: _selectedIndex,
                selectedBlock: (int selectedIndex) {
                  _selectedIndex = selectedIndex;
                  // print("_selectedIndex ${_selectedIndex}");
                  setState(() {
                    key.currentState?.jumpt(_selectedIndex);
                  });
                },
              )),
          Expanded(
              child: ELContentPageView(
            key: key,
            contents: contentArrays,
            selectedIndex: _selectedIndex,
            selectedBlock: (selectedIndex) {
              setState(() {
                _selectedIndex = selectedIndex;
              });
              // print("_selectedIndex  selectedIndex ${_selectedIndex}");
            },
          )),
        ],
      ),
    );
  }
}

