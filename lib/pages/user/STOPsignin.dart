import '../../widget/Btn.dart';
import 'package:flutter_screen_adapter/flutter_screen_adapter.dart';
import 'package:flutter/material.dart';
import '../../widget/InputText.dart';
import 'package:dio/dio.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import '../tabs/tabs.dart';
class StopSignIn extends StatefulWidget {
  StopSignIn({Key key}) : super(key: key);

  @override
  _SettingPageState createState() => _SettingPageState();
}

class _SettingPageState extends State<StopSignIn> {
  String email;
  String password;
  String rPassword;
  //重要！ 重要！
  //重要！ 重要！
  //async 和await为异步操作 dart是单线程，优先执行耗时短的任务
  //所以涉及到文件 数据库写入读取的操作包括接口调用必须加await方法让他先执行完，再去执行下面的
  //具体方面是在函数名字后加上async， 方法前加上await
  //具体可百度 bilibili
  //注册方法
  doRegister() async{
    //字面意思
    if(password.length<6){
      //flutter的错误提示框
      Fluttertoast.showToast(
          msg: 'password cannot be less than 6 digits',
          toastLength:Toast.LENGTH_SHORT,
          gravity:ToastGravity.CENTER
         );
    }
    //字面意思
    else if(rPassword!=password){
        Fluttertoast.showToast(
          msg: 'Please input same password',
          toastLength:Toast.LENGTH_SHORT,
          gravity:ToastGravity.CENTER
          
         );
    }else{
      //重要！ 重要！
      //重要！ 重要！
      //自定义的注册接口
      //没后端代码点不了 但还是要看下
      //Dio为http请求库 可执行get post等操作
      //{"email":this.email,"password":this.password}为参数发送给服务器
      //如果邮箱被注册 返回的response 为{"message":"email has been registered"}
      //如果没有{"Token":xxx,"email":xxx,"message":"success"}
      //192.168.50.16:3000为我的ipv4地址
      //xxx是在服务器中定义的变量
        var api = 'http://192.168.50.16:3000/stop/api/signin';
        var response = await Dio().post(api,data:{"email":this.email,"password":this.password});
        if(response.data["message"]=='success'){
          //SharedPreferences是本地储存的轻量数据，用于验证登陆状态之类的
          //类似于map的储存类型，会把数据储存在本地
          //一般登陆才会用到 
          SharedPreferences pref = await SharedPreferences.getInstance();
           pref.setString('Email',json.encode(response.data['email']));
          Navigator.of(context).pushAndRemoveUntil(
            new MaterialPageRoute(builder: (context)=>new Tabs()),
            (route) => route == null);
      }
      else{
       Fluttertoast.showToast(
          msg: '${response.data["message"]}',
          toastLength:Toast.LENGTH_SHORT,
          gravity:ToastGravity.CENTER
         );
     }
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
    
        title: Text("login")
      ),
      body: Container(
        padding: EdgeInsets.all(ScreenAdapter.value(30)),
        child:ListView(
          children: <Widget>[
        
        SizedBox(height: 10,),
        InputText(
          text:"please input email",
          onChanged: (value){
            this.email=value;
          },
        ),
        SizedBox(height: 10,),
        InputText(
          text:"Please input password",
          password: true,
          onChanged: (value){
            this.password=value;
          },
        ),
        SizedBox(height:20),
        InputText(
          text:"Input password again",
          password: true,
          onChanged: (value){
            this.rPassword=value;
          },
        ),
          Btn(text:"sign in",
              color: Colors.red,
              height: 74,
              //调用上面的doRegister
              cb:doRegister
          ),         
        ],
      )
      )
    );
    
  }
}