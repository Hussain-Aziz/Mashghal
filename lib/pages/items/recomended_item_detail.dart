// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:mushaghal/utils/colors.dart';
import 'package:mushaghal/utils/consts.dart';
import 'package:mushaghal/utils/dimensions.dart';
import 'package:mushaghal/widgets/app_icon.dart';
import 'package:mushaghal/widgets/expandable_text.dart';

import '../../widgets/big_text.dart';

class RecomendedItemDetail extends StatelessWidget {
  const RecomendedItemDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            toolbarHeight: 80,
            title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppIcon(icon: Icons.arrow_back),
                  AppIcon(icon: Icons.shopping_cart_checkout_outlined),
                ]),
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
                      text: "Item Name",
                    ),
                  )),
            ),
            pinned: true,
            expandedHeight: 300,
            backgroundColor: AppColors.yellowColor,
            flexibleSpace: FlexibleSpaceBar(
                background: Image.asset(
              "assets/images/placeHolder.png",
              width: double.maxFinite,
              fit: BoxFit.cover,
            )),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(horizontal: Dimensions.l20),
                  child: ExpandableTextWidget(
                    text: Consts.longPlaceHolderDesc +
                        Consts.longPlaceHolderDesc +
                        Consts.longPlaceHolderDesc,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
      bottomNavigationBar: Column(mainAxisSize: MainAxisSize.min, children: [
        Container(
          padding: EdgeInsets.symmetric(
              horizontal: Dimensions.l20 * 2.5, vertical: Dimensions.l10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppIcon(
                icon: Icons.remove,
                backgroundColor: AppColors.mainColor,
                iconSize: Dimensions.l24,
                iconColor: Colors.white,
              ),
              BigText(
                text: "10 AED X 0",
                color: AppColors.mainBlackColor,
                size: Dimensions.l26,
              ),
              AppIcon(
                icon: Icons.add,
                backgroundColor: AppColors.mainColor,
                iconSize: Dimensions.l24,
                iconColor: Colors.white,
              ),
            ],
          ),
        ),
        Container(
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
                  child: Icon(
                    Icons.favorite,
                    color: AppColors.mainColor,
                    size: Dimensions.l40,
                  )),
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
        )
      ]),
    );
  }
}
