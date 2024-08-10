import 'package:r_store/const/color_const.dart';
import 'package:r_store/const/package_const.dart';

class HomeButton extends StatelessWidget {
  final List iconList;
  final Size size;
  const HomeButton({super.key, required this.iconList,required this.size});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ...List.generate(iconList.length, (index) {
          String title = iconList[index]['title'];
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              iconList[index]['icon'],
              title.text.bold.color(blackColor).make()
            ],
          )
              .onInkTap(() {
                print(title);
              })
              .box
              .white
              .shadowSm
              .rounded
              .width(size.width)
              .height(size.height)
              .margin(const EdgeInsets.all(2.5))
              .make();
        }).toList()
      ],
    );
  }
}
