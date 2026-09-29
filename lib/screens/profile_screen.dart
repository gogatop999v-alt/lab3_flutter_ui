import 'package:flutter/material.dart';

import '../theme.dart';
import '../toast_helper.dart';
import '../widgets/app_drawer.dart';

/// Экран профиля: аватар, имя, email + кнопка «Показать приветствие».
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(title: const Text('Профиль')),
      drawer: const AppDrawer(currentRoute: '/profile'),
      body: ListView(
        padding: const EdgeInsets.all(kPadding),
        children: [
          const SizedBox(height: 8),
          Center(
            child: CircleAvatar(
              radius: 56,
              backgroundColor: scheme.primaryContainer,
              child: Icon(Icons.person, size: 64, color: scheme.primary),
            ),
          ),
          const SizedBox(height: kPadding),
          Center(
            child: Text('Иван Иванов',
                style: Theme.of(context).textTheme.titleLarge),
          ),
          const SizedBox(height: 24),
          Card(
            shape: RoundedRectangleBorder(borderRadius: kCardRadius),
            child: const Column(
              children: [
                ListTile(
                  leading: Icon(Icons.email),
                  title: Text('Email'),
                  subtitle: Text('ivan.ivanov@example.com'),
                ),
                Divider(height: 1),
                ListTile(
                  leading: Icon(Icons.school),
                  title: Text('Группа'),
                  subtitle: Text('ИС-21'),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          ElevatedButton.icon(
            icon: const Icon(Icons.waving_hand),
            label: const Text('Показать приветствие'),
            onPressed: () => showToast('Hello, Flutter!'),
          ),
        ],
      ),
    );
  }
}
