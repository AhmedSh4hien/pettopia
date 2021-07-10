import 'package:flutter/material.dart';
import 'package:pettopia/providers/authintecation_provider.dart';
import 'package:pettopia/screens/home/home_screen.dart';
import 'package:pettopia/screens/login/forgetpassword_screen.dart';

import 'package:pettopia/widgets/white_button.dart';
import 'package:pettopia/widgets/white_textfield.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    final model = Provider.of<UserProvider>(context);
    print(model.homeState);
    if (model.homeState == HomeState.Loading) {
      return Scaffold(body: Center(child: CircularProgressIndicator()));
    } else if (model.homeState == HomeState.Error) {
      print(model.loginMessage);
      return Center(
          child: SingleChildScrollView(
              child: Text('An Error Occured ${model.message}')));
    } else
      return Scaffold(
        // appBar: AppBar(
        //   backgroundColor: Colors.transparent,
        //   brightness: Brightness.light,
        //   elevation: 0,
        // ),
        body: ListView(
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/cat.png',
              height: 230,
              fit: BoxFit.fill,
            ),
            Container(
              //red box
              height: MediaQuery.of(context).size.height - 254,
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
                      "LogIn",
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
                        model.loginEmail = str;
                      }),
                  WhiteField(
                      hintText: "Password",
                      obscText: true,
                      icon: Icon(
                        Icons.lock,
                        color: Colors.white,
                      ),
                      onChange: (str) {
                        model.loginPassword = str;
                      }),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 15,
                    ),
                    child: WhiteButton(
                      text: "LogIn",
                      onPressed: () async {
                        if (model.loginEmail != '' &&
                            model.loginPassword != '') {
                          await model.loginUser();
                          print(model.loginMessage);
                          if (model.homeState == HomeState.Loaded) {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => HomeScreen()));
                          } else if (model.homeState == HomeState.NoAcc) {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text(model.loginMessage),
                            ));
                          }
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text("Please fill the empty fields"),
                          ));
                        }
                      },
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ForgetPassScreen()));
                    },
                    child: Text(
                      'Forget Password?',
                      style: TextStyle(color: Colors.black),
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
