import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mushaghal/controllers/popular_product_controller.dart';
import 'package:mushaghal/controllers/recommended_product_controller%20copy.dart';
import 'package:mushaghal/models/product_model.dart';
import 'package:mushaghal/pages/items/recomended_item_detail.dart';
import 'package:mushaghal/utils/colors.dart';
import 'package:mushaghal/utils/consts.dart';
import 'package:mushaghal/widgets/app_column.dart';
import 'package:mushaghal/widgets/big_text.dart';
import 'package:mushaghal/widgets/icon_and_text_widget.dart';
import 'package:mushaghal/widgets/small_text.dart';

import '../../utils/dimensions.dart';

class ShopItemsBody extends StatefulWidget {
  const ShopItemsBody({Key? key}) : super(key: key);

  @override
  State<ShopItemsBody> createState() => _ShopItemsBodyState();
}

class _ShopItemsBodyState extends State<ShopItemsBody> {
  PageController pageController =
      PageController(viewportFraction: 0.85); //for the next view visibility

  double currentPage = 0.0;
  double scaleFactor = 0.8;
  final double height = Dimensions.pageViewImageHeight;

  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      setState(() {
        currentPage = pageController.page!;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      GetBuilder<PopularProductController>(builder: (popularProducts) {
        return popularProducts.isLoaded
            ? Container(
                height: Dimensions.pageViewHeight,
                child: PageView.builder(
                    //for the scrollable thing
                    itemCount: popularProducts.popularProductList.length,
                    controller: pageController,
                    itemBuilder: (context, position) {
                      return buildHorizontalScrollingItem(position,
                          popularProducts.popularProductList[position]);
                    }),
              )
            : CircularProgressIndicator(
                color: AppColors.mainColor,
              );
      }),
      GetBuilder<PopularProductController>(builder: (popularProducts) {
        return DotsIndicator(
          dotsCount: popularProducts.popularProductList.length <= 0
              ? 1
              : popularProducts.popularProductList.length,
          position: currentPage,
          decorator: DotsDecorator(
            activeColor: AppColors.mainColor,
            size: const Size.square(9.0),
            activeSize: const Size(18.0, 9.0),
            activeShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0)),
          ),
        );
      }),
      SizedBox(height: Dimensions.l30),
      Container(
        margin: EdgeInsets.only(left: Dimensions.l30),
        alignment: Alignment.centerLeft,
        child: BigText(text: "Recommended Items"),
      ),

      ///list of items
      GetBuilder<RecommendedProductController>(builder: (recommendedProduct) {
        return recommendedProduct.isLoaded
            ? ListView.builder(
                shrinkWrap: true,

                ///makes it not possible to scroll the list. you have to scroll how its parent scrolls
                physics: NeverScrollableScrollPhysics(),
                itemCount: recommendedProduct.recommendedProductList.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.fromLTRB(
                        Dimensions.l20, 0, Dimensions.l20, Dimensions.l10),
                    child: Row(
                      children: [
                        Container(
                          width: Dimensions.listViewImageSize,
                          height: Dimensions.listViewImageSize,
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.circular(Dimensions.l20),
                              color: Colors.white38,
                              image: DecorationImage(
                                  image: NetworkImage(AppConsts.baseUrl +
                                      AppConsts.uploadUri +
                                      recommendedProduct
                                          .recommendedProductList[index].img!),
                                  fit: BoxFit.cover)),
                        ),
                        Expanded(
                          child: Container(
                            height: Dimensions.listViewTextContainerSize,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(Dimensions.l20),
                                  bottomRight: Radius.circular(Dimensions.l20)),
                              color: Colors.white,
                            ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: Dimensions.l10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  BigText(text: recommendedProduct.recommendedProductList[index].name!),
                                  SizedBox(height: Dimensions.l10),
                                  SmallText(text: "Item $index Desc"),
                                  SizedBox(height: Dimensions.l10),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: const [
                                      IconAndTextWidget(
                                          icon: Icons.circle_sharp,
                                          text: "Normal",
                                          iconColor: AppColors.iconColor1),
                                      IconAndTextWidget(
                                          icon: Icons.access_time_rounded,
                                          text: "32 min",
                                          iconColor: AppColors.iconColor2),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              )
            : CircularProgressIndicator(
                color: AppColors.mainColor,
              );
      }),
    ]);
  }

  Widget buildHorizontalScrollingItem(int index, ProductModel productModel) {
    Matrix4 matrix = Matrix4.identity();

    double currentScale = 0.8; //default for not in view

    if (index == currentPage.floor()) {
      //current slide
      currentScale = 1 - (currentPage - index) * (1 - scaleFactor);
    } else if (index == currentPage.floor() + 1) {
      //next one
      currentScale =
          scaleFactor + (currentPage - index + 1) * (1 - scaleFactor);
    } else if (index == currentPage.floor() - 1) {
      //previous one
      currentScale = 1 - (currentPage - index) * (1 - scaleFactor);
    }

    //set the scale and make it go a bit down to account for the size diff
    matrix = Matrix4.diagonal3Values(1, currentScale, 1)
      ..setTranslationRaw(0, getHeightDiff(currentScale), 0);

    //for 2 reasons, to make sure height is 220, if not container takes up full space, stack will not do that
    // we wanna add text too below it and stack allows us to place on top of it
    return Transform(
      transform: matrix,
      child: Stack(
        children: [
          Container(
            height: height,
            margin: EdgeInsets.symmetric(
                horizontal:
                    Dimensions.l10), //for space between the scroll items
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.l30),
                color: index.isEven
                    ? const Color(0xFF69c5df)
                    : const Color(0xDD9294cc),
                //just in case image doesn't load
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(AppConsts.baseUrl +
                      AppConsts.uploadUri +
                      productModel.img!),
                )),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
                height: Dimensions.pageViewTextHeight,
                margin: EdgeInsets.fromLTRB(
                    Dimensions.l30, 0, Dimensions.l30, Dimensions.l30),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Dimensions.l20),
                    color: Colors.white,
                    boxShadow: const [
                      BoxShadow(
                          color: Color(0xFFe8e8e8),
                          blurRadius: 5.0,
                          offset: Offset(0, 5)

                          ///we want less shadow
                          ),
                      BoxShadow(

                          ///remove left shadow
                          color: Colors.white,
                          offset: Offset(-5, 0)),
                      BoxShadow(

                          ///remove right shadow
                          color: Colors.white,
                          offset: Offset(5, 0)),
                    ]),
                child: Container(
                  ///for padding
                  padding: EdgeInsets.fromLTRB(
                      Dimensions.l15, Dimensions.l15, Dimensions.l15, 0),
                  child: AppColumn(text: productModel.name!),
                )),
          ),
        ],
      ),
    );
  }

  double getHeightDiff(double currentScale) {
    return height * (1 - currentScale) / 2;
  }
}
