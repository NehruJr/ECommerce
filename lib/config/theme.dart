import 'package:flutter/material.dart';

const Color kMainColor = Color(0xff00BE84);
const Color kDarkGreyClr = Color(0xFF121212);
const Color kPinkClr = Color(0xFFff4667);
const Color kColor1 = Color(0xff685959);
const Color kColor2 = Color(0xffADA79B);
const Color kColor3 = Color(0xffA5947F);
const Color kColor4 = Color(0xff738B71);
const Color kColor5 = Color(0xff6D454D);
const Color kDarkSettings = Color(0xff6132e4);
const Color kAccountSettings = Color(0xff73bc65);
const Color kLogOutSettings = Color(0xff5f95ef);
const Color kNotiSettings = Color(0xffdf5862);
const Color kLanguageSettings = Color(0xffCB256C);

class ThemesApp {
  static final light = ThemeData(
    backgroundColor: Colors.white,
    brightness: Brightness.light,
    colorScheme: const ColorScheme.light(
      primary: kMainColor,
      onPrimary: Colors.white,
    ),
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: const AppBarTheme(
        iconTheme:IconThemeData(
            color: Colors.black
        ),
        color: Colors.white
    ),
  );

  static final dark = ThemeData(
    backgroundColor: kDarkGreyClr,
    brightness: Brightness.dark,
    colorScheme: const ColorScheme.dark(
      primary: kDarkGreyClr,
      onPrimary: Colors.white,
    ),
    appBarTheme: const AppBarTheme(
        iconTheme:IconThemeData(
            color: Colors.black
        ),
        color: Colors.white
    ),
  );
}
