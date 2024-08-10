import 'package:r_store/const/color_const.dart';
import 'package:r_store/const/package_const.dart';
import 'package:r_store/controller/cart-controller.dart';
import 'package:r_store/controller/test-controller.dart';
import 'package:r_store/model/address.dart';
import 'package:r_store/model/cart.dart';
import 'package:r_store/view/widgets_common/custom_Button.dart';

class MyTestSocket extends GetView<TestController> {
  const MyTestSocket({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("My Test Page"),
        ),
        body: Center(child: Text("hello........!!"),));
  }
}
