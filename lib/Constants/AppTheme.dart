import 'dart:ui';

import 'package:flutter/material.dart';

class AppTheme {
  static const Color hash = Color(0xFFDDDDDD);
  static const Color darkGreen = Color(0xFF034328);
  static const Color paleGreen = Color(0xFFDAFFDB);
  static const Color offWhite = Color(0xFFFAFAFA);
  static const Color blue = Color(0xFF1A1F71);
  static const Color paleBlue = Color(0xFFB0B4F6);
  static const Color green = Color(0xFF37A05D);
  static const Color white = Color(0xFFFFFFFF);
  static const Color grey = Color(0xFF3A5160);
  static const Color secondary = Color(0xFFD8211F);
  static const Color primary = Color(0xFF79C004);
  static const Color black = Color(0xFF000000);
  static const Color darkText = Color(0xFF17262A);
  static const Color backGround = Color(0xFFE5E5E5);
  static const String fontName = 'DMSans';

  static const TextTheme textTheme = TextTheme(
    headline4: header,
    headline5: headline,
    headline6: title,
    subtitle2: subtitle,
    bodyText2: body2,
    bodyText1: body1WithBlackText,
    caption: caption,
  );

  static const TextStyle header = TextStyle( // h4 -> display1
    fontFamily: fontName,
    fontWeight: FontWeight.bold,
    fontSize: 36,
    letterSpacing: 0.4,
    height: 0.9,
    color: darkText,
  );

  static const TextStyle headline = TextStyle( // h5 -> headline
    fontFamily: fontName,
    fontWeight: FontWeight.bold,
    fontSize: 24,
    letterSpacing: 0.27,
    color: darkText,
  );

  static const TextStyle title = TextStyle( // h6 -> title
    fontFamily: fontName,
    fontWeight: FontWeight.bold,
    fontSize: 16,
    letterSpacing: 0.18,
    color: darkText,
  );

  static const TextStyle subtitle = TextStyle( // subtitle2 -> subtitle
    fontFamily: fontName,
    fontWeight: FontWeight.w400,
    fontSize: 14,
    letterSpacing: -0.04,
    color: black,
  );

  static const TextStyle body2 = TextStyle( // body1 -> body2
    fontFamily: fontName,
    fontWeight: FontWeight.w400,
    fontSize: 14,
    letterSpacing: 0.2,
    color: black,
  );

  static const TextStyle body1WithBlackText = TextStyle( // body2 -> body1
    fontFamily: fontName,
    fontWeight: FontWeight.w400,
    fontSize: 16,
    letterSpacing: -0.05,
    color: black,
  );
  static const TextStyle body1WithWhiteText = TextStyle( // body2 -> body1
    fontFamily: fontName,
    fontWeight: FontWeight.w400,
    fontSize: 16,
    letterSpacing: -0.05,
    color: white,
  );

  static const TextStyle caption = TextStyle( // Caption -> caption
    fontFamily: fontName,
    fontWeight: FontWeight.w400,
    fontSize: 12,
    letterSpacing: 0.2,
    color: black, // was lightText
  );
}