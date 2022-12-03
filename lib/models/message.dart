import '../constants.dart';

class Message {
  final String id;
  final String msg;
  Message(this.msg,this.id);
  factory Message.fromJson(jsonData){
    return Message(jsonData[KMessage],jsonData['id']);
  }
}