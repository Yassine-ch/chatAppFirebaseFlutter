import 'package:chatapp/constants.dart';
import 'package:chatapp/help/show_snack_bar.dart';
import 'package:chatapp/screens/chat_screen.dart';
import 'package:chatapp/screens/register_screnn.dart';
import 'package:chatapp/widgets/custom_button.dart';
import 'package:chatapp/widgets/custom_text_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class LoginScreen extends StatefulWidget {
 LoginScreen({Key? key}) : super(key: key);
static String id = 'LoginScreen';
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isLoading = false;

  GlobalKey <FormState> formkey = GlobalKey();

  String? email;

  String? password;

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall:isLoading ,
      child: Scaffold(
        backgroundColor: KPrimaryColor,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Form(
            key: formkey,
            child: ListView(
              children:[

                Image.asset('assets/collaboration.png',
                height:200,
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'School Chat',
                      style: TextStyle(
                        fontSize: 26,
                        color: Color(0xff7046FA )
                      ),
                    ),
                  ],
                ),

                Text(
                  'Login',
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.black
                  ),
                ),
                const SizedBox(height: 20,),
               CustomFormTextField(
                 onChanged: (data){
                   email=data;
                 },
                 hintText: 'enter your email',
               ),
                const SizedBox(height: 10,),
                CustomFormTextField(
                  obscureText: true,
                  onChanged: (data){
                    password=data;
                  },
                  hintText: 'enter your password',
                ),
                const SizedBox(height: 10,),
                CustomButton(
                  onTap: ()async
                  {
                    if(formkey.currentState!.validate()){
                      isLoading= true;
                      setState(() {

                      });
                      try{
                        await loginUser();

                        Navigator.pushNamed(context, ChatScreen.id,arguments: email);
                        //navigate to LOGIN screen

                      }
                      on FirebaseAuthException catch (e) {
                        if (e.code == 'user-not-found') {
                          showSnackBar(context,'user not found');
                        } else if (e.code == 'wrong-password') {
                          showSnackBar(context, 'wrong password');
                        }
                      }
                      catch (e){
                        showSnackBar(context, 'there was an error ');
                      }
                      isLoading=false;
                      setState(() {

                      });
                    }
                    else {

                    }
                  },
                  text: 'LOGIN',
                ),
                const SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('don\'have an account ?',
                    style: TextStyle(
                      color: Colors.black
                    )
                    ),
                    SizedBox(width: 20,),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context,RegisterScreen.id);

                      },
                      child: Text('REGISTER',
                      style: TextStyle(
                        color: Colors.grey
                      ),
                      ),
                    ),
                  ],
                ),

              ],

            ),
          ),

        )
      ),
    );
  }


Future<void> loginUser() async {
  UserCredential user = await FirebaseAuth.instance.signInWithEmailAndPassword(email: email!, password: password!);
  print(user.user!.displayName);
}
}