import 'package:flutter/material.dart';

import '../app_state.dart';
import '../theme.dart';
import '../toast_helper.dart';
import '../widgets/app_drawer.dart';

/// Экран настроек: Switch (тёмная тема), Checkbox, Slider.
class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _darkTheme = themeModeNotifier.value == ThemeMode.dark;
  bool _notifications = true;
  double _volume = 50;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Настройки')),
      drawer: const AppDrawer(currentRoute: '/settings'),
      body: ListView(
        padding: const EdgeInsets.all(kPadding),
        children: [
          Card(
            shape: RoundedRectangleBorder(borderRadius: kCardRadius),
            child: Column(
              children: [
                SwitchListTile(
                  title: const Text('Тёмная тема'),
                  secondary: const Icon(Icons.dark_mode),
                  value: _darkTheme,
                  onChanged: (value) {
                    setState(() => _darkTheme = value);
                    themeModeNotifier.value =
                        value ? ThemeMode.dark : ThemeMode.light;
                  },
                ),
                const Divider(height: 1),
                CheckboxListTile(
                  title: const Text('Уведомления'),
                  secondary: const Icon(Icons.notifications),
                  value: _notifications,
                  onChanged: (value) =>
                      setState(() => _notifications = value ?? false),
                ),
              ],
            ),
          ),
          const SizedBox(height: kPadding),
          Card(
            shape: RoundedRectangleBorder(borderRadius: kCardRadius),
            child: Padding(
              padding: const EdgeInsets.all(kPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Громкость: ${_volume.round()}',
                      style: Theme.of(context).textTheme.titleMedium),
                  Slider(
                    value: _volume,
                    min: 0,
                    max: 100,
                    divisions: 20,
                    label: _volume.round().toString(),
                    onChanged: (value) => setState(() => _volume = value),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 24),
          ElevatedButton.icon(
            icon: const Icon(Icons.save),
            label: const Text('Сохранить'),
            onPressed: () => showToast('Настройки сохранены'),
          ),
        ],
      ),
    );
  }
}
