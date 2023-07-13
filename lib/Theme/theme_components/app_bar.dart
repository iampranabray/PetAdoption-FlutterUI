import 'package:flutter/material.dart';
import 'package:pet_adoption/Theme/theme_data/theme_color.dart';

AppBarTheme? getAppBarTheme({int? themeMode}) {
  AppBarTheme? appBarTheme;
  final int themeLight = 1;
  final int themeDark = 0;

  if (themeMode == themeLight) {
    appBarTheme = AppBarTheme(
      // textTheme: lightAppBarTextTheme,
      elevation: 0,
      scrolledUnderElevation: 2,
      titleTextStyle: TextStyle(
        color: ThemeColorLightMaterial3.onSurface,
      ),
      actionsIconTheme: IconThemeData(
        color: ThemeColorLightMaterial3.onSurface,
      ),
      color: ThemeColorLightMaterial3.surface,
      iconTheme: IconThemeData(
        color: ThemeColorLightMaterial3.onSurfaceVariant,
        size: 24,
      ),
    );
  } else if (themeMode == themeDark) {
    appBarTheme = AppBarTheme(
      elevation: 0,
      scrolledUnderElevation: 2,
      titleTextStyle: TextStyle(
        color: ThemeColorDarkMaterial3.onSurface,
      ),
      actionsIconTheme: IconThemeData(
        color: ThemeColorDarkMaterial3.onSurface,
      ),
      color: ThemeColorDarkMaterial3.surface,
      iconTheme: IconThemeData(
        color: ThemeColorDarkMaterial3.onSurfaceVariant,
        size: 24,
      ),
    );
  }
  return appBarTheme;
}
