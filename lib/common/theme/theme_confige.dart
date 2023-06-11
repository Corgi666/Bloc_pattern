import 'package:appbloc/common/values/colors.dart';
import 'package:flutter/material.dart';

class Themes {
  static final ThemeData themeData = ThemeData(
      scaffoldBackgroundColor: Colors.white,
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          elevation: 0, backgroundColor: Colors.white),
      appBarTheme: const AppBarTheme(
        elevation: 0,
        backgroundColor: Colors.white,
      ));
}

bool isDarkMode(BuildContext context) {
  return MediaQuery.of(context).platformBrightness == Brightness.dark;
}

TextStyle get commonText => TextStyle(color: AppColors.primaryText);
