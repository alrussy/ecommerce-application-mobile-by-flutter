

import 'package:r_store/const/color_const.dart';
import 'package:r_store/const/dest_const%20.dart';
import 'package:r_store/const/package_const.dart';
import 'package:r_store/view/widgets_common/applogo_widget.dart';

Widget bgAuthWidget(List<Widget> children){
return 
Scaffold(
      backgroundColor: backgroundColor,
      body:
Stack(
   clipBehavior: Clip.none,
children: [
 Container(
        height: (Get.window.physicalSize.width * 0.3),
        width: double.infinity,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20)),
          color: primaryColor,
        ),
      )
      ,
      SafeArea(
       child: Padding(
         padding: const EdgeInsets.only(top:50),
         child: Align(
          alignment: Alignment.topCenter,
          child: appLogoWidgit()),
       ),
     ),

     Positioned(
      top:50+logoSize.height+100,
      left: 20,
      right: 20,
       child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children:children
        )
       .box
       
      
     . padding(const EdgeInsets.all(20)).white.rounded.shadow2xl.make()
     )
      
      ])
      );
}