import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyThemeData {
  static const Color primaryColor = Color(0xffB7935F);
  static const Color darkColor = Color(0xff0F1424);
  static const Color yellowColor = Color(0xffFACC1D);
  static const Color black = Colors.black;
  static ThemeData lightTheme = ThemeData(
    colorScheme: const ColorScheme(
        brightness: Brightness.light,
        primary: primaryColor,
        onPrimary: Colors.black54,
        secondary: primaryColor,
        onSecondary: black,
        error: Colors.red,
        onError: Colors.white,
        background: primaryColor,
        onBackground: Colors.grey,
        surface: Colors.blueGrey,
        onSurface: Colors.white),
      scaffoldBackgroundColor: Colors.transparent,
      appBarTheme: const AppBarTheme(
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
      ),
      textTheme: TextTheme(
          bodyLarge: GoogleFonts.elMessiri(
              fontSize: 35,
              fontWeight: FontWeight.bold,
              color: const Color(0xff242424)),
          bodyMedium: GoogleFonts.elMessiri(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: const Color(0xff242424)),
          bodySmall: GoogleFonts.elMessiri(
              fontSize: 20,
              fontWeight: FontWeight.w200,
              color: const Color(0xff242424))),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        type: BottomNavigationBarType.shifting,
        backgroundColor: primaryColor,
        selectedItemColor: Color(0xff242424),
        unselectedItemColor: Color(0xffF8F8F8),
        showUnselectedLabels: false,
      ));
  static ThemeData darkTheme = ThemeData(
      colorScheme: const ColorScheme(
          brightness: Brightness.dark,
          primary: darkColor,
          onPrimary: Colors.white,
          secondary: yellowColor,
          onSecondary: Colors.white,
          error: Colors.red,
          onError: Colors.white,
          background: yellowColor,
          onBackground: Colors.grey,
          surface: Colors.blueGrey,
          onSurface: Colors.white),
      scaffoldBackgroundColor: Colors.transparent,
      appBarTheme: const AppBarTheme(
        iconTheme: IconThemeData(color: Colors.white),
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
      ),
      textTheme: TextTheme(
          bodyLarge: GoogleFonts.elMessiri(
              fontSize: 35,
              fontWeight: FontWeight.bold,
              color:  Colors.white),
          bodyMedium: GoogleFonts.elMessiri(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color:  Colors.white),
          bodySmall: GoogleFonts.elMessiri(
              fontSize: 20,
              fontWeight: FontWeight.w200,
              color: yellowColor)),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        type: BottomNavigationBarType.shifting,
        backgroundColor: darkColor,
        selectedItemColor: yellowColor,
        unselectedItemColor: Colors.white,
        showUnselectedLabels: false,
      ));
}
