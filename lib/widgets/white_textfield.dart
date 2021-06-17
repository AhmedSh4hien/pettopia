import 'package:flutter/material.dart';

// ignore: non_constant_identifier_names
Widget WhiteField({required String hintText, required bool obscText}) {
  {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      child: TextField(
        autocorrect: true,
        obscureText: obscText,
        style: TextStyle(color: Colors.white),
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(
            color: Colors.white,
            // fontStyle: FontStyle.italic,
          ),
          enabledBorder:
              UnderlineInputBorder(borderSide: BorderSide(color: Colors.white)),
          focusedBorder:
              UnderlineInputBorder(borderSide: BorderSide(color: Colors.white)),
          prefixIcon: Icon(
            Icons.mail_outline_outlined,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
