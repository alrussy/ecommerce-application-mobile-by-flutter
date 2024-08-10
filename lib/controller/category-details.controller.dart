import 'package:get/get.dart';
import 'package:r_store/model/category_model/category.dart';
import 'package:r_store/model/department_model/department.dart';
import 'package:r_store/model/product_model/product.dart';
import 'package:r_store/service/product_service.dart';

class CategoryDetailsController extends GetxController {
  var currentIndexdepartment = 0.obs;
  RxList<Department> departments = RxList();
  Category? category;
  RxList<Product> products = RxList();
  ProductService api = ProductService();

  setCurrentSelected(index) async {
    products.clear();
    print(index);
    switch (index) {
      case 0:
        await getProductByCategoryId(category!.id!);
        break;
      default:
        await getProductByDepartmentId(departments[index - 1].id!);
    }
  }

  getDepartments(categoryId) async {
    departments.value = await api.getDepartmentsByCategoryID(categoryId);
  }

  getProductByCategoryId(categoryId) async {
    products.value = await api.getProductCategoryId(categoryId);
  }

  getProductByDepartmentId(deprtmentId) async {
    products.value = await api.getProductDepartmentId(deprtmentId);
  }

  @override
  void onInit() async {
    category = Get.arguments["category"] ?? Category();
    await getDepartments(category!.id!);
    await setCurrentSelected(0);
    print(departments);
    //   await getProduct(category!.departments![0]);
    super.onInit();
  }
}
