import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Color primaryColor = Color(0xffB7935f);
Color primaryDarkColor = Color(0xff141A2E);
Color blackColor = Color(0xff242424);
Color yellowColor = Color(0xfffacc1d);

mixin MyThemeData {
  static ThemeData lightTheme = ThemeData(
      primaryColor: primaryColor,
      dividerTheme: DividerThemeData(color: primaryColor),
      scaffoldBackgroundColor: Colors.transparent,
      appBarTheme: AppBarTheme(
        titleTextStyle: TextStyle(
          color: Colors.black
        ),
        iconTheme: IconThemeData(size: 30, color: blackColor),
        centerTitle: true,
        backgroundColor: Colors.transparent,
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
          showSelectedLabels: true,
          showUnselectedLabels: false,
          backgroundColor: primaryColor,
          selectedItemColor: blackColor,
          unselectedItemColor: Colors.white,
          type: BottomNavigationBarType.shifting),
      textTheme: TextTheme(
        bodyLarge: GoogleFonts.elMessiri(
          fontSize: 30,
          fontWeight: FontWeight.w700,
          color: Colors.black,
        ),
        bodyMedium: GoogleFonts.elMessiri(
          fontSize: 25,
          fontWeight: FontWeight.w700,
          color: Colors.black,
        ),
        bodySmall: GoogleFonts.elMessiri(
          fontSize: 20,
          fontWeight: FontWeight.w700,
          color: Colors.black,
        ),
      ));

  static ThemeData darkTheme = ThemeData(
      primaryColor: primaryDarkColor,
      dividerTheme:DividerThemeData(color: yellowColor),
      scaffoldBackgroundColor: Colors.transparent,
      appBarTheme: AppBarTheme(
        elevation: 0,
        titleTextStyle: TextStyle(
          color: Colors.white
        ),
        iconTheme: IconThemeData(size: 30, color: Colors.white),
        centerTitle: true,
        backgroundColor: Colors.transparent,
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
          showSelectedLabels: true,
          showUnselectedLabels: false,
          backgroundColor: primaryDarkColor,
          selectedItemColor: yellowColor,
          unselectedItemColor: Colors.white,
          type: BottomNavigationBarType.shifting),
      textTheme: TextTheme(
        bodyLarge: GoogleFonts.elMessiri(
          fontSize: 30,
          fontWeight: FontWeight.w700,
          color: Colors.white,
        ),
        bodyMedium: GoogleFonts.elMessiri(
          fontSize: 25,
          fontWeight: FontWeight.w700,
          color: Colors.white,
        ),
        bodySmall: GoogleFonts.elMessiri(
          fontSize: 20,
          fontWeight: FontWeight.w700,
          color: Colors.white,
        ),
      ));
}
