import 'package:flutter/material.dart';
import 'package:pet_adoption/Theme/theme_data/theme_color.dart';

class BottomNavigationBarCustome {
  static BottomNavigationBarThemeData bottomNavigationBarCustome(
      {required int? themeMode}) {
    final int themeLight = 1;

    return themeMode == themeLight
        ? BottomNavigationBarThemeData(
            backgroundColor: ThemeColorLightMaterial3.surface,
            elevation: 2,
            selectedItemColor: ThemeColorLightMaterial3.primary,
            unselectedItemColor: ThemeColorLightMaterial3.onSurfaceVariant,
          )
        : BottomNavigationBarThemeData(
            backgroundColor: ThemeColorDarkMaterial3.surface,
            elevation: 2,
            selectedItemColor: ThemeColorDarkMaterial3.primary,
            unselectedItemColor: ThemeColorDarkMaterial3.onSurfaceVariant,
          );
  }
}
