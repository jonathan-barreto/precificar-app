import 'package:flutter/material.dart';
import 'package:precificar_app/app/core/utils/colors/app_colors.dart';

final themeDataCustom = ThemeData(
  primaryColor: AppColors.primaryColor,

  appBarTheme: const AppBarTheme(
    backgroundColor: AppColors.secondColor,
  ),

  inputDecorationTheme: const InputDecorationTheme(
    border: OutlineInputBorder(),
    labelStyle: TextStyle(
      color: AppColors.secondColor,
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: AppColors.secondColor,
      ),
    ),
    disabledBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: AppColors.secondColor,
      ),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: AppColors.secondColor,
      ),
    ),
  ),

  elevatedButtonTheme: const ElevatedButtonThemeData(
    style: ButtonStyle(
      backgroundColor: MaterialStatePropertyAll(
        AppColors.secondColor,
      ),
    ),
  ),

  cardTheme: const CardTheme(
    color: AppColors.primaryColor,
  ),

  textTheme: const TextTheme(
    titleLarge: TextStyle(
      color: AppColors.primaryColor,
      fontWeight: FontWeight.bold,
      letterSpacing: 1,
    ),
  ),

  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    elevation: 0,
    backgroundColor: Colors.white,
    selectedItemColor: AppColors.primaryColor,
  ),
);
