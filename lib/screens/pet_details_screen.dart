import 'package:flutter/material.dart';
import 'package:pettopia/data/constants.dart';


class PetDetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      backgroundColor: Color(0xffE9897E),
      body: ListView(
        children: [
          Container(
            color: Color(0xffE9897E),
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 30, horizontal: 5),
                    decoration: BoxDecoration(
                      boxShadow: [kBoxShadow],
                    ),
                    child: Image.asset(
                      'assets/images/pet.png',
                      height: 200,
                      width: 280,
                      fit: BoxFit.fill,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 20),
                    width: 280,
                    height: 230,
                    decoration: BoxDecoration(
                      boxShadow: [kBoxShadow],
                      color: Color(0xffF5BDB6),
                    ),
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Name : "),
                          Text("Type : "),
                          Text("Age : "),
                          Text("Gender : "),
                          Text("Location : "),
                          Text("Owner Name : "),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 30),
                    child: ElevatedButton.icon(
                      icon: Icon(Icons.phone,
                      color: Color(0xffE9897E),),
                      style: ElevatedButton.styleFrom(
                        primary: Color(0xffF5BDB6),
                        padding:
                            EdgeInsets.symmetric(vertical: 5, horizontal: 35),
                        shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(30),
                        ),
                      ),
                      onPressed: () {},
                      label: Text(
                        "Contact Owner",
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
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
