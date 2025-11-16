import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/utiles/AppColors.dart';

class AppFonts {
  static final medium24White = GoogleFonts.inter(
    textStyle: TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.w500,
      color: AppColors.whiteColor,
    ),
  );

  static final bold24Black = GoogleFonts.inter(
    textStyle: TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.bold,
      color: AppColors.blackColor,
    ),
  );

  static final bold20White = GoogleFonts.inter(
    textStyle: TextStyle(
        fontSize: 20,
      fontWeight: FontWeight.bold,
      color: AppColors.whiteColor
    )
  );

  static final medium20White = GoogleFonts.inter(
    textStyle: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w500,
      color: AppColors.whiteColor
    )
  );

  static final medium14White = GoogleFonts.inter(
    textStyle: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w500,
      color: AppColors.whiteColor
    )
  );

  static final bold16White = GoogleFonts.inter(
    textStyle: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.bold,
      color: AppColors.whiteColor
    )
  );

  static final medium12Grey = GoogleFonts.inter(
    textStyle: TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w500,
      color: AppColors.geryColor
    )
  );

  static final medium24Black = GoogleFonts.inter(
    textStyle: TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.w500,
      color: AppColors.blackColor
    )
  );

  static final medium20Black = GoogleFonts.inter(
    textStyle: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w500,
      color: AppColors.blackColor
    )
  );

  static final medium14Black = GoogleFonts.inter(
    textStyle: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w500,
      color: AppColors.blackColor
    )
  );

  static final bold16Black = GoogleFonts.inter(
    textStyle: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.bold,
      color: AppColors.blackColor
    )
  );
}
