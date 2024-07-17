import 'package:flutter/material.dart';
import 'package:management_states/library/constant/colors_app.dart';



class ThemApp{
  static ThemeData themeData = ThemeData(
    fontFamily: 'Cairo',
    useMaterial3: true,
    textTheme: TextTheme(
      headline1: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 22,
          color: ColorsApp.primaryColor
      ),
      bodyText1: TextStyle(
        color: ColorsApp.primaryColor,
        fontSize: 18,
      ),
    ),
    primaryColorLight: ColorsApp.primaryColor,
  );
}
