import 'package:get/get.dart';
import 'package:r_store/controller/category-details.controller.dart';


class CategoryBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(CategoryDetailsController());
   
  }
}
