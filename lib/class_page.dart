import 'package:flutter/material.dart';

class ClassPage extends StatefulWidget {
  const ClassPage({ Key? key }) : super(key: key);

  @override
  _ClassPageState createState() => _ClassPageState();
}

class _ClassPageState extends State<ClassPage> with AutomaticKeepAliveClientMixin{
    void initState() {
    // TODO: implement initState
    super.initState();
    print("分类");
  }
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Container(
      child: Text("分类页面"),
    );
  }

   @override 
  bool get wantKeepAlive => true;
}
