import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:r_store/const/color_const.dart';
import 'package:r_store/const/list_card.dart';
import 'package:r_store/const/package_const.dart';
import 'package:r_store/const/url_const.dart';
import 'package:r_store/controller/cart-controller.dart';
import 'package:r_store/model/address.dart';
import 'package:r_store/model/cart.dart';
import 'package:r_store/view/widgets_common/custom_Button.dart';

class CartPage extends GetView<CartController> {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Cart"),
      ),
      body: Column(children: [
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
                if (carts.isEmpty)
                  " no item selected".text.bold.gray700.medium.makeCentered()
                else
                  ...List.generate(
                      carts.length,
                      (index) => GetBuilder<CartController>(
                          builder: (_) => lineCart(
                              carts.elementAt(index), controller, index)))
              ],
            ),
          ),
        ),
        Obx(() => totalSection(controller)),
        10.heightBox,
        customButton(
            "Checkout",
            controller.listCarts.isEmpty
                ? null
                : () async {
                    await customBottomSheet(controller);
                  },
            false,
            hieght: 50.0)
      ]),
    );
  }
}

Widget increment(CartController controller, int index) {
  return Row(
    children: [
      IconButton(
              onPressed: () {
                controller.descrement(index);
              },
              visualDensity: VisualDensity.compact,
              padding: const EdgeInsets.all(0),
              iconSize: 20,
              icon: const Icon(
                Icons.remove,
              ))
          .box
          .color(primaryColor)
          .roundedFull
          .width(25)
          .height(25)
          .shadowSm
          .make()
          .paddingSymmetric(horizontal: 1, vertical: 5),
      10.widthBox,
      controller.listCarts
          .elementAt(index)
          .quentity!
          .toString()
          .text
          .size(18)
          .color(primaryColor)
          .makeCentered()
          .box
          .white
          .withConstraints(const BoxConstraints(minWidth: 70))
          .rounded
          .shadowSm
          .padding(const EdgeInsets.symmetric(vertical: 5))
          .make(),
      10.widthBox,
      IconButton(
              visualDensity: VisualDensity.compact,
              padding: const EdgeInsets.all(0),
              iconSize: 20,
              color: whiteColor,
              onPressed: () {
                controller.increment(index);
              },
              icon: const Icon(Icons.add))
          .box
          .color(primaryColor)
          .roundedFull
          .width(25)
          .height(25)
          .shadowSm
          .make()
          .paddingSymmetric(horizontal: 1, vertical: 5),
    ],
  );
}

Widget lineCart(Cart cart, controller, index) {
  return Card(
    child: CupertinoListTile(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      leadingSize: 100,
      leading: Image.network("$baseCdnUrlApi${cart.product!.imageUrl}",
          fit: BoxFit.cover),
      leadingToTitle: 10,
      title: Text(cart.product!.name!),
      subtitle: Padding(
        padding: const EdgeInsets.only(top: 5.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(children: [
              ...List.generate(
                  cart.skuProduct!.details!.length,
                  (index) => index <= 1
                      ? Row(
                          children: [
                            Text(cart.skuProduct!.details![index].name!),
                            const SizedBox(
                              width: 3,
                            ),
                            Text(cart.skuProduct!.details![index].value!),
                            const SizedBox(
                              width: 20,
                            )
                          ],
                        )
                      : SizedBox.shrink())
            ]),
            20.heightBox,
            increment(controller, index),
          ],
        ),
      ),
    ),
  );
}

Widget totalSection(CartController controller) {
  return Align(
      alignment: Alignment.centerLeft,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        "Total:     \$ ${controller.total.value}"
            .text
            .bold
            .size(19)
            .color(primaryColor)
            .make()
      ])).paddingSymmetric(horizontal: 10);
}

customBottomSheet(CartController controller) async {
  await Get.bottomSheet(Container(
    height: Get.height,
    width: Get.width,
    color: greyColor,
    padding: const EdgeInsets.all(10),
    child: Column(
      children: [
        Expanded(
            child: Column(children: [
          "Checkout".text.bold.color(primaryColor).size(18).make(),
          30.heightBox,
          Align(
              alignment: Alignment.centerLeft,
              child: "Delivery-Type :".text.bold.gray500.size(15).make()),
          Row(
            children: [
              ...List.generate(
                  DeliveryType.values.length,
                  (index) => GetBuilder<CartController>(
                      builder: (_) => Expanded(
                            child: Row(
                              children: [
                                30.widthBox,
                                DeliveryType.values[index].name ==
                                        DeliveryType.deliveryHome.name
                                    ? "Delivery Home".text.bold.size(15).make()
                                    : "Take Way".text.bold.size(15).make(),
                                Radio(
                                    toggleable: true,
                                    value: DeliveryType.values[index].name,
                                    groupValue: controller.deliveryType,
                                    activeColor: primaryColor,
                                    onChanged: (value) {
                                      controller.setDeliveryTyp(value);
                                      print(controller.deliveryType);
                                    }),
                              ],
                            ),
                          ))),
            ],
          ),
          const Divider(
            thickness: 1,
            color: primaryColor,
          ),
          Align(
              alignment: Alignment.centerLeft,
              child: "Payment-Method :".text.bold.gray500.size(15).make()),
          Row(
            children: [
              ...List.generate(
                  PaymentMethod.values.length,
                  (index) => GetBuilder<CartController>(
                      builder: (_) => Expanded(
                            child: Row(
                              children: [
                                30.widthBox,
                                PaymentMethod.values[index].name.text.bold
                                    .size(15)
                                    .make(),
                                Radio(
                                    value: PaymentMethod.values[index].name,
                                    groupValue: controller.paymentMethod,
                                    activeColor: primaryColor,
                                    onChanged: (val) {
                                      controller.setPaymentMethod(val);
                                      print(controller.paymentMethod);
                                    }),
                              ],
                            ),
                          ))),
            ],
          ),
          const Divider(
            thickness: 1,
            color: primaryColor,
          ),
          GetBuilder<CartController>(
              builder: (_) => controller.deliveryType ==
                      DeliveryType.deliveryHome.name
                  ? Expanded(
                      child: Column(
                      children: [
                        Align(
                                alignment: Alignment.centerLeft,
                                child: "Address : "
                                    .text
                                    .bold
                                    .gray500
                                    .size(15)
                                    .make())
                            .marginOnly(bottom: 5),
                        DropdownButtonHideUnderline(
                          child: DropdownButton(
                            borderRadius: BorderRadius.circular(10),
                            isExpanded: true,
                            value: controller.addressId,
                            hint: "Select Address"
                                .text
                                .bold
                                .color(greyColor)
                                .make(),
                            items: controller.addresses!
                                .map((e) => DropdownMenuItem(
                                      value: e.id.toString(),
                                      child: e.toString().text.make(),
                                    ))
                                .toList(),
                            onChanged: (String? value) {
                              controller.setAddress(value);
                            },
                          )
                              .box
                              .rounded
                              .padding(
                                  const EdgeInsets.symmetric(horizontal: 10))
                              .color(primaryColor)
                              .make(),
                        )
                      ],
                    ))
                  : const SizedBox.shrink())
        ])),
        customButton("Order Now", () {
          Get.back();
          controller.order();
        }, true, hieght: 50.0)
      ],
    ),
  ));
}
