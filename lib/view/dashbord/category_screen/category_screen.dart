import 'package:r_store/const/package_const.dart';
import 'package:r_store/controller/dashbord-controller.dart';
import 'package:r_store/view/dashbord/category_screen/components/card-_category.dart';
import 'package:r_store/view/widgets_common/bg_app.dart';
import 'package:r_store/view/widgets_common/custom_app_bar.dart';

class CategoryScreen extends GetView<DashbordController> {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
     
    return bgAppWidget(children: [
       CustomAppBar(title:  'Categories',backFun: () => controller.navigation(0),),
      50.heightBox,
      const CardCategory()
    ]);
  }
}