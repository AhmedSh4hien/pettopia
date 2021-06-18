import 'package:flutter/material.dart';

class PostBubble extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding:EdgeInsets.symmetric(horizontal: 20, vertical: 50),
      margin: EdgeInsets.symmetric(horizontal: 25, vertical: 50),
      height: 100,
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(),
        borderRadius: BorderRadius.all(
          Radius.circular(15),
        ),
        color: Colors.white,
      ),
      child: Text("data", style: TextStyle(color: Colors.black),),
    );
  }
}
