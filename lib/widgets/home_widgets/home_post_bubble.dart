import 'package:flutter/material.dart';

class PostBubble extends StatelessWidget {
  final String text;
  final double hours;
  final int hearts;
  final int comments;
  final int id;


  PostBubble({
    required this.text,
    required this.hours,
    required this.hearts,
    required this.comments,
    this.id = 0,
  });
  
  @override
  Widget build(BuildContext context) {
        return Container(
      margin: EdgeInsets.only(left: 25,right: 25, bottom: 20),
      height: 100,
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(),
        borderRadius: BorderRadius.all(
          Radius.circular(15),
        ),
        color: Colors.white,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CircleAvatar(
                  backgroundColor: Colors.blueAccent,
                ),
              ),
            ],
          ),
          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  text,
                  style: TextStyle(color: Colors.black),
                  textAlign: TextAlign.left,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(
                        Icons.favorite,
                        color: Color(0xffe9897e),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 4, right: 60),
                        child: Text(
                          hearts.toString(),
                          style: TextStyle(
                            color: Color(0xffe9897e),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Icon(
                        Icons.comment,
                        color: Color(0xffe9897e),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 4,
                        ),
                        child: Text(
                          comments.toString(),
                          style: TextStyle(
                            color: Color(0xffe9897e),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(
                      Icons.timer,
                      color: Color(0xffE9897E),
                    ),
                    Text(
                      hours.toString() + "h ago",
                      style: TextStyle(color: Color(0xffE9897E), fontSize: 10),
                    ),
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
