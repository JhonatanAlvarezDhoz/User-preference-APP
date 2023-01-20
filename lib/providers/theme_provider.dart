import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeData curretTheme;

  ThemeProvider({required bool isDarkmode})
      : curretTheme = isDarkmode ? ThemeData.dark() : ThemeData.light();

  setLightMode() {
    curretTheme = ThemeData.light();

    notifyListeners(); //!para que se escuuchen los cambio
  }

  setDarkMode() {
    curretTheme = ThemeData.dark();

    notifyListeners();
  }
}
