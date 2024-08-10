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

class CartController extends GetxController {
  Set<Cart> listCarts = carts;
  RxDouble total = 0.0.obs;
  OrderService orderService = OrderService();
  final _addressService = AddressService();
  List<Address>? addresses;
  DashbordController dashbordController = Get.find();
  String? addressId;
  String? deliveryType;
  String? paymentMethod;

  increment(int index) {
    listCarts.elementAt(index).quentity =
        listCarts.elementAt(index).quentity! + 1;
    print(listCarts);
    setTotal();
    update();
  }

  void descrement(int index) {
    if (listCarts.elementAt(index).quentity! > 1) {
      listCarts.elementAt(index).quentity =
          listCarts.elementAt(index).quentity! - 1;
    }

    setTotal();
    update();
  }

  getAddresses() async {
    addresses = await _addressService.getAddresses();
  }

  order() async {
    if (addressId == null) {
      print(" you must select one address ");
      return;
    }
    print("===============${addresses!.first.id}=================");

    List<LineProduct> lineProducts =
        listCarts.map((cart) => cart.mapToLineProduct()).toList();

    final order = Order(
      addressId: int.parse(addressId!),
      intent: "sale",
      currency: "USD",
      total: total.value,
      paymentMethod: paymentMethod,
      deliveryType: deliveryType,
      description: "payment description",
      lineProducts: lineProducts,
    );

    var response = await orderService.checkoutAndOrder(order);
    carts.clear();
    total.value = 0;
    print(response);
    dashbordController.navigation(0);
  }

  setDeliveryTyp(value) {
    deliveryType = value;
    update();
  }

  setPaymentMethod(value) {
    paymentMethod = value;
    update();
  }

  setAddress(value) {
    addressId = value;

    //address = addresses?.firstWhere((address) => address.id == value);
    update();
  }

  @override
  void onInit() async {
    setTotal();
    await getAddresses();
    setDeliveryTyp(DeliveryType.deliveryHome.name);
    setPaymentMethod(PaymentMethod.cash.name);

    super.onInit();
  }

  setTotal() {
    print("================================");
    if (listCarts.isNotEmpty) {
      total.value = listCarts
          .map((e) => e.setSubTotal().subTotal!)
          .reduce((value, element) => value = value + element)
          .roundToDouble();
    }
    print("===============$total=================");

    update();
  }
}
