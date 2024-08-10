import 'package:cached_network_image/cached_network_image.dart';
import 'package:get/get.dart';
import 'package:r_store/const/package_const.dart';
import 'package:r_store/controller/home-controller.dart';

class PoburalCategory extends GetView<HomeController> {
  final List listCategory;
  const PoburalCategory({super.key,required this.listCategory});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.screenWidth,
      height: 120,
      child: ListView.builder(
        physics:const  BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemCount: listCategory.length,
          padding: const EdgeInsets.only(left: 10),
          itemBuilder: (context, index) => CachedNetworkImage(
                imageUrl: controller.listImageBanner[index],
                fit: BoxFit.fill,
              )
                  .box
                  .height(120)
                  .width(context.screenWidth - 50)
                  .rounded
                  .clip(Clip.antiAlias)
                  .shadowSm
                  .margin(const EdgeInsets.only(right: 10))
                  .make()),
    );
  }
}
