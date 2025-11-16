import 'package:flutter/material.dart';

import '../utiles/AppColors.dart';
import '../utiles/AppFonts.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
      scaffoldBackgroundColor: AppColors.whiteColor,
      textTheme: TextTheme(
          titleLarge: AppFonts.bold24Black,
          labelLarge: AppFonts.bold16Black,
          labelMedium: AppFonts.medium20Black
      )
  );

  static ThemeData darkTheme = ThemeData(
      scaffoldBackgroundColor: AppColors.blackColor,
      textTheme: TextTheme(
          titleLarge: AppFonts.bold24Black,
          labelLarge: AppFonts.bold16Black,
          labelMedium: AppFonts.medium20White
      )
  );
}