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
              margin: EdgeInsets.only(top: 45.scale(), bottom: 15.scale()),
              padding: EdgeInsets.symmetric(horizontal: 20.scale()),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //creates as much space between as possible
                children: [
                  Column(
                    children: const [
                      SizedBox(
                        width: 160,
                        height: 40,
                        child: Image(
                          image: AssetImage("assets/images/mushaghal_logo.png"),
                        ),
                      ),
                    ],
                  ),
                  Center(
                    child: Container(
                      width: 45.scale(),
                      height: 45.scale(),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.scale()),
                        color: AppColors.mainColor,
                      ),
                      child: Icon(Icons.search,
                          color: Colors.white, size: 24.scale()),
                    ),
                  )
                ],
              )),
        ),
        //body
        Expanded(child: SingleChildScrollView(child: ShopItemsBody())),
      ],
    ));
  }
}
