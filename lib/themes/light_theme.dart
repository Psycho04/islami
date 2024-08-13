import 'package:flutter/material.dart';


class MyLightTheme {
  static const Color lightPrimaryColor = Color(0xffB7935F);

  static final ThemeData lightTheme = ThemeData(
    
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: lightPrimaryColor,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.white,
        ),
    scaffoldBackgroundColor: Colors.transparent,
    appBarTheme: const AppBarTheme(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        titleTextStyle: TextStyle(
          color: Colors.black,
            fontSize: 30,
            fontWeight: FontWeight.w700,
            fontFamily: 'ElMessiri')),
    colorScheme: ColorScheme.fromSeed(
      seedColor: lightPrimaryColor,
      primary: lightPrimaryColor,
      onPrimary: Colors.black,
      secondary: lightPrimaryColor,
      onSecondary: const Color(0xffc9b496),
      primaryContainer: lightPrimaryColor
    ),
    dividerTheme: const DividerThemeData(
      color: lightPrimaryColor,
      thickness: 2,
    ),
    textTheme: const TextTheme(
        titleSmall: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
        bodySmall: TextStyle(fontSize: 25, fontWeight: FontWeight.w400),
        displayMedium: TextStyle(
            fontSize: 20, fontWeight: FontWeight.w400,)),
    iconTheme: const IconThemeData(
      color: lightPrimaryColor,
      size: 35,
    ),
    elevatedButtonTheme: const ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: MaterialStatePropertyAll(lightPrimaryColor),
        
      )
    )
  );
}
