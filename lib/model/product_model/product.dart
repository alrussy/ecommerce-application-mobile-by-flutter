import 'package:r_store/model/brand_model/brand.dart';
import 'package:r_store/model/category_model/category.dart';
import 'package:r_store/model/department_model/Department.dart';

class Product {
  int? id;
  String? name;
  double? price;
  double? discount;
  double? priceAfterDiscount;
  bool? isFeature;
  String? imageUrl;
  String? description;
  Category? category;
  Department? department;
  Brand? brand;

  Product(
      {this.id,
      this.name,
      this.price,
      this.discount,
      this.priceAfterDiscount,
      this.isFeature,
      this.imageUrl,
      this.category,
      this.department,
      this.brand});

  Product.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    name = json["name"];
    price = json["price"];
    discount = json["discount"];
    priceAfterDiscount = json["priceAfterDiscount"];
    isFeature = json["isFeature"];
    imageUrl = json["imageUrl"];
    description = json["description"];

    category =
        json["category"] == null ? null : Category.fromJson(json["category"]);
    department = json["deprtment"] == null
        ? null
        : Department.fromJson(json["deprtment"]);
    brand = json["brand"] == null ? null : Brand.fromJson(json["brand"]);
  }

  static List<Product> fromList(List<dynamic> list) {
    return list.map((map) => Product.fromJson(map)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};

    _data["id"] = id;
    _data["name"] = name;
    _data["price"] = price;
    _data["discount"] = discount;
    _data["priceAfterDiscount"] = priceAfterDiscount;
    _data["isFeature"] = isFeature;
    _data["imageUrl"] = imageUrl;
    _data["description"] = description;

    if (category != null) {
      _data["category"] = category?.toJson();
    }
    if (department != null) {
      _data["deprtment"] = department?.toJson();
    }
    if (brand != null) {
      _data["brand"] = brand?.toJson();
    }
    return _data;
  }

  @override
  String toString() {
    return "{id: $id, name: $name, price: $price,discount: $discount, priceAfterDiscount: $priceAfterDiscount }";
  }
}
