import 'package:flutter/material.dart';

class InputText extends StatelessWidget {

final String text;
final bool password;
final Object onChanged;
 InputText({Key key,this.text="输入内容",this.password=false,this.onChanged=null}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextField(
        obscureText: this.password,
        decoration: InputDecoration(
          hintText: this.text,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide.none),
          ),
        onChanged: this.onChanged,
        ),
        
        decoration: BoxDecoration(
          // color: Color.fromRGBO(233,233,233,0.8),
          // borderRadius: BorderRadius.circular(30)
          border:  Border(bottom: BorderSide(width:1,color:Colors.black12))
        ),
        );
    
  }
}