import 'package:flutter/material.dart';
import 'package:pettopia/widgets/home_widgets/home_post_bubble.dart';
import 'package:pettopia/widgets/home_widgets/home_posting_form.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets\images\HomeBG.png'), fit: BoxFit.cover),
        ),
        child: Column(
          children: [
            PostingForm(),
            PostBubble(),
          ],
        ),
      ),
    );
  }
}
