import 'package:flutter/material.dart';

CustomTheme currenttheme = CustomTheme();
Color primary = Colors.black;
Color primary2 = Colors.white;

class CustomTheme with ChangeNotifier {
  static bool isDarkMode = false;
  ThemeMode get currenttheme => isDarkMode ? ThemeMode.dark : ThemeMode.light;
  void toggle() {
    isDarkMode = !isDarkMode;
    notifyListeners();
  }

  static ThemeData get lightTheme {
    return ThemeData(
      primaryColor: primary,
      backgroundColor: Colors.white,
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.white,
        shadowColor: Colors.transparent,
        foregroundColor: Colors.black,
      ),
      textTheme: const TextTheme(
        headline1: TextStyle(
            color: Colors.black, fontSize: 24, fontWeight: FontWeight.bold),
        bodyText1: TextStyle(
          color: Colors.black,
        ),
        bodyText2: TextStyle(
          color: Colors.grey,
          fontSize: 14,
        ),
      ),
      iconTheme: IconThemeData(
        color: primary,
      ),
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      primaryColor: Colors.white,
      backgroundColor: Colors.black26,
      scaffoldBackgroundColor: Colors.black38,
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.black87,
        shadowColor: Colors.transparent,
      ),
      textTheme: TextTheme(
        headline1: const TextStyle(
            color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
        bodyText1: const TextStyle(
          color: Colors.white,
        ),
        bodyText2: TextStyle(
          color: Colors.grey[400],
          fontSize: 14,
        ),
      ),
      iconTheme: IconThemeData(
        color: primary2,
      ),
    );
  }
}
