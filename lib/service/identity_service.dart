import 'package:get_storage/get_storage.dart';
import 'package:r_store/client/clientApi.dart';
import 'package:r_store/const/package_const.dart';
import 'package:r_store/model/cerdential_model/credential.dart';

class IdentityService {
  ClientApi _api = ClientApi();

  static final String path = "/api/auth";
  GetStorage _storage = Get.find();

  Future<void> login(Credential credential) async {
    var response = await _api.postData(
        "$path/token", credential.toJson(), {}).then((value) => value);
     print("value : ${response["tokenAccess"]}");
    await _storage.write("token", response["tokenAccess"]);
  }
}
