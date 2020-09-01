import 'package:flutter/material.dart';
import 'colors.dart';

class AppTheme {
  get darkTheme => ThemeData(
        fontFamily: 'CirceRounded',
        primarySwatch: Colors.blue,
        appBarTheme: AppBarTheme(
            brightness: Brightness.dark, color: AppColors.primaryDark),
        inputDecorationTheme: InputDecorationTheme(
          hintStyle: TextStyle(color: AppColors.bodyGrey),
          labelStyle: TextStyle(color: AppColors.header),
        ),
        brightness: Brightness.dark,
        canvasColor: AppColors.canvasDark,
        cardColor: AppColors.cardColorDark,
        accentColor: AppColors.accentDark,
        accentIconTheme: IconThemeData(color: AppColors.accent),
        iconTheme: IconThemeData(color: Colors.white),
      );

  get lightTheme => ThemeData(
        fontFamily: 'CirceRounded',
        primarySwatch: Colors.blue,
        appBarTheme: AppBarTheme(
          brightness: Brightness.light,
          color: AppColors.primary,
        ),
        inputDecorationTheme: InputDecorationTheme(
          hintStyle: TextStyle(color: AppColors.bodyGrey),
          labelStyle: TextStyle(color: AppColors.header),
        ),
        canvasColor: AppColors.canvas,
        brightness: Brightness.light,
        accentColor: AppColors.accent,
        accentIconTheme: IconThemeData(color: AppColors.accent),
        iconTheme: IconThemeData(color: Colors.black87),
      );

  get directionLTR => TextDirection.ltr;
}
