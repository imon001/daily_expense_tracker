import 'package:flutter/material.dart';

ThemeData lightMode = ThemeData(
  brightness: Brightness.light,
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.deepPurple,
    foregroundColor: Colors.black87,
    centerTitle: true,
    elevation: 3,
  ),
  colorScheme: ColorScheme.light(
    background: Colors.deepPurple.shade100,
    primary: Colors.deepPurple,
    secondary: Colors.deepPurple.shade300,
  ),
);

ThemeData darkMode = ThemeData(
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.blueGrey.shade900,
      foregroundColor: Colors.white70,
      centerTitle: true,
      elevation: 3,
    ),
    brightness: Brightness.dark,
    colorScheme: ColorScheme.dark(
      background: Colors.blueGrey.shade800,
      primary: Colors.blueGrey.shade500,
      secondary: Colors.blueGrey.shade700,
    ));
