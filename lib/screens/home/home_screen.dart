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
  List<bool> optionSelected = [true, false, false, false, false, false];
  int selected = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/HomeBG.png'), fit: BoxFit.cover),
        ),
        child: Stack(
          children: [
            Container(
              padding: EdgeInsets.only(top: 100, left: 20),
              child: Container(
                height: 40,
                child: ListView(
                  // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  scrollDirection: Axis.horizontal,
                  //  physics: ClampingScrollPhysics(),
                  // padding: EdgeInsets.symmetric(vertical: 5),
                  children: [
                    tab("ALL", 0),
                    tab("Buy", 1),
                    tab("Adopt", 2),
                    tab("Mates", 3),
                    tab("Shelters", 4),
                    tab("Veternary", 5),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 150),
              child: ListView(
                children: [
                  PostingForm(),
                  PostBubble(
                    text: "one two three four",
                    hours: 1,
                    hearts: 609,
                    comments: 120,
                  ),
                  PostBubble(
                    text: "Hi Im under the water",
                    hours: 2,
                    hearts: 342,
                    comments: 4,
                  ),
                  PostBubble(
                    text: "Hi i have a quston",
                    hours: 4,
                    hearts: 4444,
                    comments: 44,
                  ),
                  PostBubble(
                    text: "oh no cringe",
                    hours: 69,
                    hearts: 420,
                    comments: 69,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SearchBar(),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(350, 38, 8, 10),
              child: CircleAvatar(
                backgroundColor: Colors.red,
                maxRadius: 20,
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget tab(
    String text,
    int index,
  ) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selected = index;
        });
      },
      child: Container(
        margin: EdgeInsets.symmetric(
          horizontal: 15,
        ),
        height: 60,
        width: 80,
        decoration: BoxDecoration(
          color: selected == index ? Color(0xffe9897e) : Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(15),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Text(
            text,
            style: TextStyle(fontSize: 13),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
