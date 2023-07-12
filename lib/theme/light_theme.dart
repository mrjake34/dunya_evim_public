import 'package:flutter/material.dart';

import '../core/constants/size/radius.dart';
import 'color_schemes.g.dart';

ThemeData lightTheme = ThemeData(
  fontFamily: 'Rubik',
  useMaterial3: true,
  colorScheme: lightColorScheme,
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      // textStyle: const TextStyle(fontWeight: FontWeight.bold),
      // backgroundColor: AppColors.buttonColor,
      // surfaceTintColor: Colors.transparent,
      // foregroundColor: Colors.white,
      // disabledBackgroundColor: const Color(0xFF495464),
      // disabledForegroundColor: const Color.fromARGB(255, 255, 255, 255),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppRadius.cardRadius),
      ),
    ),
  ),
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(
      textStyle: const TextStyle(fontWeight: FontWeight.bold),
      side: BorderSide.none,
      // foregroundColor: AppColors.buttonColor,
      // surfaceTintColor: Colors.transparent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(2),
      ),
    ),
  ),
  outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(AppRadius.cardRadius),
    ),
  )),
  appBarTheme: AppBarTheme(
      // titleTextStyle: GoogleFonts.aBeeZee(
      //   textStyle: TextStyle(
      //     // color: lightColorScheme.primary,
      //     fontWeight: FontWeight.bold,
      //   ),
      // ),
      ),
  snackBarTheme: SnackBarThemeData(
      // contentTextStyle: TextStyle(color: lightColorScheme.onBackground),
      // closeIconColor: lightColorScheme.onBackground,
      // backgroundColor: lightColorScheme.background,
      ),
);
