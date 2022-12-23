import 'package:flutter/material.dart';
import 'colors.dart';

class ThemeDetails {
  static ThemeData lightTheme = ThemeData(
      scaffoldBackgroundColor: Colors.transparent,
      colorScheme: ColorScheme(
        primary: blackColor,
        onPrimary: Colors.white,
        secondary: greenColor,
        onSecondary: grayColor,
        brightness: Brightness.light,
        error: redColor,
        onError: redColor,
        background: mintColor,
        onBackground: Colors.transparent,
        surface: Colors.transparent,
        onSurface: Colors.transparent,
      ),
      appBarTheme: AppBarTheme(
          backgroundColor: blueColor,
          elevation: 0.0,
          shadowColor: Colors.transparent,
          titleTextStyle: TextStyle(
              fontSize: 22, color: Colors.white, fontWeight: FontWeight.bold)),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: Colors.white,
          selectedItemColor: blueColor,
          unselectedItemColor: graylightColor),
      floatingActionButtonTheme:
          FloatingActionButtonThemeData(backgroundColor: blueColor));
  static ThemeData darkTheme = ThemeData(
      scaffoldBackgroundColor: Colors.transparent,
      colorScheme: ColorScheme(
        primary: Colors.white,
        onPrimary: Colors.white,
        secondary: greenColor,
        onSecondary: graylightColor,
        brightness: Brightness.dark,
        error: redColor,
        onError: redColor,
        background: blackColor,
        onBackground: Colors.transparent,
        surface: Colors.transparent,
        onSurface: Colors.transparent,
      ),
      appBarTheme: AppBarTheme(
          backgroundColor: blueColor,
          elevation: 0.0,
          titleTextStyle: TextStyle(
              fontSize: 22, color: blackColor, fontWeight: FontWeight.bold)),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: blackColor,
          selectedItemColor: blueColor,
          unselectedItemColor: graylightColor));
}
