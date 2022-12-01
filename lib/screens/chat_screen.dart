import 'package:chatapp/constants.dart';
import 'package:chatapp/widgets/chat_buble.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatScreen extends StatelessWidget {
  static String id = 'ChatScreen';

//call collection
  CollectionReference messages =
      FirebaseFirestore.instance.collection(KMessgesCollections);
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<QuerySnapshot>(
      future: messages.get(),
      builder: (context, snapshot) {


        if (snapshot.hasData) {
          print(snapshot.data!.docs[0]['msg']);
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
                  child: ListView.builder(itemBuilder: (context, index) {
                    return ChatBuble();
                  }),
                ),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: TextField(
                    controller: controller,
                    onSubmitted: (data) {
                      messages.add({
                        'msg': data,
                      });
                      controller.clear();
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
          return Text('LOADING ...');
        }
      },
    );
  }
}
