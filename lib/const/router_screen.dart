import 'package:r_store/const/router_const.dart';
import 'package:r_store/controller/cart-controller.dart';
import 'package:r_store/controller/splash-controller.dart';
import 'package:get/get.dart';
import 'package:r_store/controller/test-controller.dart';
import 'package:r_store/view/dashbord/cart-screen/cart-binding.dart';
import 'package:r_store/view/dashbord/cart-screen/cart_page.dart';
import 'package:r_store/view/dashbord/account_screen/account_screen.dart';
import 'package:r_store/view/dashbord/category_screen/department_screen/category_binding.dart';
import 'package:r_store/view/dashbord/category_screen/department_screen/category_details_screen.dart';
import 'package:r_store/view/dashbord/dashbord.dart';
import 'package:r_store/view/dashbord/dashbord_binding.dart';
import 'package:r_store/view/login_screen/loginBinding.dart';
import 'package:r_store/view/login_screen/login_screen.dart';
import 'package:r_store/view/product-details/product_details_binding.dart';
import 'package:r_store/view/product-details/product_details_screen.dart';
import 'package:r_store/view/sign_up_screen/sign_up_screen.dart';
import 'package:r_store/view/splash_screen/splash_screen.dart';
import 'package:r_store/test-screen.dart';

List<GetPage> getPage = [
  GetPage(
      name: splashScreen,
      page: () => const SplachScreen(),
      binding: BindingsBuilder.put(() => Get.put(SplashController()))),
  GetPage(
      name: loginScreen,
      page: () => const LoginScreen(),
      transition: Transition.rightToLeftWithFade,
      transitionDuration: const Duration(milliseconds: 600),
      binding: LoginBinding()),
  GetPage(
      name: signUpScreen,
      page: () => const SignUpScreen(),
      transition: Transition.rightToLeftWithFade,
      transitionDuration: const Duration(milliseconds: 600)),
  GetPage(
      name: categoryDetails,
      page: () => const CategoryDetailsScreen(),
      binding: CategoryBinding()),
  GetPage(
      name: productDetails,
      page: () => const ProductDetailsScreen(),
      binding: ProductDetailsBinding()),
  GetPage(
      name: dashbord,
      page: () => const Dashbord(),
      transition: Transition.upToDown,
      transitionDuration: const Duration(milliseconds: 600),
      binding: DashbordBinding()),
  GetPage(
      name: cartScreen,
      page: () => const CartPage(),
      transition: Transition.upToDown,
      transitionDuration: const Duration(milliseconds: 600),
      binding: CartBinding()),
  GetPage(
      name: accountScreen,
      page: () => const AccountScreen(),
      transition: Transition.upToDown,
      transitionDuration: const Duration(milliseconds: 600)),
  GetPage(
      name: testScreen,
      page: () => const MyTestSocket(),
      transition: Transition.upToDown,
      transitionDuration: const Duration(milliseconds: 600),
      binding: BindingsBuilder.put(() => Get.put(TestController()))),
];
