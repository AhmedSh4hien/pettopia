import 'package:flutter/material.dart';
// import 'package:pettopia/widgets/white_textfield.dart';

class PostingForm extends StatelessWidget {

  final GestureTapCallback tap;

  PostingForm({required this.tap});
  @override
  Widget build(BuildContext context) {
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
                    onPressed: tap,
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
