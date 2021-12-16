import 'package:flutter/material.dart';

class MyPage extends StatefulWidget {
  const MyPage({ Key? key }) : super(key: key);

  @override
  _MyPageState createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> with AutomaticKeepAliveClientMixin {
    void initState() {
    // TODO: implement initState
    super.initState();
    print("我的");
  }
  @override
  Widget build(BuildContext context) {

    super.build(context);
    return Container(
      child: Text("我的页"),
    );
  }

   @override 
  bool get wantKeepAlive => true;
}
