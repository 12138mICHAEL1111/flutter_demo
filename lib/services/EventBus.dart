import 'package:event_bus/event_bus.dart';
//没用到 别看了
EventBus eventBus = EventBus();
class UserEvent{
  String str;
  UserEvent(String str){
    this.str=str;
  }
}