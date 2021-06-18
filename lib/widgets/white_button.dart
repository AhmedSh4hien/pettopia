
import 'package:flutter/material.dart';

class WhiteButton extends StatelessWidget {
  final String text;
  final GestureTapCallback onPressed;

  WhiteButton({required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: Colors.white,
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
}
