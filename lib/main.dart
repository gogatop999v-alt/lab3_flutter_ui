import 'package:flutter/material.dart';

import 'app_state.dart';
import 'screens/cards_screen.dart';
import 'screens/home_screen.dart';
import 'screens/profile_screen.dart';
import 'screens/settings_screen.dart';
import 'theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeMode>(
      valueListenable: themeModeNotifier,
      builder: (context, mode, _) {
        return MaterialApp(
          title: 'Мое приложение',
          debugShowCheckedModeBanner: false,
          theme: buildTheme(Brightness.light),
          darkTheme: buildTheme(Brightness.dark),
          themeMode: mode,
          initialRoute: '/',
          routes: {
            '/': (_) => const HomeScreen(),
            '/profile': (_) => const ProfileScreen(),
            '/settings': (_) => const SettingsScreen(),
            '/cards': (_) => const CardsScreen(),
          },
        );
      },
    );
  }
}
