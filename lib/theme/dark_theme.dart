import 'package:flutter/material.dart';
import 'package:six_cash/util/color_resources.dart';

ThemeData dark = ThemeData(
  fontFamily: 'Roboto',
  primaryColor: Color(0xFFfc58d3),
  brightness: Brightness.dark,
  secondaryHeaderColor: Color(0xFFaaa818),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Colors.black,
      selectedItemColor: ColorResources.themeDarkBackgroundColor),
);
