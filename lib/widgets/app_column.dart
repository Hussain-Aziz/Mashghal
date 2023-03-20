import 'package:flutter/material.dart';
import 'package:mushaghal/widgets/big_text.dart';
import 'package:mushaghal/widgets/icon_and_text_widget.dart';
import 'package:mushaghal/widgets/small_text.dart';

import '../utils/colors.dart';
import '../utils/dimensions.dart';

class AppColumn extends StatelessWidget {
  final String text;
  const AppColumn({Key? key,
    required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BigText(text: text, size: Dimensions.l26),
        SizedBox(height: Dimensions.l10),
        Row(
          children: [
            Wrap( ///horizontally create multiple items
              children: List.generate(5, (index) => const Icon(Icons.star, color: AppColors.mainColor, size: 15)),
            ),
            const SizedBox(width: 10),
            SmallText(text: "4.5"),
            const SizedBox(width: 10),
            SmallText(text: "1287"),
            const SizedBox(width: 5),
            SmallText(text: "reviews"),
          ],
        ),
        SizedBox(height: Dimensions.l20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: const [
            IconAndTextWidget(icon: Icons.circle_sharp,
                text: "Normal",
                iconColor: AppColors.iconColor1),
            IconAndTextWidget(icon: Icons.access_time_rounded,
                text: "32 min",
                iconColor: AppColors.iconColor2),
          ],
        ),
      ],
    );
  }
}
