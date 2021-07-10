import 'package:flutter/material.dart';
import 'package:pettopia/providers/authintecation_provider.dart';
import 'package:pettopia/screens/ai_screen.dart';
import 'package:pettopia/screens/pages/adope_page.dart';
import 'package:pettopia/screens/pages/all_page.dart';
import 'package:pettopia/screens/pages/buy_page.dart';
import 'package:pettopia/screens/pages/mate_page.dart';
import 'package:pettopia/screens/pages/shelter_page.dart';
import 'package:pettopia/screens/pages/vet_page.dart';
import 'package:pettopia/screens/profile/profile_screen.dart';

import 'package:pettopia/widgets/home_widgets/home_post_bubble.dart';
import 'package:pettopia/widgets/home_widgets/home_posting_form.dart';
import 'package:pettopia/widgets/home_widgets/home_search_bar.dart';
import 'package:pettopia/widgets/home_widgets/pet_details.dart';
import 'package:pettopia/widgets/home_widgets/shelter_details.dart';
import 'package:pettopia/widgets/home_widgets/vet_details.dart';
import 'package:provider/provider.dart';

final pageState = [
  AllPage(),
  BuyPage(),
  AdoptPage(),
  MatePage(),
  ShelterPage(),
  VetPage()
];

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selected = 0;

  List<Widget> petPosts = [];
  List<Widget> shelterPosts = [];
  List<Widget> vetPosts = [];

  List<Widget> posts = [
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
    // PetDetails(),
  ];

  @override
  void initState() {
    super.initState();
    petPosts = posts.whereType<PetDetails>().toList();
    shelterPosts = posts.whereType<ShelterDetails>().toList();
    vetPosts = posts.whereType<VetDetails>().toList();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/images/HomeBG.png'), fit: BoxFit.cover),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.camera),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AiScreen(),
              ),
            );
          },
        ),
        body: Stack(
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
                child: pageState[selected]),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SearchBar(),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(350, 38, 8, 10),
              child: CircleAvatar(
                backgroundColor: Colors.red,
                maxRadius: 20,
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProfileScreen(),
                      ),
                    );
                  },
                ),
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
    final model = Provider.of<UserProvider>(context);

    return GestureDetector(
      onTap: () {
        setState(() {
          selected = index;
          model.whichPage = index;
          print(model.whichPage);
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
