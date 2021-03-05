import 'package:flutter/material.dart';
import 'package:flutter_demo/services/UserServices.dart';


class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isLogin = false;
  String userEmail = "";
  @override
  void initState() { 
    super.initState();
    this._getUserinfo();
  }
  _getUserinfo() async{
    // 看services/UserServices.dart
    // 一般登陆才会用到 
    var isLogin = await UserServices.getUserState();
    var userEmail = await UserServices.getUserInfo();
    setState((){
      this.userEmail=userEmail;
      this.isLogin = isLogin;  
      }
    );
  }
  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          //如果没登陆 展示登陆注册按钮
          //如果登陆了，展示当前邮箱和注销按钮 
          !this.isLogin?RaisedButton(
              child: Text("登陆注册"),
              onPressed: () {
                Navigator.pushNamed(context, '/login');
              },
              color: Theme.of(context).accentColor,
              textTheme: ButtonTextTheme.primary):
              Expanded(
                flex:1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    //展示当前的登陆的用户的邮箱
                    Text("email: ${this.userEmail}",
                    style: TextStyle(
                      fontSize:  18
                    )),
                    RaisedButton(
                      child: Text("注销"),
                      //注销
                      onPressed: (){
                        setState(() {
                           UserServices.logOut();    
                           this.isLogin=false;   
                        });
                        
                      },
                    )
                  ],
                ),
                ),
          SizedBox(height: 20),
        ]);
  }
}
