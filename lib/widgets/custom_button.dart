import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
   CustomButton({this.onTap,required this.text}) ;
   VoidCallback? onTap;
  String text;

  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Color(0xffC0B3FF),
          borderRadius: BorderRadius.circular(10) ,

        ),

        width: double.infinity,
        height: 50,
        child: Center(child: Text(text)),
      ),
    );
  }
}
