import 'package:flutter/material.dart';

/// Глобальное состояние темы приложения (переключается в «Настройках»).
final ValueNotifier<ThemeMode> themeModeNotifier =
    ValueNotifier<ThemeMode>(ThemeMode.light);
