import 'package:get/get.dart';
import 'package:mushaghal/controllers/product_controller.dart';
import 'package:mushaghal/pages/home/main_item_page.dart';
import 'package:mushaghal/pages/items/item_detail.dart';

class RouteHelper {
  static const String initial = "/";
  static const String item = "/popular-item";

  static String getInitial() => initial;
  static String getPopularItem(int pageId) => "$item?type=${ProductType.popular.index}&pageId=$pageId";
  static String getRecommendedItem(int pageId) => "$item?type=${ProductType.recommended.index}&pageId=$pageId";

  static List<GetPage> routes = [
    GetPage(name: initial, page: () => MainItemPage()),
    GetPage(
        name: item,
        page: () {
          var pageId = int.parse(Get.parameters['pageId']!);
          var type = int.parse(Get.parameters['type']!);
          return ItemDetail(pageId: pageId, productType: ProductType.values[type],);
        },
        transition: Transition.fadeIn),
  ];
}
