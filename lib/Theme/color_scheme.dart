import 'package:flutter/material.dart';
import 'package:pet_adoption/Theme/theme_data/theme_color.dart';

class ColorSchemeTheme {
  static ColorScheme colorSchemeTheme({required themeMode}) {
    final int themeLight = 1;

    return themeMode == themeLight
        ? ColorScheme.light(
            brightness: Brightness.light,
            primary: ThemeColorLightMaterial3.primary,
            onPrimary: ThemeColorLightMaterial3.onPrimary,
            primaryContainer: ThemeColorLightMaterial3.primaryContainer,
            onPrimaryContainer: ThemeColorLightMaterial3.onPrimaryContainer,
            secondary: ThemeColorLightMaterial3.secondary,
            onSecondary: ThemeColorLightMaterial3.onSecondary,
            secondaryContainer: ThemeColorLightMaterial3.secondaryContainer,
            onSecondaryContainer: ThemeColorLightMaterial3.onSecondaryContainer,
            tertiary: ThemeColorLightMaterial3.tertiary,
            onTertiary: ThemeColorLightMaterial3.onTertiary,
            tertiaryContainer: ThemeColorLightMaterial3.tertiaryContainer,
            onTertiaryContainer: ThemeColorLightMaterial3.onTertiaryContainer,
            error: ThemeColorLightMaterial3.error,
            onError: ThemeColorLightMaterial3.onError,
            errorContainer: ThemeColorLightMaterial3.errorContainer,
            onErrorContainer: ThemeColorLightMaterial3.onErrorContainer,
            background: ThemeColorLightMaterial3.background,
            onBackground: ThemeColorLightMaterial3.onBackground,
            surface: ThemeColorLightMaterial3.surface,
            onSurface: ThemeColorLightMaterial3.onSurface,
            surfaceVariant: ThemeColorLightMaterial3.surfaceVariant,
            onSurfaceVariant: ThemeColorLightMaterial3.onSurfaceVariant,
            outline: ThemeColorLightMaterial3.outline,
            primaryVariant: Color(0xff0055ff),
            secondaryVariant: Color(0xFF007a0e),
          )
        : ColorScheme.dark(
            primary: ThemeColorDarkMaterial3.primary,
            onPrimary: ThemeColorDarkMaterial3.onPrimary,
            primaryContainer: ThemeColorDarkMaterial3.primaryContainer,
            onPrimaryContainer: ThemeColorDarkMaterial3.onPrimaryContainer,
            secondary: ThemeColorDarkMaterial3.secondary,
            onSecondary: ThemeColorDarkMaterial3.onSecondary,
            secondaryContainer: ThemeColorDarkMaterial3.secondaryContainer,
            onSecondaryContainer: ThemeColorDarkMaterial3.onSecondaryContainer,
            tertiary: ThemeColorDarkMaterial3.tertiary,
            onTertiary: ThemeColorDarkMaterial3.onTertiary,
            tertiaryContainer: ThemeColorDarkMaterial3.tertiaryContainer,
            onTertiaryContainer: ThemeColorDarkMaterial3.onTertiaryContainer,
            error: ThemeColorDarkMaterial3.error,
            onError: ThemeColorDarkMaterial3.onError,
            errorContainer: ThemeColorDarkMaterial3.errorContainer,
            onErrorContainer: ThemeColorDarkMaterial3.onErrorContainer,
            background: ThemeColorDarkMaterial3.background,
            onBackground: ThemeColorDarkMaterial3.onBackground,
            surface: ThemeColorDarkMaterial3.surface,
            onSurface: ThemeColorDarkMaterial3.onSurface,
            surfaceVariant: ThemeColorDarkMaterial3.surfaceVariant,
            onSurfaceVariant: ThemeColorDarkMaterial3.onSurfaceVariant,
            outline: ThemeColorDarkMaterial3.outline,
            primaryVariant: Color(0xfff6ae2d),
            secondaryVariant: Color(0xff228B22),
          );
  }
}
