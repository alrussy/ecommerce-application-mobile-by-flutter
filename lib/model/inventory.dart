class Inventory {
  int? id;
  String? productId;
  int? quentity;
  String? imageUrl;

  Inventory({this.id, this.productId, this.quentity});

  Inventory.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    productId = json["productId"];
    quentity = json["quentity"];
    imageUrl = json["imageUrl"];
  }

  static List<Inventory> fromList(List<dynamic> list) {
    return list.map((map) => Inventory.fromJson(map)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["productId"] = productId;
    _data["quentity"] = quentity;
    _data["imageUrl"] = imageUrl;

    return _data;
  }
}
