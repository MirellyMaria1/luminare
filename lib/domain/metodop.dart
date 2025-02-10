class Metodo {
  late int id;
  late String urlImage;
  late String nome;
  late String desconto;


  Metodo({
    required this.nome,
    required this.desconto,
    required this.urlImage,
  });


  Metodo.fromJson(Map<String, dynamic> json) {
    urlImage = json['url_image'];
    nome = json['nome'];
    desconto = json['desconto'];
  }


  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = <String, dynamic>{};
    json['url_image'] = urlImage;
    json['nome'] = nome;
    json['desconto'] = desconto;


    return json;
  }
}

