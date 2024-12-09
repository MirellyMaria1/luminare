class Register {
  late String username;
  late String email;
  late String password;

  Register({
    required this.username,
    required this.email,
    required this.password,
  });

  Register.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    email = json['email'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = <String, dynamic>{};
    json['username'] = username;
    json['password'] = password;
    json['email'] = email;
    return json;
  }
}
