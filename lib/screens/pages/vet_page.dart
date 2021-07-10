import 'dart:math';

import 'package:flutter/material.dart';
import 'package:pettopia/providers/api_provider.dart';
import 'package:pettopia/widgets/home_widgets/vet_details.dart';
import 'package:provider/provider.dart';

class VetPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: ChangeNotifierProvider(
      create: (_) => ApiProvider(4),
      child: Builder(
        builder: (context) {
          final model = Provider.of<ApiProvider>(context);
          if (model.homeState == HomeState.Loading) {
            return Center(child: CircularProgressIndicator());
          }
          if (model.homeState == HomeState.Error) {
            return Center(child: Text('An Error Occured ${model.message}'));
          }
          final vets = model.vets;
          return ListView.builder(
              itemCount: vets.length,
              itemBuilder: (context, i) {
                Random random = new Random();
                final vet = vets[i];
                return VetDetails(
                    name: vet.name.toString(),
                    rating: random.nextInt(5).toDouble());
              });
        },
      ),
    ));
  }
}
