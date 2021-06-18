import 'package:flutter/material.dart';
import 'package:pettopia/widgets/home_widgets/home_post_bubble.dart';
import 'package:pettopia/widgets/home_widgets/home_posting_form.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';
import 'package:pettopia/widgets/home_widgets/home_search_bar.dart';

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
        child: Stack(
          children: [Padding(
            padding: const EdgeInsets.only(top: 70),
            child: ListView(
              children: [
              PostingForm(),
                PostBubble(),
              ],
            
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SearchBar(),
          ),],
        ),
        
      ),
    );
  }
}
