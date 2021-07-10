import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';
import 'package:pettopia/providers/authintecation_provider.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

class SearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final model = Provider.of<UserProvider>(context);

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

      onQueryChanged: (query) async {
        if (query.length > 3) {
          if (model.whichPage == 0) {
            final getUser = await http.post(
              Uri.parse('http://10.0.2.2:8000/api/search?post=$query'),
            );
            model.searchedList = json.decode(getUser.body);
            print(model.searchedList);
          }
          if (model.whichPage == 1) {
            final getUser = await http.post(
              Uri.parse(
                  'http://10.0.2.2:8000/api/searchihproduct?product_name=$query'),
            );
            model.searchedList = json.decode(getUser.body);
          }
          if (model.whichPage == 2) {
            final getUser = await http.post(
              Uri.parse(
                  'http://10.0.2.2:8000/api/searchadoption?pet_name=$query'),
            );
            model.searchedList = json.decode(getUser.body);
          }
          if (model.whichPage == 3) {
            final getUser = await http.post(
              Uri.parse('http://10.0.2.2:8000/api/searchmate?pet_name=$query'),
            );
            model.searchedList = json.decode(getUser.body);
          }
          if (model.whichPage == 4) {
            final getUser = await http.post(
              Uri.parse(
                  'http://10.0.2.2:8000/api/searchproduct?product_name=$query'),
            );
            model.searchedList = json.decode(getUser.body);
          }
          if (model.whichPage == 5) {
            final getUser = await http.post(
              Uri.parse('http://10.0.2.2:8000/api/searchvet?vet_name=$query'),
            );
            model.searchedList = json.decode(getUser.body);
          }
        }
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
        return Container(
          height: MediaQuery.of(context).size.height,
          child: ListView.builder(
            itemCount:
                model.searchedList.length != 0 ? model.searchedList.length : 0,
            itemBuilder: (context, i) => Padding(
              padding: const EdgeInsets.all(8.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: Material(
                  color: Colors.white,
                  elevation: 4.0,
                  child: Column(mainAxisSize: MainAxisSize.min, children: [
                    ListTile(
                      title: Text(
                          model.searchedList[i]['name'].toString() != 'null'
                              ? model.searchedList[i]['name'].toString()
                              : model.searchedList[i]['post'].toString()),
                      subtitle: Text(model.searchedList[i]['id'].toString()),
                    ),
                  ]),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
