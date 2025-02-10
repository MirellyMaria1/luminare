class Cardfavorito {
  late int id;
  late String urlImage;
  late String titulo;
  late String descricao;
  late String valor;




  Cardfavorito({
    required this.urlImage,
    required this.titulo,
    required this.descricao,
    required this.valor,
  });




  Cardfavorito.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    titulo = json['titulo'];
    urlImage = json['url_image'];
    descricao = json['descricao'];
    valor = json['valor'];
  }




  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['id'] = id;
    json['titulo'] = titulo;
    json['url_image'] = urlImage;
    json['descricao'] = descricao;
    json['valor'] = valor;


    return json;
  }
}
