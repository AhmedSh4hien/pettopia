import 'package:flutter/material.dart';
import 'package:pettopia/data/constants.dart';
import 'package:pettopia/models/pet_model.dart';
import 'package:pettopia/models/product_model.dart';
import 'package:pettopia/screens/pet_details_screen.dart';

class PetDetails extends StatelessWidget {
  final PetModel selectedPet;

  PetDetails(this.selectedPet);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: 280,
      margin: EdgeInsets.only(left: 30, right: 30, bottom: 20, top: 10),
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/images/pet.png'), fit: BoxFit.cover),
        boxShadow: [kBoxShadow],
      ),
      child: Container(
        margin: EdgeInsets.only(top: 150),
        color: Color(0x60939597),
        // decoration: BoxDecoration(color: Color(939597)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => PetDetailsScreen(selectedPet)));
                },
                child: Text(
                  'View Details',
                  textAlign: TextAlign.left,
                  style: TextStyle(fontSize: 20, color: Colors.black),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
