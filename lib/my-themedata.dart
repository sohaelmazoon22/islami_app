import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyThemeData {
  static const Color primary = Color(0xffB7935F);
  static ThemeData lightTheme = ThemeData(
      scaffoldBackgroundColor: Colors.transparent,
      appBarTheme: const AppBarTheme(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
      ),
      textTheme: TextTheme(
          bodyLarge: GoogleFonts.elMessiri(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: const Color(0xff242424))),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        type: BottomNavigationBarType.shifting,
        backgroundColor: primary,
        selectedItemColor: Color(0xff242424),
        unselectedItemColor: Color(0xffF8F8F8),
        showUnselectedLabels: false,
      ));
  static ThemeData darkTheme = ThemeData();
}