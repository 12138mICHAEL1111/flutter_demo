import 'package:flutter/material.dart';
class ProductPage extends StatefulWidget {
  ProductPage({Key key}) : super(key: key);

  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("商品页面"),),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          RaisedButton(
              child: Text("商品详情"),
              onPressed: () {
                Navigator.pushNamed(context, '/productinfo', arguments: {"pid": 213});
              },
              color: Theme.of(context).accentColor,
              textTheme: ButtonTextTheme.primary),
          
        ])
        );
        
  }
}