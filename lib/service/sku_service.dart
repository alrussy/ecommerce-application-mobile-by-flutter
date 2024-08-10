import 'package:get_storage/get_storage.dart';
import 'package:r_store/client/clientApi.dart';
import 'package:r_store/const/package_const.dart';
import 'package:r_store/model/sku-product.dart';

class SkuProductService {
  final ClientApi _api = ClientApi();
  final String path = "/api/products/sku-products/";
  final GetStorage _storage = Get.find();

  Map<String, String> header = Map();

  Future<List<SkuProduct>> getSkuByproduct(int productId) async {
    header.assign(headerAuthorization, "Bearer ${_storage.read("token")}");

    late List<SkuProduct> listSku = List.empty(growable: true);
    List<dynamic> pl = await _api.getData("$path/product/$productId", header);
    listSku = SkuProduct.fromList(pl);
    return Future.value(listSku);
  }
}
