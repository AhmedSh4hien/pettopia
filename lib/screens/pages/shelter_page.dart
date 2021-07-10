import 'dart:math';

import 'package:flutter/material.dart';
import 'package:pettopia/providers/api_provider.dart';
import 'package:pettopia/widgets/home_widgets/shelter_details.dart';
import 'package:provider/provider.dart';

class ShelterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: ChangeNotifierProvider(
      create: (_) => ApiProvider(3),
      child: Builder(
        builder: (context) {
          final model = Provider.of<ApiProvider>(context);
          if (model.homeState == HomeState.Loading) {
            return Center(child: CircularProgressIndicator());
          }
          if (model.homeState == HomeState.Error) {
            return Center(child: Text('An Error Occured ${model.message}'));
          }
          final shelters = model.shelters;
          return ListView.builder(
              itemCount: shelters.length,
              itemBuilder: (context, i) {
                Random random = new Random();
                final shelter = shelters[i];
                return ShelterDetails(
                    name: shelter.name.toString(),
                    rating: random.nextInt(5).toDouble());
              });
        },
      ),
    ));
  }
}
