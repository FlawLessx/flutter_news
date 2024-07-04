import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static const primaryColor = Color(0xff121212);
  static const secondaryColor = Color(0xfff7f8f8);
  static const backgroundColor = Color(0xfff7f8f8);
  static const scondaryBackgroundColor = Colors.white;
  static const borderColor = Color(0xffbdbdbd);
  static const textColor = primaryColor;

  static final appTheme = ThemeData.light().copyWith(
    scaffoldBackgroundColor: backgroundColor,
    primaryColor: primaryColor,
    textTheme: GoogleFonts.poppinsTextTheme(
      TextTheme(
        displayLarge: TextStyle(
          color: textColor,
          fontSize: 28.sp,
          fontWeight: FontWeight.w800,
        ),
        displayMedium: TextStyle(
          color: textColor,
          fontSize: 26.sp,
          fontWeight: FontWeight.w600,
        ),
        headlineLarge: TextStyle(
          color: textColor,
          fontSize: 20.sp,
          fontWeight: FontWeight.w600,
        ),
        headlineMedium: TextStyle(
          color: textColor,
          fontSize: 18.sp,
          fontWeight: FontWeight.w600,
        ),
        headlineSmall: TextStyle(
          color: textColor,
          fontSize: 14.sp,
          fontWeight: FontWeight.w700,
        ),
        titleLarge: TextStyle(
          color: textColor,
          fontSize: 16.sp,
          fontWeight: FontWeight.w600,
        ),
        titleMedium: TextStyle(
          color: textColor,
          fontSize: 14.sp,
          fontWeight: FontWeight.w600,
        ),
        titleSmall: TextStyle(
          color: textColor,
          fontSize: 12.sp,
          fontWeight: FontWeight.w400,
        ),
        bodyLarge: TextStyle(
          color: textColor,
          fontSize: 16.sp,
          fontWeight: FontWeight.w600,
        ),
        bodyMedium: TextStyle(
          color: textColor,
          fontSize: 14.sp,
          fontWeight: FontWeight.w400,
        ),
        bodySmall: TextStyle(
          color: textColor,
          fontSize: 12.sp,
          fontWeight: FontWeight.w400,
        ),
        labelMedium: TextStyle(
          color: textColor,
          fontSize: 10.sp,
          fontWeight: FontWeight.w400,
        ),
        labelSmall: TextStyle(
          color: textColor,
          fontSize: 8.sp,
          fontWeight: FontWeight.w400,
        ),
      ),
    ),
    colorScheme: const ColorScheme.light(
      primary: primaryColor,
      secondary: secondaryColor,
    ),
    inputDecorationTheme: const InputDecorationTheme(
      floatingLabelStyle: TextStyle(color: AppTheme.primaryColor),
      floatingLabelBehavior: FloatingLabelBehavior.always,
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: AppTheme.primaryColor),
      ),
    ),
    appBarTheme: AppBarTheme(
      elevation: 0,
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarBrightness: Brightness.light,
        statusBarColor: Colors.white,
        systemNavigationBarColor: Colors.white,
        systemNavigationBarContrastEnforced: true,
        systemNavigationBarIconBrightness: Brightness.dark,
        statusBarIconBrightness: Brightness.dark,
      ),
      backgroundColor: Colors.white,
      shadowColor: Colors.transparent,
      titleTextStyle: TextStyle(
        color: textColor,
        fontSize: 18.sp,
        fontWeight: FontWeight.bold,
      ),
      iconTheme: const IconThemeData(
        color: AppTheme.primaryColor,
      ),
    ),
  );
}
