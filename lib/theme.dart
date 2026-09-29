import 'package:flutter/material.dart';

/// Единая тема приложения (светлая / тёмная от одного seed-цвета).
ThemeData buildTheme(Brightness brightness) {
  final scheme = ColorScheme.fromSeed(
    seedColor: Colors.indigo,
    brightness: brightness,
  );

  return ThemeData(
    useMaterial3: true,
    colorScheme: scheme,
    appBarTheme: AppBarTheme(
      backgroundColor: scheme.primary,
      foregroundColor: scheme.onPrimary,
      centerTitle: true,
    ),
    // Одинаковые стили заголовков во всём приложении
    textTheme: const TextTheme(
      titleLarge: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
      titleMedium: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: scheme.primary,
      foregroundColor: scheme.onPrimary,
    ),
  );
}

/// Скругление карточек и плиток - одинаковое везде.
final BorderRadius kCardRadius = BorderRadius.circular(16);
const double kPadding = 16;
