import 'package:flutter/material.dart';

class PostPage extends StatelessWidget {
  List posts;
  final pageController = PageController(
    initialPage: 0,
  );
  @override
  Widget build(BuildContext context) {
    Map data = ModalRoute.of(context).settings.arguments;
    posts = data['posts'];
    print(posts);
    return SafeArea(
        child: PageView(
            controller: pageController,
            children: posts
                .map((post) => Image.asset('assets/images/' + post + '.jpg'))
                .toList()));
  }
}
