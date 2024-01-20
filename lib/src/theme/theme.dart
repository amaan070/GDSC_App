import 'package:flutter/material.dart';
import 'package:gdsc_app/src/constants/colors.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData defaultTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: colorPrimary,
    textTheme: TextTheme(
      displayLarge: GoogleFonts.exo2(
          fontSize: 30,
          fontWeight: FontWeight.bold,
          color: const Color.fromARGB(172, 0, 0, 0)),
      displaySmall: GoogleFonts.exo2(
          fontSize: 15,
          fontWeight: FontWeight.bold,
          color: const Color.fromARGB(172, 0, 0, 0)),
      labelSmall: const TextStyle(fontStyle: FontStyle.italic, fontSize: 13),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
            padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
              const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            ),
            shape: MaterialStateProperty.all<OutlinedBorder>(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
            ),
            backgroundColor: MaterialStateProperty.all<Color>(
              colorPrimary,
            ),
            foregroundColor: MaterialStateProperty.all<Color>(
              Colors.white,
            ),
            side: MaterialStateProperty.all<BorderSide>(
              const BorderSide(color: Color.fromARGB(172, 0, 0, 0)),
            ))),
    outlinedButtonTheme: OutlinedButtonThemeData(
        style: ButtonStyle(
      padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
        const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      ),
      shape: MaterialStateProperty.all<OutlinedBorder>(
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      ),
      foregroundColor: MaterialStateProperty.all<Color>(
        colorPrimary,
      ),
      side: MaterialStateProperty.all<BorderSide>(
        const BorderSide(color: Color.fromARGB(172, 0, 0, 0)),
      ),
    )),
    textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
      foregroundColor: MaterialStateProperty.all<Color>(
        colorPrimary,
      ),
    )));
