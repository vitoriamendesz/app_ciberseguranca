class Senhas{
  String id;
  String nome;
  String senha;

  Senhas({
    required this.id, 
    required this.nome, 
    required this.senha,
  });

  Senhas.fromMap(Map<String, dynamic> map)
      : id = map["id"], 
        nome = map["nome"], 
        senha = map["senha"];

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "nome": nome,
      "senha": senha,
    };
  }


}