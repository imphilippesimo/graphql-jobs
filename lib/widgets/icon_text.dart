import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class IconText extends StatelessWidget {
  final Icon icon;
  final Text text;

  const IconText({Key key, this.icon, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Row(
      children: <Widget>[
        icon,
        SizedBox(
          width: 5,
        ),
        text,
      ],
    ));
  }
}
