import 'package:equatable/equatable.dart';
import 'package:r_store/model/order.dart';
import 'package:r_store/model/sku-product.dart';
import 'package:r_store/model/product_model/product.dart';

class Cart {
  Product? product;
  SkuProduct? skuProduct;
  int? quentity;
  double? subTotal;

  Cart({this.product, this.skuProduct, this.quentity});

  Cart setSubTotal() {
    subTotal = quentity! * product!.priceAfterDiscount!;
    return this;
  }

  @override
  String toString() {
    return "{product:$product,details:$skuProduct,quentity: $quentity,subTotal:$subTotal}";
  }

  LineProduct mapToLineProduct() {
    LineProduct lineProduct = LineProduct(
        sku: skuProduct!.sku!,
        name: product!.name,
        quentity: quentity,
        price: product!.priceAfterDiscount,
        details: skuProduct!.details,
        imageUrl: product!.imageUrl);
    return lineProduct;
  }
}

enum DeliveryType { deliveryHome, takeWay }

enum PaymentMethod { cash, paypal }
