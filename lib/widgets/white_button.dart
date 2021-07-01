import 'package:flutter/material.dart';

// ignore: non_constant_identifier_names
Widget WhiteButton({
  required text,
  required onPressed,
  color = Colors.white,
}) {
  color != Colors.white ? color = color : color = Colors.white;

  return ElevatedButton(
    style: ElevatedButton.styleFrom(
      primary: color,
      padding: EdgeInsets.symmetric(horizontal: 100),
      shape: new RoundedRectangleBorder(
        borderRadius: new BorderRadius.circular(30),
      ),
    ),
    // style: Style,
    onPressed: onPressed,
    child: Text(
      text,
      style: TextStyle(
        color: Colors.black,
      ),
    ),
  );
}
