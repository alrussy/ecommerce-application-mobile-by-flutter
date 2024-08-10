import 'package:r_store/const/color_const.dart';
import 'package:r_store/const/package_const.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar(
      {required this.title,
      this.toEnd = false,
      this.icon,
      this.backFun,
      super.key});

  final String title;
  final bool toEnd;
  final IconData? icon;
  final  Function()? backFun;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment:
          toEnd ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        IconButton(
            icon: Icon(
              icon ?? Icons.arrow_back_sharp,
              color: whiteColor,
            ),
            onPressed: backFun ?? () => print("===================")),
        title.text.semiBold.size(16).make().paddingSymmetric(horizontal: 10),
      ],
    );
  }
}
