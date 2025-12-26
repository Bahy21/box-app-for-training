import 'package:box_app/core/constants/app_cached.dart';
import 'package:box_app/core/local/shared_preferences/shared_pref_services.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class ThemeCubit extends Cubit<ThemeMode> {
  final SharedPrefServices appPref;

  ThemeCubit(this.appPref) : super(ThemeMode.light) {
    _loadTheme();
  }

  void _loadTheme() {
    final isDark = appPref.getData(key: AppCached.isDarkMode) ?? false;
    emit(isDark ? ThemeMode.dark : ThemeMode.light);
  }

  void setDarkMode(bool isDark) {
    appPref.saveData(AppCached.isDarkMode, isDark);
    emit(isDark ? ThemeMode.dark : ThemeMode.light);
  }

  void toggleTheme() {
    final isDark = state == ThemeMode.dark;
    setDarkMode(!isDark);
  }

  bool get isDarkMode => state == ThemeMode.dark;
}
