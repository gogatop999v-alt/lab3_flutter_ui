import 'package:flutter/material.dart';

import '../toast_helper.dart';

/// Боковое меню. [currentRoute] нужен, чтобы не открывать текущий экран повторно.
class AppDrawer extends StatelessWidget {
  final String currentRoute;

  const AppDrawer({super.key, required this.currentRoute});

  void _go(BuildContext context, String route) {
    Navigator.pop(context); // закрыть Drawer
    if (route != currentRoute) {
      Navigator.pushNamedAndRemoveUntil(context, route, (r) => false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;

    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            decoration: BoxDecoration(color: scheme.primary),
            accountName: const Text('Иван Иванов'),
            accountEmail: const Text('ivan.ivanov@example.com'),
            currentAccountPicture: CircleAvatar(
              backgroundColor: scheme.onPrimary,
              child: Icon(Icons.person, size: 40, color: scheme.primary),
            ),
          ),
          ListTile(
            leading: const Text('🏠', style: TextStyle(fontSize: 24)),
            title: const Text('Главная'),
            selected: currentRoute == '/',
            onTap: () => _go(context, '/'),
          ),
          ListTile(
            leading: const Text('👤', style: TextStyle(fontSize: 24)),
            title: const Text('Профиль'),
            selected: currentRoute == '/profile',
            onTap: () => _go(context, '/profile'),
          ),
          ListTile(
            leading: const Text('⚙️', style: TextStyle(fontSize: 24)),
            title: const Text('Настройки'),
            selected: currentRoute == '/settings',
            onTap: () => _go(context, '/settings'),
          ),
          const Divider(),
          ListTile(
            leading: const Text('🚪', style: TextStyle(fontSize: 24)),
            title: const Text('Выход'),
            onTap: () {
              Navigator.pop(context);
              showToast('Выход из аккаунта');
            },
          ),
        ],
      ),
    );
  }
}
