import 'package:chatapp/constants.dart';
import 'package:chatapp/screens/login_screen.dart';
import 'package:chatapp/widgets/custom_button.dart';
import 'package:chatapp/widgets/custom_text_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
   RegisterScreen({Key? key}) : super(key: key);
   static String id ='register';
   String? email;
   String? password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: KPrimaryColor,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
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

              CustomTextField(
                onChanged: (data)
                {
                  email= data;
                },
                hintText: 'enter your email',
              ),
              const SizedBox(height: 10,),
              CustomTextField(
                onChanged: (data){
                  password=data;
                },
                hintText: 'enter your password',
              ),
              const SizedBox(height: 10,),
              CustomButton(
                onTap: ()async
                {
                try{
                  var auth = FirebaseAuth.instance;
                  UserCredential user= await auth.createUserWithEmailAndPassword(email: email!, password: password!);
                  print(user.user!.displayName);
                }
                on FirebaseAuthException catch (e) {
                  if (e.code == 'weak-password') {
                   ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Weak passwoerd'),),);
                  } else if (e.code == 'email-already-in-use') {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Email already existe'),),);
                  }
                }
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('SUCCESS'),),);
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

        )
    );
  }
}