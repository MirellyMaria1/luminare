class Pacote {
  late int id;
  late String usuario;
  late String email;
  late int senha;
  late int confirmar;

  Pacote({
    required this.usuario,
    required this.email,
    required this.senha,
    required this.confirmar,
  });

  Pacote.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    usuario = json['usuario'];
    email = json['email'];
    senha = json['senha'];
    confirmar = json['confirmar'];
  }
}