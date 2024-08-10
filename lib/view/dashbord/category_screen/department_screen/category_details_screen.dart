import 'package:r_store/const/package_const.dart';
import 'package:r_store/controller/category-details.controller.dart';
import 'package:r_store/view/dashbord/category_screen/components/card_product.dart';
import 'package:r_store/view/dashbord/category_screen/components/custom_tab_departments.dart';
import 'package:r_store/view/widgets_common/bg_app.dart';
import 'package:r_store/view/widgets_common/custom_app_bar.dart';

class CategoryDetailsScreen extends GetView<CategoryDetailsController> {
  const CategoryDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return 
       bgAppWidget(children: [
        CustomAppBar(title: controller.category!.name!),
        20.heightBox,
        const CustomTabDepartments(),
        20.heightBox,
        CardProduct()
      ]);
    
  }
}
