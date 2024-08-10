import 'package:get/get.dart';
import 'package:r_store/const/dest_const%20.dart';
import 'package:r_store/const/package_const.dart';
import 'package:r_store/const/color_const.dart';
import 'package:r_store/const/router_const.dart';
import 'package:r_store/controller/login-controller.dart';
import 'package:r_store/view/widgets_common/bg_auth_widget.dart';
import 'package:r_store/view/widgets_common/custom_Button.dart';
import 'package:r_store/view/widgets_common/custom_text_field.dart';
import 'package:social_auth_buttons/social_auth_buttons.dart';

class LoginScreen extends GetView<LoginController> {
  const LoginScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return bgAuthWidget(
      [
        'Email'
            .text
            .color(textColor)
            .bold
            .size(textTitleFontSize.toDouble())
            .make(),
        customTextField("Email", Icons.person, false, controller.email),
        10.heightBox,
        'Password'
            .text
            .color(textColor)
            .bold
            .size(textTitleFontSize.toDouble())
            .make(),
        customTextField("*******", Icons.password, true, controller.password),
       
        Align(
          alignment: Alignment.topRight,
        
          child: TextButton(
              onPressed: () {},
              style: const ButtonStyle(
                  padding: MaterialStatePropertyAll(EdgeInsets.zero)),
              child: 'Forget Password'.text.blue500.underline.make()),
        ),
        customButton('Login', () => controller.login(), true),
      
        10.heightBox,
        GoogleAuthButton(
          onPressed: () {},
          padding: EdgeInsets.zero,
          darkMode: false,
        ),
        10.heightBox,
        FacebookAuthButton(
          onPressed: () {},
          padding: EdgeInsets.zero,
          darkMode: false,
        ),
        10.heightBox,
        Center(
          child: "if you have not account press here  "
              .richText
              .withTextSpanChildren([
            "SignUp".textSpan.bold.underline.color(primaryColor).tap(() {
              Get.toNamed(signUpScreen);
            }).make(),
          ]).make(),
        ),
      ],
    );
  }
}
