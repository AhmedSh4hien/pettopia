import 'package:flutter/material.dart';
import 'package:pettopia/providers/authintecation_provider.dart';
import 'package:pettopia/widgets/white_textfield.dart';
import 'package:provider/provider.dart';

class UserSellScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final model = Provider.of<UserProvider>(context);

    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/images/HomeBG.png'), fit: BoxFit.cover),
      ),
      child: Scaffold(
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
        backgroundColor: Colors.transparent,
        body: ListView(
          children: [
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.blue,
                    radius: 30,
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Text(
                      model.currentUserName,
                      style: TextStyle(
                        color: Color(0xffE9897E),
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  WhiteField(
                      hintText: "Add photo of your pet",
                      obscText: false,
                      icon: Icon(Icons.photo, color: Color(0xffE9897E)),
                      color: Color(0xffE9897E),
                      onChange: () {}),
                  WhiteField(
                      hintText: "Pet name",
                      obscText: false,
                      icon: Icon(Icons.edit, color: Color(0xffE9897E)),
                      color: Color(0xffE9897E),
                      onChange: (str) {
                        model.petName = str;
                      }),
                  WhiteField(
                      hintText: "Pet type",
                      obscText: false,
                      icon: Icon(Icons.edit, color: Color(0xffE9897E)),
                      color: Color(0xffE9897E),
                      onChange: (str) {
                        model.petType = str;
                      }),
                  WhiteField(
                      hintText: "Pet age",
                      obscText: false,
                      icon: Icon(Icons.edit, color: Color(0xffE9897E)),
                      color: Color(0xffE9897E),
                      onChange: (str) {
                        model.petAge = str;
                      }),
                  WhiteField(
                      hintText: "Pet price",
                      obscText: false,
                      icon: Icon(Icons.edit, color: Color(0xffE9897E)),
                      color: Color(0xffE9897E),
                      onChange: (str) {
                        model.petPrice = str;
                      }),
                  WhiteField(
                      hintText: "Pet gender",
                      obscText: false,
                      icon: Icon(Icons.edit, color: Color(0xffE9897E)),
                      color: Color(0xffE9897E),
                      onChange: (str) {
                        model.petGender = str;
                      }),
                  WhiteField(
                      hintText: "Owner location",
                      obscText: false,
                      icon: Icon(Icons.location_on, color: Color(0xffE9897E)),
                      color: Color(0xffE9897E),
                      onChange: (str) {
                        model.petLocation = str;
                      }),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xffF5BDB6),
                      padding:
                          EdgeInsets.symmetric(vertical: 5, horizontal: 50),
                      shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(30),
                      ),
                    ),
                    onPressed: () async {
                      await model.sellPet();
                      await Future.delayed(Duration(seconds: 1));
                      Navigator.pop(context);
                    },
                    child: Text(
                      "Add",
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
