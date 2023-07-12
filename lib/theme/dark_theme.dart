import '../core/constants/size/radius.dart';
import 'color_schemes.g.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData darkTheme = ThemeData(
  fontFamily: 'Rubik',
  useMaterial3: true,
  visualDensity: VisualDensity.adaptivePlatformDensity,
  colorScheme: darkColorScheme,
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      textStyle: const TextStyle(fontWeight: FontWeight.bold),
      side: BorderSide.none,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppRadius.cardRadius),
      ),
    ),
  ),
  textButtonTheme: TextButtonThemeData(
    style: ElevatedButton.styleFrom(
      textStyle: const TextStyle(fontWeight: FontWeight.bold),
      side: BorderSide.none,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppRadius.cardRadius),
      ),
    ),
  ),
  iconButtonTheme: IconButtonThemeData(
    style: IconButton.styleFrom(
      // foregroundColor: const Color.fromARGB(255, 210, 210, 210),
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
    //     fontWeight: FontWeight.bold,
    //     // color: darkColorScheme.primary,
    //   ),
    // ),
    // elevation: 2,
    // shadowColor: Colors.black,
  ),
  snackBarTheme: SnackBarThemeData(
    // contentTextStyle: TextStyle(color: darkColorScheme.onBackground),
    // closeIconColor: darkColorScheme.onBackground,
    // backgroundColor: darkColorScheme.background,
  ),
);
