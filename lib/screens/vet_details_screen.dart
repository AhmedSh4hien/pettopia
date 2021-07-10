import 'dart:math';

import 'package:flutter/material.dart';
import 'package:pettopia/providers/authintecation_provider.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

class VetDetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final model = Provider.of<UserProvider>(context);
    Random random = new Random();
    // Random randoms = new Random();
    // Random randomsss = new Random();

    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/images/HomeBG.png'), fit: BoxFit.cover),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          brightness: Brightness.light,
          elevation: 0,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                backgroundColor: Colors.blue,
                radius: 30,
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                height: MediaQuery.of(context).size.height - 170,
                width: 324,
                child: ListView(children: [
                  GestureDetector(
                    onTap: () async {
                      final getUser = await http.post(
                        Uri.parse(
                            'http://10.0.2.2:8000/api/makeappointment?shedule_id=1&user_id=${model.currentUserId}'),
                      );
                      print(getUser.body);
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text('You have reserved successfully'),
                      ));
                    },
                    child: Container(
                      width: 323.0,
                      height: 124.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(21.0),
                        color: const Color(0xffe9897e),
                        border: Border.all(
                            width: 1.0, color: const Color(0xff707070)),
                      ),
                      child: Center(
                          child: Text(
                              'Monday From ${random.nextInt(9)}:00PM to 11:00PM')),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  GestureDetector(
                    onTap: () async {
                      final getUser = await http.post(
                        Uri.parse(
                            'http://10.0.2.2:8000/api/makeappointment?shedule_id=2&user_id=${model.currentUserId}'),
                      );
                      print(getUser.body);
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text('You have reserved successfully'),
                      ));
                    },
                    child: Container(
                      width: 323.0,
                      height: 124.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(21.0),
                        color: const Color(0xffe9897e),
                        border: Border.all(
                            width: 1.0, color: const Color(0xff707070)),
                      ),
                      child: Center(
                          child: Text(
                              'Thursday From ${random.nextInt(7)}:00PM to 9:00PM')),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  GestureDetector(
                    onTap: () async {
                      final getUser = await http.post(
                        Uri.parse(
                            'http://10.0.2.2:8000/api/makeappointment?shedule_id=3&user_id=${model.currentUserId}'),
                      );
                      print(getUser.body);
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text('You have reserved successfully'),
                      ));
                    },
                    child: Container(
                      width: 323.0,
                      height: 124.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(21.0),
                        color: const Color(0xffe9897e),
                        border: Border.all(
                            width: 1.0, color: const Color(0xff707070)),
                      ),
                      child: Center(
                          child: Text(
                              'Sunday From ${random.nextInt(5)}:00PM to 8:00PM')),
                    ),
                  ),
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
