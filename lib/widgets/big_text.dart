import 'package:flutter/cupertino.dart';
import 'package:mushaghal/utils/colors.dart';
import 'package:mushaghal/utils/dimensions.dart';

class BigText extends StatelessWidget {
  final Color? color; //to make color variable
  final String text;
  final double size;
  final TextOverflow overflow;

  BigText(
      {Key? key,
      required this.text,
      this.color = AppColors.mainBlackColor,
      this.overflow = TextOverflow.ellipsis,
      this.size = 20})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: 1,
      overflow: overflow,
      style: TextStyle(
        fontFamily: 'Roboto',
        color: color,
        fontSize: size == 0 ? Dimensions.l20 : size,
        fontWeight: FontWeight.w400,
      ),
    );
  }
}
