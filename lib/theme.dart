import 'package:flutter/material.dart';

final ThemeData dotaTheme = ThemeData(
  primaryColor: const Color(0xFF000000), // Dark background

  scaffoldBackgroundColor: const Color(0xFF1B1B1B),

  textTheme: const TextTheme(
    displayLarge: TextStyle(
        color: Color(0xFFFFFFFF), fontSize: 32, fontWeight: FontWeight.bold),
    titleLarge: TextStyle(color: Color(0xFFD32F2F), fontSize: 20),
    bodyLarge: TextStyle(color: Colors.white),
    bodyMedium: TextStyle(color: Colors.white70),
  ),

  appBarTheme: const AppBarTheme(
    backgroundColor: Color(0xFFA4230D),
    titleTextStyle: TextStyle(
        color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
    iconTheme: IconThemeData(color: Colors.white),
  ),

  buttonTheme: const ButtonThemeData(
    buttonColor: Color(0xFFD32F2F), // Dota 2 Red
    textTheme: ButtonTextTheme.primary,
  ),

  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      foregroundColor: Colors.white,
      backgroundColor: const Color(0xFFD32F2F),
    ),
  ),

  iconTheme: const IconThemeData(
    color: Color(0xFFD32F2F), // Dota 2 Red
  ),

  listTileTheme: ListTileThemeData(
    textColor: Colors.white,
    contentPadding: const EdgeInsets.symmetric(horizontal: 16),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8),
    ),
    iconColor: Colors.white,
  ),

  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: Color(0xFFD32F2F), // Dota 2 Red
    foregroundColor: Colors.white,
  ),
  colorScheme: ColorScheme.fromSwatch()
      .copyWith(
        primary: const Color(0xFF000000), // Dota 2 Black
        secondary: const Color(0xFFA72714), // Dota 2 Red
      )
      .copyWith(background: const Color(0xFF1B1B1B)),
);
