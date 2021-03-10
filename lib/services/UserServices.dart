import 'package:shared_preferences/shared_preferences.dart';
 

class UserServices{
  //读取SharedPreferences本地储存的key: Email
  static getUserInfo() async{
    String userid;
    try{
      SharedPreferences pref = await SharedPreferences.getInstance();
      String id = pref.getString('userid');
      userid = id;
    }catch(e){   
    }
    return userid;
  }

  //如果有useremail login状态为true
  static getUserState() async{
    var userid = await UserServices.getUserInfo();
    if(userid!=null){
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