import 'package:flutter/material.dart';
import 'package:pettopia/providers/api_provider.dart';
import 'package:pettopia/widgets/home_widgets/pet_details.dart';
import 'package:pettopia/widgets/home_widgets/product_details.dart';
import 'package:provider/provider.dart';

class BuyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: ChangeNotifierProvider(
      create: (_) => ApiProvider(5),
      child: Builder(
        builder: (context) {
          final model = Provider.of<ApiProvider>(context);
          if (model.homeState == HomeState.Loading) {
            return Center(child: CircularProgressIndicator());
          }
          if (model.homeState == HomeState.Error) {
            return Center(child: Text('An Error Occured ${model.message}'));
          }
          final prods = model.prods;
          return ListView.builder(
              itemCount: prods.length,
              itemBuilder: (context, i) {
                final prod = prods[i];
                return ProductDetails(prod);
              });
        },
      ),
    ));
  }
}
