import 'package:flutter/material.dart';
import 'package:pettopia/screens/profile/add_pet_screen.dart';
import 'package:pettopia/screens/profile/user_adopt_screen.dart';
import 'package:pettopia/screens/profile/user_sell_screen.dart';

class SellBuyScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/images/HomeBG.png'), fit: BoxFit.cover),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          brightness: Brightness.light,
          elevation: 0,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Color(0xffF5BDB6),
                  padding: EdgeInsets.symmetric(vertical: 5, horizontal: 50),
                  shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(30),
                  ),
                ),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => AddPetScreen()));
                },
                child: Text(
                  "Add profile's pet",
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Color(0xffF5BDB6),
                  padding: EdgeInsets.symmetric(vertical: 5, horizontal: 50),
                  shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(30),
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => UserSellScreen()));
                },
                child: Text(
                  "Sell your pet",
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
              ),
              // ElevatedButton(
              //   style: ElevatedButton.styleFrom(
              //     primary: Color(0xffF5BDB6),
              //     padding: EdgeInsets.symmetric(vertical: 5, horizontal: 50),
              //     shape: new RoundedRectangleBorder(
              //       borderRadius: new BorderRadius.circular(30),
              //     ),
              //   ),
              //   onPressed: () {
              //     Navigator.push(
              //         context,
              //         MaterialPageRoute(
              //             builder: (context) => UserAdoptScreen()));
              //   },
              //   child: Text(
              //     "Put for adoption",
              //     style: TextStyle(
              //       color: Colors.black,
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
