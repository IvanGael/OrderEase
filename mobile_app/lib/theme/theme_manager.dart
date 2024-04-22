import 'package:flutter/material.dart';
import 'package:orderease/utils/utils.dart';

class ThemeManager {
  ThemeData lightTheme = ThemeData(
    fontFamily: "PetrovSans",
    primaryColor: Utils.getColorFromHex("#4d4f58"), 
    colorScheme: ColorScheme.light(
      primary: Utils.getColorFromHex("#4d4f58"), 
      secondary: Utils.getColorFromHex("#132a3a")
    ).copyWith(background: Utils.getColorFromHex("#3adca2")),
    visualDensity: VisualDensity.adaptivePlatformDensity
  );

  ThemeData darkTheme = ThemeData(
    fontFamily: "PetrovSans",
    primaryColor: Utils.getColorFromHex("#1fd795"), 
    colorScheme: ColorScheme.light(
      primary: Utils.getColorFromHex("#1fd795"), 
      secondary: Utils.getColorFromHex("#132a3a")
    )
  );
}
