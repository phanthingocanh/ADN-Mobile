import 'package:flutter/material.dart';

class AppThemes {
  static ThemeData lightTheme() => ThemeData.light().copyWith(
        buttonTheme: ButtonThemeData(
          height: 50.0,
          textTheme: ButtonTextTheme.primary,
          buttonColor: Colors.lightBlueAccent,
        ),
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(),
        ),
      );
}
