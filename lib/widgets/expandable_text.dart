import 'package:flutter/material.dart';
import 'package:mushaghal/widgets/small_text.dart';

import '../utils/colors.dart';
import '../utils/dimensions.dart';

class ExpandableTextWidget extends StatefulWidget {
  final String text;

  const ExpandableTextWidget({super.key, required this.text});

  @override
  State<ExpandableTextWidget> createState() => _ExpandableTextWidgetState();
}

class _ExpandableTextWidgetState extends State<ExpandableTextWidget> {
  late String firstHalf;
  late String secondHalf;

  bool flag = true;
  double textHeight = Dimensions.screenHeight / 5.63;
  @override
  void initState() {
    super.initState();
    if (widget.text.length > textHeight) {
      firstHalf = widget.text.substring(0, textHeight.toInt());
      secondHalf =
          widget.text.substring(textHeight.toInt() + 1, widget.text.length);
    } else {
      firstHalf = widget.text;
      secondHalf = "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 80.scale()),
      child: secondHalf.isEmpty
          ? SmallText(
              size: 16,
              text: firstHalf,
              color: AppColors.paraColor,
              height: 1.8,
            )
          : Column(
              children: <Widget>[
                SmallText(
                  size: 16,
                  height: 1.8,
                  text: flag ? ("$firstHalf...") : (firstHalf + secondHalf),
                  color: AppColors.paraColor,
                ),
                const SizedBox(
                  height: 5,
                ),
                InkWell(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      SmallText(
                        text: flag ? "Show more" : "Show less",
                        color: AppColors.mainColor,
                        size: 14,
                      ),
                      Icon(
                        flag
                            ? Icons.keyboard_arrow_down_outlined
                            : Icons.keyboard_arrow_up_outlined,
                        color: AppColors.mainColor,
                      )
                    ],
                  ),
                  onTap: () {
                    setState(() {
                      flag = !flag;
                    });
                  },
                ),
                const SizedBox(
                  height: 50,
                )
              ],
            ),
    );
  }
}
