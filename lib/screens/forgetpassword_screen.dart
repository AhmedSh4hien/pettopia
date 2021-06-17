import 'package:flutter/material.dart';
import 'package:pettopia/screens/main_screen.dart';

import 'package:pettopia/widgets/white_button.dart';
import 'package:pettopia/widgets/white_textfield.dart';

class ForgetPassScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        brightness: Brightness.light,
        elevation: 0,
      ),
      body: ListView(
        // crossAxisAlignment: CrossAxisAlignment.center,
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
          Expanded(
            child: Container(
              //red box
              height: 500,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(30),
                  topLeft: Radius.circular(30),
                ),
                color: Colors.red,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 40),
                    child: Text(
                      "Forget Password",
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                  WhiteField(hintText: "Email",obscText: false),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 15,
                    ),
                    child: WhiteButton(text: "Continue",onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MainScreen()));
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
