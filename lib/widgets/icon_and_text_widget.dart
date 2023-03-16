import 'package:flutter/cupertino.dart';
import 'package:mushaghal/utils/dimensions.dart';
import 'package:mushaghal/widgets/small_text.dart';

class IconAndTextWidget extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color iconColor;
  final Color? color;

  const IconAndTextWidget(
      {Key? key,
      required this.icon,
      required this.text,
      required this.iconColor,
      this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: iconColor, size: Dimensions.iconSize24),
        const SizedBox(width: 5),
        SmallText(
          text: text,
          color: color,
        )
      ],
    );
  }
}
