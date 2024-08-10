import 'package:get_storage/get_storage.dart';
import 'package:r_store/client/clientApi.dart';
import 'package:r_store/const/package_const.dart';
import 'package:r_store/model/inventory.dart';

class InventoryService {
  final ClientApi _api = ClientApi();
  final String path = "/api/inventory/";
  final GetStorage _storage = Get.find();

  Map<String, String> header = Map();

  Future<List<Inventory>> getInventoryByproduct(int productId) async {
    header.assign(headerAuthorization, "Bearer ${_storage.read("token")}");
       
    late List<Inventory> inventories = List.empty(growable: true);
    List<dynamic> pl = await _api.getData("$path/product/$productId", header);
    inventories = Inventory.fromList(pl);
    print(inventories);
    return Future.value(inventories);
  }
}
