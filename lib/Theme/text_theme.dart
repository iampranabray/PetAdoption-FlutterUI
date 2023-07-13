import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pet_adoption/Theme/theme_data/theme_color.dart';

class TextThemeCustom {
  static TextTheme lightTextTheme() {
    return TextTheme(
      displayLarge: GoogleFonts.roboto(
        textStyle: TextStyle(
            fontSize: 96, color: ThemeColorLightMaterial3.onBackground),
      ),
      displayMedium: GoogleFonts.roboto(
        textStyle: TextStyle(
            fontSize: 60, color: ThemeColorLightMaterial3.onBackground),
      ),
      displaySmall: GoogleFonts.roboto(
        textStyle: TextStyle(
            fontSize: 48, color: ThemeColorLightMaterial3.onBackground),
      ),
      headlineMedium: GoogleFonts.roboto(
        textStyle: TextStyle(
            fontSize: 34, color: ThemeColorLightMaterial3.onBackground),
      ),
      headlineSmall: GoogleFonts.roboto(
        textStyle: TextStyle(
            fontSize: 24, color: ThemeColorLightMaterial3.onBackground),
      ),
      titleLarge: GoogleFonts.roboto(
        textStyle: TextStyle(
            fontSize: 20, color: ThemeColorLightMaterial3.onBackground),
      ),
      titleMedium: GoogleFonts.roboto(
        textStyle: TextStyle(
            fontSize: 16, color: ThemeColorLightMaterial3.onBackground),
      ),
      titleSmall: GoogleFonts.roboto(
        textStyle: TextStyle(
            fontSize: 14, color: ThemeColorLightMaterial3.onBackground),
      ),
      bodyLarge: GoogleFonts.roboto(
        textStyle: TextStyle(
            fontSize: 16, color: ThemeColorLightMaterial3.onBackground),
      ),
      bodyMedium: GoogleFonts.roboto(
        textStyle: TextStyle(
            fontSize: 14, color: ThemeColorLightMaterial3.onBackground),
      ),
      labelLarge: GoogleFonts.roboto(
        textStyle: TextStyle(
            fontSize: 14, color: ThemeColorLightMaterial3.onBackground),
      ),
      bodySmall: GoogleFonts.roboto(
        textStyle: TextStyle(
            fontSize: 12, color: ThemeColorLightMaterial3.onBackground),
      ),
      labelSmall: GoogleFonts.roboto(
        textStyle: TextStyle(
            fontSize: 10, color: ThemeColorLightMaterial3.onBackground),
      ),
    );
  }

  static TextTheme darkTextTheme() {
    return TextTheme(
      displayLarge: GoogleFonts.roboto(
        textStyle: TextStyle(
            fontSize: 96, color: ThemeColorDarkMaterial3.onBackground),
      ),
      displayMedium: GoogleFonts.roboto(
        textStyle: TextStyle(
            fontSize: 60, color: ThemeColorDarkMaterial3.onBackground),
      ),
      displaySmall: GoogleFonts.roboto(
        textStyle: TextStyle(
            fontSize: 48, color: ThemeColorDarkMaterial3.onBackground),
      ),
      headlineMedium: GoogleFonts.roboto(
        textStyle: TextStyle(
            fontSize: 34, color: ThemeColorDarkMaterial3.onBackground),
      ),
      headlineSmall: GoogleFonts.roboto(
        textStyle: TextStyle(
            fontSize: 24, color: ThemeColorDarkMaterial3.onBackground),
      ),
      titleLarge: GoogleFonts.roboto(
        textStyle: TextStyle(
            fontSize: 20, color: ThemeColorDarkMaterial3.onBackground),
      ),
      titleMedium: GoogleFonts.roboto(
        textStyle: TextStyle(
            fontSize: 16, color: ThemeColorDarkMaterial3.onBackground),
      ),
      titleSmall: GoogleFonts.roboto(
        textStyle: TextStyle(
            fontSize: 14, color: ThemeColorDarkMaterial3.onBackground),
      ),
      bodyLarge: GoogleFonts.roboto(
        textStyle: TextStyle(
            fontSize: 16, color: ThemeColorDarkMaterial3.onBackground),
      ),
      bodyMedium: GoogleFonts.roboto(
        textStyle: TextStyle(
            fontSize: 14, color: ThemeColorDarkMaterial3.onBackground),
      ),
      labelLarge: GoogleFonts.roboto(
        textStyle: TextStyle(
            fontSize: 14, color: ThemeColorDarkMaterial3.onBackground),
      ),
      bodySmall: GoogleFonts.roboto(
        textStyle: TextStyle(
            fontSize: 12, color: ThemeColorDarkMaterial3.onBackground),
      ),
      labelSmall: GoogleFonts.roboto(
        textStyle: TextStyle(
            fontSize: 10, color: ThemeColorDarkMaterial3.onBackground),
      ),
    );
  }
}
