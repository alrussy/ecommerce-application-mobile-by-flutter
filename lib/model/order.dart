import 'package:r_store/model/cart.dart';
import 'package:r_store/model/sku-product.dart';

class Order {
  int? id;
  int? addressId;
  DateTime? dateOrder;
  double? total;
  String? currency;
  String? paymentMethod;
  String? deliveryType;
  String? intent;
  String? description;
  List<LineProduct>? lineProducts;
  String? status;

  Order(
      {this.id,
      this.dateOrder,
      this.status,
      this.addressId,
      this.paymentMethod,
      this.total,
      this.currency,
      this.intent,
      this.description,
      this.lineProducts,
      this.deliveryType});

  Order.fromJson(Map<String, dynamic> json) {
    addressId = json["addressId"];
    total = json["total"];
    currency = json["currency"];
    paymentMethod = json["paymentMethod"];
    deliveryType = json["deliveryType"];
    intent = json["intent"];
    description = json["description"];
    lineProducts = json["lineProducts"] == null
        ? null
        : (json["lineProducts"] as List)
            .map((e) => LineProduct.fromJson(e))
            .toList();
  }

  static List<Order> fromList(List<Map<String, dynamic>> list) {
    return list.map((map) => Order.fromJson(map)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["dateOrder"] = dateOrder;
    _data["status"] = status;
    _data["addressId"] = addressId;
    _data["total"] = total;
    _data["currency"] = currency;
    _data["paymentMethod"] = paymentMethod;
    _data["deliveryType"] = deliveryType;
    _data["intent"] = intent;
    _data["description"] = description;
    if (lineProducts != null) {
      _data["lineProducts"] = lineProducts?.map((e) => e.toJson()).toList();
    }
    return _data;
  }
}

class LineProduct {
  int? id;

  String? sku;
  String? name;
  double? price;
  String? imageUrl;
  int? quentity;
  List<Details>? details;

  LineProduct(
      {this.id,
      this.sku,
      this.quentity,
      this.name,
      this.details,
      this.price,
      this.imageUrl});

  LineProduct.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    sku = json["sku"];
    quentity = json["quentity"];
    name = json["name"];
    price = json["price"];
    imageUrl = json["imageUrl"];
    details = json["details"] == null
        ? null
        : (json["details"] as List).map((e) => Details.fromJson(e)).toList();
  }

  static List<LineProduct> fromList(List<Map<String, dynamic>> list) {
    return list.map((map) => LineProduct.fromJson(map)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["sku"] = sku;
    _data["quentity"] = quentity;
    _data["name"] = name;
    _data["price"] = price;
    _data["imageUrl"] = imageUrl;
    if (details != null) {
      _data["details"] = details?.map((e) => e.toJson()).toList();
    }
    return _data;
  }
}
