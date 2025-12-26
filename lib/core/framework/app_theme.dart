import 'package:box_app/core/constants/app_constants.dart';
import 'package:box_app/core/constants/app_fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../theme/app_colors/dark_theme_colors.dart';
import '../theme/app_colors/light_theme_colors.dart';

class AppTheme {
  static final _lightColors = LightThemeColors();
  static final _darkColors = DarkThemeColors();

  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,

      // Primary Colors
      primaryColor: _lightColors.primary,
      scaffoldBackgroundColor: _lightColors.scaffoldBackground,

      // AppBar Theme
      appBarTheme: AppBarTheme(
        backgroundColor: _lightColors.appBarBackground,
        elevation: 0,
        centerTitle: true,
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        iconTheme: IconThemeData(color: _lightColors.iconPrimary),
        titleTextStyle: TextStyle(
          fontSize: AppFonts.t18,
          color: _lightColors.textPrimary,
          fontWeight: FontWeight.w500,
        ),
      ),

      // Text Theme
      textTheme: TextTheme(
        displayLarge: TextStyle(
          fontSize: AppFonts.t24,
          fontWeight: FontWeight.w700,
          color: _lightColors.textPrimary,
        ),
        displayMedium: TextStyle(
          fontSize: AppFonts.t20,
          fontWeight: FontWeight.w400,
          color: _lightColors.textPrimary,
        ),
        displaySmall: TextStyle(
          fontSize: AppFonts.t18,
          fontWeight: FontWeight.w400,
          color: _lightColors.textPrimary,
        ),
        bodyLarge: TextStyle(
          fontSize: AppFonts.t16,
          fontWeight: FontWeight.w400,
          color: _lightColors.textPrimary,
        ),
        bodyMedium: TextStyle(
          fontSize: AppFonts.t14,
          fontWeight: FontWeight.w400,
          color: _lightColors.textSecondary,
        ),
        bodySmall: TextStyle(
          fontSize: AppFonts.t12,
          fontWeight: FontWeight.w400,
          color: _lightColors.textSecondary,
        ),
      ),

      // Card Theme
      cardTheme: CardThemeData(
        color: _lightColors.cardBackground,
        elevation: 2,
        shadowColor: _lightColors.shadow,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),

      // Input Decoration Theme
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: _lightColors.inputBackground,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: _lightColors.border),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: _lightColors.border),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: _lightColors.borderFocused, width: 2),
        ),
      ),

      // Bottom Navigation Bar Theme
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: _lightColors.bottomNavBackground,
        selectedItemColor: _lightColors.bottomNavSelected,
        unselectedItemColor: _lightColors.bottomNavUnselected,
        type: BottomNavigationBarType.fixed,
      ),

      // Icon Theme
      iconTheme: IconThemeData(color: _lightColors.iconPrimary),

      // Font Family
      fontFamily: AppConstants.fontFamily,

      // Color Scheme
      colorScheme: ColorScheme.light(
        primary: _lightColors.primary,
        secondary: _lightColors.orange,
        surface: _lightColors.scaffoldBackground,
        error: _lightColors.error,
        onPrimary: _lightColors.textOnPrimary,
        onSecondary: _lightColors.textOnPrimary,
        onSurface: _lightColors.textPrimary,
        onError: _lightColors.white,
      ),
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,

      // Primary Colors
      primaryColor: _darkColors.primary,
      scaffoldBackgroundColor: _darkColors.scaffoldBackground,

      // AppBar Theme
      appBarTheme: AppBarTheme(
        backgroundColor: _darkColors.appBarBackground,
        elevation: 0,
        centerTitle: true,
        systemOverlayStyle: SystemUiOverlayStyle.light,
        iconTheme: IconThemeData(color: _darkColors.iconPrimary),
        titleTextStyle: TextStyle(
          fontSize: AppFonts.t18,
          color: _darkColors.textPrimary,
          fontWeight: FontWeight.w500,
        ),
      ),

      // Text Theme
      textTheme: TextTheme(
        displayLarge: TextStyle(
          fontSize: AppFonts.t24,
          fontWeight: FontWeight.w700,
          color: _darkColors.textPrimary,
        ),
        displayMedium: TextStyle(
          fontSize: AppFonts.t20,
          fontWeight: FontWeight.w400,
          color: _darkColors.textPrimary,
        ),
        displaySmall: TextStyle(
          fontSize: AppFonts.t18,
          fontWeight: FontWeight.w400,
          color: _darkColors.textPrimary,
        ),
        bodyLarge: TextStyle(
          fontSize: AppFonts.t16,
          fontWeight: FontWeight.w400,
          color: _darkColors.textPrimary,
        ),
        bodyMedium: TextStyle(
          fontSize: AppFonts.t14,
          fontWeight: FontWeight.w400,
          color: _darkColors.textSecondary,
        ),
        bodySmall: TextStyle(
          fontSize: AppFonts.t12,
          fontWeight: FontWeight.w400,
          color: _darkColors.textSecondary,
        ),
      ),

      // Card Theme
      cardTheme: CardThemeData(
        color: _darkColors.cardBackground,
        elevation: 2,
        shadowColor: _darkColors.shadow,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),

      // Input Decoration Theme
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: _darkColors.inputBackground,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: _darkColors.border),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: _darkColors.border),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: _darkColors.borderFocused, width: 2),
        ),
      ),

      // Bottom Navigation Bar Theme
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: _darkColors.bottomNavBackground,
        selectedItemColor: _darkColors.bottomNavSelected,
        unselectedItemColor: _darkColors.bottomNavUnselected,
        type: BottomNavigationBarType.fixed,
      ),

      // Icon Theme
      iconTheme: IconThemeData(color: _darkColors.iconPrimary),

      // Font Family
      fontFamily: AppConstants.fontFamily,

      // Color Scheme
      colorScheme: ColorScheme.dark(
        primary: _darkColors.primary,
        secondary: _darkColors.orange,
        surface: _darkColors.cardBackground,
        error: _darkColors.error,
        onPrimary: _darkColors.textOnPrimary,
        onSecondary: _darkColors.textOnPrimary,
        onSurface: _darkColors.textPrimary,
        onError: _darkColors.white,
      ),
    );
  }
}
