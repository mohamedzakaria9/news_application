import 'package:flutter/material.dart';

import '../utiles/AppColors.dart';
import '../utiles/AppFonts.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
      scaffoldBackgroundColor: AppColors.whiteColor,
      primaryColor: AppColors.blackColor,
      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.whiteColor,
        centerTitle:true
      ),
      textTheme: TextTheme(
          titleLarge: AppFonts.bold24Black,
          labelLarge: AppFonts.bold16Black,
          labelMedium: AppFonts.medium20Black,
          labelSmall: AppFonts.medium14Black
      )
  );

  static ThemeData darkTheme = ThemeData(
      scaffoldBackgroundColor: AppColors.blackColor,
      primaryColor: AppColors.whiteColor,
      appBarTheme: AppBarTheme(
          backgroundColor: AppColors.blackColor,
          centerTitle:true
      ),
      textTheme: TextTheme(
          titleLarge: AppFonts.bold24Black,
          labelLarge: AppFonts.bold16White,
          labelMedium: AppFonts.medium20White,
          labelSmall: AppFonts.medium14White
      )
  );
}