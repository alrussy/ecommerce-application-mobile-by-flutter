import 'dart:ffi';
import 'dart:io';

import 'package:get/get.dart';
import 'package:r_store/const/color_const.dart';
import 'package:r_store/const/list_card.dart';
import 'package:r_store/const/package_const.dart';
import 'package:r_store/controller/dashbord-controller.dart';
import 'package:r_store/model/address.dart';
import 'package:r_store/model/cart.dart';
import 'package:r_store/model/order.dart';
import 'package:r_store/model/sku-product.dart';
import 'package:r_store/model/product_model/product.dart';
import 'package:r_store/service/address_service.dart';
import 'package:r_store/service/order_service.dart';
import 'package:socket_io_client/socket_io_client.dart' as io;

class TestController extends GetxController {
  @override
  void onInit() async {
    super.onInit();
  }
}
