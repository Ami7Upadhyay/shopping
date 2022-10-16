import 'package:flutter/material.dart';
import 'package:shopping/core/app_color.dart';

class AppTheme {
  static final lightTheme = ThemeData(
      primaryColor: const Color(0xff006a6a),
      textSelectionTheme: const TextSelectionThemeData(
        cursorColor: color26252A,
      ),
      inputDecorationTheme: const InputDecorationTheme(
          filled: true,
          fillColor: colorF0F0F0,
          isDense: true,
          prefixIconColor: color26252A,
          hintStyle: TextStyle(
            color: color26252A,
            fontSize: 13,
            fontWeight: FontWeight.w400,
          ),
          focusedBorder:
              OutlineInputBorder(borderSide: BorderSide(color: colorF0F0F0)),
          enabledBorder:
              OutlineInputBorder(borderSide: BorderSide(color: colorF0F0F0)),
          border:
              OutlineInputBorder(borderSide: BorderSide(color: colorF0F0F0))),
      buttonTheme: ButtonThemeData(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
        buttonColor: const Color(0xff006a6a),
      ));
}
