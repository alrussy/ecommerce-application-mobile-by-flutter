import 'package:cached_network_image/cached_network_image.dart';
import 'package:r_store/const/color_const.dart';
import 'package:r_store/const/package_const.dart';
import 'package:r_store/const/url_const.dart';
import 'package:r_store/controller/dashbord-controller.dart';
import 'package:r_store/model/category_model/category.dart';

class CardCategory extends GetView<DashbordController> {
  const CardCategory({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Obx(() => GridView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 15,
                mainAxisExtent: 150,
                mainAxisSpacing: 10),
            itemCount: controller.categories.length,
            itemBuilder: (context, index) => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CachedNetworkImage(
                      imageUrl:
                          "$baseCdnUrlApi${controller.categories[index].imageUrl}",
                      fit: BoxFit.contain,
                      height: 110,
                    ).paddingSymmetric(horizontal: 7),
                    "${controller.categories[index].name}"
                        .text
                        .bold
                        .size(14)
                        .makeCentered()
                  ],
                )
                    .box
                    .customRounded(const BorderRadius.all(Radius.circular(5)))
                    .clip(Clip.antiAlias)
                    .width(100)
                    .color(whiteColor)
                    .make()
                    .onInkTap(() {
                  controller.goToDetailsCategory(controller.categories[index]);
                }))));
  }
}
