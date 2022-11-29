import 'package:chatapp/constants.dart';
import 'package:chatapp/widgets/chat_buble.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {

 static String id ='ChatScreen';

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        automaticallyImplyLeading: false,
        backgroundColor: Color(0xffC0B3FF),
       title: Row(
         mainAxisAlignment: MainAxisAlignment.center,
         children: [
           Image.asset(keyLog,
           height: 50,
           ),
           Text('CHAT'),
         ],
       ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(itemBuilder: (context,index)
            {
              return ChatBuble();
            }
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'send Message',
                suffixIcon: Icon(
                  Icons.send,
                  color:Color(0xffAC29F5) ,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16)
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                )
              ),
            ),
          ),
        ],
      ),

    );
  }
}
