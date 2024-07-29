import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static final theme = ThemeData(
    colorScheme: ColorScheme.fromSwatch().copyWith(
      primary: const Color(0xff0c54be),
      secondary: const Color(0xff303f60),
      surface: const Color(0xfff5f9fd),
    ),
    scaffoldBackgroundColor: const Color(0xfff5f9fd),
    useMaterial3: true,
    textTheme: GoogleFonts.poppinsTextTheme(),
    inputDecorationTheme: const InputDecorationTheme(
      filled: true,
      fillColor: Colors.white,
      isDense: true,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(12.0)),
        borderSide: BorderSide.none,
      ),
      hintStyle: TextStyle(
        color: Colors.black,
      ),
    ),
  );
}
