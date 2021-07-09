import 'package:flutter/material.dart';
import 'package:pettopia/providers/authintecation_provider.dart';
import 'package:pettopia/screens/home/home_screen.dart';
import 'package:pettopia/screens/login/main_screen.dart';

import 'package:pettopia/widgets/white_button.dart';
import 'package:pettopia/widgets/white_textfield.dart';
import 'package:provider/provider.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    final model = Provider.of<UserProvider>(context);
    if (model.registerState == HomeState.Loading) {
      return Scaffold(body: Center(child: CircularProgressIndicator()));
    } else if (model.registerState == HomeState.Error) {
      print(model.loginMessage);
      return Center(
          child: SingleChildScrollView(
              child: Text('An Error Occured ${model.message}')));
    } else
      return Scaffold(
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
                      onChange: (str) {
                        model.registerName = str;
                      }),
                  WhiteField(
                      hintText: "Email",
                      obscText: false,
                      icon: Icon(
                        Icons.mail,
                        color: Colors.white,
                      ),
                      onChange: (str) {
                        model.registerEmail = str;
                      }),
                  WhiteField(
                      hintText: "Password",
                      obscText: true,
                      icon: Icon(
                        Icons.lock,
                        color: Colors.white,
                      ),
                      onChange: (str) {
                        model.registerPassword = str;
                      }),
                  WhiteField(
                      hintText: "Number",
                      obscText: false,
                      icon: Icon(
                        Icons.phone,
                        color: Colors.white,
                      ),
                      onChange: (str) {
                        model.registerNumber = str;
                      }),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 15,
                    ),
                    child: WhiteButton(
                      text: "SignUp",
                      onPressed: () async {
                        if (model.registerNumber != '' &&
                            model.registerPassword != '' &&
                            model.registerName != '' &&
                            model.registerEmail != '') {
                          await model.registerUser();
                          print(model.registerMessage);
                          if (model.registerState == HomeState.Loaded) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => HomeScreen()));
                          } else if (model.registerState == HomeState.NoAcc) {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text(model.registerMessage),
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
                ],
              ),
            ),
          ],
        ),
      );
  }
}
