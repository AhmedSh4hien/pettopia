import 'package:flutter/material.dart';
import 'package:pettopia/providers/authintecation_provider.dart';
import 'package:pettopia/screens/login/codeverification_screen.dart';

import 'package:pettopia/widgets/white_button.dart';
import 'package:pettopia/widgets/white_textfield.dart';
import 'package:provider/provider.dart';

class ForgetPassScreen extends StatefulWidget {
  @override
  _ForgetPassScreenState createState() => _ForgetPassScreenState();
}

class _ForgetPassScreenState extends State<ForgetPassScreen> {
  @override
  Widget build(BuildContext context) {
    final model = Provider.of<UserProvider>(context);

    return Scaffold(
      body: ListView(
        children: [
          Image.asset(
            'assets/images/cat.png',
            height: 250,
            fit: BoxFit.fill,
          ),
          Container(
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
                    onChange: (str) {
                      model.pwForgotEmail = str;
                    }),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 15,
                  ),
                  child: WhiteButton(
                    text: "Continue",
                    onPressed: () async {
                      await model.getUserID();
                      if (model.retrieveID != 0) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => VerifyCodeScreen()));
                      } else
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text("This mail doesn\'t have an account"),
                        ));
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
