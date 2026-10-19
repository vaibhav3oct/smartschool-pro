import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static const Color brandPrimary = Color(0xFF102A43);
  static const Color brandPrimaryLight = Color(0xFF2D5B8A);
  static const Color brandAccent = Color(0xFF2EC4B6);
  static const Color brandSurface = Color(0xFFF4F7FB);
  static const Color success = Color(0xFF2AA876);
  static const Color warning = Color(0xFFF6B73C);
  static const Color danger = Color(0xFFE85D75);
  static const Color textPrimary = Color(0xFF132238);

  static final lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    scaffoldBackgroundColor: brandSurface,
    colorScheme: const ColorScheme.light(
      primary: brandPrimary,
      secondary: brandAccent,
      surface: Colors.white,
      onPrimary: Colors.white,
      onSurface: textPrimary,
      error: danger,
    ),
    textTheme: GoogleFonts.interTextTheme().copyWith(
      displayLarge: GoogleFonts.inter(
        fontWeight: FontWeight.w800,
        color: textPrimary,
      ),
      titleLarge: GoogleFonts.inter(
        fontWeight: FontWeight.w700,
        color: textPrimary,
      ),
      bodyLarge: GoogleFonts.inter(
        color: textPrimary,
      ),
      bodyMedium: GoogleFonts.inter(
        color: textPrimary,
      ),
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.white,
      foregroundColor: textPrimary,
      elevation: 0,
    ),
    cardTheme: CardTheme(
      elevation: 0,
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Colors.white,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: const BorderSide(color: Color(0xFFD9E3F0)),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: const BorderSide(color: Color(0xFFD9E3F0)),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: const BorderSide(color: brandPrimary),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: const BorderSide(color: danger),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: brandPrimary,
        foregroundColor: Colors.white,
        minimumSize: const Size(140, 52),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14),
        ),
        textStyle: GoogleFonts.inter(
          fontWeight: FontWeight.w700,
          fontSize: 15,
        ),
      ),
    ),
  );

  static final darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    scaffoldBackgroundColor: const Color(0xFF0C1220),
    colorScheme: const ColorScheme.dark(
      primary: Color(0xFF8AB4FF),
      secondary: brandAccent,
      surface: Color(0xFF121A2B),
      onPrimary: Colors.white,
      onSurface: Colors.white,
      error: danger,
    ),
    textTheme: GoogleFonts.interTextTheme(
      ThemeData(brightness: Brightness.dark).textTheme,
    ),
    cardTheme: CardTheme(
      elevation: 0,
      color: const Color(0xFF121A2B),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18),
      ),
    ),
  );
}
