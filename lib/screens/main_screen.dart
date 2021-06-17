import 'package:flutter/material.dart';
import 'package:pettopia/screens/login_screen.dart';
import 'package:pettopia/screens/register_screen.dart';
import 'package:pettopia/widgets/white_button.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        brightness: Brightness.light,
        elevation: 0,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 150,
            decoration: BoxDecoration(
              // borderRadius: BorderRadius.all(
              //   Radius.circular(32),
              // ),
              color: Colors.amber,
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(0, 40, 0, 20),
            child: Text(
              'Title Title Title Title Title Title Title ',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
            ),
          ),
          Expanded(
            child: Container(
              //red box
              height: 300,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(30),
                  topLeft: Radius.circular(30),
                ),
                color: Colors.red,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 15,
                    ),
                    child: WhiteButton(
                      text: "LogIn",
                      onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()))
                    ),
                  ),
                  Text(
                    "Don't have an account?",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 15,
                    ),
                    child:
                        WhiteButton(text: "SignUp", onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => RegisterScreen()));
                      },),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
