import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class PostHome extends StatelessWidget {
  final firestore = Firestore.instance;
  String query;
  @override
  Widget build(BuildContext context) {
    Map data = ModalRoute.of(context).settings.arguments;
    query = data['query'];

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.home),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: FutureBuilder<QuerySnapshot>(
        future: firestore.collection(query).getDocuments(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List posts = snapshot.data.documents;
            print(posts.length);
            // if (posts.length > 0) {
            //   for (var i = 0; i < posts.length; i++) {
            //     var mainImg = posts[i].get('mainImg');
            //     var posts = posts[i].get('posts');
            //     print(mainImg);
            //   }
            // }
            return Padding(
              padding: EdgeInsets.all(15.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/post_page', arguments: {
                    'posts': posts[0].get('posts'),
                  });
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  child: Image.asset(
                    'assets/images/' + posts[0].get('mainImg') + '.jpg',
                  ),
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
