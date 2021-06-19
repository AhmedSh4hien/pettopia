import 'package:flutter/material.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';

class SearchBar extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return FloatingSearchBar(
      hint: 'Search',
      hintStyle: TextStyle(color: Colors.black),
      // openAxisAlignment: ,
      
      width: 300,
      height: 40,
      openWidth: 300,
      axisAlignment: -0.8,
      scrollPadding: EdgeInsets.only(top: 16, bottom: 20),
      elevation: 1.0,
      borderRadius: BorderRadius.circular(30),

      //padding: EdgeInsets.symmetric(horizontal: 10),
     // margins: EdgeInsets.only(top: 40),
      onQueryChanged: (query) {
        //methods here
      },

      transitionCurve: Curves.easeInOut,
      transitionDuration: Duration(milliseconds: 500),
      transition: CircularFloatingSearchBarTransition(),
      debounceDelay: Duration(milliseconds: 500),
      actions: [
        FloatingSearchBarAction(
          showIfOpened: false,
          child: CircularButton(
            icon: Icon(Icons.search),
            onPressed: () {
              //
            },
          ),
        ),
        FloatingSearchBarAction.searchToClear(
          showIfClosed: false,
        ),
      ],
      leadingActions: [], //to hide actions icon
      builder: (context, transition) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: Material(
            color: Colors.white,
            elevation: 4.0,
            child: Column(mainAxisSize: MainAxisSize.min, children: [
              ListTile(
                title: Text('Item 1'),
                subtitle: Text('more?'),
              ),
              ListTile(
                title: Text('Item 2'),
                subtitle: Text('more...'),
              ),
              ListTile(
                title: Text('Item 3'),
                subtitle: Text('more!'),
              ),
            ]),
          ),
        );
      },
    );
  }
}
