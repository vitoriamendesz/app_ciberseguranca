import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mobile/screens/permission_list.dart';

void main() {
  testWidgets('Verifica se os aplicativos aparecem na tela', (WidgetTester tester) async {
    // Construa o widget PermissionListScreen
    await tester.pumpWidget(MaterialApp(home: PermissionListScreen()));

    // Verifique se alguns aplicativos aparecem na tela
    expect(find.text('WhatsApp'), findsOneWidget);
    expect(find.text('Telegram'), findsOneWidget);
    expect(find.text('Messenger'), findsOneWidget);
  });
}
