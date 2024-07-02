import 'package:flutter/material.dart';

final ThemeData lightTheme = ThemeData(
  primaryColor: const Color(0xFFFFFFFF),
  scaffoldBackgroundColor: const Color(0xFFFFFFFF),
  // Text Theme for the Application
  textTheme: const TextTheme(
    displayLarge: TextStyle(
        fontSize: 57.0, fontWeight: FontWeight.bold, color: Color.fromARGB(255, 15, 14, 14)),
    displayMedium: TextStyle(
        fontSize: 45.0, fontWeight: FontWeight.bold, color: Color(0xFF212121)),
    displaySmall: TextStyle(
        fontSize: 36.0, fontWeight: FontWeight.bold, color: Color(0xFF212121)),
    bodyLarge: TextStyle(
        fontSize: 16.0, fontWeight: FontWeight.bold, color: Color(0xFF212121)),
    bodyMedium: TextStyle(
        fontSize: 14.0, fontWeight: FontWeight.bold, color: Color(0xFF757575)),
    bodySmall: TextStyle(
        fontSize: 12.0, fontWeight: FontWeight.bold, color: Color(0xFF212121)),
    titleLarge: TextStyle(
        fontSize: 22.0, fontWeight: FontWeight.bold, color: Color(0xFF212121)),
    titleMedium: TextStyle(
        fontSize: 16.0, fontWeight: FontWeight.bold, color: Color(0xFF212121)),
    titleSmall: TextStyle(
        fontSize: 14.0, fontWeight: FontWeight.bold, color: Color(0xFF212121)),
    headlineLarge: TextStyle(
        fontSize: 32.0, fontWeight: FontWeight.bold, color: Color(0xFF212121)),
    headlineMedium: TextStyle(
        fontSize: 28.0, fontWeight: FontWeight.bold, color: Color(0xFF212121)),
    headlineSmall: TextStyle(
        fontSize: 24.0, fontWeight: FontWeight.bold, color: Color(0xFF212121)),
    labelLarge: TextStyle(
        fontSize: 14.0, fontWeight: FontWeight.bold, color: Color(0xFF212121)),
    labelMedium: TextStyle(
        fontSize: 12.0, fontWeight: FontWeight.bold, color: Color(0xFF212121)),
    labelSmall: TextStyle(
        fontSize: 11.0, fontWeight: FontWeight.bold, color: Color(0xFF212121)),
  ),
  // Button Theme for the Application
  buttonTheme: const ButtonThemeData(
    buttonColor: Color(0xFF607D8B),
    textTheme: ButtonTextTheme.primary,
  ),
  // Color Scheme for the Application
  colorScheme: const ColorScheme.light(
    primary: Color(0xFF607D8B),
    secondary: Color(0xFFB87333),
    tertiary: Color(0xFF212121),
    primaryContainer: Color(0xFF455A64),
    secondaryContainer: Color(0xFF8A5730),
    background: Color(0xFFECEFF1),
    surface: Colors.teal,
    onPrimary: Color(0xFFFFFFFF),
    onSecondary: Color(0xFFFFFFFF),
    onBackground: Color(0xFF212121),
    onSurface: Color(0xFF212121),
    onError: Color(0xFFFFFFFF),
    error: Color(0xFFC1121F),
  ).copyWith(background: const Color(0xFFECEFF1)),
);

final ThemeData darkTheme = ThemeData(
  primaryColor: const Color(0xFFb0bec5),
  scaffoldBackgroundColor: const Color(0xFF10141c),
  // Text Theme for the Application
  textTheme: const TextTheme(
    displayLarge: TextStyle(
        fontSize: 57.0, fontWeight: FontWeight.bold, color: Color(0xFFe0e0e0)),
    displayMedium: TextStyle(
        fontSize: 45.0, fontWeight: FontWeight.bold, color: Color(0xFFe0e0e0)),
    displaySmall: TextStyle(
        fontSize: 36.0, fontWeight: FontWeight.bold, color: Color(0xFFe0e0e0)),
    bodyLarge: TextStyle(
        fontSize: 16.0, fontWeight: FontWeight.bold, color: Color(0xFFe0e0e0)),
    bodyMedium: TextStyle(
        fontSize: 14.0, fontWeight: FontWeight.bold, color: Color(0xFFBDBDBD)),
    bodySmall: TextStyle(
        fontSize: 12.0, fontWeight: FontWeight.bold, color: Color(0xFFe0e0e0)),
    headlineLarge: TextStyle(
        fontSize: 32.0, fontWeight: FontWeight.bold, color: Color(0xFFe0e0e0)),
    headlineMedium: TextStyle(
        fontSize: 28.0, fontWeight: FontWeight.bold, color: Color(0xFFe0e0e0)),
    headlineSmall: TextStyle(
        fontSize: 24.0, fontWeight: FontWeight.bold, color: Color(0xFFe0e0e0)),
    titleLarge: TextStyle(
        fontSize: 22.0, fontWeight: FontWeight.bold, color: Color(0xFFe0e0e0)),
    titleMedium: TextStyle(
        fontSize: 16.0, fontWeight: FontWeight.bold, color: Color(0xFFe0e0e0)),
    titleSmall: TextStyle(
        fontSize: 14.0, fontWeight: FontWeight.bold, color: Color(0xFFe0e0e0)),
    labelLarge: TextStyle(
        fontSize: 14.0, fontWeight: FontWeight.bold, color: Color(0xFFe0e0e0)),
    labelMedium: TextStyle(
        fontSize: 12.0, fontWeight: FontWeight.bold, color: Color(0xFFe0e0e0)),
    labelSmall: TextStyle(
        fontSize: 11.0, fontWeight: FontWeight.bold, color: Color(0xFFe0e0e0)),
  ),
  // Button Theme for the Application
  buttonTheme: const ButtonThemeData(
    buttonColor: Color(0xFFb0bec5),
    textTheme: ButtonTextTheme.primary,
  ),
  // Color Scheme for the Application
  colorScheme: const ColorScheme.dark(
    primary: Color(0xFFb0bec5),
    tertiary: Color(0xFFe0e0e0),
    inversePrimary: Color.fromARGB(255, 5, 105, 152),
    secondary: Color(0xFFD4A373),
    primaryContainer: Color(0xFF000000),
    secondaryContainer: Color(0xFFA1887F),
    background: Color(0xFF10141c),
    surface: Color(0xFF151922),
    onPrimary: Color(0xFF10141c),
    onSecondary: Color(0xFF10141c),
    onBackground: Color(0xFFE0E0E0),
    onSurface: Color(0xFFE0E0E0),
    onError: Color(0xFF10141c),
    error: Color(0xFFef5350),
  )
      .copyWith(secondary: const Color(0xFFD4A373))
      .copyWith(background: const Color(0xFF10141c)),
);

class CustomTheme {
  static const BorderRadius borderRadius =
      BorderRadius.all(Radius.circular(8.0));
  static const BorderRadius borderRadiusSmall =
      BorderRadius.all(Radius.circular(4.0));
  static const BorderRadius borderRadiusLarge =
      BorderRadius.all(Radius.circular(16.0));

  static const Color borderColorLight = Color(0xFFE0E0E0);
  static const Color borderColorDark = Color(0xFF37474F);

  static const List<BoxShadow> boxShadowLight = [
    BoxShadow(
      color: Color.fromARGB(255, 255, 255, 255),
      offset: Offset(-1, 1),
      blurRadius: 2.0,
    ),
  ];

  static const List<BoxShadow> boxShadowDark = [
    BoxShadow(
      color: Color.fromARGB(215, 255, 255, 255),
      offset: Offset(-1, 1),
      blurRadius: 2.0,
    ),
  ];

  // static const
}