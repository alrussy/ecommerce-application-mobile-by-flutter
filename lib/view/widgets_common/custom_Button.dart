import 'package:r_store/const/color_const.dart';
import 'package:r_store/const/package_const.dart';

Widget customButton(String text, fun, bool isBorderRadius, {hieght,width}) {
  return ElevatedButton(
          onPressed: fun,
          style: ButtonStyle(
            shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                borderRadius: isBorderRadius
                    ? const BorderRadius.all(Radius.circular(10))
                    : BorderRadius.zero)),
            backgroundColor:fun==null?const MaterialStatePropertyAll(greyColor): const MaterialStatePropertyAll(primaryColor),
          ),
          child: text.text.bold.size(18).white.make())
      .box
      .height(hieght ?? 40)
      .width(width??Get.width)
      .make();
}
