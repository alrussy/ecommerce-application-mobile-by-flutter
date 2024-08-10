import 'package:get/get.dart';
import 'package:r_store/const/package_const.dart';
import 'package:r_store/const/router_const.dart';
import 'package:r_store/controller/cart-controller.dart';
import 'package:r_store/controller/home-controller.dart';
import 'package:r_store/model/cart.dart';
import 'package:r_store/model/category_model/category.dart';
import 'package:r_store/model/product_model/product.dart';
import 'package:r_store/service/product_service.dart';

class DashbordController extends GetxController {
  HomeController homecontroller = HomeController();
  var currentNavIndex = 0.obs;
  RxList<Category> categories = RxList();
  var productService = ProductService();

  goToDetailsCategory(category) {
    Get.toNamed(categoryDetails, arguments: {"category": category});
  }


  navigation(value) async {
    currentNavIndex.value = value;
    switch (value) {
      case 1:
        {
          categories.value = await productService.getAllCategories();
        }
        break;

      default:
        homecontroller.onInit();
    }
  }

  @override
  void onInit() async {
    //  products = homecontroller.getAllProducts();
    super.onInit();
  }
}
