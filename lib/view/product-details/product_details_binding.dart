import 'package:get/get.dart';
import 'package:r_store/controller/product-details-controller.dart';


class ProductDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(ProductDetailsController());
   
  }
}
