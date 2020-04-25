import 'package:flutter/material.dart';

class IconText extends StatelessWidget {
  final Icon icon;
  final Text text;
  final double width;

  const IconText({Key key, this.icon, this.text, this.width}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          icon,
          SizedBox(
            width: 5,
          ),
          Flexible(child: text),
        ],
      ),
    );
  }
}
