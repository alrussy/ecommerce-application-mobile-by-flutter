


import 'package:get/get.dart';
import 'package:r_store/controller/cart-controller.dart';

class CartBinding extends Bindings{
   @override
  void dependencies() {
    Get.put(CartController());
   
  }
}