import 'package:get/get.dart';
import 'package:r_store/const/color_const.dart';
import 'package:r_store/const/dest_const%20.dart';
import 'package:r_store/const/package_const.dart';
import 'package:r_store/const/router_const.dart';
import 'package:r_store/controller/login-controller.dart';
import 'package:r_store/view/widgets_common/bg_auth_widget.dart';
import 'package:r_store/view/widgets_common/custom_Button.dart';
import 'package:r_store/view/widgets_common/custom_text_field.dart';

class SignUpScreen extends GetView<LoginController> {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return bgAuthWidget([
      'User Name'
          .text
          .color(textColor)
          .bold
          .size(textTitleFontSize.toDouble())
          .make(),
      customTextField("User Name", Icons.person, false, controller.email),
      10.heightBox,
      'Email'
          .text
          .color(textColor)
          .bold
          .size(textTitleFontSize.toDouble())
          .make(),
      customTextField("Email", Icons.email, false, controller.password),
      10.heightBox,
      'Phone'
          .text
          .color(textColor)
          .bold
          .size(textTitleFontSize.toDouble())
          .make(),
      customTextField("Phone", Icons.phone_android, false, controller.email),
      10.heightBox,
      'password'
          .text
          .color(textColor)
          .bold
          .size(textTitleFontSize.toDouble())
          .make(),
      customTextField("Password", Icons.password, true, controller.email),
      10.heightBox,
      customButton('SignUp', () => print("login"),true),
      Center(
        child:
            "if you have account press here  ".richText.withTextSpanChildren([
          "Login".textSpan.bold.underline.color(primaryColor).tap(() {
            Get.toNamed(loginScreen);
          }).make(),
        ]).make(),
      ),
    ]);
  }
}
