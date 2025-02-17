class Address {
  late String cep;
  late String estado;
  late String cidade;
  late String bairro;
  late String rua;

  Address({
    required this.cep,
    required this.estado,
    required this.cidade,
    required this.bairro,
    required this.rua,
  });

  String get address => '$rua, $bairro, $cidade - $estado';

  Address.fromJson(Map<String, dynamic> json) {
    cep = json['cep'];
    estado = json['estado'];
    cidade = json['cidade'];
    bairro = json['bairro'] ?? '';
    rua = json['rua'] ?? '';
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['cep'] = cep;
    data['estado'] = estado;
    data['cidade'] = cidade;
    data['bairro'] = bairro;
    data['rua'] = rua;

    return data;
  }
}
