import 'package:flutter/material.dart';

import 'app_colors/app_theme_colors.dart';
import 'app_colors/dark_theme_colors.dart';
import 'app_colors/light_theme_colors.dart';

extension ThemeColorsExtension on BuildContext {
  AppThemeColors get themeColors {
    final isDark = Theme.of(this).brightness == Brightness.dark;
    return isDark ? DarkThemeColors() : LightThemeColors();
  }
}

class ThemeProvider {
  static AppThemeColors getColors(Brightness brightness) {
    return brightness == Brightness.dark
        ? DarkThemeColors()
        : LightThemeColors();
  }

  static AppThemeColors get light => LightThemeColors();

  static AppThemeColors get dark => DarkThemeColors();
}
