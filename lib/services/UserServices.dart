import 'package:shared_preferences/shared_preferences.dart';
 

class UserServices{
  //读取SharedPreferences本地储存的 key Email
  static getUserInfo() async{
    String userEmail;
    try{
      SharedPreferences pref = await SharedPreferences.getInstance();
      String email = pref.getString('Email');
      userEmail = email;
    }catch(e){   
    }
    return userEmail;
  }

  //如果有useremail login状态为true
  static getUserState() async{
    var userEmail = await UserServices.getUserInfo();
    if(userEmail!=null){
      return true;
    }
    return false;
  }
 //清除SharedPreferences即为登出
  static logOut() async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.clear();
  }
}