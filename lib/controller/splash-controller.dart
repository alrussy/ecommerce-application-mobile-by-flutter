



import 'package:get/get.dart';
import 'package:r_store/const/router_const.dart';

class SplashController extends GetxController{

  goToLogin(){
    Get.offNamed(loginScreen);
  }

  @override
  void onInit() async{
    await Future.delayed(const Duration(seconds: 5));
    goToLogin();
    super.onInit();
  }
}