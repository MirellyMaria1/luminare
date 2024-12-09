class User {
  late String usuario;
  late String senha;
  late String email;

  User(this.email, this.usuario, this.senha);

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = <String, dynamic>{};
    json['username'] = usuario;
    json['password'] = senha;
    json['email'] = email;
    return json;
  }
}