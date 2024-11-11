import 'package:flutter_test/flutter_test.dart';
import 'package:mobile/models/senhas.dart';

void main() {
  test('Senhas model constructor test', () {
    
    final senha = Senhas(
      id: '1',
      nome: 'Google',
      senha: 'password123',
    );

    
    expect(senha.id, '1');
    expect(senha.nome, 'Google');
    expect(senha.senha, 'password123');
  });
}