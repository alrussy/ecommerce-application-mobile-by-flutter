import 'package:get_storage/get_storage.dart';
import 'package:r_store/Client/clientApi.dart';
import 'package:r_store/const/package_const.dart';
import 'package:r_store/model/order.dart';

class OrderService {
 final ClientApi _api = ClientApi();
  static  const String path = "/api/orders/user";
 final GetStorage _storage = Get.find();

  Map<String, String> header = {};

  Future<Order> checkoutAndOrder(Order order) async {
    header.assign(
        headerAuthorization, "Bearer ${await _storage.read("token")}");

    var response = await _api.postData(path, order.toJson(), header);
    print(response);

    return Future.value(Order.fromJson(response));
  }
}
