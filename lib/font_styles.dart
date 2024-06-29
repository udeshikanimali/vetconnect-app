import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class FontStyles {
  static TextStyle bodyTextStyle(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return TextStyle(
      fontSize: screenWidth * 0.015 + 8,
      fontFamily: 'inter',
      fontWeight: FontWeight.w400,
     
    );
  }

  static TextStyle titleTextStyle(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return TextStyle(
      letterSpacing: 0.5,
      fontSize: screenWidth * 0.025 + 10,
      fontFamily: 'inter',
      fontWeight: FontWeight.w700,
      color: Colors.green
      
    );
  }

  static TextStyle hintTextStyle(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return TextStyle(
      fontSize: screenWidth * 0.015 + 8,
      fontFamily: 'inter',
      fontWeight: FontWeight.w400,
      color: HexColor("#ABB2BA"),
    );
  }

  static TextStyle errorTextStyle(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return TextStyle(
      fontSize: screenWidth * 0.013 + 8,
      fontFamily: 'inter',
      fontWeight: FontWeight.w400,
      color: Colors.red
    );
  }

  static TextStyle buttonTextStyle(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return TextStyle(
      //fontSize: screenWidth * 0.04,
      fontSize: screenWidth * 0.02 + 8,
      fontFamily: 'inter',
      fontWeight: FontWeight.w500,
      color: HexColor("#ffffff"),
    );
  }
}