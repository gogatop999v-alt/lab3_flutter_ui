import 'package:flutter/material.dart';

import '../theme.dart';
import '../toast_helper.dart';
import '../widgets/app_drawer.dart';
import '../widgets/grid_tab.dart';

/// Главный экран: две вкладки («Список» и «Сетка»), Drawer, FAB для добавления.
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<String> _items = List.generate(10, (i) => 'Товар №${i + 1}');
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  /// Дополнительное задание: AlertDialog + добавление элемента в список.
  Future<void> _addItem() async {
    _controller.clear();

    final name = await showDialog<String>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Новый элемент'),
        content: TextField(
          controller: _controller,
          autofocus: true,
          decoration: const InputDecoration(
            labelText: 'Название',
            border: OutlineInputBorder(),
          ),
          onSubmitted: (value) => Navigator.pop(ctx, value),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text('Отмена'),
          ),
          ElevatedButton(
            onPressed: () => Navigator.pop(ctx, _controller.text),
            child: const Text('Добавить'),
          ),
        ],
      ),
    );

    if (!mounted) return;
    final trimmed = name?.trim() ?? '';
    if (trimmed.isEmpty) return;

    setState(() => _items.add(trimmed));
    showToast('Добавлено: $trimmed');
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Builder(
        builder: (context) {
          final tabController = DefaultTabController.of(context);
          final onPrimary = Theme.of(context).colorScheme.onPrimary;

          return Scaffold(
            appBar: AppBar(
              title: const Text('Мое приложение'),
              actions: [
                IconButton(
                  icon: const Icon(Icons.style),
                  tooltip: 'Карточки',
                  onPressed: () => Navigator.pushNamed(context, '/cards'),
                ),
              ],
              bottom: TabBar(
                labelColor: onPrimary,
                unselectedLabelColor: onPrimary.withAlpha(170),
                indicatorColor: onPrimary,
                tabs: const [
                  Tab(icon: Icon(Icons.list), text: 'Список'),
                  Tab(icon: Icon(Icons.grid_view), text: 'Сетка'),
                ],
              ),
            ),
            drawer: const AppDrawer(currentRoute: '/'),
            body: TabBarView(
              children: [
                _buildList(),
                const GridTab(),
              ],
            ),
            // Кнопка добавления показывается только на вкладке «Список»
            floatingActionButton: AnimatedBuilder(
              animation: tabController,
              builder: (context, _) => tabController.index == 0
                  ? FloatingActionButton(
                      onPressed: _addItem,
                      tooltip: 'Добавить элемент',
                      child: const Icon(Icons.add),
                    )
                  : const SizedBox.shrink(),
            ),
          );
        },
      ),
    );
  }

  Widget _buildList() {
    return ListView.builder(
      padding: const EdgeInsets.all(kPadding),
      itemCount: _items.length,
      itemBuilder: (context, index) {
        final title = _items[index];
        return Card(
          margin: const EdgeInsets.only(bottom: 12),
          shape: RoundedRectangleBorder(borderRadius: kCardRadius),
          child: ListTile(
            shape: RoundedRectangleBorder(borderRadius: kCardRadius),
            leading: CircleAvatar(
              backgroundColor: Theme.of(context).colorScheme.primaryContainer,
              child: Icon(
                Icons.shopping_bag,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
            title: Text(title),
            subtitle: const Text('Описание товара'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () => showToast('Вы выбрали: $title'),
          ),
        );
      },
    );
  }
}
