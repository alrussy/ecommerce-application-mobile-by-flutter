import 'package:r_store/const/color_const.dart';
import 'package:r_store/const/package_const.dart';
import 'package:r_store/view/widgets_common/applogo_widget.dart';



class SplachScreen extends StatelessWidget {
  const SplachScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: primaryColor,
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          (context.screenHeight * 0.4).heightBox,
          appLogoWidgit(),
          appName.text.white.bold.size(16).make(),
          version.text.white.make(),
          const Spacer(),
          cradite.text.bold.white.make(),
          10.heightBox,
        ],
      )),
    );
  }
}
