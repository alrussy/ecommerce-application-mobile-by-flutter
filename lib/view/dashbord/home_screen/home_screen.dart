import 'package:cached_network_image/cached_network_image.dart';
import 'package:r_store/const/color_const.dart';
import 'package:r_store/const/dest_const%20.dart';
import 'package:r_store/const/package_const.dart';
import 'package:r_store/controller/home-controller.dart';
import 'package:r_store/view/dashbord/home_screen/widgets/banner_widget.dart';
import 'package:r_store/view/dashbord/home_screen/widgets/card_products.dart';
import 'package:r_store/view/dashbord/home_screen/widgets/featured_categories.dart';
import 'package:r_store/view/dashbord/home_screen/widgets/featured_product.dart';
import 'package:r_store/view/dashbord/home_screen/widgets/home_button.dart';
import 'package:r_store/view/dashbord/home_screen/widgets/pobural_category.dart';
import 'package:r_store/view/dashbord/home_screen/widgets/search_widget.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() => controller.isloading!.value
        ? Center(child: CircularProgressIndicator())
        : Container(
            color: greyColor,
            width: context.screenWidth,
            height: context.screenHeight,
            child: SafeArea(
                child: Column(
              children: [
                const SearchWidget(),
                Expanded(
                  child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: Column(
                        children: [
                          const BannerWidget(
                              autoPlay: true,
                              showSliderBlow: true,
                              viewportFraction: 0.99),
                          10.heightBox,
                          HomeButton(
                            iconList: iconList,
                            size: homeButtonSize1,
                          ),
                          10.heightBox,
                          PoburalCategory(
                            listCategory: controller.listImageBanner,
                          ),
                          10.heightBox,
                          HomeButton(
                              iconList: iconList2, size: homeButtonSize2),
                          FeaturedCategories(
                              cats: controller.faetuerCategories),
                          10.heightBox,
                          const FeaturedProducts(),
                          10.heightBox,
                          const BannerWidget(
                              autoPlay: false,
                              showSliderBlow: false,
                              viewportFraction: 0.8),
                          CardProductWidget(),
                        ],
                      )),
                ),
              ],
            ))));
  }
}

var iconList = [
  {
    'title': 'Today Deal',
    'icon': const Icon(Icons.today_outlined, size: 35, color: Vx.blue900)
  },
  {
    'title': 'Flash Sale',
    'icon': const Icon(Icons.flash_on, size: 35, color: Vx.orange700)
  }
];
var iconList2 = [
  {
    'title': 'Top Categories',
    'icon': const Icon(Icons.vertical_align_top_outlined,
        size: 25, color: Vx.green500)
  },
  {
    'title': 'Brands',
    'icon': const Icon(Icons.tips_and_updates_outlined,
        size: 25, color: Vx.purple900)
  },
  {
    'title': 'Top Sallers',
    'icon': const Icon(Icons.arrow_circle_up, size: 25, color: Vx.yellow400)
  },
];
