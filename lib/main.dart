import 'package:flutter/material.dart';
import 'package:pasacoinapp/welcomescreen/welcome_screen.dart';

void main() {
  runApp(PasanakuApp());
}

class PasanakuApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pasacoin',
      theme: _buildPasacoinTheme(),
      home: WelcomeScreen(),
    );
  }

  ThemeData _buildPasacoinTheme() {
    final Color primaryColor = Color(0xFF274C77);
    final Color secondaryColor = Color(0xFF6096BA);
    final Color backgroundColor = Color(0xFFE7ECEF);
    final Color cardColor = Color(0xFFA3CEF1);
    final Color textPrimaryColor = Color(0xFF8B8C89);

    final ThemeData base = ThemeData.light();
    return base.copyWith(
      colorScheme: ColorScheme.fromSwatch().copyWith(
        primary: primaryColor,
        secondary: secondaryColor,
        background: backgroundColor,
        surface: cardColor,
        onPrimary: Colors.white,
        onSecondary: Colors.white,
        onSurface: Colors.black,
      ),
      scaffoldBackgroundColor: backgroundColor,
      cardColor: cardColor,
      textTheme: _buildPasacoinTextTheme(base.textTheme, textPrimaryColor),
      appBarTheme: AppBarTheme(
        backgroundColor: primaryColor,
        iconTheme: IconThemeData(color: Colors.white),
        titleTextStyle: TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: secondaryColor,
      ),
      buttonTheme: ButtonThemeData(
        buttonColor: secondaryColor,
        textTheme: ButtonTextTheme.primary,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white,
          backgroundColor: secondaryColor,
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: cardColor,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: BorderSide.none,
        ),
        hintStyle: TextStyle(color: textPrimaryColor),
        labelStyle: TextStyle(color: textPrimaryColor),
      ),
    );
  }

  TextTheme _buildPasacoinTextTheme(TextTheme base, Color textPrimaryColor) {
    return base.copyWith(
      titleLarge: base.titleLarge?.copyWith(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: textPrimaryColor,
      ),
      bodyMedium: base.bodyMedium?.copyWith(
        fontSize: 14,
        color: textPrimaryColor,
      ),
      labelLarge: base.labelLarge?.copyWith(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    );
  }
}
