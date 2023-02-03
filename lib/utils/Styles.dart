import 'dart:ui';

import 'package:flutter/material.dart';

const bgColor = Color.fromRGBO(234, 206, 227, 1); //bgcolor

// const kPrimaryColor = Color(0xFFFFC61F);
// const ksecondaryColor = Color(0xFFB5BFD0);
// const kTextColor = Color(0xFF50505D);
// const kTextLightColor = Color(0xFF6A727D);

class Styles {
  static TextStyle textH1 = const TextStyle(
      fontSize: 50,
      fontWeight: FontWeight.w400,
      color: txtColor,
      wordSpacing: 2);
  static TextStyle texttitle = const TextStyle(
      fontSize: 35, fontWeight: FontWeight.w400, color: txtColor);
  // static const orange = Color(0xFFFC6011);
  static const primary = Color(0xFF4A4B4D);
  static const secondary = Color(0xFF7C7D7E);
  static const placeholder = Color(0xFFB6B7B7);
  static const placeholderBg = Color(0xFFF2F2F2);

  static const iconColor = Colors.deepOrangeAccent; //bgcolor
  // static const bgColor = Color.fromRGBO(234, 206, 227, 1); //bgcolor
  static const bgColor = Colors.deepOrange; //bgcolor
  static const orange = Color.fromRGBO(241, 90, 41, 1); //icons
  static const txtColor = Color.fromRGBO(66, 43, 74, 1); //txt
  static const btntxtColor = Color.fromRGBO(50, 28, 59, 1); //txt
  static const grey = Color(0xFF4A4B4D);

  static TextStyle textH2 = const TextStyle(fontSize: 20, color: txtColor);

  static TextStyle textH3 =
      TextStyle(fontSize: 15, color: txtColor, fontWeight: FontWeight.w900);

  static TextStyle btnText = TextStyle(fontSize: 20, color: btntxtColor);
}
