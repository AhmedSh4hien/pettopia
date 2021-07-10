import 'package:flutter/material.dart';
import 'package:pettopia/providers/authintecation_provider.dart';
import 'package:pettopia/screens/login/login_screen.dart';
import 'package:pettopia/screens/login/main_screen.dart';

import 'package:pettopia/widgets/white_button.dart';
import 'package:pettopia/widgets/white_textfield.dart';
import 'package:provider/provider.dart';

class ChangePassScreen extends StatefulWidget {
  @override
  _ChangePassScreenState createState() => _ChangePassScreenState();
}

class _ChangePassScreenState extends State<ChangePassScreen> {
  @override
  Widget build(BuildContext context) {
    final model = Provider.of<UserProvider>(context);

    return Scaffold(
      body: ListView(
        // crossAxisAlignment: CrossAxisAlignment.center,
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
                    "Change Password",
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
                WhiteField(
                    hintText: "Enter new password",
                    obscText: false,
                    icon: Icon(
                      Icons.lock,
                      color: Colors.white,
                    ),
                    onChange: (str) {
                      model.changedPW = str;
                    }),
                WhiteField(
                    hintText: "Reenter new passwrod",
                    obscText: false,
                    icon: Icon(
                      Icons.lock,
                      color: Colors.white,
                    ),
                    onChange: (str) {
                      model.confirmPW = str;
                    }),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 15,
                  ),
                  child: WhiteButton(
                    text: "Change",
                    onPressed: () async {
                      if (model.changedPW == model.confirmPW) {
                        await model.updateUserPw();
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text('Password changed successfully'),
                        ));
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginScreen()));
                      } else
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text('Passwords don\'t match'),
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
