import 'package:chatapp/constants.dart';
import 'package:chatapp/models/message.dart';
import 'package:chatapp/widgets/chat_buble.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatScreen extends StatelessWidget {
  static String id = 'ChatScreen';
  final _controller = ScrollController();

//call collection
  CollectionReference messages =
      FirebaseFirestore.instance.collection(KMessgesCollections);
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
   var email = ModalRoute.of(context)!.settings.arguments ;
    return StreamBuilder<QuerySnapshot>(
      stream: messages.orderBy(KCreatedAt,descending: true).snapshots(),
      builder: (context, snapshot) {


        if (snapshot.hasData) {
        List<Message> messagesList=[];
        for(int i =0;i<snapshot.data!.docs.length;i++){
          messagesList.add(Message.fromJson(snapshot.data!.docs[i]));
        }
          return Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
              backgroundColor: Color(0xffC0B3FF),
              title: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    keyLog,
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
                  child: ListView.builder(
                    reverse: true,
                    controller: _controller,
                      itemCount: messagesList.length,
                      itemBuilder: (context, index) {
                    return
                      messagesList[index].id == email ?
                      ChatBuble(

                      msg:messagesList[index],):ChatBubleForFriend(msg: messagesList[index]);
                  }),
                ),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: TextField(
                    controller: controller,
                    onSubmitted: (data) {
                      messages.add({
                        KMessage: data,
                        KCreatedAt:  DateTime.now(),
                        'id':email
                      });
                      controller.clear();
                      _controller.animateTo(
                      0,
                        duration: Duration(seconds: 1),
                        curve: Curves.fastOutSlowIn,
                      );
                    },
                    decoration: InputDecoration(
                        hintText: 'send Message',
                        suffixIcon: Icon(
                          Icons.send,
                          color: Color(0xffAC29F5),
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16)),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                        )),
                  ),
                ),
              ],
            ),
          );
        } else {
          return Scaffold(
              body: Text('Loading please wait...'),
          );
        }
      },
    );
  }
}
