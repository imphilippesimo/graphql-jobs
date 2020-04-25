import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextStyleGuide {
  static TextStyle mainTitle(Color color) {
    return TextStyle(
      color: color,
      fontSize: 25.0,
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle guestTitle(Color color) {
    return TextStyle(
      color: color,
      fontSize: 15.0,
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle punchLine1(Color color) {
    return TextStyle(
        color: color,
        fontSize: 20.0,
        fontWeight: FontWeight.w600,
        letterSpacing: 1.5,
        fontFamily: 'Montserrat');
  }

  static TextStyle punchLine2(Color color) {
    return TextStyle(
        color: color,
        fontSize: 15.0,
        fontWeight: FontWeight.w600,
        letterSpacing: 1.5,
        fontFamily: 'Montserrat');
  }

  static const TextStyle JobCardMainTitle = TextStyle(
    color: Colors.white,
    fontSize: 20.0,
    fontWeight: FontWeight.w600,
    letterSpacing: 1.2,
  );

  static const TextStyle EventDetailMainTitle = TextStyle(
    color: Colors.white,
    fontSize: 35.0,
    fontWeight: FontWeight.w900,
    letterSpacing: 1.5,
  );

  static const TextStyle EventCardMainTitle = TextStyle(
    color: Colors.white,
    fontSize: 25.0,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle listCardTitle = TextStyle(
    fontSize: 16.0,
    fontWeight: FontWeight.w600,
    letterSpacing: 1.2,
  );

  static TextStyle listCardTitleSecondary(Color color) {
    return TextStyle(
      color: color,
      fontSize: 15.0,
      fontWeight: FontWeight.w600,
      letterSpacing: 1.2,
    );
  }

  static TextStyle eventDetailDescription(Color color) {
    return TextStyle(
      color: color,
      fontSize: 15.0,
      fontWeight: FontWeight.w400,
    );
  }
}
