import 'package:flutter/material.dart';

class AppTheme {
  static final light = ThemeData.light().copyWith(
    iconTheme: const IconThemeData(color: Colors.black87),
    bottomNavigationBarTheme:
        const BottomNavigationBarThemeData(backgroundColor: Colors.white, selectedItemColor: Colors.black, unselectedItemColor: Colors.grey),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.white,
      titleTextStyle: TextStyle(
        color: Colors.black,
        fontSize: 28,
      ),
      actionsIconTheme: IconThemeData(color: Colors.black, size: 30),
      iconTheme: IconThemeData(color: Colors.black),
    ),
    scaffoldBackgroundColor: Colors.white,
    cardColor: Colors.black,
    unselectedWidgetColor: Colors.black45,
    focusColor: Colors.black,
    textTheme: const TextTheme(
      displayLarge: TextStyle(color: Colors.black, fontSize: 40, fontWeight: FontWeight.w500),
      displayMedium: TextStyle(color: Colors.black, fontSize: 28, fontWeight: FontWeight.w500),
      displaySmall: TextStyle(color: Colors.black, fontSize: 22, fontWeight: FontWeight.w400),
      headlineMedium: TextStyle(color: Colors.black, fontSize: 19, fontWeight: FontWeight.bold),
      headlineSmall: TextStyle(color: Colors.black54, fontSize: 17, fontWeight: FontWeight.w700),
      titleLarge: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),
      titleMedium: TextStyle(color: Colors.black87, fontSize: 14, fontWeight: FontWeight.normal),
      titleSmall: TextStyle(color: Colors.black, fontSize: 13, fontWeight: FontWeight.w400),
    ),
  );

  static final dark = ThemeData.dark().copyWith(
    primaryColor: Colors.black12,
    bottomNavigationBarTheme:
        const BottomNavigationBarThemeData(backgroundColor: Colors.black, selectedItemColor: Colors.white, unselectedItemColor: Colors.white70),
    appBarTheme: const AppBarTheme(
      color: Colors.black,
      titleTextStyle: TextStyle(
        color: Colors.white,
        fontSize: 28,
      ),
      actionsIconTheme: IconThemeData(color: Colors.white, size: 30),
      iconTheme: IconThemeData(color: Colors.white),
    ),
    scaffoldBackgroundColor: Colors.black,
    focusColor: Colors.white,
    textTheme: const TextTheme(
      displayLarge: TextStyle(color: Colors.white, fontSize: 40, fontWeight: FontWeight.w500),
      displayMedium: TextStyle(color: Colors.white, fontSize: 28, fontWeight: FontWeight.w400),
      displaySmall: TextStyle(color: Colors.white70, fontSize: 22, fontWeight: FontWeight.w500),
      headlineMedium: TextStyle(color: Colors.white, fontSize: 19, fontWeight: FontWeight.w700),
      headlineSmall: TextStyle(color: Colors.white70, fontSize: 16, fontWeight: FontWeight.bold),
      titleLarge: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
      titleSmall: TextStyle(color: Colors.white, fontSize: 13, fontWeight: FontWeight.w400),
      titleMedium: TextStyle(color: Colors.white70, fontSize: 14, fontWeight: FontWeight.normal),
    ),
  );
}
