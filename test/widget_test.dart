import 'package:flutter_test/flutter_test.dart';

import 'package:lab3_flutter_ui/main.dart';

void main() {
  testWidgets('Главный экран показывает две вкладки', (tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('Список'), findsOneWidget);
    expect(find.text('Сетка'), findsOneWidget);
    expect(find.text('Товар №1'), findsOneWidget);
  });
}
