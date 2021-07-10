import 'package:flutter/material.dart';
import 'package:pettopia/providers/authintecation_provider.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

class PostingForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final model = Provider.of<UserProvider>(context);

    return Container(
      margin: EdgeInsets.only(left: 20, right: 20, bottom: 20, top: 10),
      height: 115,
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(),
        borderRadius: BorderRadius.all(
          Radius.circular(15),
        ),
        color: Color(0xffe9897e),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(16),
                child: Text(
                  "What's on your mind?",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                // margin: EdgeInsets.symmetric(horizontal: 10, ),
                width: 300,
                height: 10,
                child: TextField(
                  cursorColor: Colors.white,
                  autocorrect: true,
                  onChanged: (str) {
                    model.addPostText = str;
                  },
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    // hintText: hintText,
                    hintStyle: TextStyle(
                        // color: Colors.white,
                        // fontStyle: FontStyle.italic,
                        ),
                    enabledBorder:
                        UnderlineInputBorder(borderSide: BorderSide()),
                    focusedBorder:
                        UnderlineInputBorder(borderSide: BorderSide()),
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.all(16),
                child: SizedBox(
                  width: 60,
                  height: 20,
                  child: ElevatedButton(
                    onPressed: () async {
                      final getUser = await http.post(
                        Uri.parse(
                            'http://10.0.2.2:8000/api/insertpost?post=${model.addPostText}&id=${model.currentUserId}'),
                      );
                      print(getUser.body);
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text('You have Posted successfully'),
                      ));
                    },
                    child: Text(
                      "Post",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                          fontWeight: FontWeight.bold),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xfff5bdb6),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
