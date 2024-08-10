import 'package:get_storage/get_storage.dart';
import 'package:r_store/client/clientApi.dart';
import 'package:r_store/const/package_const.dart';
import 'package:r_store/model/address.dart';
import 'package:r_store/model/cerdential_model/credential.dart';

class AddressService {
  ClientApi _api = ClientApi();

  static final String path = "/api/address";
   final GetStorage _storage = Get.find();

  Map<String, String> header = Map();

  Future<List<Address>> getAddresses() async {
    header.assign(headerAuthorization, "Bearer ${_storage.read("token")}");

    late List<Address> addresses = List.empty(growable: true);
    List<dynamic> addressesResponse = await _api.getData("$path", header);
    addresses = Address.fromList(addressesResponse);
    print(addresses);
    return Future.value(addresses);
  }
  
}
