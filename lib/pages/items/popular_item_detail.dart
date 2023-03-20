import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mushaghal/utils/consts.dart';
import 'package:mushaghal/widgets/app_column.dart';
import 'package:mushaghal/widgets/expandable_text.dart';

import '../../utils/colors.dart';
import '../../utils/dimensions.dart';
import '../../widgets/app_icon.dart';
import '../../widgets/big_text.dart';
import '../../widgets/icon_and_text_widget.dart';
import '../../widgets/small_text.dart';

class PopularItemDetail extends StatelessWidget {
  const PopularItemDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            Positioned(
              left: 0,
              right: 0,
              child: Container(
                height: Dimensions.popularItemImageSize,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage("assets/images/placeHolder.png"))),
              ),
            ),
            Positioned(
                left: Dimensions.l20,
                right: Dimensions.l20,
                top: Dimensions.l45,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    AppIcon(icon: Icons.arrow_back),
                    AppIcon(icon: Icons.shopping_cart_checkout_outlined),
                  ],
                )),
            Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                top: Dimensions.popularItemImageSize - Dimensions.l20,
                child: Container(
                  padding: EdgeInsets.all(Dimensions.l20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(Dimensions.l20),
                        topLeft: Radius.circular(Dimensions.l20)),
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const AppColumn(text: "Item name"),
                        SizedBox(height: Dimensions.l20),
                        BigText(text: "Shop Name"),
                        SizedBox(height: Dimensions.l20),
                        const ExpandableTextWidget(
                            text: AppConsts.longPlaceHolderDesc)
                      ],
                    ),
                  ),
                ))
          ],
        ),
        bottomNavigationBar: Container(
          height: Dimensions.bottomBarHeight,
          padding: EdgeInsets.symmetric(
              vertical: Dimensions.l30, horizontal: Dimensions.l20),
          decoration: BoxDecoration(
            color: AppColors.buttonBackgroundColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(Dimensions.l40),
              topRight: Radius.circular(Dimensions.l40),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.all(Dimensions.l20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimensions.l20),
                  color: Colors.white,
                ),
                child: Row(
                  children: [
                    const Icon(Icons.remove, color: AppColors.signColor),
                    SizedBox(width: Dimensions.l10),
                    BigText(text: "0"),
                    SizedBox(width: Dimensions.l10),
                    const Icon(Icons.add, color: AppColors.signColor),
                  ],
                ),
              ),
              Container(
                  padding: EdgeInsets.all(Dimensions.l20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Dimensions.l20),
                    color: AppColors.mainColor,
                  ),
                  child: BigText(
                    text: "10 AED | Add",
                    color: Colors.white,
                  )),
            ],
          ),
        ));
  }
}
