import 'package:flutter/material.dart';

import '../theme.dart';
import '../toast_helper.dart';

/// Вкладка «Сетка»: плитки меняют цвет на зелёный при нажатии.
class GridTab extends StatefulWidget {
  const GridTab({super.key});

  @override
  State<GridTab> createState() => _GridTabState();
}

class _GridTabState extends State<GridTab>
    with AutomaticKeepAliveClientMixin {
  static const List<Color> _baseColors = [
    Colors.blue,
    Colors.orange,
    Colors.purple,
    Colors.pink,
    Colors.brown,
    Colors.indigo,
    Colors.amber,
    Colors.cyan,
    Colors.deepOrange,
    Colors.blueGrey,
    Colors.red,
    Colors.deepPurple,
  ];

  // Номера плиток, по которым нажали (они становятся зелёными)
  final Set<int> _pressed = {};

  @override
  bool get wantKeepAlive => true; // сохранять состояние при смене вкладки

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return GridView.builder(
      padding: const EdgeInsets.all(kPadding),
      itemCount: _baseColors.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 12,
        crossAxisSpacing: 12,
      ),
      itemBuilder: (context, index) {
        final number = index + 1;
        final isPressed = _pressed.contains(index);

        return Material(
          color: Colors.transparent,
          child: InkWell(
            borderRadius: kCardRadius,
            onTap: () {
              setState(() {
                if (isPressed) {
                  _pressed.remove(index);
                } else {
                  _pressed.add(index);
                }
              });
              showToast('Плитка №$number ${isPressed ? "сброшена" : "нажата"}');
            },
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 250),
              decoration: BoxDecoration(
                color: isPressed ? Colors.green : _baseColors[index],
                borderRadius: kCardRadius,
              ),
              alignment: Alignment.center,
              child: Text(
                '$number',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
