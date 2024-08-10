import 'package:r_store/const/color_const.dart';
import 'package:r_store/const/package_const.dart';
import 'package:r_store/const/url_const.dart';
import 'package:r_store/controller/product-details-controller.dart';
import 'package:r_store/model/sku-product.dart';
import 'package:r_store/view/widgets_common/custom_Button.dart';

class ProductDetailsScreen extends GetView<ProductDetailsController> {
  const ProductDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        title: "Product Details".text.semiBold.size(16).make(),
        leadingWidth: 30,
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
            icon: Icon(Icons.arrow_back_outlined),
            onPressed: () {
              Get.back();
            }),
        actions: [
          IconButton(icon: Icon(Icons.share), onPressed: () {}),
          IconButton(icon: Icon(Icons.favorite), onPressed: () {}),
        ],
      ),
      body: Column(
        children: [
          VxSwiper.builder(
            aspectRatio: 16 / 9,
            enlargeCenterPage: true,
            enableInfiniteScroll: false,
            scrollDirection: Axis.horizontal,
            viewportFraction: 0.9,
            onPageChanged: (index) => controller.setIndex(index),
            autoPlay: false,
            height: 250,
            itemCount: 1,
            itemBuilder: (context, index) => Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                    child: Image.network(
                  "$baseCdnUrlApi${controller.product.imageUrl}",
                  fit: BoxFit.cover,
                ).marginSymmetric(horizontal: 5)),
              ],
            ),
          ),
          5.heightBox,
          //   Obx(() =>
          //   // controller.details.length > 1
          //   //     ? SliderBlowWidget(
          //   //         length: controller.details.length,
          //   //         indexCurrent: controller.indexCurrent.value):
          //  SizedBox()),
          20.heightBox,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              "${controller.product.name}".text.black.bold.size(18).make(),
              10.heightBox,
              VxRating(
                onRatingUpdate: (value) => {print(value)},
                count: 5,
                stepInt: true,
                selectionColor: primaryColor,
                normalColor: Vx.gray500,
              ),
              10.heightBox,
              "\$ ${controller.product.priceAfterDiscount}"
                  .text
                  .red400
                  .bold
                  .xl2
                  .make(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      "nnnnn".text.gray700.light.make(),
                      "sjdflksjdfkls".text.bold.medium.black.make()
                    ],
                  ),
                  const CircleAvatar(
                    backgroundColor: Colors.white,
                    child: Icon(Icons.message_rounded),
                  ),
                ],
              )
                  .box
                  .gray300
                  .height(60)
                  .padding(
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 4))
                  .make(),
              Obx(() => controller.loading.value
                  ? const Center(child: CircularProgressIndicator())
                  : listDetailsWedget(controller.detailsView)),
            ],
          )
              .box
              .width(double.infinity)
              .make()
              .paddingSymmetric(horizontal: 15, vertical: 10)
              .expand(),
          customButton("Add to Card", () {
            customBottomSheet(controller);
          }, false, hieght: 50.toDouble())
        ],
      ).paddingOnly(top: 15),
    );
  }
}

Widget listDetailsWedget(List<DetailsView> details) {
  return Expanded(
      child: GetBuilder<ProductDetailsController>(
    builder: (controller) => ListView.builder(
        shrinkWrap: true,
        padding: EdgeInsets.only(top: 10),
        itemCount: details.length,
        itemBuilder: (context, index) => details[index].values!.length > 1
            ? Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                "${details[index].name} : ".text.bold.gray400.size(18).make(),
                Row(children: [
                  ...List.generate(
                      details[index].values!.length,
                      (index2) => details[index].name.toString() == "color"
                          ? Row(
                              children: [
                                Container(
                                  height: 10,
                                  width: 10,
                                  color: setColor(details[index]
                                      .values![index2]
                                      .value!
                                      .toLowerCase()),
                                ),
                                10.widthBox,
                                details[index]
                                    .values![index2]
                                    .value!
                                    .toString()
                                    .text
                                    .bold
                                    .color(setColorTextDetailes(
                                        details[index].values![index2]))
                                    .make()
                              ],
                            ).paddingSymmetric(horizontal: 10).onInkTap(() {
                              controller.selected(index, index2);
                              print(controller.selectDetails);
                              print("$index   $index2");
                            })
                          : details[index]
                              .values![index2]
                              .value
                              .toString()
                              .text
                              .bold
                              .color(setColorTextDetailes(
                                  details[index].values![index2]))
                              .size(15)
                              .make()
                              .paddingSymmetric(horizontal: 10)
                              .onInkTap(() {
                              controller.selected(index, index2);
                              print(controller.selectDetails);
                              print("$index   $index2");
                            }))
                ])
              ])
            : const SizedBox.shrink()),
  ));
}

customBottomSheet(ProductDetailsController controller) async {
  await Get.bottomSheet(Container(
      height: Get.height,
      width: Get.width,
      color: greyColor,
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(children: [
        Expanded(
            child: Column(children: [
          20.heightBox,
          "Details".text.bold.color(primaryColor).size(18).make(),
          listDetailsWedget(controller.detailsView),
        ])),
        customButton("Accept", () {
          Get.back();
          controller.addToListCart();
        }, true, hieght: 50.0),
        20.heightBox
      ])));
}

Color setColor(colorName) {
  switch (colorName) {
    case "red":
      return Colors.red;
    case "black":
      return Color.fromARGB(255, 10, 8, 8);
    case "blue":
      return Colors.blue;
    case "white":
      return Color.fromARGB(255, 239, 244, 249);
    default:
      return Colors.grey;
  }
}

Color setColorTextDetailes(Details detail) {
  if (detail.isSelected! && detail.isShow!) {
    return Colors.red;
  } else if (detail.isShow! && !detail.isSelected!) {
    return Colors.black;
  } else {
    return Colors.grey.shade600;
  }
}
