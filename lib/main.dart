import 'package:flutter/material.dart';
import 'package:pettopia/screens/home/home_screen.dart';

// import 'package:pettopia/screens/profile/profile_screen.dart';

// import 'package:pettopia/screens/login/main_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
