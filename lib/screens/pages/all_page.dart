import 'dart:math';

import 'package:flutter/material.dart';
import 'package:pettopia/providers/api_provider.dart';
import 'package:pettopia/widgets/home_widgets/home_post_bubble.dart';
import 'package:pettopia/widgets/home_widgets/home_posting_form.dart';
import 'package:provider/provider.dart';

class AllPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(child: PostingForm()),
        Expanded(
          flex: 3,
          child: Container(
              child: ChangeNotifierProvider(
            create: (_) => ApiProvider(0),
            child: Builder(
              builder: (context) {
                final model = Provider.of<ApiProvider>(context);
                if (model.homeState == HomeState.Loading) {
                  return Center(child: CircularProgressIndicator());
                }
                if (model.homeState == HomeState.Error) {
                  return Center(
                      child: Text('An Error Occured ${model.message}'));
                }
                final posts = model.posts;
                return ListView.builder(
                    itemCount: posts.length,
                    itemBuilder: (context, i) {
                      Random randomComments = new Random();
                      Random randomHearts = new Random();
                      Random randomHours = new Random();

                      final post = posts[i];
                      return PostBubble(
                        text: post.post.toString(),
                        comments: randomComments.nextInt(200),
                        hearts: randomHearts.nextInt(1000),
                        hours: randomHours.nextInt(24).toDouble(),
                      );
                    });
              },
            ),
          )),
        ),
      ],
    );
  }
}
