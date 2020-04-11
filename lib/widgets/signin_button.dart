import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SignInButton extends StatelessWidget {
  final IconData icon;
  final Color backgroundColor;
  final Color foreGroundColor;
  final Function onPressed;
  final String textContent;

  const SignInButton(
      {Key key,
      this.icon,
      this.backgroundColor,
      this.foreGroundColor,
      this.onPressed,
      this.textContent})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70.0,
      child: RaisedButton(
        onPressed: onPressed,
        color: backgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50.0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              icon,
              size: 20.0,
              color: foreGroundColor,
            ),
            SizedBox(
              width: 5.0,
            ),
            Text(
              textContent,
              style: TextStyle(
                color: foreGroundColor,
                fontSize: 20.0,
                fontWeight: FontWeight.w600,
                letterSpacing: 1.2,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
