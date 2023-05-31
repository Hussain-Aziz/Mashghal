import 'package:flutter/material.dart';
import 'package:mushaghal/widgets/big_text.dart';
import 'package:mushaghal/widgets/icon_and_text_widget.dart';
import 'package:mushaghal/widgets/small_text.dart';

import '../utils/colors.dart';
import '../utils/dimensions.dart';

class ShopColumn extends StatelessWidget {
  final String name;
  final String description;
  const ShopColumn({super.key, required this.name, required this.description});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(child: BigText(text: name, size: 26.scale())),
        SizedBox(height: 10.scale()),
        Row(
          children: [
            Wrap(
              ///horizontally create multiple items
              children: List.generate(
                  5,
                  (index) => const Icon(Icons.star,
                      color: AppColors.iconColor2, size: 15)),
            ),
            const SizedBox(width: 10),
            SmallText(text: "4.5"),
            const SizedBox(width: 10),
            SmallText(text: "1287"),
            const SizedBox(width: 5),
            SmallText(text: "reviews"),
          ],
        ),
        SizedBox(height: 20.scale()),
        SmallText(
          text: description,
          color: Color.fromARGB(255, 114, 114, 114),
        ),
      ],
    );
  }
}
