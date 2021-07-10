import 'package:flutter/material.dart';
import 'package:pettopia/screens/home/home_screen.dart';
import 'package:pettopia/screens/login/main_screen.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'providers/api_provider.dart';
import 'providers/authintecation_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  var email = prefs.getString('email');
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => UserProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => ApiProvider(6),
        ),
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: email == null ? MainScreen() : HomeScreen()),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // bool userOrNot = false;
    // checkUser().then((value) => userOrNot = value);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainScreen(),
    );
  }
}
