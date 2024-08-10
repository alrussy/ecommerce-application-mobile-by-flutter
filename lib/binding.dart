import 'package:get_storage/get_storage.dart';
import 'package:r_store/const/package_const.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => GetConnect(), fenix: true);
    Get.lazyPut(() => GetStorage(), fenix: true);
  }

}
