import 'package:flutter/material.dart';
import 'package:graphqljobs/models/tag_model.dart';

class TagTile extends StatelessWidget {
  final Tag tag;

  const TagTile({this.tag});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(5.0, 0.0, 5.0, 0.0),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Text(
        tag.name,
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w300,
          fontSize: 12.0,
        ),
      ),
    );
  }
}
