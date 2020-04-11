import 'package:flutter/material.dart';
import 'package:graphqljobs/models/user_model.dart';

class EventCarousel extends StatelessWidget {

  final User user;

  const EventCarousel({Key key, this.user}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Center(
          child: Text(
            'Hey ${user.email!=null?user.email:''} 🤗 , \n\nhang tight... \n\nWe are looking for awesome events around you, \n\nTo let you share with GraphQL lovers 💗',
            style: TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).primaryColor),
          )),
    );
  }
}
