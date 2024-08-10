import 'package:get_storage/get_storage.dart';
import 'package:r_store/client/clientApi.dart';
import 'package:r_store/const/package_const.dart';
import 'package:r_store/const/string_const.dart';
import 'package:r_store/model/category_model/category.dart';

class CategoryService {
  ClientApi _api = ClientApi();
  static final String path = "/api/products/categories";
  GetStorage _storage = Get.find();

  Map<String, String> header = Map();

  Future<List<Category>> getAllCategories() async {
    header.assign(headerAuthorization, "Bearer ${_storage.read("token")}");
    late List<Category> categories = List.empty(growable: true);
    await  _api.getData(path, header).then((allProducts) =>
        allProducts.forEach((json) => categories.add(Category.fromJson(json))));
    print(categories);
    return Future.value(categories);
  }


  Future<List<Category>> getFeatsureCategories() async {
    header.assign(headerAuthorization, "Bearer ${_storage.read("token")}");
    late List<Category> categories = List.empty(growable: true);
    await _api.getData(path+"/is_featre", header).then((allProducts) =>
        allProducts.forEach((json) => categories.add(Category.fromJson(json))));
    print(categories);
    return Future.value(categories);
  }
}
