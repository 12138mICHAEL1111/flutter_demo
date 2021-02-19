import 'package:flutter/material.dart';
import 'Category.dart';
import 'home.dart';
import 'setting.dart';

class Tabs extends StatefulWidget {
  Tabs({Key key}) : super(key: key);

  @override
  _TabsState createState() => _TabsState();
}

class _TabsState extends State<Tabs> {
  int _currentIndex = 0;
  List _pageList = [HomePage(), CategoryPage(), SettingPage()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('flutter demo'),
        ),
        body:this._pageList[this._currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: this._currentIndex,
          onTap:(int index){
            setState(() {
              this._currentIndex = index;
            });
          },
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "首页"
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.category),
              label: "分类"
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: "设置"
            )
          ],
        ),
      );
  }
}

