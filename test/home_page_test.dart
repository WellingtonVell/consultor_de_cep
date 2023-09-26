import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:consultor_de_cep/pages/home_page.dart';

void main() {
  testWidgets('Error message should be displayed when CEP is not found', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: HomePage()));

    // Simule a inserção de um CEP inválido
    const invalidCep = '01001-002';
    final cepInputField = find.byType(TextField);
    await tester.enterText(cepInputField, invalidCep);

    // Execute a consulta
    final consultButton = find.text('Consultar CEP');
    await tester.tap(consultButton);
    await tester.pump();

    // Verifique se a mensagem de erro está sendo exibida
    final errorMessage = find.text('CEP não encontrado, Digite um CEP válido!');
    expect(errorMessage, findsOneWidget);
  });
}
