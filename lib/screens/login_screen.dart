import 'package:chatapp/constants.dart';
import 'package:chatapp/screens/register_screnn.dart';
import 'package:chatapp/widgets/custom_button.dart';
import 'package:chatapp/widgets/custom_text_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: KPrimaryColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
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
           CustomTextField(
             hintText: 'enter your email',
           ),
            const SizedBox(height: 10,),
            CustomTextField(
              hintText: 'enter your password',
            ),
            const SizedBox(height: 10,),
            CustomButton(
              text: 'Login',
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

      )
    );
  }
}
