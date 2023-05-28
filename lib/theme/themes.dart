import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

ThemeData getBlackWhiteTheme() {
  final ThemeData base = ThemeData.dark();

  return base.copyWith(
    primaryColor: Colors.black,
    primaryColorLight: Colors.white,
    scaffoldBackgroundColor: Colors.black,
    appBarTheme: const AppBarTheme(
      color: Colors.black,
      elevation: 0, systemOverlayStyle: SystemUiOverlayStyle.light,
    ),
    textTheme: const TextTheme(
      displayLarge: TextStyle(
        color: Colors.white,
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),
      bodyLarge: TextStyle(
        color: Colors.white,
        fontSize: 16,
      ),
    ),
    buttonTheme: ButtonThemeData(
      buttonColor: Colors.white,
      textTheme: ButtonTextTheme.primary,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      fillColor: Colors.white,
      filled: true,
      enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(
          color: Colors.white,
          width: 2,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(
          color: Colors.white,
          width: 2,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      labelStyle: const TextStyle(
        color: Colors.white,
      ),
    ), colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.white),
  );
}
