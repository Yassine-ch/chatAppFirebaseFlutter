import 'package:chatapp/models/message.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChatBuble extends StatelessWidget {
 const ChatBuble({Key? key,
  required this.msg
  }) : super(key: key);
 final Message msg;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 10,vertical: 10),


        padding: EdgeInsets.only(left: 16,top: 10,bottom: 10,right: 16),
        decoration: BoxDecoration(
          border: Border.all(
            color: Color(0xff7046FA),
            width: 2
          ),
          borderRadius: BorderRadius.only(topLeft: Radius.circular(50),
              topRight: Radius.circular(50),
              bottomRight: Radius.circular(50)
          ),
          color: Colors.white,
        ),
        child:  Text(msg.msg,
          style:TextStyle(
            color: Colors.black,
          ),
        ),
      ),
    );

  }
}
class ChatBubleForFriend extends StatelessWidget {
  const ChatBubleForFriend({Key? key,
    required this.msg
  }) : super(key: key);
  final Message msg;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 10,vertical: 10),


        padding: EdgeInsets.only(left: 16,top: 10,bottom: 10,right: 16),
        decoration: BoxDecoration(
          border: Border.all(
              color: Colors.black,
              width: 2
          ),
          borderRadius: BorderRadius.only(topLeft: Radius.circular(50),
              topRight: Radius.circular(50),
              bottomLeft: Radius.circular(50)
          ),
          color: Color(0xffC0B3FF),
        ),
        child:  Text(msg.msg,
          style:TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );

  }
}

