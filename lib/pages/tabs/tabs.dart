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
  void initState()  {
    super.initState();

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('flutter demo'),
      ),
      floatingActionButton: Container(
        height: 70,
        width: 70,
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(35), color: Colors.white),
        child: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            setState(() {
              this._currentIndex = 1;
            });
          },
          backgroundColor: this._currentIndex == 1 ? Colors.red : Colors.yellow,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: this._pageList[this._currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: this._currentIndex,
        onTap: (int index) {
          setState(() {
            this._currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "首页"),
          BottomNavigationBarItem(icon: Icon(Icons.category), label: "分类"),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: "设置")
        ],
      ),
      drawer: Drawer(
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                  child: UserAccountsDrawerHeader(
                    accountName: Text("xxx"),
                    accountEmail: Text("xxx"),
                    currentAccountPicture: CircleAvatar(
                      backgroundImage: NetworkImage(
                          "https://www.itying.com/images/flutter/3.png"),
                    ),
                  ),
                )
              ],
            ),
            ListTile(
              title: Text("我的空间"),
              leading: CircleAvatar(
                child: Icon(Icons.home),
              ),
            ),
            Divider(),
            ListTile(
              title: Text("用户中心"),
              leading: CircleAvatar(
                child: Icon(Icons.people),
              ),
            ),
            Divider(),
            ListTile(
              title: Text("设置"),
              leading: CircleAvatar(
                child: Icon(Icons.settings),
              ),
            ),
          ],
        ),
      ),
  
    );
  }
}
