import 'package:flutter/material.dart';
import 'package:flutter_card_swipper/flutter_card_swiper.dart';
import 'package:pettopia/widgets/white_textfield.dart';

class ProfileScreen extends StatelessWidget {
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
          onPressed: () {},
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
                      'Dina Akram',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Container(
                    height: 150,
                    width: 250,
                    padding: EdgeInsets.symmetric(vertical: 10),
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
                  WhiteField(
                    hintText: 'Change Password',
                    obscText: false,
                    icon: Icon(
                      Icons.lock,
                      color: Colors.white,
                    ),
                  ),
                  WhiteField(
                    hintText: 'Change Phone',
                    obscText: false,
                    icon: Icon(
                      Icons.phone,
                      color: Colors.white,
                    ),
                  ),
                  WhiteField(
                    hintText: 'Change E-mail',
                    obscText: false,
                    icon: Icon(
                      Icons.mail,
                      color: Colors.white,
                    ),
                    // color: Colors.blue,
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
