import 'package:flutter/material.dart';
import 'package:pettopia/widgets/home_widgets/home_post_bubble.dart';
import 'package:pettopia/widgets/home_widgets/home_posting_form.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/HomeBG.png'), fit: BoxFit.cover),
        ),
        child: ListView(
          children: [
            FloatingSearchBarAction(
              child: ElevatedButton(
                child: Icon(Icons.search, color: Colors.white),
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  shape: CircleBorder(),
                  padding: EdgeInsets.all(10),
                  primary: Colors.blue, // <-- Button color
                  onPrimary: Colors.red, // <-- Splash color
                ),
              ),
            ),
            PostingForm(),
            PostBubble(),
          ],
        ),
      ),
    );
  }
}
