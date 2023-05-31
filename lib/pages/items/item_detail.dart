import 'package:flutter/material.dart';
import 'package:mushaghal/controllers/cart_controller.dart';
import 'package:mushaghal/controllers/product_controller.dart';
import 'package:mushaghal/utils/colors.dart';
import 'package:mushaghal/utils/consts.dart';
import 'package:mushaghal/utils/dimensions.dart';
import 'package:mushaghal/widgets/app_icon.dart';
import 'package:mushaghal/widgets/expandable_text.dart';
import 'package:get/get.dart';
import 'package:mushaghal/widgets/big_text.dart';

class ItemDetail extends StatelessWidget {
  final int pageId;
  final ProductType productType;
  ItemDetail({super.key, required this.pageId, required this.productType});

  @override
  Widget build(BuildContext context) {
    var product =
        Get.find<ProductController>().getProductList(productType)[pageId];
    Get.find<ProductController>()
        .initProduct(product, Get.find<CartController>());
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            toolbarHeight: 80,
            automaticallyImplyLeading: false,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                    onTap: () => Get.back(),
                    child: AppIcon(icon: Icons.arrow_back)),
                GetBuilder<ProductController>(builder: (controller) {
                  var items = Get.find<ProductController>().totalCartItems;
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
            ),
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(20),
              child: Container(
                  width: double.maxFinite,
                  padding: EdgeInsets.only(top: 5, bottom: 10),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      )),
                  child: Center(
                    child: BigText(
                      text: product.name!,
                    ),
                  )),
            ),
            pinned: true,
            expandedHeight: 300,
            backgroundColor: AppColors.yellowColor,
            flexibleSpace: FlexibleSpaceBar(
                background: Hero(
                    tag: "$productType-item-$pageId",
                    child: Image.asset(AppConsts.uploadUri + product.img!,
                      width: double.maxFinite,
                      fit: BoxFit.cover,
                    ))),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 20.scale()),
                  child: ExpandableTextWidget(text: product.description!),
                ),
              ],
            ),
          )
        ],
      ),
      bottomNavigationBar: GetBuilder<ProductController>(
          builder: (recommendedProductController) {
        return Column(mainAxisSize: MainAxisSize.min, children: [
          Container(
            padding: EdgeInsets.symmetric(
                horizontal: 50.scale(), vertical: 10.scale()),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () =>
                      recommendedProductController.addQuantity(decrement: true),
                  child: AppIcon(
                    icon: Icons.remove,
                    backgroundColor: AppColors.mainColor,
                    iconSize: 24.scale(),
                    iconColor: Colors.white,
                  ),
                ),
                BigText(
                  text:
                      "${product.price!} AED X ${recommendedProductController.totalItems}",
                  color: AppColors.mainBlackColor,
                  size: 26.scale(),
                ),
                GestureDetector(
                    onTap: () {
                      recommendedProductController.addQuantity();
                    },
                    child: AppIcon(
                      icon: Icons.add,
                      backgroundColor: AppColors.mainColor,
                      iconSize: 24.scale(),
                      iconColor: Colors.white,
                    )),
              ],
            ),
          ),
          Container(
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
                    child: Icon(
                      Icons.favorite,
                      color: AppColors.mainColor,
                      size: 40.scale(),
                    )),
                Container(
                    padding: EdgeInsets.all(20.scale()),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.scale()),
                      color: AppColors.mainColor,
                    ),
                    child: GestureDetector(
                      onTap: () =>
                          recommendedProductController.addItem(product),
                      child: BigText(
                        text: "${product.price} AED | Add",
                        color: Colors.white,
                      ),
                    )),
              ],
            ),
          )
        ]);
      }),
    );
  }
}
