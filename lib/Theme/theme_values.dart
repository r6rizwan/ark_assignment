//This is the Theme Manager with pre-defined Color values for all 4 themes.

import 'package:flutter/material.dart';

/// ----  Blue Theme  ----
const bluePrimary = Colors.blue;
const blueAccent = Colors.blueAccent;
const blueBackground = Color(0xFFFFFFFF);
const blueIcon = Colors.white;
final blueTheme = ThemeData(
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: blueBackground,
        selectedItemColor: blueIcon,
        unselectedItemColor: Colors.black),
    primaryColor: bluePrimary,
    backgroundColor: blueBackground,
    colorScheme: ColorScheme.fromSwatch().copyWith(secondary: blueAccent));

/// ----  Dark Theme  ----
const darkPrimary = Color(0xFF000000);
const darkAccent = Color(0xFFBB86FC);
const darkBackground = Color(0xFF313030);
const darktext = Color(0xFFFFFFFF);
const darkUnselectedIcon = Color(0xFF9287F7);
const darkloading = Colors.white;
final darkTheme = ThemeData(
  progressIndicatorTheme: const ProgressIndicatorThemeData(color: darkloading),
  primaryColor: darkPrimary,
  backgroundColor: darkBackground,
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: darkBackground,
    unselectedItemColor: darkUnselectedIcon,
    selectedItemColor: darktext,
  ),
  textTheme: const TextTheme(
    bodyText1: TextStyle(color: darktext),
  ),
  colorScheme: ColorScheme.fromSwatch().copyWith(secondary: darkAccent),
);

/// ----  Green Theme  ----
const greenPrimary = Color(0xFF4CAF50);
const greenAccent = Color(0xFF631739);
const greenBackground = Color(0xFFFFFFFF);
final greenTheme = ThemeData(
    primaryColor: greenPrimary,
    backgroundColor: greenBackground,
    progressIndicatorTheme:
        const ProgressIndicatorThemeData(color: greenPrimary),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: greenBackground,
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.black,
    ),
    colorScheme: ColorScheme.fromSwatch().copyWith(secondary: greenAccent));

/// ----  Pink Theme  ----
const pinkPrimary = Color(0xFFE91E63);
const pinkAccent = Color(0xFF0C7D9C);
const pinkBackground = Color(0xFFFFFFFF);
final pinkTheme = ThemeData(
    primaryColor: pinkPrimary,
    backgroundColor: pinkBackground,
    progressIndicatorTheme:
        const ProgressIndicatorThemeData(color: pinkPrimary),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: pinkBackground,
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.black,
    ),
    colorScheme: ColorScheme.fromSwatch().copyWith(secondary: pinkAccent));

ThemeData customTheme = ThemeData(
  primaryColor: const Color(0xFF75BAF3),
  backgroundColor: Colors.white,
  colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.white),
);
