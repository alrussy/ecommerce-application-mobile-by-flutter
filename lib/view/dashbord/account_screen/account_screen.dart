import 'package:r_store/const/color_const.dart';
import 'package:r_store/const/package_const.dart';
import 'package:r_store/model/sku-product.dart';
import 'package:r_store/view/widgets_common/bg_app.dart';
import 'package:r_store/view/widgets_common/custom_app_bar.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return bgAppWidget(hight: Get.window.physicalSize.width * 0.5, children: [
      const CustomAppBar(
        title: "",
      ),
      10.heightBox,
      userInfoSection(),
      40.heightBox,
      detailsSection(),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Icon(Icons.language,
                  color: const Color.fromARGB(214, 255, 255, 255)),
              "Language"
                  .text
                  .color(const Color.fromARGB(214, 255, 255, 255))
                  .make(),
            ],
          ).box.height(50).make(),
          Column(
            children: [
              Icon(Icons.edit_square,
                  color: const Color.fromARGB(214, 255, 255, 255)),
              "Edit Profile"
                  .text
                  .color(const Color.fromARGB(214, 255, 255, 255))
                  .make(),
            ],
          ).box.height(50).make(),
          Column(
            children: [
              Icon(Icons.location_on_outlined,
                  color: const Color.fromARGB(214, 255, 255, 255)),
              "Address"
                  .text
                  .color(const Color.fromARGB(214, 255, 255, 255))
                  .make(),
            ],
          ).box.height(50).make()
        ],
      ).marginSymmetric(horizontal: 50, vertical: 15),
      Column(
        children: [
          ListTile(
            title: "My Orders".text.bold.medium.make(),
            leading: Icon(Icons.list_alt),
          ).marginSymmetric(vertical: 5),
          ListTile(
            title: "My WishList".text.bold.medium.make(),
            leading: Icon(Icons.favorite_outline_outlined),
          ),
          ListTile(
            title: "My Orders".text.bold.medium.make(),
            leading: Icon(Icons.list_alt),
          ),
        ],
      ).box.white.roundedSM.margin(Vx.m8).make().expand()
    ]);
  }
}

detailsSection() {
  return Row(
    children: [
      ...List.generate(
          3,
          (index) => Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  "09".text.bold.makeCentered(),
                  "in your cart".text.bold.make(),
                ],
              )
                  .box
                  .width(Get.width * 0.3)
                  .height(60)
                  .white
                  .roundedSM
                  .make()
                  .marginSymmetric(horizontal: 5))
    ],
  );
}

userInfoSection() {
  return Row(
    children: [
      const CircleAvatar(
        backgroundImage: AssetImage(appLogo),
        radius: 30,
      )
          .box
          .clip(Clip.hardEdge)
          .roundedFull
          .p3
          .black
          .make()
          .marginSymmetric(horizontal: 5),
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            "Ahmed Alrussy".text.bold.white.make(),
            "Alrussy@gmail.com".text.color(Colors.white70).make()
          ],
        ),
      ),
      "Logout"
          .text
          .bold
          .white
          .lg
          .makeCentered()
          .box
          .rounded
          .p8
          .border()
          .make()
          .onTap(() {})
    ],
  ).paddingSymmetric(horizontal: 10);
}
