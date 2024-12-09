class Register {
  late String username;
  late String email;
  late int password;

  Register({
    required this.username,
    required this.email,
    required this.password,
  });

  Register.fromJson(Map<String, dynamic> json) {
    usuario = json['username'];
    email = json['email'];
    senha = json['password'];
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = <String, dynamic>{};
    json['username'] = usuario;
    json['password'] = senha;
    json['email'] = email;
    return json;
  }
}
}