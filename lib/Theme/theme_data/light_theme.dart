import 'package:flutter/material.dart';
import 'package:pet_adoption/Theme/color_scheme.dart';
import 'package:pet_adoption/Theme/text_theme.dart';
import 'package:pet_adoption/Theme/theme_components/app_bar.dart';
import 'package:pet_adoption/Theme/theme_components/bottom_navigation_bar_custome.dart';
import 'package:pet_adoption/Theme/theme_data/theme_color.dart';

class LightThemeData {
  static final int themeLight = 1;

  static ThemeData lightThemeData() {
    return ThemeData(
        brightness: Brightness.light,
        useMaterial3: true,
        primaryColor: ThemeColorLightMaterial3.primary,
        canvasColor: Colors.transparent,
        scaffoldBackgroundColor: ThemeColorLightMaterial3.background,
        appBarTheme: getAppBarTheme(themeMode: themeLight),
        navigationRailTheme: const NavigationRailThemeData(
          selectedIconTheme: IconThemeData(
            color: Color(0xff005BFF),
            opacity: 1,
            size: 24,
          ),
          unselectedIconTheme: IconThemeData(
            color: Color(0xff495057),
            opacity: 1,
            size: 24,
          ),
          backgroundColor: Color(0xffffffff),
          elevation: 3,
          selectedLabelTextStyle: TextStyle(
            color: Color(0xff005BFF),
          ),
          unselectedLabelTextStyle: TextStyle(
            color: Color(0xff495057),
          ),
        ),
        bottomNavigationBarTheme:
            BottomNavigationBarCustome.bottomNavigationBarCustome(
                themeMode: themeLight),
        dividerTheme: DividerThemeData(
            color: ThemeColorLightMaterial3.outline.withAlpha(50)),
        colorScheme: ColorSchemeTheme.colorSchemeTheme(themeMode: themeLight),
        // cardTheme: CardTheme(
        //   color: ThemeColorLightMaterial3.surface,
        //   shadowColor: ThemeColorLightMaterial3.shadowColor,
        // ),
        inputDecorationTheme: InputDecorationTheme(
          fillColor: ThemeColorLightMaterial3.surfaceVariant,
          //iconColor: ThemeColorLightMaterial3.onSurfaceVariant,
          prefixIconColor: ThemeColorLightMaterial3.onSurfaceVariant,
          suffixIconColor: ThemeColorLightMaterial3.onSurfaceVariant,
          hintStyle: const TextStyle(fontSize: 15, color: Color(0xaa495057)),
          focusedBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(4)),
            borderSide: BorderSide(width: 1, color: Color(0xff005BFF)),
          ),
          enabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(4)),
            borderSide: BorderSide(width: 1, color: Colors.black54),
          ),
          border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(4)),
              borderSide: BorderSide(width: 1, color: Colors.black54)),
        ),
        textTheme: TextThemeCustom.lightTextTheme(),
        // disabledColor: ThemeColorLightMaterial3.onSurface,

        //Color(0xffdcc7ff),
        expansionTileTheme: ExpansionTileThemeData(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          collapsedShape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
        // floatingActionButtonTheme:
        //     FloatingActionButtonCustome.floatingActionButtonCustome(
        //         themeMode: themeLight),
        dividerColor: ThemeColorLightMaterial3.outline,
        errorColor: Color(0xfff0323c),
        // popupMenuTheme: PopupMenuThemeData(
        //   color: ThemeColorLightMaterial3.surface,
        //   textStyle: TextThemeCustom.lightTextTheme()
        //       .bodyText2!
        //       .merge(TextStyle(color: ThemeColorLightMaterial3.onSurface)),
        // ),
        snackBarTheme: SnackBarThemeData(
            backgroundColor: ThemeColorLightMaterial3.onPrimaryContainer,
            actionTextColor: ThemeColorLightMaterial3.primaryContainer,
            disabledActionTextColor: ThemeColorLightMaterial3.surface,
            behavior: SnackBarBehavior.floating,
            showCloseIcon: true,
            closeIconColor: ThemeColorLightMaterial3.primaryContainer),
        bottomAppBarTheme: BottomAppBarTheme(
            color: ThemeColorLightMaterial3.secondaryContainer, elevation: 0),
        // sliderTheme: SliderComponent.sliderComponent(themeMode: themeLight),
        dialogBackgroundColor: ThemeColorLightMaterial3.surface);
    //dialogTheme: DialogCustom.dialogCustom(themeMode: themeLight));
  }
}
