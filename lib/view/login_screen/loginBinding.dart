import 'package:get/get.dart';
import 'package:r_store/controller/login-controller.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(LoginController());
  }
}
