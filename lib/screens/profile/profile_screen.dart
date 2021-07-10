import 'package:flutter/material.dart';
import 'package:flutter_card_swipper/flutter_card_swiper.dart';
import 'package:pettopia/providers/authintecation_provider.dart';
import 'package:pettopia/screens/login/main_screen.dart';
import 'package:pettopia/screens/profile/sell_buy_screen.dart';
import 'package:pettopia/widgets/white_button.dart';
import 'package:pettopia/widgets/white_textfield.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    final model = Provider.of<UserProvider>(context);
    model.getPrefUser();
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
        title: Text(
          'PROFILE',
          textAlign: TextAlign.center,
        ),
        centerTitle: true,
        // actions: [
        //   IconButton(
        //     icon: Icon(Icons.clear),
        //     onPressed: () {},
        //   ),
        // ],
      ),
      backgroundColor: Color(0xffE9897E),
      body: ListView(
        children: [
          Container(
            color: Color(0xffE9897E),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: CircleAvatar(
                      backgroundColor: Colors.blue,
                      radius: 30,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Text(
                      model.currentUserName,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        height: 150,
                        width: 250,
                        padding: EdgeInsets.symmetric(vertical: 5),
                        child: Swiper(
                          itemBuilder: (BuildContext context, int index) {
                            return ClipRRect(
                              borderRadius: BorderRadius.circular(20.0),
                              child: Container(
                                color: Colors.blue,
                              ),
                            );
                          },
                          itemCount: 5,
                          viewportFraction: 0.8,
                          scale: 0.9,
                          //pagination: SwiperPagination(),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SellBuyScreen()));
                        },
                        child: CircleAvatar(
                          backgroundColor: Color(0xFFF5BDB6),
                          radius: 30,
                          child: Icon(
                            Icons.add,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                  WhiteField(
                      hintText: 'Change Password',
                      obscText: false,
                      icon: Icon(
                        Icons.lock,
                        color: Colors.white,
                      ),
                      onChange: (str) {
                        model.changedPW = str;
                      }),
                  // WhiteField(
                  //     hintText: 'Change Phone',
                  //     obscText: false,
                  //     icon: Icon(
                  //       Icons.phone,
                  //       color: Colors.white,
                  //     ),
                  //     onChange: () {}),
                  // WhiteField(
                  //     hintText: 'Change E-mail',
                  //     obscText: false,
                  //     icon: Icon(
                  //       Icons.mail,
                  //       color: Colors.white,
                  //     ),
                  //     onChange: () {}
                  //
                  //     // color: Colors.blue,
                  //     ),
                  WhiteButton(
                      text: "Change Password",
                      onPressed: () async {
                        await model.getPrefUser();
                        model.retrieveID = int.parse(model.currentUserId);
                        model.updateUserPw();
                      }),
                  WhiteButton(
                      text: "Sign out",
                      onPressed: () async {
                        await model.cleanPrefUser();
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MainScreen()));

                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (context) => SellBuyScreen()));
                      })
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
