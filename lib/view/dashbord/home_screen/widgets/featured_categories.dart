import 'package:cached_network_image/cached_network_image.dart';
import 'package:r_store/const/package_const.dart';
import 'package:r_store/const/url_const.dart';
import 'package:r_store/controller/home-controller.dart';
import 'package:r_store/model/category_model/category.dart';

class FeaturedCategories extends GetView<HomeController> {
  const FeaturedCategories({required this.cats, super.key});

  final List<Category> cats;
  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: Alignment.topLeft,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            'Featured Categories'.text.black.size(18).bold.make(),
            Obx(() => ListView.builder(
                  padding: const EdgeInsets.only(left: 10),
                  scrollDirection: Axis.horizontal,
                  itemCount: cats.length,
                  itemBuilder: (context, index) => Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        children: [
                          CachedNetworkImage(
                            imageUrl:
                                "$baseCdnUrlApi${controller.faetuerCategories[index].imageUrl}",
                            height: 40,
                            width: 40,
                          ).paddingOnly(left: 10),
                          10.widthBox,
                          Expanded(
                              child: cats[index]
                                  .name
                                  .toString()
                                  .text
                                  .black
                                  .size(15)
                                  .make())
                        ],
                      )
                          .box
                          .roundedSM
                          .shadowSm
                          .white
                          .size(context.screenWidth * 0.50, 70)
                          .make()
                          .paddingAll(5),
                    ],
                  ),
                ).box.size(context.screenWidth, 70 * 1.5).make())
          ],
        )).paddingOnly(left: 10, top: 10);
  }
}
