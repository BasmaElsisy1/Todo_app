import 'package:flutter/material.dart';

class MyProvider extends ChangeNotifier {
  String language = 'en';
  ThemeMode themeMode = ThemeMode.light;




  void changeLanguage(String languageCode) {
    language = languageCode;
    notifyListeners();
  }

  void changeTheme(ThemeMode mode) {
    themeMode = mode;
    notifyListeners();

  }
}
