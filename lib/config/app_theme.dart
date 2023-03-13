import 'package:flutter/material.dart';

final _theme = ThemeData(fontFamily: 'Poppins');

class AppTheme {
  static TextTheme txtTheme = _theme.textTheme.copyWith(
    bodySmall: _theme.textTheme.bodySmall?.copyWith(
      fontSize: 12,
      color: Color(0xFF696969),
    ),
    bodyMedium: _theme.textTheme.bodyMedium?.copyWith(
      fontSize: 14,
      color: Color(0xFF696969),
    ),
    displaySmall: _theme.textTheme.displaySmall?.copyWith(fontSize: 45),
    displayMedium: _theme.textTheme.displayMedium?.copyWith(fontSize: 60),
  );

  static ThemeData dark = _theme.copyWith(
    brightness: Brightness.dark,
    colorScheme: const ColorScheme.dark(
      background: Color(0XFF191919),
      onBackground: Colors.white,
      primaryContainer: Color(0xFF3F3F3F),
      secondaryContainer: Color(0xFF858585),
    ),
    textTheme: txtTheme.apply(
      bodyColor: Colors.white,
      displayColor: Colors.white,
    ),
    primaryColor: const Color(0xFF007FFF),
    hoverColor: const Color(0xFF49A4FF),
    useMaterial3: true,
    canvasColor: Color(0xFF363636),
    backgroundColor: Color(0XFF191919),
    scaffoldBackgroundColor: Color(0XFF191919),
    iconTheme: IconThemeData(
      color: _theme.colorScheme.secondaryContainer,
      size: 18,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        onPrimary: Colors.white,
        primary: _theme.primaryColor,
        shape: CircleBorder(),
        padding: EdgeInsets.all(10),
      ),
    ),
  );
}
