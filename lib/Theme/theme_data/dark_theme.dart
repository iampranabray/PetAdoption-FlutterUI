import 'package:flutter/material.dart';
import 'package:pet_adoption/Theme/color_scheme.dart';
import 'package:pet_adoption/Theme/text_theme.dart';
import 'package:pet_adoption/Theme/theme_components/app_bar.dart';
import 'package:pet_adoption/Theme/theme_components/bottom_navigation_bar_custome.dart';
import 'package:pet_adoption/Theme/theme_data/theme_color.dart';

class DarkThemeData {
  static final int themeDark = 0;

  static ThemeData darkThemeData() {
    return ThemeData(
      brightness: Brightness.dark,
      useMaterial3: true,

      canvasColor: Colors.transparent,
      primaryColor: ThemeColorDarkMaterial3.primary,
      // Color(0xfff6ae2d),
      scaffoldBackgroundColor: ThemeColorDarkMaterial3.background,
      appBarTheme: getAppBarTheme(themeMode: themeDark),
      colorScheme: ColorSchemeTheme.colorSchemeTheme(themeMode: themeDark),

      // cardTheme: CardTheme(
      //   color: ThemeColorDarkMaterial3.surface,
      //   // Color(0xff37404a),
      //   shadowColor: ThemeColorDarkMaterial3.shadowColor,
      //   //Color(0xff000000),
      //   elevation: 1,
      //   margin: EdgeInsets.all(0),
      // ),

      textTheme: TextThemeCustom.darkTextTheme(),

      disabledColor: ThemeColorDarkMaterial3.onSurface,

      inputDecorationTheme: InputDecorationTheme(
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(4)),
          borderSide: BorderSide(width: 1, color: Color(0xff3d63ff)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(4)),
          borderSide: BorderSide(width: 1, color: Colors.white70),
        ),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(4)),
            borderSide: BorderSide(width: 1, color: Colors.white70)),
      ),
      dividerColor: ThemeColorDarkMaterial3.outline.withAlpha(50),
      dividerTheme: DividerThemeData(
          color: ThemeColorDarkMaterial3.outline.withAlpha(50)),
      // Color(0xffd1d1d1),
      errorColor: Colors.orange,
      cardColor: ThemeColorDarkMaterial3.surface,

      // floatingActionButtonTheme:
      //     FloatingActionButtonCustome.floatingActionButtonCustome(
      //         themeMode: themeDark),
      popupMenuTheme: PopupMenuThemeData(
        color: ThemeColorDarkMaterial3.surface,
        textStyle: TextThemeCustom.lightTextTheme().bodyMedium?.merge(
              TextStyle(
                color: ThemeColorDarkMaterial3.onSurface,
              ),
            ),
      ),
      snackBarTheme: SnackBarThemeData(
          backgroundColor: ThemeColorDarkMaterial3.onPrimaryContainer,
          actionTextColor: ThemeColorDarkMaterial3.primaryContainer,
          disabledActionTextColor: ThemeColorDarkMaterial3.surface,
          behavior: SnackBarBehavior.floating,
          showCloseIcon: true,
          closeIconColor: ThemeColorDarkMaterial3.primaryContainer),

      //bottomSheetTheme: ,
      bottomNavigationBarTheme:
          BottomNavigationBarCustome.bottomNavigationBarCustome(
              themeMode: themeDark),
      bottomAppBarTheme: BottomAppBarTheme(
        color: ThemeColorDarkMaterial3.surface,
        elevation: 2,
      ),

      //sliderTheme: SliderComponent.sliderComponent(themeMode: themeDark),
      dialogBackgroundColor: ThemeColorDarkMaterial3.surface,
      // dialogTheme: DialogCustom.dialogCustom(themeMode: themeDark),
      // cupertinoOverrideTheme: CupertinoThemeData(),
    );
  }
}
