import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mushaghal/controllers/popular_product_controller.dart';
import 'package:mushaghal/pages/home/main_item_page.dart';
import 'package:mushaghal/routes/route_helper.dart';
import 'package:mushaghal/utils/consts.dart';
import 'package:mushaghal/widgets/app_column.dart';
import 'package:mushaghal/widgets/expandable_text.dart';
import 'package:get/get.dart';
import 'package:mushaghal/utils/colors.dart';
import 'package:mushaghal/utils/dimensions.dart';
import 'package:mushaghal/widgets/app_icon.dart';
import 'package:mushaghal/widgets/big_text.dart';

class PopularItemDetail extends StatelessWidget {
  int pageId;
  PopularItemDetail({Key? key, required this.pageId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var product =
        Get.find<PopularProductController>().popularProductList[pageId];
    return Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            Positioned(
              left: 0,
              right: 0,
              child: Hero(
                tag: "popular-item-$pageId",
                child: Container(
                  height: Dimensions.popularItemImageSize,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(AppConsts.baseUrl +
                              AppConsts.uploadUri +
                              product.img!))),
                ),
              ),
            ),
            Positioned(
                left: Dimensions.l20,
                right: Dimensions.l20,
                top: Dimensions.l45,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                        onTap: () => Get.toNamed(RouteHelper.getInitial()),
                        child: AppIcon(icon: Icons.arrow_back)),
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
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(Dimensions.l20),
                        topLeft: Radius.circular(Dimensions.l20)),
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppColumn(text: product.name!),
                        SizedBox(height: Dimensions.l20),
                        BigText(text: "Shop Name"),
                        SizedBox(height: Dimensions.l20),
                        ExpandableTextWidget(text: product.description!)
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
                    text: "${product.price} AED | Add",
                    color: Colors.white,
                  )),
            ],
          ),
        ));
  }
}
