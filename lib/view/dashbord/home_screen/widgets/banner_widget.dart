import 'package:cached_network_image/cached_network_image.dart';
import 'package:r_store/const/color_const.dart';
import 'package:r_store/const/package_const.dart';
import 'package:r_store/controller/home-controller.dart';

class BannerWidget extends GetView<HomeController> {
  final bool autoPlay;
  final bool showSliderBlow;
  final double viewportFraction;
  const BannerWidget(
      {super.key, required this.autoPlay, required this.showSliderBlow,required this.viewportFraction});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        VxSwiper.builder(
          aspectRatio: 16 / 9,
          enlargeCenterPage: true,
          autoPlay: autoPlay,
          height: 150,
          viewportFraction: viewportFraction,
          onPageChanged: (index) => controller.setIndexBanner(index),
          itemCount: controller.listImageBanner.length,
          itemBuilder: (context, index) => Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: CachedNetworkImage(
                  imageUrl: controller.listImageBanner[index],
                  fit: BoxFit.fill,
                )
                    .box
                    .rounded
                    .clip(Clip.antiAlias)
                    .margin(const EdgeInsets.all(8))
                    .gray300
                    .width(double.infinity)
                    .shadowMd
                    .make(),
              ),
            ],
          ),
        ),
        5.heightBox,
        showSliderBlow
            ? Obx(() => Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                    controller.listImageBanner.length,
                    (index2) => Container(
                          height: 7,
                          width: 7,
                          margin: const EdgeInsets.all(2),
                          decoration: BoxDecoration(
                              color: index2 == controller.indexBanner.value
                                  ? primaryColor
                                  : whiteColor,
                              shape: BoxShape.circle),
                        )).toList()))
            : const SizedBox(
                height: 7,
                width: 7,
              ),
      ],
    );
  }
}
