import 'package:flutter/material.dart';
import 'package:graphqljobs/models/user_model.dart';

class ArticleCarousel extends StatelessWidget {
  final User user;

  const ArticleCarousel({Key key, this.user}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Center(
          child: Text(
        'Hey ${user.email!=null?user.email:''} 🤗 , hang tight... , \n\nWe are gathering the most useful GraphQL articles just for you 💗',
        style: TextStyle(
            fontSize: 30.0,
            fontWeight: FontWeight.bold,
            color: Theme.of(context).primaryColor),
      )),
    );
  }
}
