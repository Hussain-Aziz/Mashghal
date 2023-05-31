import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mushaghal/controllers/product_controller.dart';
import 'package:mushaghal/models/product_model.dart';
import 'package:mushaghal/routes/route_helper.dart';
import 'package:mushaghal/utils/colors.dart';
import 'package:mushaghal/utils/consts.dart';
import 'package:mushaghal/widgets/big_text.dart';
import 'package:mushaghal/widgets/icon_and_text_widget.dart';
import 'package:mushaghal/widgets/shop_column.dart';
import 'package:mushaghal/widgets/small_text.dart';
import 'package:mushaghal/utils/dimensions.dart';

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
      GetBuilder<ProductController>(builder: (products) {
        return products.isLoaded
            ? Container(
                height: Dimensions.pageViewHeight,
                child: PageView.builder(
                    //for the scrollable thing
                    itemCount: products.popularProductList.length,
                    controller: pageController,
                    itemBuilder: (context, position) {
                      return buildHorizontalScrollingItem(
                          position, products.popularProductList[position]);
                    }),
              )
            : CircularProgressIndicator(
                color: AppColors.mainColor,
              );
      }),
      GetBuilder<ProductController>(builder: (products) {
        return DotsIndicator(
          dotsCount: products.popularProductList.length <= 0
              ? 1
              : products.popularProductList.length,
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
      SizedBox(height: 30.scale()),
      Container(
        margin: EdgeInsets.only(left: 30.scale()),
        alignment: Alignment.centerLeft,
        child: BigText(text: "Recommended Items"),
      ),

      ///list of items
      GetBuilder<ProductController>(builder: (product) {
        return product.isLoaded
            ? ListView.builder(
                shrinkWrap: true,

                ///makes it not possible to scroll the list. you have to scroll how its parent scrolls
                physics: NeverScrollableScrollPhysics(),
                itemCount: product.recommendedProductList.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () =>
                        Get.toNamed(RouteHelper.getRecommendedItem(index)),
                    child: Container(
                      margin: EdgeInsets.fromLTRB(
                          20.scale(), 0, 20.scale(), 10.scale()),
                      child: Row(
                        children: [
                          Hero(
                            tag: "${ProductType.recommended}-item-$index",
                            child: Container(
                              width: Dimensions.listViewImageSize,
                              height: Dimensions.listViewImageSize,
                              decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.circular(20.scale()),
                                  color: Colors.white38,
                                  image: DecorationImage(
                                      image: AssetImage(AppConsts.uploadUri +
                                          product.recommendedProductList[index]
                                              .img!),
                                      fit: BoxFit.cover)),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              height: Dimensions.listViewTextContainerSize,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(20.scale()),
                                    bottomRight: Radius.circular(20.scale())),
                                color: Colors.white,
                              ),
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 10.scale()),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    BigText(
                                        text: product
                                            .recommendedProductList[index]
                                            .name!),
                                    SizedBox(height: 10.scale()),
                                    SmallText(
                                        text: product
                                            .recommendedProductList[index]
                                            .description!),
                                    SizedBox(height: 10.scale()),
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
          GestureDetector(
            onTap: () => Get.toNamed(RouteHelper.getPopularItem(index)),
            child: Hero(
              tag: "${ProductType.popular}-item-$index",
              child: Container(
                height: height,
                margin: EdgeInsets.symmetric(
                    horizontal:
                        10.scale()), //for space between the scroll items
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30.scale()),
                    color: index.isEven
                        ? const Color(0xFF69c5df)
                        : const Color(0xDD9294cc),
                    //just in case image doesn't load
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(AppConsts.uploadUri +
                          productModel.img!),
                    )),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
                height: Dimensions.pageViewTextHeight,
                margin:
                    EdgeInsets.fromLTRB(30.scale(), 0, 30.scale(), 30.scale()),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.scale()),
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
                      15.scale(), 15.scale(), 15.scale(), 0),
                  child: ShopColumn(
                    name: productModel.name!,
                    description: productModel.description!,
                  ),
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
