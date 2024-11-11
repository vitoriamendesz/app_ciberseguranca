import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mobile/screens/recomendacoes_screen.dart'; // Ajuste o caminho conforme necessário

void main() {
  testWidgets('Testa a tela de alertas e recomendações', (WidgetTester tester) async {
    // Carregar a tela
    await tester.pumpWidget(
      MaterialApp(
        home: AlertasRecomendacoesScreen(),
      ),
    );

    // Verificar se o título da tela está presente
    expect(find.text('Alertas e Recomendações'), findsOneWidget);

    // Verificar se os textos das seções estão presentes
    expect(find.text('Dicas de Segurança'), findsOneWidget);
    expect(find.text('Alertas Importantes'), findsOneWidget);

    // Verificar se os cards de recomendação estão presentes
    expect(find.text('Habilite a Autenticação de Dois Fatores'), findsOneWidget);
    expect(find.text('Acesso Indevido Detectado'), findsOneWidget);

    // Verificar se os ícones estão sendo exibidos
    expect(find.byIcon(Icons.shield), findsOneWidget);
    expect(find.byIcon(Icons.warning), findsOneWidget);
  });
}
