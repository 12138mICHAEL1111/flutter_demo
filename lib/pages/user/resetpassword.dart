import '../../widget/Btn.dart';
import 'package:flutter_screen_adapter/flutter_screen_adapter.dart';
import 'package:flutter/material.dart';
import '../../widget/InputText.dart';
import 'package:dio/dio.dart';
class ResetPassword extends StatefulWidget {
  ResetPassword({Key key}) : super(key: key);

  @override
  _ResetPassword createState() => _ResetPassword();
}

class _ResetPassword extends State<ResetPassword> {
  String id;
  String password;
  String rpassword;
  String email;
  resetpassword() async{
    var api="http://192.168.50.16:3000/stop/api/rest/users/resetpassword";
    var response = await Dio().post(api,data:{"email":this.email,"userid":this.id,"password":this.password}); 
    print(response.data);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          text:"please input ID",
          onChanged: (value){
            this.id=value;
          },
        ),
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
            this.rpassword=value;
          },
        ),
       
          Btn(text:"sign in",
              color: Colors.red,
              height: 74,
              //调用上面的doRegister
              cb:resetpassword
          ),         
        ],
      )
      )
    );
  }
}