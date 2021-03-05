import '../../widget/Btn.dart';
import 'package:flutter_screen_adapter/flutter_screen_adapter.dart';
import 'package:flutter/material.dart';
import '../../widget/InputText.dart';
import 'package:dio/dio.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import '../tabs/tabs.dart';
class LoginPage extends StatefulWidget {
  LoginPage({Key key}) : super(key: key);

  @override
  _SettingPageState createState() => _SettingPageState();
}

class _SettingPageState extends State<LoginPage> {
  String email;
  String password;
  login() async{
    //post接口 是我自定义的接口 192.168.50.16是我的ipv4地址
     var api = 'http://192.168.50.16:3000/stop/api/login';
     //response是post返回的数据 可以print response.data下看下返回什么，密码错误，找不到账号，登陆成功返回的是不一样的
     //data:{"email":this.email,"password":this.password}是post的参数 传给服务器的
     var response = await Dio().post(api,data:{"email":this.email,"password":this.password});
     var message = response.data["message"];
     if(message=="cannot find this email address"){
       //flutter的错误提示框
        Fluttertoast.showToast(
          msg: message,
          toastLength:Toast.LENGTH_SHORT,
          gravity:ToastGravity.CENTER
         );
    }
    else if(message=="wrong password"){
       Fluttertoast.showToast(
          msg: message,
          toastLength:Toast.LENGTH_SHORT,
          gravity:ToastGravity.CENTER
         );
    }
    else{
       Fluttertoast.showToast(
          msg: "Log in successfully",
          toastLength:Toast.LENGTH_SHORT,
          gravity:ToastGravity.CENTER
         );
         SharedPreferences pref = await SharedPreferences.getInstance();
           pref.setString('Email',json.encode(response.data['email']));
           //登陆成功跳转到主界面
          Navigator.of(context).pushAndRemoveUntil(
            new MaterialPageRoute(builder: (context)=>new Tabs()),
            (route) => route == null);
      }
      }
  
  
  @override
  Widget build(BuildContext context) {
     ScreenAdapter.init(context);
    return  Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon:Icon(Icons.close),
          onPressed: (){
            Navigator.pop(context);
          },
        ),
        actions:<Widget> [
          FlatButton(
            child: Text("客服"),
            onPressed: (){
            },
        )
        ],
        title: Text("login")
      ),
      body: Container(
        color: Colors.orange,
        padding: EdgeInsets.all(ScreenAdapter.value(30)),
        child:ListView(
          children: <Widget>[
            Center(
            child: Container(
              margin : EdgeInsets.only(top:30),
              height: ScreenAdapter.value(200) ,
              width: ScreenAdapter.value(200),
              child: Image.asset('images/logo.png')
              
            )
        ),
        SizedBox(height: 10,),
        //为自定义组件，看widget/InputText.dart
        //用于代码模块化
        //text和onchanged是传入的参数
        InputText(
          text:"Please input email",
          onChanged: (value){
            this.email = value;
          },
        ),
        SizedBox(height: 10,),
        InputText(
          text:"Please input password",
          password: true,
          onChanged: (value){
            this.password = value;
          },
        ),
        SizedBox(height:20),
        Container(
          padding: EdgeInsets.all(ScreenAdapter.value(20)),
          child: Stack(
            children: <Widget>[
              Align(
                alignment: Alignment.centerLeft,
                child: Text('忘记密码')),
                Align(
                alignment: Alignment.centerRight,
                child:InkWell(
                  onTap: (){
                    Navigator.pushNamed(context,'/stopregister');
                  },
                  child: Text('STOP注册'),
                )
              ),
            
            ],
          )
        ),
        //为自定义组件，看widget/Btn.dart
        //cb是回调函数，调用上面的login，这边不用加括号
          Btn(text:"登陆",
              color: Colors.red,
              height: 74,
              cb:login
          ),         
        ],
      )
      )
    );
    
  }
}