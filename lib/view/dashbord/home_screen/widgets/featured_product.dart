import 'package:cached_network_image/cached_network_image.dart';
import 'package:r_store/const/color_const.dart';
import 'package:r_store/const/package_const.dart';
import 'package:r_store/const/url_const.dart';
import 'package:r_store/controller/home-controller.dart';

class FeaturedProducts extends GetView<HomeController> {
  const FeaturedProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        'Featured Products'
            .text
            .black
            .size(18)
            .bold
            .make()
            .marginSymmetric(vertical: 5, horizontal: 10),
        Expanded(
            child: Obx(
          () => ListView.builder(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              scrollDirection: Axis.horizontal,
              itemCount: controller.faetuerProducts.length,
              itemBuilder: (context, index) => Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: AspectRatio(
                            aspectRatio: 16 / 9,
                            child: CachedNetworkImage(
                              imageUrl:
                                  "$baseCdnUrlApi${controller.products[index].imageUrl}",
                              width: Get.width,
                              // fit: BoxFit.contain,
                            )),
                      ),
                      "${controller.faetuerProducts[index].name}"
                          .text
                          .ellipsis
                          .bold
                          .color(primaryColor)
                          .make()
                          .objectTopLeft(),
                      "\$ ${controller.faetuerProducts[index].price}"
                          .text
                          .bold
                          .color(blackColor)
                          .make()
                          .objectTopLeft(),
                    ],
                  )
                      .box
                      .width(150)
                      .margin(const EdgeInsets.only(left: 10))
                      .padding(const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 15))
                      .white
                      .roundedSM
                      // .customRounded(const BorderRadius.only(
                      //     bottomRight: Radius.circular(20),
                      //     topLeft: Radius.circular(10)))
                      .make()
                      .badge(
                          count: index,
                          color: Colors.redAccent,
                          size: index % 2 == 0 ? 40 : 0,
                          position: VxBadgePosition.rightTop,
                          limit: true,
                          type: VxBadgeType.ellipse)).paddingOnly(right: 10),
        ))
      ],
    ).box.height(270).make();
  }
}
