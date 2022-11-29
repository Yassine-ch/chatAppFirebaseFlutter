import 'package:chatapp/firebase_options.dart';
import 'package:chatapp/screens/chat_screen.dart';
import 'package:chatapp/screens/login_screen.dart';
import 'package:chatapp/screens/register_screnn.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';



  void main() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );


  runApp( ChatApp());
}
class ChatApp extends StatelessWidget {
  const ChatApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        LoginScreen.id:(context)=>LoginScreen(),
        RegisterScreen.id:(context)=>RegisterScreen(),
        ChatScreen.id:(context)=>ChatScreen(),


      },


      initialRoute: LoginScreen.id,
    );
  }
}


