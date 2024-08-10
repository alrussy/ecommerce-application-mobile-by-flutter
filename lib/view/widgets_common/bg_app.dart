import 'package:r_store/const/color_const.dart';
import 'package:r_store/const/package_const.dart';

Widget bgAppWidget({ List<Widget>? children,hight}) {
  return Scaffold(
      backgroundColor: backgroundColor,
      body: Stack(clipBehavior: Clip.none, children: [
        Container(
          height:hight?? (Get.window.physicalSize.width * 0.2),
          width: double.infinity,
          decoration: const BoxDecoration(
            color: primaryColor,
          ),
        ),
        SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(top: 10, left: 5),
            child: Align(
                alignment: Alignment.topCenter,
                child: Column(children: children!)),
          ),
        ),
      ]));
}
