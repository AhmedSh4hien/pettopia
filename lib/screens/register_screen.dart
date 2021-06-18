import 'package:flutter/material.dart';
import 'package:pettopia/screens/main_screen.dart';

import 'package:pettopia/widgets/white_button.dart';
import 'package:pettopia/widgets/white_textfield.dart';

class RegisterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/cat.png',
            height: 230,
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
                      "Create an Account",
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                  WhiteField(
                    hintText: "Name",
                    obscText: false,
                    icon: Icon(
                      Icons.portrait,
                      color: Colors.white,
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
                  WhiteField(
                    hintText: "Password",
                    obscText: true,
                    icon: Icon(
                      Icons.lock,
                      color: Colors.white,
                    ),
                  ),
                  WhiteField(
                    hintText: "Number",
                    obscText: false,
                    icon: Icon(
                      Icons.phone,
                      color: Colors.white,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 15,
                    ),
                    child: WhiteButton(
                      text: "SignUp",
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MainScreen()));
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
