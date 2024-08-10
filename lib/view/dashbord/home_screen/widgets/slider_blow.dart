import 'package:flutter/material.dart';
import 'package:r_store/const/color_const.dart';

class SliderBlowWidget extends StatelessWidget {
  const SliderBlowWidget(
      {required this.length, required this.indexCurrent, super.key});

  final int length;
  final int indexCurrent;

  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
            length,
            (index) => Container(
                  height: 10,
                  width: 10,
                  margin: const EdgeInsets.all(2),
                  decoration: BoxDecoration(
                      color: index == indexCurrent ? primaryColor : greyColor,
                      shape: BoxShape.circle),
                )).toList());
  }
}
