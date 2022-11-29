import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomFormTextField extends StatelessWidget {
   CustomFormTextField({this.onChanged,this.hintText});
  String? hintText;
Function (String)? onChanged;
  @override
  Widget build(BuildContext context) {
    return  TextFormField(
      validator: (data){
        if (data!.isEmpty){
          return 'field is required';
        }
      },
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
