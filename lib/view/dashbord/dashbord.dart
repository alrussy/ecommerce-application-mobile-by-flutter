import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:r_store/const/color_const.dart';
import 'package:r_store/controller/dashbord-controller.dart';
import 'package:r_store/view/dashbord/cart-screen/cart_page.dart';
import 'package:r_store/view/dashbord/account_screen/account_screen.dart';
import 'package:r_store/view/dashbord/category_screen/category_screen.dart';
import 'package:r_store/view/dashbord/home_screen/home_screen.dart';

class Dashbord extends StatelessWidget {
  const Dashbord({super.key});

  @override
  Widget build(BuildContext context) {
    DashbordController controller = Get.find();
    var navbarItem = [
      const BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
      const BottomNavigationBarItem(
          icon: Icon(Icons.category), label: 'Categories'),
      const BottomNavigationBarItem(icon: Icon(Icons.menu), label: 'Cart'),
      const BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Account'),
    ];

    var page = [
      const HomeScreen(),
      const CategoryScreen(),
      const CartPage(),
      const AccountScreen()
    ];

    return Scaffold(
        body: Column(
          children: [
            Obx(
              () => Expanded(
                child: page.elementAt(controller.currentNavIndex.value),
              ),
            )
          ],
        ),
        bottomNavigationBar: Obx(
          () => BottomNavigationBar(
              elevation: 5,
              currentIndex: controller.currentNavIndex.value,
              type: BottomNavigationBarType.fixed,
              items: navbarItem,
              unselectedItemColor: blackColor,
              selectedIconTheme: const IconThemeData(size: 35),
              showSelectedLabels: false,
              unselectedLabelStyle: const TextStyle(color: blackColor),
              selectedItemColor: primaryColor,
              onTap: (value) => controller.navigation(value)),
        ));
  }
}
