import 'package:flutter/material.dart';
import 'package:six_cash/util/color_resources.dart';

ThemeData light = ThemeData(
  brightness: Brightness.light,
  fontFamily: 'Rubik',
  primaryColor: Color(0xFF003E47),
  secondaryHeaderColor: Color(0xFFff00f7),
  highlightColor: Color(0xFF003E47),
  backgroundColor: Colors.white,
  primaryColorDark: Colors.black,
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Colors.white,
      selectedItemColor: ColorResources.themeLightBackgroundColor),
);
