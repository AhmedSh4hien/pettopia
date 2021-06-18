import 'package:flutter/material.dart';
import 'package:pettopia/screens/login/codeverification_screen.dart';

import 'package:pettopia/widgets/white_button.dart';
import 'package:pettopia/widgets/white_textfield.dart';

class ForgetPassScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/cat.png',
            height: 250,
            fit: BoxFit.fill,
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
                  WhiteField(
                    hintText: "Email",
                    obscText: false,
                    icon: Icon(
                      Icons.mail,
                      color: Colors.white,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 15,
                    ),
                    child: WhiteButton(
                      text: "Continue",
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => VerifyCodeScreen()));
                      },
                    ),
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