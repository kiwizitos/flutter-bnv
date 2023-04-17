import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppTheme {
  static ThemeData get theme => ThemeData(
    fontFamily: 'Inter',
    backgroundColor: AppColors.white,
    scaffoldBackgroundColor: AppColors.white,
    appBarTheme: AppBarTheme(
      color: AppColors.white
    ),
    primarySwatch: Colors.blue,
    inputDecorationTheme: inputTheme,
    textTheme: TextTheme(bodyText1: TextStyle(color: AppColors.black))
  );
  static InputDecorationTheme get inputTheme => const InputDecorationTheme(
    border: OutlineInputBorder(borderSide: BorderSide(color: AppColors.black)),
    enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: AppColors.black)),
    focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: AppColors.blue800)),
    focusColor: AppColors.blue800,
    floatingLabelStyle: TextStyle(color: AppColors.blue800)
  );
}