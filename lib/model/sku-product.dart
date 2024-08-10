import 'package:equatable/equatable.dart';

class SkuProduct {
  String? sku;
  List<Details>? details;
  SkuProduct({this.sku, this.details});

  SkuProduct.fromJson(Map<String, dynamic> json) {
    details = json["details"] == null
        ? null
        : (json["details"] as List).map((e) => Details.fromJson(e)).toList();
    sku = json["sku"];
  }

  static List<SkuProduct> fromList(List<dynamic> list) {
    return list.map((map) => SkuProduct.fromJson(map)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    if (details != null) {
      _data["details"] = details?.map((e) => e.toJson()).toList();
    }
    _data["sku"] = sku;
    return _data;
  }

  @override
  String toString() {
    return "[$sku,$details]";
  }
}
//=====================================( Detail Class )========================================

class Details extends Equatable {
  int? id;
  String? value;
  String? name;
  bool? isShow = true;
  bool? isSelected = false;

  Details({this.id, this.value, this.name, this.isShow, this.isSelected});

  Details.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    value = json["value"];
    name = json["name"];
  }

  static List<Details> fromList(List<Map<String, dynamic>> list) {
    return list.map((map) => Details.fromJson(map)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["value"] = value;
    _data["name"] = name;
    return _data;
  }

  @override
  List<Object?> get props => [id, name, value];

  @override
  String toString() {
    return "[id: $id ,value: $value ,name: $name,isSelected: $isSelected,isShow: $isShow]";
  }
}

//=====================================( DetailsView Class )========================================
class DetailsView {
  String? name;
  List<Details>? values;

  DetailsView({this.name, this.values});

  static List<DetailsView> convertDetailsToDetailsView(
      List<SkuProduct> skuProducts) {
    Set<String> names = Set();

    skuProducts.forEach((e) => e.details!.forEach((e2) => names.add(e2.name!)));

    List<DetailsView> detailsViews = List.empty(growable: true);

    for (var name in names) {
      List<Details> newDetails = List.empty(growable: true);
      skuProducts.forEach((e) => e.details!.forEach((element) => {
            if (name == element.name && !newDetails.contains(element))
              {newDetails.add(element)}
          }));

      detailsViews.add(DetailsView(name: name, values: newDetails));
    }
    return detailsViews;
  }

  @override
  String toString() {
    return "[$name ,$values ]";
  }
}
