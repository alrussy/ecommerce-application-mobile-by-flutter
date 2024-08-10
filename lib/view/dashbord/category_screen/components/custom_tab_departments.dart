import 'package:r_store/const/color_const.dart';
import 'package:r_store/const/package_const.dart';
import 'package:r_store/controller/category-details.controller.dart';
import 'package:r_store/model/department_model/department.dart';

class CustomTabDepartments extends GetView<CategoryDetailsController> {
  const CustomTabDepartments({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() => ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: controller.departments.length + 1,
          itemBuilder: (context, index) => index == 0
              ? "All"
                  .toString()
                  .text
                  .bold
                  .ellipsis
                  .letterSpacing(1)
                  .color(blackColor)
                  .makeCentered()
                  .paddingSymmetric(horizontal: 3)
                  .box
                  .margin(EdgeInsets.only(left: 10, bottom: 5, top: 5))
                  .roundedSM
                  .shadowSm
                  .color(greyColor)
                  .width(150)
                  .make()
                  .onInkTap(() {
                  controller.setCurrentSelected(index);
                })
              : controller.departments[index - 1].name
                  .toString()
                  .text
                  .bold
                  .ellipsis
                  .letterSpacing(1)
                  .color(whiteColor)
                  .makeCentered()
                  .paddingSymmetric(horizontal: 3)
                  .box
                  .margin(EdgeInsets.only(left: 10, bottom: 5, top: 5))
                  .roundedSM
                  .shadowSm
                  .color(primaryColor)
                  .width(150)
                  .make()
                  .onInkTap(() {
                  controller.setCurrentSelected(index);
                }),
        ).box.height(50).make());
  }
}
