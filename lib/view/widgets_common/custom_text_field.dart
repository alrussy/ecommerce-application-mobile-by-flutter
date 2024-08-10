


import 'package:r_store/const/color_const.dart';
import 'package:r_store/const/package_const.dart';

Widget customTextField(hintText,icon,isPassword,controller){
  return  TextFormField(
    
    controller: controller,
          decoration: InputDecoration(
              contentPadding:const EdgeInsets.symmetric(horizontal: 5),
              isDense: true,
              filled: true,
        
              fillColor: greyColor,
              hintText: hintText,
              border: const OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              prefixIcon: Icon(icon,grade: 1),
            
              suffixIcon:isPassword?const  Icon(Icons.visibility_off):const SizedBox.shrink()));
}