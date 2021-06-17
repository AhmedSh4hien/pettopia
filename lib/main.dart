import 'package:flutter/material.dart';
import 'package:pettopia/screens/changepassword_screen.dart';
import 'package:pettopia/screens/codeverification_screen.dart';
import 'package:pettopia/screens/forgetpassword_screen.dart';
import 'package:pettopia/screens/login_screen.dart';
import 'package:pettopia/screens/main_screen.dart';
import 'package:pettopia/screens/register_screen.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MainScreen(),
    );
  }
}
