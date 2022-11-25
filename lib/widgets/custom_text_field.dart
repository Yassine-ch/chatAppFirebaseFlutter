import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
   CustomTextField({this.onChanged,this.hintText});
  String? hintText;
Function (String)? onChanged;
  @override
  Widget build(BuildContext context) {
    return  TextField(
      onChanged: onChanged,
      decoration: InputDecoration(
        hintText: hintText,
          hintStyle: TextStyle(
            color: Color(0xff7046FA),
          ),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: Color(0xffAC29F5),
              )
          ),
          border: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.white,
              )
          )
      ),
    );
  }
}
