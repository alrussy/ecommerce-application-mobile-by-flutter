import 'package:get/get.dart';
import 'package:r_store/const/router_const.dart';
import 'package:r_store/model/category_model/category.dart';
import 'package:r_store/model/product_model/product.dart';
import 'package:r_store/service/product_service.dart';

class HomeController extends GetxController {
  var listImageBanner = [
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTwVdxlab5dxtdWeuvIR06mHUak0WeJOZKVrA&usqp=CAU",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTwVdxlab5dxtdWeuvIR06mHUak0WeJOZKVrA&usqp=CAU",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRsUWBBpH6X7jIPhhDTLFQVdcim06JqsZH8rQ&usqp=CAU"
  ];
  RxInt indexBanner = 0.obs;
  RxList<Product> products = RxList<Product>();
  RxList<Product> faetuerProducts = RxList<Product>();
  RxList<Category> faetuerCategories = RxList();
  RxBool? isloading=true.obs;
  ProductService productService = ProductService();

  setIndexBanner(index) {
    indexBanner.value = index;
  }

  getAllProducts() async {
    print("start");

    products.value = await productService.getAllProduct();
    print("end");
  }

  getAllFaetuerCategories() async {
    faetuerCategories.value = await productService.getFeatuerCategories();
  }

  getAllFaetuerProducts() {
    faetuerProducts.value =
        products.where((product) => product.isFeature!).toList();
    print(faetuerProducts);
  }

  @override
  void onInit() async {
    isloading!.value = true;
    await getAllFaetuerCategories();
    await getAllProducts();
    getAllFaetuerProducts();
    isloading!.value = false;
    super.onInit();
  }

  void goToPRoductDetails(Product product) {
    Get.toNamed(productDetails,
                  arguments: product);
  }
}
