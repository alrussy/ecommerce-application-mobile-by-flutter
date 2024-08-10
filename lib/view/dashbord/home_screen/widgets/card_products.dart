import 'package:cached_network_image/cached_network_image.dart';
import 'package:r_store/const/color_const.dart';
import 'package:r_store/const/package_const.dart';
import 'package:r_store/const/router_const.dart';
import 'package:r_store/const/url_const.dart';
import 'package:r_store/controller/home-controller.dart';

class CardProductWidget extends GetView<HomeController> {
  const CardProductWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() => GridView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: controller.products.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 15,
            mainAxisExtent: 280,
            mainAxisSpacing: 15),
        itemBuilder: (context, index) => Column(
              children: [
                Expanded(
                  child: AspectRatio(
                      aspectRatio: 16 / 9,
                      child: CachedNetworkImage(
                        imageUrl:
                            "$baseCdnUrlApi${controller.products[index].imageUrl}",
                        width: Get.width,
                        fit: BoxFit.contain,
                        filterQuality: FilterQuality.high,
                        // fit: BoxFit.contain,
                      )),
                ),
                controller.products[index].name
                    .toString()
                    .text
                    .bold
                    .color(primaryColor)
                    .make()
                    .objectTopLeft(),
                (controller.products[index].discount!).toInt() > 0
                    ? Row(children: [
                        "\$ ${controller.products[index].price}"
                            .text
                            .bold
                            .gray300
                            .lineThrough
                            .make(),
                        10.widthBox,

                        "\$ ${controller.products[index].priceAfterDiscount!}"
                            .text
                            .bold
                            .color(blackColor)
                            .make()
                      ])
                    : "\$ ${controller.products[index].price!}"
                        .text
                        .bold
                        .color(blackColor)
                        .make()
                        .objectBottomLeft()
              ],
            )
                .box
                .width(200)
                .padding(
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 15))
                .white
                //.roundedSM
                .customRounded(BorderRadius.only(
                    bottomRight:const Radius.circular(5),
                    bottomLeft: const Radius.circular(5),
                    topRight: (controller.products[index].discount!).toInt() > 0
                        ?const  Radius.circular(30)
                        : const Radius.circular(5),
                    topLeft: const Radius.circular(5)))
                .make()
                .badge(
                  optionalWidget:
                      "${(controller.products[index].discount!).toInt()}%"
                          .text
                          .bold
                          .white
                          .makeCentered(),
                  color: Colors.redAccent,
                  size: (controller.products[index].discount!).toInt() > 0
                      ? 50
                      : 0,
                  position: VxBadgePosition.rightTop,
                  limit: true,
                  type: VxBadgeType.ellipse,
                )
                .onTap(() {
             controller.goToPRoductDetails(controller.products[index]);
           
            })));
  }
}
