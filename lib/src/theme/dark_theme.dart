import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData darkTheme = ThemeData(
    colorScheme: const ColorScheme.dark(
        background: Color.fromARGB(255, 1, 5, 43),
        primary: Colors.white,
        secondary: Color.fromARGB(255, 48, 48, 48)),
    brightness: Brightness.dark,
    textTheme: TextTheme(
      displayLarge: GoogleFonts.exo2(
          fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white),
      displaySmall: GoogleFonts.exo2(
          fontSize: 15, fontWeight: FontWeight.bold, color: Colors.white),
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
              Colors.grey[100]!,
            ),
            foregroundColor: MaterialStateProperty.all<Color>(
                const Color.fromARGB(255, 1, 5, 43)))),
    outlinedButtonTheme: OutlinedButtonThemeData(
        style: ButtonStyle(
      padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
        const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      ),
      shape: MaterialStateProperty.all<OutlinedBorder>(
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      ),
      foregroundColor: MaterialStateProperty.all<Color>(
        Colors.grey[100]!,
      ),
      side: MaterialStateProperty.all<BorderSide>(
        BorderSide(color: Colors.grey[800]!),
      ),
    )),
    textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
      foregroundColor: MaterialStateProperty.all<Color>(
        Colors.grey[100]!,
      ),
    )));
