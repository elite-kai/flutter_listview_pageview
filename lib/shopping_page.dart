import 'package:flutter/material.dart';

class ShoppingPage extends StatefulWidget {
  const ShoppingPage({ Key? key }) : super(key: key);

  @override 
  _ShoppingPageState createState() => _ShoppingPageState();
}

class _ShoppingPageState extends State<ShoppingPage> with AutomaticKeepAliveClientMixin {
    void initState() {
    // TODO: implement initState
    super.initState();
    print("购物页");
  }
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Container(
      child: Text("购物页"),
    );
  }

  @override 
  bool get wantKeepAlive => true;
}
