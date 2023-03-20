import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mushaghal/controllers/popular_product_controller.dart';
import 'package:mushaghal/controllers/recommended_product_controller%20copy.dart';
import 'package:mushaghal/pages/home/main_item_page.dart';
import 'package:mushaghal/helper/dependencies.dart' as dep;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dep.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Get.find<PopularProductController>().getPopularProductList();
    Get.find<RecommendedProductController>().getRecommendedProductList();
    return GetMaterialApp(
      title: 'Mushaghal',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: MainItemPage(),
    );
  }
}
