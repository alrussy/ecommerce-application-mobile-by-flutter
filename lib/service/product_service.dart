import 'package:get_storage/get_storage.dart';
import 'package:r_store/Client/clientApi.dart';
import 'package:r_store/const/package_const.dart';
import 'package:r_store/model/category_model/category.dart';
import 'package:r_store/model/department_model/department.dart';
import 'package:r_store/model/product_model/product.dart';

class ProductService {
  ClientApi _api = ClientApi();
  static final String path = "/api/products";
  GetStorage _storage = Get.find();

  Map<String, String> header = Map();

  Future<List<Product>> getAllProduct() async {
    header.assign(headerAuthorization, "Bearer ${_storage.read("token")}");
    late List<Product> products = List.empty(growable: true);
    List<dynamic> pl = await _api.getData(path, header);
    products = Product.fromList(pl);
    print(products);
    return Future.value(products);
  }
 Future<List<Product>> getProductCategoryId(categoryId) async {
    header.assign(headerAuthorization, "Bearer ${_storage.read("token")}");
    late List<Product> products = List.empty(growable: true);
    List<dynamic> pl = await _api.getData("$path/category/$categoryId", header);
    products = Product.fromList(pl);
    print(products);
    return Future.value(products);
  }
  Future<List<Product>> getProductDepartmentId(departmentId) async {
    header.assign(headerAuthorization, "Bearer ${_storage.read("token")}");
    late List<Product> products = List.empty(growable: true);
    List<dynamic> pl = await _api.getData("$path/department/$departmentId", header);
    products = Product.fromList(pl);
    print(products);
    return Future.value(products);
  }
  Future<List<Category>> getFeatuerCategories() async {
    header.assign(headerAuthorization, "Bearer ${_storage.read("token")}");
    late List<Category> categories = List.empty(growable: true);
    List<dynamic> categoryResponse =
        await _api.getData("$path/categories/is_feature", header);
    categories = Category.fromList(categoryResponse);
    print(categories);
    return Future.value(categories);
  }

  Future<List<Category>> getAllCategories() async {
    header.assign(headerAuthorization, "Bearer ${_storage.read("token")}");
    late List<Category> categories = List.empty(growable: true);
    List<dynamic> categoryResponse =
        await _api.getData("$path/categories", header);
    categories = Category.fromList(categoryResponse);

    print(categories);
    return Future.value(categories);
  }

  Future<List<Department>> getDepartmentsByCategoryID(categoryId) async {
    header.assign(headerAuthorization, "Bearer ${_storage.read("token")}");
    late List<Department> departments = List.empty(growable: true);
    List<dynamic> departmentsResponse =
        await _api.getData("$path/departments/category/$categoryId", header);
    departments = Department.fromList(departmentsResponse);

    print(departmentsResponse);
    return Future.value(departments);
  }

  // List<Product> getProductIsFeatuer() {
  //   header.assign(headerAuthorization, "Bearer ${_storage.read("token")}");
  //   late List<Product> products=List.empty(growable: true);
  //   _api.getData(path+"/isFeatur", header).then((allProducts) =>
  //       allProducts.forEach((json) => products.add(Product.fromJson(json))));
  //   return products;
  // }
}

//amal_ali@gmai.com