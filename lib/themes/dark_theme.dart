import 'package:flutter/material.dart';

// ignore: camel_case_types
class myDarkTheme {
  static const isDark = true;
  static const Color darkPrimaryColor = Color(0xff141A2E);
  static const Color darkSecondaryColor = Color(0xffFACC1D);
  static final ThemeData darkTheme = ThemeData(
    
    cardTheme: const CardTheme(
      color: darkPrimaryColor,
      surfaceTintColor: darkPrimaryColor,
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: darkPrimaryColor,
        selectedItemColor: darkSecondaryColor,
        unselectedItemColor: Colors.white),
    scaffoldBackgroundColor: Colors.transparent,
    appBarTheme: const AppBarTheme(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        titleTextStyle: TextStyle(
          color: Colors.white,
          fontSize: 30,
          fontWeight: FontWeight.w700,
          fontFamily: 'ElMessiri'
        )),
    colorScheme: ColorScheme.fromSeed(
      seedColor: darkPrimaryColor,
      primary: darkPrimaryColor,
      onPrimary: Colors.white,
      secondary: darkPrimaryColor,
      onSecondary: const Color(0xff151c32),
      primaryContainer: darkSecondaryColor
    ),
    dividerTheme: const DividerThemeData(
      color: darkSecondaryColor,
      thickness: 2,
    ),
    textTheme: const TextTheme(
     titleSmall: TextStyle(fontSize: 25, fontWeight: FontWeight.w600,color: Colors.white),
        bodySmall: TextStyle(fontSize: 25, fontWeight: FontWeight.w400,color: Colors.white),
        displayMedium: TextStyle(
            fontSize: 20, fontWeight: FontWeight.w400, color: darkSecondaryColor)
    ),
    iconTheme: const IconThemeData(color: darkSecondaryColor),
     elevatedButtonTheme: const ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: MaterialStatePropertyAll(darkSecondaryColor),
      )
    )
  );
}
