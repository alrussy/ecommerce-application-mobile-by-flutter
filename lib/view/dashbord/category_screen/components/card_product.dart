import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:r_store/const/color_const.dart';
import 'package:r_store/const/package_const.dart';
import 'package:r_store/const/router_const.dart';
import 'package:r_store/const/url_const.dart';
import 'package:r_store/controller/category-details.controller.dart';

class CardProduct extends GetView<CategoryDetailsController> {
  CardProduct({super.key});
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Obx(
      () => GridView.builder(
          padding: EdgeInsets.symmetric(horizontal: 15),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 15,
              mainAxisExtent: 170,
              mainAxisSpacing: 10),
          itemCount: controller.products.length,
          itemBuilder: (context, index) => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    clipBehavior: Clip.antiAlias,
                    height: 110,
                    child: CachedNetworkImage(
                      imageUrl:
                          "$baseCdnUrlApi${controller.products[index].imageUrl}",
                      fit: BoxFit.cover,
                    ).marginAll(12),
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(5),
                            topRight: Radius.circular(5))),
                  ),
                  controller.products[index].name
                      .toString()
                      .text
                      .bold
                      .size(12)
                      .ellipsis
                      .make()
                      .paddingSymmetric(horizontal: 5),
                  Row(
                    children: [
                      controller.products[index].discount! > 0.0
                          ? controller.products[index].price
                              .toString()
                              .text
                              .bold
                              .green300
                              .lineThrough
                              .size(10)
                              .make()
                              .paddingSymmetric(horizontal: 5)
                          : SizedBox(),
                      "${controller.products[index].priceAfterDiscount} \$"
                          .toString()
                          .text
                          .bold
                          .size(10)
                          .make()
                          .paddingSymmetric(horizontal: 5)
                    ],
                  )
                ],
              )
                  .box
                  .customRounded(const BorderRadius.all(Radius.circular(5)))
                  .width(100)
                  .color(whiteColor)
                  .make()
                  .onTap(() {
                Get.toNamed(productDetails,
                    arguments: controller.products[index]);
              })),
    ));
  }
}
