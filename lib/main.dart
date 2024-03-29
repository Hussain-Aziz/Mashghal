import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mushaghal/controllers/cart_controller.dart';
import 'package:mushaghal/controllers/product_controller.dart';
import 'package:mushaghal/pages/home/main_item_page.dart';
import 'package:mushaghal/helper/dependencies.dart' as dep;
import 'package:mushaghal/routes/route_helper.dart';
import 'package:mushaghal/utils/consts.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dep.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Get.find<ProductController>().fetchProductList();
    return GetBuilder<CartController>(builder: (_) {
      return GetMaterialApp(
        title: AppConsts.appName,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        debugShowCheckedModeBanner: false,
        home: MainItemPage(),
        initialRoute: RouteHelper.initial,
        getPages: RouteHelper.routes,
      );
    });
  }
}
