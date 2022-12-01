import '../constants.dart';

class Message {
  final String msg;
  Message(this.msg);
  factory Message.fromJson(jsonData){
    return Message(jsonData[KMessage]);
  }
}