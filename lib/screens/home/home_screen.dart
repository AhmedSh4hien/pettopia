import 'package:flutter/material.dart';

import 'package:pettopia/widgets/home_widgets/home_post_bubble.dart';
import 'package:pettopia/widgets/home_widgets/home_posting_form.dart';
import 'package:pettopia/widgets/home_widgets/home_search_bar.dart';
import 'package:pettopia/widgets/home_widgets/pet_details.dart';
import 'package:pettopia/widgets/home_widgets/shelter_details.dart';
import 'package:pettopia/widgets/home_widgets/vet_details.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // List<bool> optionSelected = [true, false, false, false, false, false];
  int selected = 0;

  List<Widget> petPosts = [];
  List<Widget> shelterPosts = [];
  List<Widget> vetPosts = [];

  List<Widget> posts = [
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
    VetDetails(
      name: 'Dr Merna Emad',
      rating: 3,
    ),
    ShelterDetails(
      name: 'Save Pets Shelter',
      rating: 4,
    ),
    PetDetails(),
  ];

  
  @override
  void initState() {
    super.initState();
   petPosts  = posts.whereType<PetDetails>().toList();
   shelterPosts  = posts.whereType<ShelterDetails>().toList();
   vetPosts  = posts.whereType<VetDetails>().toList();
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
                children: selected == 0? posts :(selected == 1 ? petPosts : selected == 4 ? shelterPosts : selected == 5 ? vetPosts : [] ),
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
          horizontal: 12,
        ),
        height: 60,
        // width: 70,
        decoration: BoxDecoration(
          color: selected == index ? Color(0xffe9897e) : Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(15),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
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
