import 'package:flutter/material.dart';

class CategoryPage extends StatefulWidget {
  CategoryPage({Key key}) : super(key: key);

  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(length: 2,
    child:Scaffold(
      appBar: AppBar(
        title: Row(children: <Widget> [
          Expanded(
            child: TabBar(tabs: <Widget>[
          Tab(text: "热销",),
          Tab(text: "推荐",)
        ],),)
        ],),
      ),
      body:TabBarView(children: <Widget>[
          Column(children: <Widget>[
            SizedBox(height: 50,),
            RaisedButton(
              child: Text("跳转到表单页面"),
              onPressed: (){
               
              },
              color:  Theme.of(context).accentColor,
              textTheme: ButtonTextTheme.primary,
            )
          ],),
          Text("aaa")
      ],)
      
    ));
  }
}