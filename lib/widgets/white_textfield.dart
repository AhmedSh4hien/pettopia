import 'package:flutter/material.dart';

// ignore: non_constant_identifier_names
Widget WhiteField({
  required String hintText,
  required bool obscText,
  required Icon icon,
  color = Colors.white,
}) {
  {
    color != Colors.white ? color = color : color = Colors.white;
    
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      child: TextField(
        cursorColor: color,
        autocorrect: true,
        obscureText: obscText,
        style: TextStyle(color: color),
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(
            color: color,
            // fontStyle: FontStyle.italic,
          ),
          enabledBorder:
              UnderlineInputBorder(borderSide: BorderSide(color: color)),
          focusedBorder:
              UnderlineInputBorder(borderSide: BorderSide(color: color)),
          prefixIcon: icon,
        ),
      ),
    );
  }
}
