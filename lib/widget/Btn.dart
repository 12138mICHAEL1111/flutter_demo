import 'package:flutter/material.dart';
import 'package:flutter_screen_adapter/flutter_screen_adapter.dart';
class Btn extends StatelessWidget {
  final Color color;
  final String text;
  final Object cb;
  final double height;
  Btn({Key key,this.color = Colors.black,this.text="button",this.cb=null,this.height=68}) : super(key: key);

  @override
  Widget build(BuildContext context) {
     ScreenAdapter.init(context);
    return InkWell(
     onTap: this.cb,
     child:Container(
       margin: EdgeInsets.all(5),
       padding: EdgeInsets.all(5),
       height: ScreenAdapter.value(68),
       width:double.infinity,
       decoration: BoxDecoration(
         color: color,
         borderRadius: BorderRadius.circular(10)),
       child: Center(child: Text(this.text,style:TextStyle(color: Colors.white)),
       )
     )
    );
  }
}