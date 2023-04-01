import 'package:flutter/material.dart';
import 'package:mushaghal/controllers/cart_controller.dart';
import 'package:mushaghal/controllers/popular_product_controller.dart';
import 'package:mushaghal/utils/consts.dart';
import 'package:mushaghal/widgets/app_column.dart';
import 'package:mushaghal/widgets/expandable_text.dart';
import 'package:get/get.dart';
import 'package:mushaghal/utils/colors.dart';
import 'package:mushaghal/utils/dimensions.dart';
import 'package:mushaghal/widgets/app_icon.dart';
import 'package:mushaghal/widgets/big_text.dart';

class PopularItemDetail extends StatelessWidget {
  final int pageId;
  PopularItemDetail({super.key, required this.pageId});

  @override
  Widget build(BuildContext context) {
    var product = Get.find<PopularProductController>().productList[pageId];
    Get.find<PopularProductController>()
        .initProduct(product, Get.find<CartController>());
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
                left: 20.scale(),
                right: 20.scale(),
                top: 45.scale(),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                        onTap: () => Get.back(),
                        child: AppIcon(icon: Icons.arrow_back)),
                    GetBuilder<PopularProductController>(builder: (controller) {
                      var items =
                          Get.find<PopularProductController>().totalCartItems;
                      return Stack(
                        children: [
                          AppIcon(icon: Icons.shopping_cart_checkout_outlined),
                          if (items > 0) ...[
                            Positioned(
                                right: 0,
                                top: 0,
                                child: AppIcon(
                                  icon: Icons.circle,
                                  size: 20,
                                  iconColor: Colors.transparent,
                                  backgroundColor: AppColors.mainColor,
                                )),
                            Positioned(
                                right: 6,
                                top: 3,
                                child: BigText(
                                  text: items.toString(),
                                  size: 12,
                                  color: Colors.white,
                                )),
                          ]
                        ],
                      );
                    }),
                  ],
                )),
            Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                top: Dimensions.popularItemImageSize - 20.scale(),
                child: Container(
                  padding: EdgeInsets.all(20.scale()),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(20.scale()),
                        topLeft: Radius.circular(20.scale())),
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppColumn(text: product.name!),
                        SizedBox(height: 20.scale()),
                        BigText(text: "Shop Name"),
                        SizedBox(height: 20.scale()),
                        ExpandableTextWidget(text: product.description!)
                      ],
                    ),
                  ),
                ))
          ],
        ),
        bottomNavigationBar: GetBuilder<PopularProductController>(
            builder: (popularProductController) {
          return Container(
            height: Dimensions.bottomBarHeight,
            padding: EdgeInsets.symmetric(
                vertical: 30.scale(), horizontal: 20.scale()),
            decoration: BoxDecoration(
              color: AppColors.buttonBackgroundColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40.scale()),
                topRight: Radius.circular(40.scale()),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: EdgeInsets.all(20.scale()),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.scale()),
                    color: Colors.white,
                  ),
                  child: Row(
                    children: [
                      GestureDetector(
                          onTap: () => popularProductController.addQuantity(
                              decrement: true),
                          child:
                              Icon(Icons.remove, color: AppColors.signColor)),
                      SizedBox(width: 10.scale()),
                      BigText(text: "${popularProductController.totalItems}"),
                      SizedBox(width: 10.scale()),
                      GestureDetector(
                          onTap: () {
                            popularProductController.addQuantity();
                          },
                          child: Icon(Icons.add, color: AppColors.signColor)),
                    ],
                  ),
                ),
                Container(
                    padding: EdgeInsets.all(20.scale()),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.scale()),
                      color: AppColors.mainColor,
                    ),
                    child: GestureDetector(
                      onTap: () {
                        popularProductController.addItem(product);
                      },
                      child: BigText(
                        text: "AED ${product.price} | Add",
                        color: Colors.white,
                      ),
                    )),
              ],
            ),
          );
        }));
  }
}
