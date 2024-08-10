import 'package:r_store/model/department_model/Department.dart';

class Category {
  int? id;
  String? name;
  bool? isFueature;
  String? imageUrl;
  List<Department>? departments;

  Category(
      {this.id, this.name, this.isFueature, this.imageUrl, this.departments});

  Category.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    name = json["name"];
    isFueature = json["isFueature"];
    imageUrl = json["imageUrl"];
    departments = json["departments"] == null
        ? null
        : Department.fromList(json["departments"]);
  }

  static List<Category> fromList(List<dynamic> list) {
    return list.map((map) => Category.fromJson(map)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["name"] = name;
    _data["isFueature"] = isFueature;
    _data["imageUrl"] = imageUrl;
    if (departments != null) {
      _data["departments"] = departments?.map((e) => e.toJson()).toList();
    }
    return _data;
  }
}
