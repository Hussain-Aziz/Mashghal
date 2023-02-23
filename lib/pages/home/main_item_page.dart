import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mushaghal/pages/home/shop_items_body.dart';
import 'package:mushaghal/utils/colors.dart';
import 'package:mushaghal/utils/dimensions.dart';

class MainItemPage extends StatefulWidget {
  const MainItemPage({Key? key}) : super(key: key);

  @override
  State<MainItemPage> createState() => _MainItemPageState();
}

class _MainItemPageState extends State<MainItemPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          //we have 3 main "parts" that want want to be aranged vertically
          children: [
            //header
            Container(
              child: Container(
                  margin: EdgeInsets.only(top: Dimensions.l45, bottom: Dimensions.l15),
                  padding: EdgeInsets.symmetric(horizontal: Dimensions.l20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //creates as much space between as possible
                    children: [
                      Column(
                        children: const [
                          SizedBox(
                            width: 160,
                            height: 40,
                            child: Image(image: AssetImage("assets/images/mushaghal_logo.png"),
                            ),
                          ),
                        ],
                      ),
                      Center(
                        child: Container(
                          width: Dimensions.l45,
                          height: Dimensions.l45,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(Dimensions.l15),
                            color: AppColors.mainColor,
                          ),
                          child: Icon(Icons.search, color: Colors.white, size: Dimensions.iconSize24),
                        ),
                      )
                    ],
                  )),
            ),
            //body
            Expanded(
                child: SingleChildScrollView(
                    child: ShopItemsBody()
                )
            ),
          ],
        ));
  }
}
