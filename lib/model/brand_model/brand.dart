class Brand {
    int? id;
    String? name;

    Brand({this.id, this.name});

    Brand.fromJson(Map<String, dynamic> json) {
        id = json["id"];
        name = json["name"];
    }

    static List<Brand> fromList(List<Map<String, dynamic>> list) {
        return list.map((map) => Brand.fromJson(map)).toList();
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        _data["id"] = id;
        _data["name"] = name;
        return _data;
    }
}
