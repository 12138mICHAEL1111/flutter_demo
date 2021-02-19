import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          RaisedButton(
              child: Text("搜索"),
              onPressed: () {
                Navigator.pushNamed(context, '/search', arguments: {"id": 123});
              },
              color: Theme.of(context).accentColor,
              textTheme: ButtonTextTheme.primary),
          SizedBox(height: 20),
          RaisedButton(
              child: Text("商品"),
              onPressed: () {
                Navigator.pushNamed(context, '/product');
              },
              color: Theme.of(context).accentColor,
              textTheme: ButtonTextTheme.primary)
        ]);
  }
}
