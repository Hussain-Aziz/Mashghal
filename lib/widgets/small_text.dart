import 'package:flutter/cupertino.dart';
import 'package:mushaghal/utils/colors.dart';

class SmallText extends StatelessWidget {
  final Color? color; //to make color variable
  final String text;
  final double size;
  final double height;

  SmallText(
      {Key? key,
      required this.text,
      this.color = AppColors.textColor,
      this.size = 12,
      this.height = 1.2})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontFamily: 'Roboto',
        color: color,
        fontSize: size,
        height: height,
      ),
    );
  }
}
