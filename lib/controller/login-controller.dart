import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:r_store/client/clientApi.dart';
import 'package:r_store/const/package_const.dart';
import 'package:r_store/const/router_const.dart';
import 'package:r_store/model/cerdential_model/credential.dart';
import 'package:r_store/service/identity_service.dart';

class LoginController extends GetxController {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  ClientApi api = ClientApi();
  IdentityService service = IdentityService();
  GetStorage _storage = Get.find();

  login() async {
    var credential = Credential(email: email.text, password: password.text);
    print("email" + email.text);
    //String token = _storage.read("token");
   // print("token:" + token);

    await service.login(credential);

    // var responsecategories = await api.getData(
    //     "http://192.168.1.3:9190/api/products/categories",
    //     {headerAuthorization:token}).then((value) => value);
    // var responseproducts = await api
    //     .getData("http://192.168.1.3:9190/api/products", {headerAuthorization:token})
    //     .then((value) {
    //   return value;
    // });
    Get.toNamed(dashbord);
  }
}
