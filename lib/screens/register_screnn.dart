import 'package:chatapp/constants.dart';
import 'package:chatapp/help/show_snack_bar.dart';
import 'package:chatapp/screens/chat_screen.dart';
import 'package:chatapp/screens/login_screen.dart';
import 'package:chatapp/widgets/custom_button.dart';
import 'package:chatapp/widgets/custom_text_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';


class RegisterScreen extends StatefulWidget {
   RegisterScreen({Key? key}) : super(key: key);
   static String id ='register';

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
   String? email;

   String? password;

   bool isLoading = false;

   GlobalKey<FormState> formkey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
          backgroundColor: KPrimaryColor,
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Form(
              key:formkey ,
              child: ListView(
                children:[

                  Image.asset('assets/collaboration.png'
                  ,height: 200,),

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
                    'Register',
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.black
                    ),
                  ),
                  const SizedBox(height: 20,),

                  CustomFormTextField(
                    onChanged: (data)
                    {
                      email= data;
                    },
                    hintText: 'enter your email',
                  ),
                  const SizedBox(height: 10,),
                  CustomFormTextField(
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
                      await registerUser();
                      Navigator.pushNamed(context, ChatScreen.id);
                      //navigate to LOGIN screen

                    }
                    on FirebaseAuthException catch (e) {
                      if (e.code == 'weak-password') {
                        showSnackBar(context,'weak password');
                      } else if (e.code == 'email-already-in-use') {
                        showSnackBar(context, 'email already in use');
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
                    text: 'Register',
                  ),
                  const SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Already Have an account',
                          style: TextStyle(
                              color: Colors.black
                          )
                      ),
                      SizedBox(width: 20,),
                      GestureDetector(
                        onTap: (){
                          Navigator.pop(context);
                        },
                        child: Text('Login',
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


  Future<void> registerUser() async {
     var auth = FirebaseAuth.instance;
    UserCredential user= await auth.createUserWithEmailAndPassword(email: email!, password: password!);
    print(user.user!.displayName);
  }
}