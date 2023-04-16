import 'package:flutter/material.dart';

// ChangeNotifier
// Provide change notification API
class ThemeProvider extends ChangeNotifier{ 

  ThemeData currentTheme;

  // :        https://dart.dev/language/constructors#initializer-list
  ThemeProvider({
    required bool isDarkmode
  }): currentTheme = isDarkmode ? ThemeData.dark() : ThemeData.light();


  setLightMode() {
    currentTheme = ThemeData.light();
    notifyListeners();    // Once it changes --> Notify it, being listened by the proper Widget
  }

  setDarkmode() {
    currentTheme = ThemeData.dark();
    notifyListeners();    // Once it changes --> Notify it, being listened by the proper Widget
  }



}


