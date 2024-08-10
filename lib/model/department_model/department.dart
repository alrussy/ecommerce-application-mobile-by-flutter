class Department {
  int? id;
  String? name;

  Department({this.id, this.name});

  Department.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    name = json["name"];
  }

  static List<Department> fromList(List<dynamic> list) {
    return list.map((map) => Department.fromJson(map)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["name"] = name;
    return _data;
  }

  @override
  String toString() {
    return "[$id , $name]";
  }
}
