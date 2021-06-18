
import 'package:flutter/material.dart';
import 'package:pettopia/screens/login_screen.dart';
import 'package:pettopia/screens/register_screen.dart';
import 'package:pettopia/widgets/white_button.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Colors.transparent,
      //   brightness: Brightness.light,
      //   elevation: 0,
      // ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          
          Image.asset('assets/images/Smain.png',fit: BoxFit.fill,width: double.infinity,),
          Container(
            padding: EdgeInsets.fromLTRB(0, 40, 0, 20),
            child: Text(
              'Thank you for making new friends!',
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
