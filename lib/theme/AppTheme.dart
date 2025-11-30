import 'package:flutter/material.dart';

import '../utiles/AppColors.dart';
import '../utiles/AppFonts.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
      scaffoldBackgroundColor: AppColors.whiteColor,
      primaryColor: AppColors.blackColor,

      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.whiteColor,
        centerTitle:true,
        iconTheme: IconThemeData(color: AppColors.blackColor),
      ),
      textTheme: TextTheme(
          titleLarge: AppFonts.bold24Black,
          labelLarge: AppFonts.bold16Black,
          labelMedium: AppFonts.medium20Black,
          labelSmall: AppFonts.medium14Black,
          bodyLarge: AppFonts.medium24Black
      )
  );

  static ThemeData darkTheme = ThemeData(
      scaffoldBackgroundColor: AppColors.blackColor,
      primaryColor: AppColors.whiteColor,
      appBarTheme: AppBarTheme(
          backgroundColor: AppColors.blackColor,
          centerTitle:true,
          iconTheme: IconThemeData(color: AppColors.whiteColor),
      ),
      textTheme: TextTheme(
          titleLarge: AppFonts.bold24Black,
          labelLarge: AppFonts.bold16White,
          labelMedium: AppFonts.medium20White,
          labelSmall: AppFonts.medium14White,
          bodyLarge: AppFonts.medium24White
      )
  );
}