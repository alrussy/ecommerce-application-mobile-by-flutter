class Credential {
  String? email;
  String? password;

  Credential({this.email, this.password});

  Credential.fromJson(Map<String, dynamic> json) {
    email = json["email"];
    password = json["password"];
  }

  static List<Credential> fromList(List<Map<String, dynamic>> list) {
    return list.map((map) => Credential.fromJson(map)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["email"] = email;
    _data["password"] = password;
    return _data;
  }
}
