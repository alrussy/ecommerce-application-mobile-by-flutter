import 'package:get/get.dart';
import 'package:r_store/controller/cart-controller.dart';
import 'package:r_store/controller/dashbord-controller.dart';
import 'package:r_store/controller/home-controller.dart';

class DashbordBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(DashbordController());
    Get.put(HomeController());
    Get.put(CartController());
  }
}
