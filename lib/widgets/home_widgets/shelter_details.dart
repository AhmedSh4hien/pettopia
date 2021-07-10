import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ShelterDetails extends StatelessWidget {
  final String name;
  final double rating;

  ShelterDetails({
    required this.name,
    required this.rating,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 20, right: 20, bottom: 20, top: 10),
      height: 105,
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(),
        borderRadius: BorderRadius.all(
          Radius.circular(15),
        ),
        color: Color(0xffe9897e),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: 80,
            decoration: BoxDecoration(
              // border: Border.all(),
              borderRadius: BorderRadius.all(
                Radius.circular(15),
              ),
              color: Colors.blue,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 13,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: RatingBar.builder(
                    initialRating: rating,
                    minRating: 1,
                    direction: Axis.horizontal,
                    allowHalfRating: false,
                    itemCount: 5,
                    itemSize: 20,
                    unratedColor: Color(0x46939597),
                    glow: false,
                    tapOnlyMode: true,
                    itemPadding: EdgeInsets.symmetric(horizontal: 0.6),
                    itemBuilder: (context, _) => Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    onRatingUpdate: (rating) {
                      print(rating);
                    },
                  ),
                ),
                SizedBox(
                  width: 96,
                  height: 20,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      "Call",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 10,
                          fontWeight: FontWeight.bold),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xfff5bdb6),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
