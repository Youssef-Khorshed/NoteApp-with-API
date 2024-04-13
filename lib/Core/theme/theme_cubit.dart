import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:todo_task/Core/colors.dart';

class ThemeCubit extends Cubit<bool> {
  ThemeCubit() : super(true);

  static ThemeData lightTheme = ThemeData(
      primarySwatch: color6,
      scaffoldBackgroundColor: Colors.white,
      colorScheme: const ColorScheme.light(),
      iconTheme: IconThemeData(color: color_grey2),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              disabledBackgroundColor: Colors.transparent,
              backgroundColor: Colors.transparent,
              elevation: 0.0)),
      appBarTheme: const AppBarTheme(
          iconTheme: IconThemeData(color: color12),
          backgroundColor: Colors.transparent,
          elevation: 0.0));

  static ThemeData darkTheme = ThemeData(
      primarySwatch: color12,
      scaffoldBackgroundColor: Colors.black,
      colorScheme: const ColorScheme.dark(),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              foregroundColor: color_wthite,
              backgroundColor: Colors.transparent,
              elevation: 0.0)),
      iconTheme: IconThemeData(color: color_wthite),
      // ignore: prefer_const_constructors
      appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent, elevation: 0.0));

  void switch_theme({required bool themestate}) {
    emit(themestate);
  }
}
